{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/producer_configuration.h>
module Pulsar.Client.Internal.Foreign.ProducerConfiguration where
import Foreign.Ptr
#strict_import

import Pulsar.Client.Internal.Foreign.MessageRouter
import Pulsar.Client.Internal.Foreign.StringMap
{- typedef enum {
            pulsar_UseSinglePartition,
            pulsar_RoundRobinDistribution,
            pulsar_CustomPartition
        } pulsar_partitions_routing_mode; -}
#integral_t pulsar_partitions_routing_mode
#num pulsar_UseSinglePartition
#num pulsar_RoundRobinDistribution
#num pulsar_CustomPartition
{- typedef enum {
            pulsar_Murmur3_32Hash, pulsar_BoostHash, pulsar_JavaStringHash
        } pulsar_hashing_scheme; -}
#integral_t pulsar_hashing_scheme
#num pulsar_Murmur3_32Hash
#num pulsar_BoostHash
#num pulsar_JavaStringHash
{- typedef enum {
            pulsar_CompressionNone = 0,
            pulsar_CompressionLZ4 = 1,
            pulsar_CompressionZLib = 2,
            pulsar_CompressionZSTD = 3,
            pulsar_CompressionSNAPPY = 4
        } pulsar_compression_type; -}
#integral_t pulsar_compression_type
#num pulsar_CompressionNone
#num pulsar_CompressionLZ4
#num pulsar_CompressionZLib
#num pulsar_CompressionZSTD
#num pulsar_CompressionSNAPPY
{- typedef enum {
            pulsar_None = 0,
            pulsar_String = 1,
            pulsar_Json = 2,
            pulsar_Protobuf = 3,
            pulsar_Avro = 4,
            pulsar_Boolean = 5,
            pulsar_Int8 = 6,
            pulsar_Int16 = 7,
            pulsar_Int32 = 8,
            pulsar_Int64 = 9,
            pulsar_Float32 = 10,
            pulsar_Float64 = 11,
            pulsar_KeyValue = 15,
            pulsar_Bytes = -1,
            pulsar_AutoConsume = -3,
            pulsar_AutoPublish = -4
        } pulsar_schema_type; -}
#integral_t pulsar_schema_type
#num pulsar_None
#num pulsar_String
#num pulsar_Json
#num pulsar_Protobuf
#num pulsar_Avro
#num pulsar_Boolean
#num pulsar_Int8
#num pulsar_Int16
#num pulsar_Int32
#num pulsar_Int64
#num pulsar_Float32
#num pulsar_Float64
#num pulsar_KeyValue
#num pulsar_Bytes
#num pulsar_AutoConsume
#num pulsar_AutoPublish
{- typedef enum {
            pulsar_ProducerFail, pulsar_ProducerSend
        } pulsar_producer_crypto_failure_action; -}
#integral_t pulsar_producer_crypto_failure_action
#num pulsar_ProducerFail
#num pulsar_ProducerSend
{- typedef struct _pulsar_producer_configuration pulsar_producer_configuration_t; -}
#opaque_t struct _pulsar_producer_configuration
#synonym_t pulsar_producer_configuration_t , <struct _pulsar_producer_configuration>
{- typedef struct _pulsar_crypto_key_reader pulsar_crypto_key_reader; -}
#opaque_t struct _pulsar_crypto_key_reader
#synonym_t pulsar_crypto_key_reader , <struct _pulsar_crypto_key_reader>
#ccall pulsar_producer_configuration_create , IO (Ptr <struct _pulsar_producer_configuration>)
#ccall pulsar_producer_configuration_free , Ptr <struct _pulsar_producer_configuration> -> IO ()
#ccall pulsar_producer_configuration_set_producer_name , Ptr <struct _pulsar_producer_configuration> -> CString -> IO ()
#ccall pulsar_producer_configuration_get_producer_name , Ptr <struct _pulsar_producer_configuration> -> IO CString
#ccall pulsar_producer_configuration_set_send_timeout , Ptr <struct _pulsar_producer_configuration> -> CInt -> IO ()
#ccall pulsar_producer_configuration_get_send_timeout , Ptr <struct _pulsar_producer_configuration> -> IO CInt
#ccall pulsar_producer_configuration_set_initial_sequence_id , Ptr <struct _pulsar_producer_configuration> -> CLong -> IO ()
#ccall pulsar_producer_configuration_get_initial_sequence_id , Ptr <struct _pulsar_producer_configuration> -> IO CLong
#ccall pulsar_producer_configuration_set_compression_type , Ptr <struct _pulsar_producer_configuration> -> <pulsar_compression_type> -> IO ()
#ccall pulsar_producer_configuration_get_compression_type , Ptr <struct _pulsar_producer_configuration> -> IO <pulsar_compression_type>
#ccall pulsar_producer_configuration_set_schema_info , Ptr <struct _pulsar_producer_configuration> -> <pulsar_schema_type> -> CString -> CString -> Ptr <struct _pulsar_string_map> -> IO ()
#ccall pulsar_producer_configuration_set_max_pending_messages , Ptr <struct _pulsar_producer_configuration> -> CInt -> IO ()
#ccall pulsar_producer_configuration_get_max_pending_messages , Ptr <struct _pulsar_producer_configuration> -> IO CInt
#ccall pulsar_producer_configuration_set_max_pending_messages_across_partitions , Ptr <struct _pulsar_producer_configuration> -> CInt -> IO ()
#ccall pulsar_producer_configuration_get_max_pending_messages_across_partitions , Ptr <struct _pulsar_producer_configuration> -> IO CInt
#ccall pulsar_producer_configuration_set_partitions_routing_mode , Ptr <struct _pulsar_producer_configuration> -> <pulsar_partitions_routing_mode> -> IO ()
#ccall pulsar_producer_configuration_get_partitions_routing_mode , Ptr <struct _pulsar_producer_configuration> -> IO <pulsar_partitions_routing_mode>
#ccall pulsar_producer_configuration_set_message_router , Ptr <struct _pulsar_producer_configuration> -> <pulsar_message_router> -> Ptr () -> IO ()
#ccall pulsar_producer_configuration_set_hashing_scheme , Ptr <struct _pulsar_producer_configuration> -> <pulsar_hashing_scheme> -> IO ()
#ccall pulsar_producer_configuration_get_hashing_scheme , Ptr <struct _pulsar_producer_configuration> -> IO <pulsar_hashing_scheme>
#ccall pulsar_producer_configuration_set_block_if_queue_full , Ptr <struct _pulsar_producer_configuration> -> CInt -> IO ()
#ccall pulsar_producer_configuration_get_block_if_queue_full , Ptr <struct _pulsar_producer_configuration> -> IO CInt
#ccall pulsar_producer_configuration_set_batching_enabled , Ptr <struct _pulsar_producer_configuration> -> CInt -> IO ()
#ccall pulsar_producer_configuration_get_batching_enabled , Ptr <struct _pulsar_producer_configuration> -> IO CInt
#ccall pulsar_producer_configuration_set_batching_max_messages , Ptr <struct _pulsar_producer_configuration> -> CUInt -> IO ()
#ccall pulsar_producer_configuration_get_batching_max_messages , Ptr <struct _pulsar_producer_configuration> -> IO CUInt
#ccall pulsar_producer_configuration_set_batching_max_allowed_size_in_bytes , Ptr <struct _pulsar_producer_configuration> -> CULong -> IO ()
#ccall pulsar_producer_configuration_get_batching_max_allowed_size_in_bytes , Ptr <struct _pulsar_producer_configuration> -> IO CULong
#ccall pulsar_producer_configuration_set_batching_max_publish_delay_ms , Ptr <struct _pulsar_producer_configuration> -> CULong -> IO ()
#ccall pulsar_producer_configuration_get_batching_max_publish_delay_ms , Ptr <struct _pulsar_producer_configuration> -> IO CULong
#ccall pulsar_producer_configuration_set_property , Ptr <struct _pulsar_producer_configuration> -> CString -> CString -> IO ()
#ccall pulsar_producer_is_encryption_enabled , Ptr <struct _pulsar_producer_configuration> -> IO CInt
#ccall pulsar_producer_configuration_set_default_crypto_key_reader , Ptr <struct _pulsar_producer_configuration> -> CString -> CString -> IO ()
#ccall pulsar_producer_configuration_get_crypto_failure_action , Ptr <struct _pulsar_producer_configuration> -> IO <pulsar_producer_crypto_failure_action>
#ccall pulsar_producer_configuration_set_crypto_failure_action , Ptr <struct _pulsar_producer_configuration> -> <pulsar_producer_crypto_failure_action> -> IO ()
#ccall pulsar_producer_configuration_set_encryption_key , Ptr <struct _pulsar_producer_configuration> -> CString -> IO ()
