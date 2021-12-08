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
