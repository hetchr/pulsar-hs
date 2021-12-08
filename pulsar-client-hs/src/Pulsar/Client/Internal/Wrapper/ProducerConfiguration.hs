{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RecordWildCards #-}

module Pulsar.Client.Internal.Wrapper.ProducerConfiguration
  ( ProducerConfiguration (..),
    defaultProducerConfiguration,
    PartitionsRoutingMode (..),
    HashingScheme (..),
    CompressionType (..),
    CryptoFailureAction (..),
    mkProducerConfiguration,
  )
where

import Foreign.C.Types
import GHC.Ptr
import Pulsar.Client.Internal.Foreign.ProducerConfiguration
import Pulsar.Client.Internal.Wrapper.Utils

data ProducerConfiguration = ProducerConfiguration
  { producerName :: Maybe String,
    producerSendTimeout :: Maybe Int32,
    producerInitialSequenceId :: Maybe Int64,
    producerCompressionType :: Maybe CompressionType,
    producerMaxPendingMessages :: Maybe Int32,
    producerMaxPendingMessagesAcrossPartitions :: Maybe Int32,
    producerPartitionsRoutingMode :: Maybe PartitionsRoutingMode,
    producerHashingScheme :: Maybe HashingScheme,
    producerBlockIfQueueFull :: Maybe Int32,
    producerBatchingEnabled :: Maybe Int32,
    producerBatchingMaxMessages :: Maybe Word32,
    producerBatchingMaxAllowedSizeInBytes :: Maybe Word64,
    producerBatchingMaxPublishDelayMs :: Maybe Word64,
    producerProperties :: Map String String,
    producerDefaultCryptoKeyReader :: Maybe (String, String),
    producerCryptoFailureAction :: Maybe CryptoFailureAction,
    producerEncryptionKey :: Maybe String
  }
  deriving (Eq, Show)

data PartitionsRoutingMode
  = UseSinglePartition
  | RoundRobinDistribution
  | CustomPartition
  deriving (Eq, Show)

data HashingScheme
  = Murmur3_32Hash
  | BoostHash
  | JavaStringHash
  deriving (Eq, Show)

data CompressionType
  = CompressionNone
  | CompressionLZ4
  | CompressionZLib
  | CompressionZSTD
  | CompressionSNAPPY
  deriving (Eq, Show)

-- data SchemaType
--   = SchemaNone
--   | SchemaString
--   | SchemaJson
--   | SchemaProtobuf
--   | SchemaAvro
--   | SchemaBoolean
--   | SchemaInt8
--   | SchemaInt16
--   | SchemaInt32
--   | SchemaInt64
--   | SchemaFloat32
--   | SchemaFloat64
--   | SchemaKeyValue
--   | SchemaBytes
--   | SchemaAutoConsume
--   | SchemaAutoPublish

data CryptoFailureAction
  = ProducerFail
  | ProducerSend
  deriving (Eq, Show)

defaultProducerConfiguration =
  ProducerConfiguration
    { producerName = Nothing,
      producerSendTimeout = Nothing,
      producerInitialSequenceId = Nothing,
      producerCompressionType = Nothing,
      producerMaxPendingMessages = Nothing,
      producerMaxPendingMessagesAcrossPartitions = Nothing,
      producerPartitionsRoutingMode = Nothing,
      producerHashingScheme = Nothing,
      producerBlockIfQueueFull = Nothing,
      producerBatchingEnabled = Nothing,
      producerBatchingMaxMessages = Nothing,
      producerBatchingMaxAllowedSizeInBytes = Nothing,
      producerBatchingMaxPublishDelayMs = Nothing,
      producerProperties = mempty,
      producerDefaultCryptoKeyReader = Nothing,
      producerCryptoFailureAction = Nothing,
      producerEncryptionKey = Nothing
    }

mkProducerConfiguration :: MonadResource m => ProducerConfiguration -> m (Ptr C'_pulsar_producer_configuration)
mkProducerConfiguration ProducerConfiguration {..} = undefined

nativePartitionsRoutingMode :: PartitionsRoutingMode -> C'pulsar_partitions_routing_mode
nativePartitionsRoutingMode =
  \case
    UseSinglePartition -> undefined
    RoundRobinDistribution -> undefined
    CustomPartition -> undefined

nativeHashingScheme :: HashingScheme -> C'pulsar_hashing_scheme
nativeHashingScheme =
  \case
    Murmur3_32Hash -> undefined
    BoostHash -> undefined
    JavaStringHash -> undefined

nativeCompressionType :: CompressionType -> C'pulsar_compression_type
nativeCompressionType =
  \case
    CompressionNone -> undefined
    CompressionLZ4 -> undefined
    CompressionZLib -> undefined
    CompressionZSTD -> undefined
    CompressionSNAPPY -> undefined

-- nativeSchemaType :: SchemaType -> C'pulsar_schema_type
-- nativeSchemaType =
--   \case
--     SchemaNone -> undefined
--     SchemaString -> undefined
--     SchemaJson -> undefined
--     SchemaProtobuf -> undefined
--     SchemaAvro -> undefined
--     SchemaBoolean -> undefined
--     SchemaInt8 -> undefined
--     SchemaInt16 -> undefined
--     SchemaInt32 -> undefined
--     SchemaInt64 -> undefined
--     SchemaFloat32 -> undefined
--     SchemaFloat64 -> undefined
--     SchemaKeyValue -> undefined
--     SchemaBytes -> undefined
--     SchemaAutoConsume -> undefined
--     SchemaAutoPublish -> undefined

nativeCryptoFailureAction :: CryptoFailureAction -> C'pulsar_producer_crypto_failure_action
nativeCryptoFailureAction =
  \case
    ProducerFail -> undefined
    ProducerSend -> undefined

-- undefined config . C'pulsar_schema_type -> CString -> CString -> Ptr Pulsar.Client.Internal.Foreign.StringMap.C'_pulsar_string_map
-- undefined config . Pulsar.Client.Internal.Foreign.MessageRouter.C'pulsar_message_router -> Ptr ()
