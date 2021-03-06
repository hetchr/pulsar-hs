{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/message_router.h>
module Pulsar.Client.Internal.Foreign.MessageRouter where
import Foreign.Ptr
#strict_import

import Pulsar.Client.Internal.Foreign.Message
{- typedef struct _pulsar_topic_metadata pulsar_topic_metadata_t; -}
#opaque_t struct _pulsar_topic_metadata
#synonym_t pulsar_topic_metadata_t , <struct _pulsar_topic_metadata>
#callback pulsar_message_router , Ptr <struct _pulsar_message> -> Ptr <struct _pulsar_topic_metadata> -> Ptr () -> IO CInt
#ccall pulsar_topic_metadata_get_num_partitions , Ptr <struct _pulsar_topic_metadata> -> IO CInt
