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

withConsumer' :: Consumer -> ReaderT Consumer IO a -> IO a
withConsumer' consumer@(Consumer ptrConsumer) f = do
  result <- runReaderT f consumer
  c'pulsar_consumer_unsubscribe ptrConsumer
  c'pulsar_consumer_close ptrConsumer
  c'pulsar_consumer_free ptrConsumer
  return result

addConsumer :: (Ptr C'pulsar_consumer_t -> a -> IO b) -> a -> ReaderT Consumer IO b
addConsumer f x = do
  Consumer consumer <- ask
  liftIO $ f consumer x

receiveMessage :: (RawResult -> IO a) -> ReaderT Message IO a -> ReaderT Consumer IO a
receiveMessage onFailed f = do
  Consumer consumer <- ask
  withPtrPtr $ \msgPtr -> do
    result <- c'pulsar_consumer_receive consumer msgPtr
    peekOn (isOk result) msgPtr (onFailed $ RawResult result) $ flip (consumeMessage . Message) f

receiveMessageWithTimeout :: Int32 -> (RawResult -> IO a) -> ReaderT Message IO a -> ReaderT Consumer IO a
receiveMessageWithTimeout timeout onFailed f = do
  Consumer consumer <- ask
  withPtrPtr $ \msgPtr -> do
    result <- c'pulsar_consumer_receive_with_timeout consumer msgPtr $ CInt timeout
    peekOn (isOk result) msgPtr (onFailed $ RawResult result) $ flip (consumeMessage . Message) f

acknowledgeMessage :: Message -> ReaderT Consumer IO RawResult
acknowledgeMessage = fmap RawResult . addConsumer c'pulsar_consumer_acknowledge . unMessage

acknowledgeMessageId :: MessageId -> ReaderT Consumer IO RawResult
acknowledgeMessageId = fmap RawResult . addConsumer c'pulsar_consumer_acknowledge_id . unMessageId

acknowledgeCumulativeMessage :: Message -> ReaderT Consumer IO RawResult
acknowledgeCumulativeMessage = fmap RawResult . addConsumer c'pulsar_consumer_acknowledge_cumulative . unMessage

acknowledgeCumulativeMessageId :: MessageId -> ReaderT Consumer IO RawResult
acknowledgeCumulativeMessageId = fmap RawResult . addConsumer c'pulsar_consumer_acknowledge_cumulative_id . unMessageId

acknowledgeNegativeMessage :: Message -> ReaderT Consumer IO ()
acknowledgeNegativeMessage = addConsumer c'pulsar_consumer_negative_acknowledge . unMessage

acknowledgeNegativeMessageId :: MessageId -> ReaderT Consumer IO ()
acknowledgeNegativeMessageId = addConsumer c'pulsar_consumer_negative_acknowledge_id . unMessageId

redeliverUnacknowledgeMessages :: ReaderT Consumer IO ()
redeliverUnacknowledgeMessages = ask >>= liftIO . c'pulsar_consumer_redeliver_unacknowledged_messages . unConsumer

seekConsumer :: MessageId -> ReaderT Consumer IO RawResult
seekConsumer = fmap RawResult . addConsumer c'pulsar_consumer_seek . unMessageId
