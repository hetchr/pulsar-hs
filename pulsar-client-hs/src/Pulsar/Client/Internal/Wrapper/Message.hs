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
buildMessage MessageBuilder {..} = undefined

consumeMessage :: MonadIO m => FetchedMessage s -> ReaderT (FetchedMessage s) m a -> m a
consumeMessage ptr r = undefined

messageProperty :: (MonadIO m, MonadReader (FetchedMessage s) m) => String -> m (Maybe String)
messageProperty key = undefined

messageContent :: (MonadIO m, MonadReader (FetchedMessage s) m) => m ByteString
messageContent = undefined

messageId :: (MonadIO m, MonadReader (FetchedMessage s) m) => ReaderT (FetchedMessageId s) m a -> m a
messageId f = undefined

messagePartitionKey :: (MonadIO m, MonadReader (FetchedMessage s) m) => m String
messagePartitionKey = undefined

messageOrderingKey :: (MonadIO m, MonadReader (FetchedMessage s) m) => m String
messageOrderingKey = undefined

messagePublishTimestamp :: (MonadIO m, MonadReader (FetchedMessage s) m) => m Word64
messagePublishTimestamp = undefined

messageEventTimestamp :: (MonadIO m, MonadReader (FetchedMessage s) m) => m Word64
messageEventTimestamp = undefined

messageTopicName :: (MonadIO m, MonadReader (FetchedMessage s) m) => m String
messageTopicName = undefined

messageRedeliveryCount :: (MonadIO m, MonadReader (FetchedMessage s) m) => m Int32
messageRedeliveryCount = undefined

messageSchemaVersion :: (MonadIO m, MonadReader (FetchedMessage s) m) => m String
messageSchemaVersion = undefined
