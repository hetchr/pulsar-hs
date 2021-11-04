{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/consumer_configuration.h>
module Pulsar.Client.Internal.Foreign.ConsumerConfiguration where
import Foreign.Ptr
#strict_import

import Pulsar.Client.Internal.Foreign.Consumer
import Pulsar.Client.Internal.Foreign.Message
import Pulsar.Client.Internal.Foreign.ProducerConfiguration
import Pulsar.Client.Internal.Foreign.StringMap
{- typedef struct _pulsar_consumer_configuration pulsar_consumer_configuration_t; -}
#opaque_t struct _pulsar_consumer_configuration
#synonym_t pulsar_consumer_configuration_t , <struct _pulsar_consumer_configuration>
{- typedef enum {
            pulsar_ConsumerExclusive,
            pulsar_ConsumerShared,
            pulsar_ConsumerFailover,
            pulsar_ConsumerKeyShared
        } pulsar_consumer_type; -}
#integral_t pulsar_consumer_type
#num pulsar_ConsumerExclusive
#num pulsar_ConsumerShared
#num pulsar_ConsumerFailover
#num pulsar_ConsumerKeyShared
{- typedef enum {
            initial_position_latest, initial_position_earliest
        } initial_position; -}
#integral_t initial_position
#num initial_position_latest
#num initial_position_earliest
{- typedef enum {
            pulsar_ConsumerFail, pulsar_ConsumerDiscard, pulsar_ConsumerConsume
        } pulsar_consumer_crypto_failure_action; -}
#integral_t pulsar_consumer_crypto_failure_action
#num pulsar_ConsumerFail
#num pulsar_ConsumerDiscard
#num pulsar_ConsumerConsume
#callback pulsar_message_listener , Ptr <struct _pulsar_consumer> -> Ptr <struct _pulsar_message> -> Ptr () -> IO ()
#ccall pulsar_consumer_configuration_create , IO (Ptr <struct _pulsar_consumer_configuration>)
#ccall pulsar_consumer_configuration_free , Ptr <struct _pulsar_consumer_configuration> -> IO ()
#ccall pulsar_consumer_configuration_set_consumer_type , Ptr <struct _pulsar_consumer_configuration> -> <pulsar_consumer_type> -> IO ()
#ccall pulsar_consumer_configuration_get_consumer_type , Ptr <struct _pulsar_consumer_configuration> -> IO <pulsar_consumer_type>
#ccall pulsar_consumer_configuration_set_schema_info , Ptr <struct _pulsar_consumer_configuration> -> <pulsar_schema_type> -> CString -> CString -> Ptr <struct _pulsar_string_map> -> IO ()
#ccall pulsar_consumer_configuration_set_message_listener , Ptr <struct _pulsar_consumer_configuration> -> <pulsar_message_listener> -> Ptr () -> IO ()
#ccall pulsar_consumer_configuration_has_message_listener , Ptr <struct _pulsar_consumer_configuration> -> IO CInt
#ccall pulsar_consumer_configuration_set_receiver_queue_size , Ptr <struct _pulsar_consumer_configuration> -> CInt -> IO ()
#ccall pulsar_consumer_configuration_get_receiver_queue_size , Ptr <struct _pulsar_consumer_configuration> -> IO CInt
#ccall pulsar_consumer_set_max_total_receiver_queue_size_across_partitions , Ptr <struct _pulsar_consumer_configuration> -> CInt -> IO ()
#ccall pulsar_consumer_get_max_total_receiver_queue_size_across_partitions , Ptr <struct _pulsar_consumer_configuration> -> IO CInt
#ccall pulsar_consumer_set_consumer_name , Ptr <struct _pulsar_consumer_configuration> -> CString -> IO ()
#ccall pulsar_consumer_get_consumer_name , Ptr <struct _pulsar_consumer_configuration> -> IO CString
#ccall pulsar_consumer_set_unacked_messages_timeout_ms , Ptr <struct _pulsar_consumer_configuration> -> CULong -> IO ()
#ccall pulsar_consumer_get_unacked_messages_timeout_ms , Ptr <struct _pulsar_consumer_configuration> -> IO CLong
#ccall pulsar_configure_set_negative_ack_redelivery_delay_ms , Ptr <struct _pulsar_consumer_configuration> -> CLong -> IO ()
#ccall pulsar_configure_get_negative_ack_redelivery_delay_ms , Ptr <struct _pulsar_consumer_configuration> -> IO CLong
#ccall pulsar_configure_set_ack_grouping_time_ms , Ptr <struct _pulsar_consumer_configuration> -> CLong -> IO ()
#ccall pulsar_configure_get_ack_grouping_time_ms , Ptr <struct _pulsar_consumer_configuration> -> IO CLong
#ccall pulsar_configure_set_ack_grouping_max_size , Ptr <struct _pulsar_consumer_configuration> -> CLong -> IO ()
#ccall pulsar_configure_get_ack_grouping_max_size , Ptr <struct _pulsar_consumer_configuration> -> IO CLong
#ccall pulsar_consumer_is_encryption_enabled , Ptr <struct _pulsar_consumer_configuration> -> IO CInt
#ccall pulsar_consumer_configuration_set_default_crypto_key_reader , Ptr <struct _pulsar_consumer_configuration> -> CString -> CString -> IO ()
#ccall pulsar_consumer_configuration_get_crypto_failure_action , Ptr <struct _pulsar_consumer_configuration> -> IO <pulsar_consumer_crypto_failure_action>
#ccall pulsar_consumer_configuration_set_crypto_failure_action , Ptr <struct _pulsar_consumer_configuration> -> <pulsar_consumer_crypto_failure_action> -> IO ()
#ccall pulsar_consumer_is_read_compacted , Ptr <struct _pulsar_consumer_configuration> -> IO CInt
#ccall pulsar_consumer_set_read_compacted , Ptr <struct _pulsar_consumer_configuration> -> CInt -> IO ()
#ccall pulsar_consumer_get_subscription_initial_position , Ptr <struct _pulsar_consumer_configuration> -> IO CInt
#ccall pulsar_consumer_set_subscription_initial_position , Ptr <struct _pulsar_consumer_configuration> -> <initial_position> -> IO ()
#ccall pulsar_consumer_configuration_set_property , Ptr <struct _pulsar_consumer_configuration> -> CString -> CString -> IO ()
