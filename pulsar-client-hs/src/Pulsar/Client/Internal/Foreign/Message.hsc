{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/message.h>
module Pulsar.Client.Internal.Foreign.Message where
import Foreign.Ptr
#strict_import

import Pulsar.Client.Internal.Foreign.MessageId
import Pulsar.Client.Internal.Foreign.StringMap
{- typedef struct _pulsar_message pulsar_message_t; -}
#opaque_t struct _pulsar_message
#synonym_t pulsar_message_t , <struct _pulsar_message>
#ccall pulsar_message_create , IO (Ptr <struct _pulsar_message>)
#ccall pulsar_message_free , Ptr <struct _pulsar_message> -> IO ()
#ccall pulsar_message_set_content , Ptr <struct _pulsar_message> -> Ptr () -> CSize -> IO ()
#ccall pulsar_message_set_allocated_content , Ptr <struct _pulsar_message> -> Ptr () -> CSize -> IO ()
#ccall pulsar_message_set_property , Ptr <struct _pulsar_message> -> CString -> CString -> IO ()
#ccall pulsar_message_set_partition_key , Ptr <struct _pulsar_message> -> CString -> IO ()
#ccall pulsar_message_set_ordering_key , Ptr <struct _pulsar_message> -> CString -> IO ()
#ccall pulsar_message_set_event_timestamp , Ptr <struct _pulsar_message> -> CULong -> IO ()
#ccall pulsar_message_set_sequence_id , Ptr <struct _pulsar_message> -> CLong -> IO ()
#ccall pulsar_message_set_deliver_after , Ptr <struct _pulsar_message> -> CULong -> IO ()
#ccall pulsar_message_set_deliver_at , Ptr <struct _pulsar_message> -> CULong -> IO ()
#ccall pulsar_message_set_replication_clusters , Ptr <struct _pulsar_message> -> Ptr CString -> CSize -> IO ()
#ccall pulsar_message_disable_replication , Ptr <struct _pulsar_message> -> CInt -> IO ()
#ccall pulsar_message_get_properties , Ptr <struct _pulsar_message> -> IO (Ptr <struct _pulsar_string_map>)
#ccall pulsar_message_has_property , Ptr <struct _pulsar_message> -> CString -> IO CInt
#ccall pulsar_message_get_property , Ptr <struct _pulsar_message> -> CString -> IO CString
#ccall pulsar_message_get_data , Ptr <struct _pulsar_message> -> IO (Ptr ())
#ccall pulsar_message_get_length , Ptr <struct _pulsar_message> -> IO CUInt
#ccall pulsar_message_get_message_id , Ptr <struct _pulsar_message> -> IO (Ptr <struct _pulsar_message_id>)
#ccall pulsar_message_get_partitionKey , Ptr <struct _pulsar_message> -> IO CString
#ccall pulsar_message_has_partition_key , Ptr <struct _pulsar_message> -> IO CInt
#ccall pulsar_message_get_orderingKey , Ptr <struct _pulsar_message> -> IO CString
#ccall pulsar_message_has_ordering_key , Ptr <struct _pulsar_message> -> IO CInt
#ccall pulsar_message_get_publish_timestamp , Ptr <struct _pulsar_message> -> IO CULong
#ccall pulsar_message_get_event_timestamp , Ptr <struct _pulsar_message> -> IO CULong
#ccall pulsar_message_get_topic_name , Ptr <struct _pulsar_message> -> IO CString
#ccall pulsar_message_get_redelivery_count , Ptr <struct _pulsar_message> -> IO CInt
#ccall pulsar_message_has_schema_version , Ptr <struct _pulsar_message> -> IO CInt
#ccall pulsar_message_get_schemaVersion , Ptr <struct _pulsar_message> -> IO CString
#ccall pulsar_message_set_schema_version , Ptr <struct _pulsar_message> -> CString -> IO ()
