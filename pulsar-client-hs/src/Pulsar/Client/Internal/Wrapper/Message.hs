{-# LANGUAGE RecordWildCards #-}

module Pulsar.Client.Internal.Wrapper.Message
  ( Message (..),
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
import Control.Monad.Trans.Reader
import Control.Monad.Trans.Resource
import Data.ByteString
import Data.ByteString.Builder (byteString, toLazyByteString)
import Data.ByteString.Lazy (toStrict)
import Data.ByteString.Unsafe (unsafePackAddressLen)
import Foreign.C.Types
import GHC.Ptr
import Pulsar.Client.Internal.Foreign.Message
import Pulsar.Client.Internal.Wrapper.MessageId
import Pulsar.Client.Internal.Wrapper.Utils

newtype Message = Message {unMessage :: Ptr C'_pulsar_message}

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

buildMessage :: MonadIO m => MessageBuilder -> ResourceT m (ReleaseKey, Message)
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
  return (release, Message config)

consumeMessage :: MonadIO m => Message -> ReaderT Message m a -> m a
consumeMessage ptr r = do
  result <- runReaderT r ptr
  liftIO $ c'pulsar_message_free $ unMessage ptr
  return result

messageProperty :: MonadIO m => String -> ReaderT Message m (Maybe String)
messageProperty key = do
  ptr <- ask
  liftIO $ do
    str <- withCString key $ c'pulsar_message_get_property (unMessage ptr)
    if str == nullPtr
      then return Nothing
      else Just <$> peekCString str

messageContent :: MonadIO m => ReaderT Message m ByteString
messageContent = do
  Message ptr <- ask
  liftIO $ do
    Ptr addr <- c'pulsar_message_get_data ptr
    len <- c'pulsar_message_get_length ptr
    ptrBS <- unsafePackAddressLen (fromIntegral len) addr
    evaluate $ force $ toStrict $ toLazyByteString $ byteString ptrBS
{-# NOINLINE messageContent #-}

messageId :: MonadIO m => ReaderT MessageId m a -> ReaderT Message m a
messageId f = do
  Message message <- ask
  idPtr <- MessageId <$> liftIO (c'pulsar_message_get_message_id message)
  lift $ withMessageId idPtr f

messagePartitionKey :: MonadIO m => ReaderT Message m String
messagePartitionKey = ask >>= \x -> liftIO $ c'pulsar_message_get_partitionKey (unMessage x) >>= peekCString

messageOrderingKey :: MonadIO m => ReaderT Message m String
messageOrderingKey = ask >>= \x -> liftIO $ c'pulsar_message_get_orderingKey (unMessage x) >>= peekCString

messagePublishTimestamp :: MonadIO m => ReaderT Message m Word64
messagePublishTimestamp = ask >>= liftIO . fmap (\(CULong x) -> x) . c'pulsar_message_get_publish_timestamp . unMessage

messageEventTimestamp :: MonadIO m => ReaderT Message m Word64
messageEventTimestamp = ask >>= liftIO . fmap (\(CULong x) -> x) . c'pulsar_message_get_event_timestamp . unMessage

messageTopicName :: MonadIO m => ReaderT Message m String
messageTopicName = ask >>= \x -> liftIO $ c'pulsar_message_get_topic_name (unMessage x) >>= peekCString

messageRedeliveryCount :: MonadIO m => ReaderT Message m Int32
messageRedeliveryCount = ask >>= liftIO . fmap (\(CInt x) -> x) . c'pulsar_message_get_redelivery_count . unMessage

messageSchemaVersion :: MonadIO m => ReaderT Message m String
messageSchemaVersion = ask >>= \x -> liftIO $ c'pulsar_message_get_schemaVersion (unMessage x) >>= peekCString
