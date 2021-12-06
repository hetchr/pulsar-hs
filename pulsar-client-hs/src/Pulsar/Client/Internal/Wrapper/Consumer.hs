module Pulsar.Client.Internal.Wrapper.Consumer
  ( Consumer (..),
    withConsumer',
    receiveMessage,
    receiveMessageWithTimeout,
    acknowledgeMessage,
    acknowledgeMessageId,
    acknowledgeCumulativeMessage,
    acknowledgeCumulativeMessageId,
    acknowledgeNegativeMessage,
    acknowledgeNegativeMessageId,
    redeliverUnacknowledgeMessages,
    seekConsumer,
  )
where

import Control.Monad.Trans.Reader
import Pulsar.Client.Internal.Foreign.Consumer
import Pulsar.Client.Internal.Wrapper.Message
import Pulsar.Client.Internal.Wrapper.MessageId
import Pulsar.Client.Internal.Wrapper.Result
import Pulsar.Client.Internal.Wrapper.Utils

newtype Consumer = Consumer {unConsumer :: Ptr C'pulsar_consumer_t}

withConsumer' :: MonadIO m => Consumer -> ReaderT Consumer m a -> m a
withConsumer' consumer@(Consumer ptrConsumer) f = do
  result <- runReaderT f consumer
  liftIO $ c'pulsar_consumer_unsubscribe ptrConsumer
  liftIO $ c'pulsar_consumer_close ptrConsumer
  liftIO $ c'pulsar_consumer_free ptrConsumer
  return result

addConsumer :: MonadIO m => (Ptr C'pulsar_consumer_t -> a -> IO b) -> a -> ReaderT Consumer m b
addConsumer f x = do
  Consumer consumer <- ask
  liftIO $ f consumer x

receiveMessage :: MonadUnliftIO m => (RawResult -> m a) -> ReaderT Message m a -> ReaderT Consumer m a
receiveMessage onFailed f = do
  Consumer consumer <- ask
  withPtrPtr $ \msgPtr -> do
    result <- liftIO $ c'pulsar_consumer_receive consumer msgPtr
    peekOn (isOk result) msgPtr (onFailed $ RawResult result) $ flip (consumeMessage . Message) f

receiveMessageWithTimeout :: MonadUnliftIO m => Int32 -> (RawResult -> m a) -> ReaderT Message m a -> ReaderT Consumer m a
receiveMessageWithTimeout timeout onFailed f = do
  Consumer consumer <- ask
  withPtrPtr $ \msgPtr -> do
    result <- liftIO $ c'pulsar_consumer_receive_with_timeout consumer msgPtr $ CInt timeout
    peekOn (isOk result) msgPtr (onFailed $ RawResult result) $ flip (consumeMessage . Message) f

acknowledgeMessage :: MonadIO m => Message -> ReaderT Consumer m RawResult
acknowledgeMessage = fmap RawResult . addConsumer c'pulsar_consumer_acknowledge . unMessage

acknowledgeMessageId :: MonadIO m => MessageId -> ReaderT Consumer m RawResult
acknowledgeMessageId = fmap RawResult . addConsumer c'pulsar_consumer_acknowledge_id . unMessageId

acknowledgeCumulativeMessage :: MonadIO m => Message -> ReaderT Consumer m RawResult
acknowledgeCumulativeMessage = fmap RawResult . addConsumer c'pulsar_consumer_acknowledge_cumulative . unMessage

acknowledgeCumulativeMessageId :: MonadIO m => MessageId -> ReaderT Consumer m RawResult
acknowledgeCumulativeMessageId = fmap RawResult . addConsumer c'pulsar_consumer_acknowledge_cumulative_id . unMessageId

acknowledgeNegativeMessage :: MonadIO m => Message -> ReaderT Consumer m ()
acknowledgeNegativeMessage = addConsumer c'pulsar_consumer_negative_acknowledge . unMessage

acknowledgeNegativeMessageId :: MonadIO m => MessageId -> ReaderT Consumer m ()
acknowledgeNegativeMessageId = addConsumer c'pulsar_consumer_negative_acknowledge_id . unMessageId

redeliverUnacknowledgeMessages :: MonadIO m => ReaderT Consumer m ()
redeliverUnacknowledgeMessages = ask >>= liftIO . c'pulsar_consumer_redeliver_unacknowledged_messages . unConsumer

seekConsumer :: MonadIO m => MessageId -> ReaderT Consumer m RawResult
seekConsumer = fmap RawResult . addConsumer c'pulsar_consumer_seek . unMessageId
