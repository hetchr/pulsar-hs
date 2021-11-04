{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/message_id.h>
module Pulsar.Client.Internal.Foreign.MessageId where
import Foreign.Ptr
#strict_import

{- typedef struct _pulsar_message_id pulsar_message_id_t; -}
#opaque_t struct _pulsar_message_id
#synonym_t pulsar_message_id_t , <struct _pulsar_message_id>
#ccall pulsar_message_id_earliest , IO (Ptr <struct _pulsar_message_id>)
#ccall pulsar_message_id_latest , IO (Ptr <struct _pulsar_message_id>)
#ccall pulsar_message_id_serialize , Ptr <struct _pulsar_message_id> -> Ptr CInt -> IO (Ptr ())
#ccall pulsar_message_id_deserialize , Ptr () -> CUInt -> IO (Ptr <struct _pulsar_message_id>)
#ccall pulsar_message_id_str , Ptr <struct _pulsar_message_id> -> IO CString
#ccall pulsar_message_id_free , Ptr <struct _pulsar_message_id> -> IO ()
