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

mkProducerConfiguration :: MonadIO m => ProducerConfiguration -> ResourceT m (Ptr C'_pulsar_producer_configuration)
mkProducerConfiguration ProducerConfiguration {..} = do
  config <- new c'pulsar_producer_configuration_create c'pulsar_producer_configuration_free
  whenOptionString producerName $ c'pulsar_producer_configuration_set_producer_name config
  whenOption producerSendTimeout $ c'pulsar_producer_configuration_set_send_timeout config . CInt
  whenOption producerInitialSequenceId $ c'pulsar_producer_configuration_set_initial_sequence_id config . CLong
  whenOption producerCompressionType $ c'pulsar_producer_configuration_set_compression_type config . nativeCompressionType
  whenOption producerMaxPendingMessages $ c'pulsar_producer_configuration_set_max_pending_messages config . CInt
  whenOption producerMaxPendingMessagesAcrossPartitions $ c'pulsar_producer_configuration_set_max_pending_messages_across_partitions config . CInt
  whenOption producerPartitionsRoutingMode $ c'pulsar_producer_configuration_set_partitions_routing_mode config . nativePartitionsRoutingMode
  whenOption producerHashingScheme $ c'pulsar_producer_configuration_set_hashing_scheme config . nativeHashingScheme
  whenOption producerBlockIfQueueFull $ c'pulsar_producer_configuration_set_block_if_queue_full config . CInt
  whenOption producerBatchingEnabled $ c'pulsar_producer_configuration_set_batching_enabled config . CInt
  whenOption producerBatchingMaxMessages $ c'pulsar_producer_configuration_set_batching_max_messages config . CUInt
  whenOption producerBatchingMaxAllowedSizeInBytes $ c'pulsar_producer_configuration_set_batching_max_allowed_size_in_bytes config . CULong
  whenOption producerBatchingMaxPublishDelayMs $ c'pulsar_producer_configuration_set_batching_max_publish_delay_ms config . CULong
  whenOptionMap producerProperties $ c'pulsar_producer_configuration_set_property config
  whenOptionStringTuple producerDefaultCryptoKeyReader $ c'pulsar_producer_configuration_set_default_crypto_key_reader config
  whenOption producerCryptoFailureAction $ c'pulsar_producer_configuration_set_crypto_failure_action config . nativeCryptoFailureAction
  whenOptionString producerEncryptionKey $ c'pulsar_producer_configuration_set_encryption_key config
  return config

nativePartitionsRoutingMode :: PartitionsRoutingMode -> C'pulsar_partitions_routing_mode
nativePartitionsRoutingMode =
  \case
    UseSinglePartition -> c'pulsar_UseSinglePartition
    RoundRobinDistribution -> c'pulsar_RoundRobinDistribution
    CustomPartition -> c'pulsar_CustomPartition

nativeHashingScheme :: HashingScheme -> C'pulsar_hashing_scheme
nativeHashingScheme =
  \case
    Murmur3_32Hash -> c'pulsar_Murmur3_32Hash
    BoostHash -> c'pulsar_BoostHash
    JavaStringHash -> c'pulsar_JavaStringHash

nativeCompressionType :: CompressionType -> C'pulsar_compression_type
nativeCompressionType =
  \case
    CompressionNone -> c'pulsar_CompressionNone
    CompressionLZ4 -> c'pulsar_CompressionLZ4
    CompressionZLib -> c'pulsar_CompressionZLib
    CompressionZSTD -> c'pulsar_CompressionZSTD
    CompressionSNAPPY -> c'pulsar_CompressionSNAPPY

-- nativeSchemaType :: SchemaType -> C'pulsar_schema_type
-- nativeSchemaType =
--   \case
--     SchemaNone -> c'pulsar_None
--     SchemaString -> c'pulsar_String
--     SchemaJson -> c'pulsar_Json
--     SchemaProtobuf -> c'pulsar_Protobuf
--     SchemaAvro -> c'pulsar_Avro
--     SchemaBoolean -> c'pulsar_Boolean
--     SchemaInt8 -> c'pulsar_Int8
--     SchemaInt16 -> c'pulsar_Int16
--     SchemaInt32 -> c'pulsar_Int32
--     SchemaInt64 -> c'pulsar_Int64
--     SchemaFloat32 -> c'pulsar_Float32
--     SchemaFloat64 -> c'pulsar_Float64
--     SchemaKeyValue -> c'pulsar_KeyValue
--     SchemaBytes -> c'pulsar_Bytes
--     SchemaAutoConsume -> c'pulsar_AutoConsume
--     SchemaAutoPublish -> c'pulsar_AutoPublish

nativeCryptoFailureAction :: CryptoFailureAction -> C'pulsar_producer_crypto_failure_action
nativeCryptoFailureAction =
  \case
    ProducerFail -> c'pulsar_ProducerFail
    ProducerSend -> c'pulsar_ProducerSend

-- c'pulsar_producer_configuration_set_schema_info config . C'pulsar_schema_type -> CString -> CString -> Ptr Pulsar.Client.Internal.Foreign.StringMap.C'_pulsar_string_map
-- c'pulsar_producer_configuration_set_message_router config . Pulsar.Client.Internal.Foreign.MessageRouter.C'pulsar_message_router -> Ptr ()
