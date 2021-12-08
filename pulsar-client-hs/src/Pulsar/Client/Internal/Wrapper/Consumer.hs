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
withConsumer' consumer@(Consumer ptrConsumer) f = undefined

addConsumerMessage :: (MonadIO m, MonadReader (FetchedMessage Consumer) m) => (Ptr C'pulsar_consumer_t -> Ptr C'pulsar_message_t -> IO a) -> m a
addConsumerMessage f = undefined

addConsumerMessageId :: (MonadIO m, MonadReader (FetchedMessageId Consumer) m) => (Ptr C'pulsar_consumer_t -> Ptr C'pulsar_message_id_t -> IO a) -> m a
addConsumerMessageId f = undefined

receiveMessage :: MonadUnliftIO m => (RawResult -> m a) -> ReaderT (FetchedMessage Consumer) m a -> ReaderT Consumer m a
receiveMessage onFailed f = undefined

receiveMessageWithTimeout :: MonadUnliftIO m => Int32 -> (RawResult -> m a) -> ReaderT (FetchedMessage Consumer) m a -> ReaderT Consumer m a
receiveMessageWithTimeout timeout onFailed f = undefined

acknowledgeMessage :: (MonadIO m, MonadReader (FetchedMessage Consumer) m) => m RawResult
acknowledgeMessage = undefined

acknowledgeMessageId :: (MonadIO m, MonadReader (FetchedMessageId Consumer) m) => m RawResult
acknowledgeMessageId = undefined

acknowledgeCumulativeMessage :: (MonadIO m, MonadReader (FetchedMessage Consumer) m) => m RawResult
acknowledgeCumulativeMessage = undefined

acknowledgeCumulativeMessageId :: (MonadIO m, MonadReader (FetchedMessageId Consumer) m) => m RawResult
acknowledgeCumulativeMessageId = undefined

acknowledgeNegativeMessage :: (MonadIO m, MonadReader (FetchedMessage Consumer) m) => m ()
acknowledgeNegativeMessage = undefined

acknowledgeNegativeMessageId :: (MonadIO m, MonadReader (FetchedMessageId Consumer) m) => m ()
acknowledgeNegativeMessageId = undefined

redeliverUnacknowledgeMessages :: (MonadIO m, MonadReader Consumer m) => m ()
redeliverUnacknowledgeMessages = undefined

seekConsumer :: (MonadIO m, MonadReader (FetchedMessageId Consumer) m) => m RawResult
seekConsumer = undefined
