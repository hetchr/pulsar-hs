{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/producer.h>
module Pulsar.Client.Internal.Foreign.Producer where
import Foreign.Ptr
#strict_import

import Pulsar.Client.Internal.Foreign.Message
import Pulsar.Client.Internal.Foreign.MessageId
import Pulsar.Client.Internal.Foreign.Result
{- typedef struct _pulsar_producer pulsar_producer_t; -}
#opaque_t struct _pulsar_producer
#synonym_t pulsar_producer_t , <struct _pulsar_producer>
#callback pulsar_send_callback , <pulsar_result> -> Ptr <struct _pulsar_message_id> -> Ptr () -> IO ()
#callback pulsar_close_callback , <pulsar_result> -> Ptr () -> IO ()
#callback pulsar_flush_callback , <pulsar_result> -> Ptr () -> IO ()
#ccall pulsar_producer_get_topic , Ptr <struct _pulsar_producer> -> IO CString
#ccall pulsar_producer_get_producer_name , Ptr <struct _pulsar_producer> -> IO CString
#ccall pulsar_producer_send , Ptr <struct _pulsar_producer> -> Ptr <struct _pulsar_message> -> IO <pulsar_result>
#ccall pulsar_producer_send_async , Ptr <struct _pulsar_producer> -> Ptr <struct _pulsar_message> -> <pulsar_send_callback> -> Ptr () -> IO ()
#ccall pulsar_producer_get_last_sequence_id , Ptr <struct _pulsar_producer> -> IO CLong
#ccall pulsar_producer_close , Ptr <struct _pulsar_producer> -> IO <pulsar_result>
#ccall pulsar_producer_close_async , Ptr <struct _pulsar_producer> -> <pulsar_close_callback> -> Ptr () -> IO ()
#ccall pulsar_producer_flush , Ptr <struct _pulsar_producer> -> IO <pulsar_result>
#ccall pulsar_producer_flush_async , Ptr <struct _pulsar_producer> -> <pulsar_flush_callback> -> Ptr () -> IO ()
#ccall pulsar_producer_free , Ptr <struct _pulsar_producer> -> IO ()
#ccall pulsar_producer_is_connected , Ptr <struct _pulsar_producer> -> IO CInt
