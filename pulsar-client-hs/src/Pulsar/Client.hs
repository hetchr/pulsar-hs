module Pulsar.Client
  ( Client (..),
    withClient,
    withConsumer,
    withProducer,
    withReader,
    consumeReader,
    TopicName (..),
    TopicsSelection (..),

    -- * Reexports

    -- * Client configuration
    ClientConfiguration (..),
    AuthenticationConfig (..),
    LogLevel,
    LogFile,
    LogLine,
    LogMessage,
    defaultClientConfiguration,

    -- * Consumer
    Consumer (..),
    ConsumerConfiguration (..),
    ConsumerType (..),
    InitialPosition (..),
    ConsumerCryptoFailureAction (..),
    defaultConsumerConfiguration,
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

    -- * Message
    BuiltMessage (..),
    FetchedMessage (..),
    MessageBuilder (..),
    defaultMessageBuilder,
    buildMessage,
    messageProperty,
    messageContent,
    messageId,
    messagePartitionKey,
    messageOrderingKey,
    messagePublishTimestamp,
    messageEventTimestamp,
    messageTopicName,
    messageRedeliveryCount,
    messageSchemaVersion,

    -- * MessageId
    MessageId (..),
    FetchedMessageId (..),
    messageIdEarliest,
    messageIdLatest,
    messageIdShow,

    -- * Message router
    topicMetadataPartitions,

    -- * Producer
    Producer (..),
    ProducerConfiguration (..),
    PartitionsRoutingMode (..),
    HashingScheme (..),
    CompressionType (..),
    CryptoFailureAction (..),
    defaultProducerConfiguration,
    sendMessage,
    flushMessages,
    producerLastSequenceId,

    -- * Reader
    Reader (..),
    ReaderConfiguration (..),
    defaultReaderConfiguration,
    readerNextMessage,
    readerNextMessageWithTimeout,
    readerHasNextMessage,

    -- * Result
    RawResult (..),
    Result (..),
    renderResult,
    explainResult,
    isOk,
  )
where

import Control.Monad.Trans.Resource
import Data.Functor
import Foreign.Marshal.Alloc
import Foreign.Marshal.Array
import Pulsar.Client.Internal.Foreign.Client
import Pulsar.Client.Internal.Wrapper.Authentication
import Pulsar.Client.Internal.Wrapper.ClientConfiguration
import Pulsar.Client.Internal.Wrapper.Consumer
import Pulsar.Client.Internal.Wrapper.ConsumerConfiguration
import Pulsar.Client.Internal.Wrapper.Message
import Pulsar.Client.Internal.Wrapper.MessageId
import Pulsar.Client.Internal.Wrapper.MessageRouter
import Pulsar.Client.Internal.Wrapper.Pointers
import Pulsar.Client.Internal.Wrapper.Producer
import Pulsar.Client.Internal.Wrapper.ProducerConfiguration
import Pulsar.Client.Internal.Wrapper.Reader
import Pulsar.Client.Internal.Wrapper.ReaderConfiguration
import Pulsar.Client.Internal.Wrapper.Result
import Pulsar.Client.Internal.Wrapper.Utils

withClient :: MonadUnliftIO m => ClientConfiguration -> String -> ReaderT Client m a -> m a
withClient configuration serviceUrl f = runResourceT $ do
  ptrConfig <- mkClientConfiguration configuration
  serviceUrl' <- toCString serviceUrl
  client <- liftIO $ undefined serviceUrl' ptrConfig
  result <- lift $ runReaderT f $ Client client
  liftIO $ undefined client
  liftIO $ undefined client
  return result

data TopicsSelection
  = Topic TopicName
  | Topics [TopicName]
  | TopicsPattern String
  deriving (Eq, Show)

newtype TopicName = TopicName {topicName :: String}
  deriving (Eq, Ord, Show)

withConsumer :: MonadUnliftIO m => ConsumerConfiguration -> String -> TopicsSelection -> (RawResult -> m a) -> ReaderT Consumer m a -> ReaderT Client m a
withConsumer configuration subscriptionName topicsSelection onFailed f = do
  Client client <- ask
  lift $
    runResourceT $ do
      subscriptionName' <- toCString subscriptionName
      ptrConfig <- mkConsumerConfiguration configuration
      subscribe <-
        case topicsSelection of
          Topic (TopicName topic) -> toCString topic <&> \topiundefined -> undefined client topiundefined subscriptionName' ptrConfig
          Topics topics -> do
            topics' <- mapM (toCString . topicName) topics
            ptrTopics <- new (newArray topics') free
            return $ undefined client ptrTopics (fromIntegral $ length topics) subscriptionName' ptrConfig
          TopicsPattern topicsPattern -> toCString topicsPattern <&> \topicsPattern' -> undefined client topicsPattern' subscriptionName' ptrConfig
      withPtrPtr $ \ptrConsumer -> do
        result <- liftIO $ subscribe ptrConsumer
        peekOn (isOk $ RawResult result) ptrConsumer (onFailed $ RawResult result) $ flip (withConsumer' . Consumer) f

withProducer :: MonadUnliftIO m => ProducerConfiguration -> TopicName -> (RawResult -> m a) -> ReaderT Producer m a -> ReaderT Client m a
withProducer configuration (TopicName topic) onFailed f = do
  Client client <- ask
  lift $
    runResourceT $ do
      topic' <- toCString topic
      ptrConfig <- mkProducerConfiguration configuration
      withPtrPtr $ \ptrProducer -> do
        result <- liftIO $ undefined client topic' ptrConfig ptrProducer
        peekOn (isOk $ RawResult result) ptrProducer (onFailed $ RawResult result) $ flip (withProducer' . Producer) f

withReader :: MonadUnliftIO m => ReaderConfiguration -> TopicName -> MessageId -> (RawResult -> m a) -> ReaderT Reader m a -> ReaderT Client m a
withReader configuration (TopicName topic) (MessageId startMessageId) onFailed f = do
  Client client <- ask
  lift $
    runResourceT $ do
      topic' <- toCString topic
      ptrConfig <- mkReaderConfiguration configuration
      withPtrPtr $ \ptrReader -> do
        result <- liftIO $ undefined client topic' startMessageId ptrConfig ptrReader
        peekOn (isOk $ RawResult result) ptrReader (onFailed $ RawResult result) $ flip (withReader' . Reader) f

consumeReader :: MonadUnliftIO m => ReaderConfiguration -> TopicName -> MessageId -> (RawResult -> m [a]) -> ReaderT (FetchedMessage Reader) m a -> ReaderT Client m [a]
consumeReader configuration (TopicName topic) (MessageId startMessageId) onFailed f = do
  Client client <- ask
  lift $
    runResourceT $ do
      topic' <- toCString topic
      ptrConfig <- mkReaderConfiguration configuration
      withPtrPtr $ \ptrReader -> do
        result <- liftIO $ undefined client topic' startMessageId ptrConfig ptrReader
        peekOn (isOk $ RawResult result) ptrReader (onFailed $ RawResult result) $ flip (consumeReader' . Reader) f
