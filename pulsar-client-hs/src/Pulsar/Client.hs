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
    Message (..),
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
    messageIdEarliest,
    messageIdLatest,
    messageIdShow,
    messageIdFree,

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

import Control.Monad.Trans.Reader (ReaderT, ask, runReaderT)
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
import Pulsar.Client.Internal.Wrapper.Producer
import Pulsar.Client.Internal.Wrapper.ProducerConfiguration
import Pulsar.Client.Internal.Wrapper.Reader
import Pulsar.Client.Internal.Wrapper.ReaderConfiguration
import Pulsar.Client.Internal.Wrapper.Result
import Pulsar.Client.Internal.Wrapper.Utils

newtype Client = Client {unClient :: Ptr C'pulsar_client_t}

withClient :: ClientConfiguration -> String -> ReaderT Client IO a -> IO a
withClient configuration serviceUrl f = runResourceT $ do
  ptrConfig <- mkClientConfiguration configuration
  serviceUrl' <- toCString serviceUrl
  liftIO $ do
    client <- liftIO $ c'pulsar_client_create serviceUrl' ptrConfig
    result <- runReaderT f $ Client client
    c'pulsar_client_close client
    c'pulsar_client_free client
    return result

data TopicsSelection
  = Topic TopicName
  | Topics [TopicName]
  | TopicsPattern String
  deriving (Eq, Show)

newtype TopicName = TopicName {topicName :: String}
  deriving (Eq, Show)

withConsumer :: ConsumerConfiguration -> String -> TopicsSelection -> (RawResult -> IO a) -> ReaderT Consumer IO a -> ReaderT Client IO a
withConsumer configuration subscriptionName topicsSelection onFailed f = do
  Client client <- ask
  liftIO $
    runResourceT $ do
      subscriptionName' <- toCString subscriptionName
      ptrConfig <- mkConsumerConfiguration configuration
      subscribe <-
        case topicsSelection of
          Topic (TopicName topic) -> toCString topic <&> \topic' -> c'pulsar_client_subscribe client topic' subscriptionName' ptrConfig
          Topics topics -> do
            topics' <- mapM (toCString . topicName) topics
            ptrTopics <- new (newArray topics') free
            return $ c'pulsar_client_subscribe_multi_topics client ptrTopics (fromIntegral $ length topics) subscriptionName' ptrConfig
          TopicsPattern topicsPattern -> toCString topicsPattern <&> \topicsPattern' -> c'pulsar_client_subscribe_pattern client topicsPattern' subscriptionName' ptrConfig
      liftIO $
        withPtrPtr $ \ptrConsumer -> do
          result <- subscribe ptrConsumer
          peekOn (isOk result) ptrConsumer (onFailed $ RawResult result) $ flip (withConsumer' . Consumer) f

withProducer :: ProducerConfiguration -> TopicName -> (RawResult -> IO a) -> ReaderT Producer IO a -> ReaderT Client IO a
withProducer configuration (TopicName topic) onFailed f = do
  Client client <- ask
  liftIO $
    runResourceT $ do
      topic' <- toCString topic
      ptrConfig <- mkProducerConfiguration configuration
      liftIO $
        withPtrPtr $ \ptrProducer -> do
          result <- c'pulsar_client_create_producer client topic' ptrConfig ptrProducer
          peekOn (isOk result) ptrProducer (onFailed $ RawResult result) $ flip (withProducer' . Producer) f

withReader :: ReaderConfiguration -> TopicName -> MessageId -> (RawResult -> IO a) -> ReaderT Reader IO a -> ReaderT Client IO a
withReader configuration (TopicName topic) (MessageId startMessageId) onFailed f = do
  Client client <- ask
  liftIO $
    runResourceT $ do
      topic' <- toCString topic
      ptrConfig <- mkReaderConfiguration configuration
      liftIO $
        withPtrPtr $ \ptrReader -> do
          result <- c'pulsar_client_create_reader client topic' startMessageId ptrConfig ptrReader
          peekOn (isOk result) ptrReader (onFailed $ RawResult result) $ flip (withReader' . Reader) f

consumeReader :: ReaderConfiguration -> TopicName -> MessageId -> (RawResult -> IO [a]) -> ReaderT Message IO a -> ReaderT Client IO [a]
consumeReader configuration (TopicName topic) (MessageId startMessageId) onFailed f = do
  Client client <- ask
  liftIO $
    runResourceT $ do
      topic' <- toCString topic
      ptrConfig <- mkReaderConfiguration configuration
      liftIO $
        withPtrPtr $ \ptrReader -> do
          result <- c'pulsar_client_create_reader client topic' startMessageId ptrConfig ptrReader
          peekOn (isOk result) ptrReader (onFailed $ RawResult result) $ flip (consumeReader' . Reader) f
