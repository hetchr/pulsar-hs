{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/client_configuration.h>
module Pulsar.Client.Internal.Foreign.ClientConfiguration where
import Pulsar.Client.Internal.Foreign.Authentication
import Foreign.Ptr
#strict_import

{- typedef enum {
            pulsar_DEBUG = 0,
            pulsar_INFO = 1,
            pulsar_WARN = 2,
            pulsar_ERROR = 3
        } pulsar_logger_level_t; -}
#integral_t pulsar_logger_level_t
#num pulsar_DEBUG
#num pulsar_INFO
#num pulsar_WARN
#num pulsar_ERROR
#callback pulsar_logger , <pulsar_logger_level_t> -> CString -> CInt -> CString -> Ptr () -> IO ()
{- typedef struct _pulsar_client_configuration pulsar_client_configuration_t; -}
#opaque_t struct _pulsar_client_configuration
#synonym_t pulsar_client_configuration_t , <struct _pulsar_client_configuration>
#ccall pulsar_client_configuration_create , IO (Ptr <struct _pulsar_client_configuration>)
#ccall pulsar_client_configuration_free , Ptr <struct _pulsar_client_configuration> -> IO ()
#ccall pulsar_client_configuration_set_auth , Ptr <struct _pulsar_client_configuration> -> Ptr <struct _pulsar_authentication> -> IO ()
#ccall pulsar_client_configuration_set_memory_limit , Ptr <struct _pulsar_client_configuration> -> CULong -> IO ()
#ccall pulsar_client_configuration_get_memory_limit , Ptr <struct _pulsar_client_configuration> -> IO CULong
#ccall pulsar_client_configuration_set_operation_timeout_seconds , Ptr <struct _pulsar_client_configuration> -> CInt -> IO ()
#ccall pulsar_client_configuration_get_operation_timeout_seconds , Ptr <struct _pulsar_client_configuration> -> IO CInt
#ccall pulsar_client_configuration_set_io_threads , Ptr <struct _pulsar_client_configuration> -> CInt -> IO ()
#ccall pulsar_client_configuration_get_io_threads , Ptr <struct _pulsar_client_configuration> -> IO CInt
#ccall pulsar_client_configuration_set_message_listener_threads , Ptr <struct _pulsar_client_configuration> -> CInt -> IO ()
#ccall pulsar_client_configuration_get_message_listener_threads , Ptr <struct _pulsar_client_configuration> -> IO CInt
#ccall pulsar_client_configuration_set_concurrent_lookup_request , Ptr <struct _pulsar_client_configuration> -> CInt -> IO ()
#ccall pulsar_client_configuration_get_concurrent_lookup_request , Ptr <struct _pulsar_client_configuration> -> IO CInt
#ccall pulsar_client_configuration_set_logger , Ptr <struct _pulsar_client_configuration> -> <pulsar_logger> -> Ptr () -> IO ()
#ccall pulsar_client_configuration_set_use_tls , Ptr <struct _pulsar_client_configuration> -> CInt -> IO ()
#ccall pulsar_client_configuration_is_use_tls , Ptr <struct _pulsar_client_configuration> -> IO CInt
#ccall pulsar_client_configuration_set_tls_trust_certs_file_path , Ptr <struct _pulsar_client_configuration> -> CString -> IO ()
#ccall pulsar_client_configuration_get_tls_trust_certs_file_path , Ptr <struct _pulsar_client_configuration> -> IO CString
#ccall pulsar_client_configuration_set_tls_allow_insecure_connection , Ptr <struct _pulsar_client_configuration> -> CInt -> IO ()
#ccall pulsar_client_configuration_is_tls_allow_insecure_connection , Ptr <struct _pulsar_client_configuration> -> IO CInt
#ccall pulsar_client_configuration_set_stats_interval_in_seconds , Ptr <struct _pulsar_client_configuration> -> CUInt -> IO ()
#ccall pulsar_client_configuration_is_validate_hostname , Ptr <struct _pulsar_client_configuration> -> IO CInt
#ccall pulsar_client_configuration_set_validate_hostname , Ptr <struct _pulsar_client_configuration> -> CInt -> IO ()
#ccall pulsar_client_configuration_get_stats_interval_in_seconds , Ptr <struct _pulsar_client_configuration> -> IO CUInt
