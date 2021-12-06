{-# LANGUAGE RecordWildCards #-}

module Pulsar.Client.Internal.Wrapper.Message
  ( BuiltMessage (..),
    FetchedMessage (..),
    MessageBuilder (..),
    defaultMessageBuilder,
    buildMessage,
    consumeMessage,
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
  )
where

import Control.DeepSeq (force)
import Control.Exception (evaluate)
import Data.ByteString
import Data.ByteString.Builder (byteString, toLazyByteString)
import Data.ByteString.Lazy (toStrict)
import Data.ByteString.Unsafe (unsafePackAddressLen)
import Foreign.C.Types
import GHC.Ptr
import Pulsar.Client.Internal.Foreign.Message
import Pulsar.Client.Internal.Wrapper.MessageId
import Pulsar.Client.Internal.Wrapper.Pointers
import Pulsar.Client.Internal.Wrapper.Utils

data MessageBuilder = MessageBuilder
  { content :: Maybe ByteString,
    properties :: Map String String,
    partitionKey :: Maybe String,
    orderingKey :: Maybe String,
    eventTimestamp :: Maybe Word64,
    sequenceId :: Maybe Int64,
    deliveredAfter :: Maybe Word64,
    deliverAt :: Maybe Word64,
    replicationClusters :: [String],
    disableReplication :: Maybe Bool
  }

defaultMessageBuilder :: MessageBuilder
defaultMessageBuilder =
  MessageBuilder
    { content = Nothing,
      properties = mempty,
      partitionKey = Nothing,
      orderingKey = Nothing,
      eventTimestamp = Nothing,
      sequenceId = Nothing,
      deliveredAfter = Nothing,
      deliverAt = Nothing,
      replicationClusters = mempty,
      disableReplication = Nothing
    }

buildMessage :: MonadResource m => MessageBuilder -> m (ReleaseKey, BuiltMessage)
buildMessage MessageBuilder {..} = do
  (release, config) <- allocate c'pulsar_message_create c'pulsar_message_free
  whenOptionByteString content $ c'pulsar_message_set_content config
  whenOptionMap properties $ c'pulsar_message_set_property config
  whenOptionString partitionKey $ c'pulsar_message_set_partition_key config
  whenOptionString orderingKey $ c'pulsar_message_set_ordering_key config
  whenOption eventTimestamp $ c'pulsar_message_set_event_timestamp config . CULong
  whenOption sequenceId $ c'pulsar_message_set_sequence_id config . CLong
  whenOption deliveredAfter $ c'pulsar_message_set_deliver_after config . CULong
  whenOption deliverAt $ c'pulsar_message_set_deliver_at config . CULong
  whenOptionStringList replicationClusters $ c'pulsar_message_set_replication_clusters config
  whenOption disableReplication $ c'pulsar_message_disable_replication config . fromBool
  return (release, BuiltMessage $ Message config)

consumeMessage :: MonadIO m => FetchedMessage s -> ReaderT (FetchedMessage s) m a -> m a
consumeMessage ptr r = do
  result <- runReaderT r ptr
  liftIO $ c'pulsar_message_free $ unMessage $ unFetchedMessage ptr
  return result

messageProperty :: (MonadIO m, MonadReader (FetchedMessage s) m) => String -> m (Maybe String)
messageProperty key = do
  ptr <- ask
  liftIO $ do
    str <- withCString key $ c'pulsar_message_get_property (unMessage $ unFetchedMessage ptr)
    if str == nullPtr
      then return Nothing
      else Just <$> peekCString str

messageContent :: (MonadIO m, MonadReader (FetchedMessage s) m) => m ByteString
messageContent = do
  Message ptr <- unFetchedMessage <$> ask
  liftIO $ do
    Ptr addr <- c'pulsar_message_get_data ptr
    len <- c'pulsar_message_get_length ptr
    ptrBS <- unsafePackAddressLen (fromIntegral len) addr
    evaluate $ force $ toStrict $ toLazyByteString $ byteString ptrBS
{-# NOINLINE messageContent #-}

messageId :: (MonadIO m, MonadReader (FetchedMessage s) m) => ReaderT (FetchedMessageId s) m a -> m a
messageId f = do
  message <- ask
  idPtr <- MessageId <$> liftIO (c'pulsar_message_get_message_id $ unMessage $ unFetchedMessage message)
  withMessageId (FetchedMessageId (fetchedMessageConsumer message) idPtr) f

messagePartitionKey :: (MonadIO m, MonadReader (FetchedMessage s) m) => m String
messagePartitionKey = ask >>= \x -> liftIO $ c'pulsar_message_get_partitionKey (unMessage $ unFetchedMessage x) >>= peekCString

messageOrderingKey :: (MonadIO m, MonadReader (FetchedMessage s) m) => m String
messageOrderingKey = ask >>= \x -> liftIO $ c'pulsar_message_get_orderingKey (unMessage $ unFetchedMessage x) >>= peekCString

messagePublishTimestamp :: (MonadIO m, MonadReader (FetchedMessage s) m) => m Word64
messagePublishTimestamp = ask >>= liftIO . fmap (\(CULong x) -> x) . c'pulsar_message_get_publish_timestamp . unMessage . unFetchedMessage

messageEventTimestamp :: (MonadIO m, MonadReader (FetchedMessage s) m) => m Word64
messageEventTimestamp = ask >>= liftIO . fmap (\(CULong x) -> x) . c'pulsar_message_get_event_timestamp . unMessage . unFetchedMessage

messageTopicName :: (MonadIO m, MonadReader (FetchedMessage s) m) => m String
messageTopicName = ask >>= \x -> liftIO $ c'pulsar_message_get_topic_name (unMessage $ unFetchedMessage x) >>= peekCString

messageRedeliveryCount :: (MonadIO m, MonadReader (FetchedMessage s) m) => m Int32
messageRedeliveryCount = ask >>= liftIO . fmap (\(CInt x) -> x) . c'pulsar_message_get_redelivery_count . unMessage . unFetchedMessage

messageSchemaVersion :: (MonadIO m, MonadReader (FetchedMessage s) m) => m String
messageSchemaVersion = ask >>= \x -> liftIO $ c'pulsar_message_get_schemaVersion (unMessage $ unFetchedMessage x) >>= peekCString
