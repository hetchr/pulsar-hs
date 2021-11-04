{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/reader_configuration.h>
module Pulsar.Client.Internal.Foreign.ReaderConfiguration where
import Foreign.Ptr
#strict_import

import Pulsar.Client.Internal.Foreign.Reader
import Pulsar.Client.Internal.Foreign.Message
{- typedef struct _pulsar_reader_configuration pulsar_reader_configuration_t; -}
#opaque_t struct _pulsar_reader_configuration
#synonym_t pulsar_reader_configuration_t , <struct _pulsar_reader_configuration>
#callback pulsar_reader_listener , Ptr <struct _pulsar_reader> -> Ptr <struct _pulsar_message> -> Ptr () -> IO ()
#ccall pulsar_reader_configuration_create , IO (Ptr <struct _pulsar_reader_configuration>)
#ccall pulsar_reader_configuration_free , Ptr <struct _pulsar_reader_configuration> -> IO ()
#ccall pulsar_reader_configuration_set_reader_listener , Ptr <struct _pulsar_reader_configuration> -> <pulsar_reader_listener> -> Ptr () -> IO ()
#ccall pulsar_reader_configuration_has_reader_listener , Ptr <struct _pulsar_reader_configuration> -> IO CInt
#ccall pulsar_reader_configuration_set_receiver_queue_size , Ptr <struct _pulsar_reader_configuration> -> CInt -> IO ()
#ccall pulsar_reader_configuration_get_receiver_queue_size , Ptr <struct _pulsar_reader_configuration> -> IO CInt
#ccall pulsar_reader_configuration_set_reader_name , Ptr <struct _pulsar_reader_configuration> -> CString -> IO ()
#ccall pulsar_reader_configuration_get_reader_name , Ptr <struct _pulsar_reader_configuration> -> IO CString
#ccall pulsar_reader_configuration_set_subscription_role_prefix , Ptr <struct _pulsar_reader_configuration> -> CString -> IO ()
#ccall pulsar_reader_configuration_get_subscription_role_prefix , Ptr <struct _pulsar_reader_configuration> -> IO CString
#ccall pulsar_reader_configuration_set_read_compacted , Ptr <struct _pulsar_reader_configuration> -> CInt -> IO ()
#ccall pulsar_reader_configuration_is_read_compacted , Ptr <struct _pulsar_reader_configuration> -> IO CInt
