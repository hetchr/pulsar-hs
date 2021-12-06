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

import Pulsar.Client.Internal.Foreign.Consumer
import Pulsar.Client.Internal.Foreign.Message
import Pulsar.Client.Internal.Foreign.MessageId
import Pulsar.Client.Internal.Wrapper.Message
import Pulsar.Client.Internal.Wrapper.MessageId
import Pulsar.Client.Internal.Wrapper.Pointers
import Pulsar.Client.Internal.Wrapper.Result
import Pulsar.Client.Internal.Wrapper.Utils

withConsumer' :: MonadIO m => Consumer -> ReaderT Consumer m a -> m a
withConsumer' consumer@(Consumer ptrConsumer) f = do
  result <- runReaderT f consumer
  liftIO $ c'pulsar_consumer_unsubscribe ptrConsumer
  liftIO $ c'pulsar_consumer_close ptrConsumer
  liftIO $ c'pulsar_consumer_free ptrConsumer
  return result

addConsumerMessage :: (MonadIO m, MonadReader (FetchedMessage Consumer) m) => (Ptr C'pulsar_consumer_t -> Ptr C'pulsar_message_t -> IO a) -> m a
addConsumerMessage f = do
  message <- ask
  liftIO $ f (unConsumer $ fetchedMessageConsumer message) (unMessage $ unFetchedMessage message)

addConsumerMessageId :: (MonadIO m, MonadReader (FetchedMessageId Consumer) m) => (Ptr C'pulsar_consumer_t -> Ptr C'pulsar_message_id_t -> IO a) -> m a
addConsumerMessageId f = do
  message <- ask
  liftIO $ f (unConsumer $ fetchedMessageIdConsumer message) (unMessageId $ unFetchedMessageId message)

receiveMessage :: MonadUnliftIO m => (RawResult -> m a) -> ReaderT (FetchedMessage Consumer) m a -> ReaderT Consumer m a
receiveMessage onFailed f = do
  consumer@(Consumer consumerPtr) <- ask
  withPtrPtr $ \msgPtr -> do
    result <- liftIO $ c'pulsar_consumer_receive consumerPtr msgPtr
    peekOn (isOk result) msgPtr (onFailed $ RawResult result) $ flip (consumeMessage . FetchedMessage consumer . Message) f

receiveMessageWithTimeout :: MonadUnliftIO m => Int32 -> (RawResult -> m a) -> ReaderT (FetchedMessage Consumer) m a -> ReaderT Consumer m a
receiveMessageWithTimeout timeout onFailed f = do
  consumer@(Consumer consumerPtr) <- ask
  withPtrPtr $ \msgPtr -> do
    result <- liftIO $ c'pulsar_consumer_receive_with_timeout consumerPtr msgPtr $ CInt timeout
    peekOn (isOk result) msgPtr (onFailed $ RawResult result) $ flip (consumeMessage . FetchedMessage consumer . Message) f

acknowledgeMessage :: MonadIO m => ReaderT (FetchedMessage Consumer) m RawResult
acknowledgeMessage = RawResult <$> addConsumerMessage c'pulsar_consumer_acknowledge

acknowledgeMessageId :: MonadIO m => ReaderT (FetchedMessageId Consumer) m RawResult
acknowledgeMessageId = RawResult <$> addConsumerMessageId c'pulsar_consumer_acknowledge_id

acknowledgeCumulativeMessage :: MonadIO m => ReaderT (FetchedMessage Consumer) m RawResult
acknowledgeCumulativeMessage = RawResult <$> addConsumerMessage c'pulsar_consumer_acknowledge_cumulative

acknowledgeCumulativeMessageId :: MonadIO m => ReaderT (FetchedMessageId Consumer) m RawResult
acknowledgeCumulativeMessageId = RawResult <$> addConsumerMessageId c'pulsar_consumer_acknowledge_cumulative_id

acknowledgeNegativeMessage :: MonadIO m => ReaderT (FetchedMessage Consumer) m ()
acknowledgeNegativeMessage = addConsumerMessage c'pulsar_consumer_negative_acknowledge

acknowledgeNegativeMessageId :: MonadIO m => ReaderT (FetchedMessageId Consumer) m ()
acknowledgeNegativeMessageId = addConsumerMessageId c'pulsar_consumer_negative_acknowledge_id

redeliverUnacknowledgeMessages :: MonadIO m => ReaderT Consumer m ()
redeliverUnacknowledgeMessages = ask >>= liftIO . c'pulsar_consumer_redeliver_unacknowledged_messages . unConsumer

seekConsumer :: MonadIO m => ReaderT (FetchedMessageId Consumer) m RawResult
seekConsumer = RawResult <$> addConsumerMessageId c'pulsar_consumer_seek
