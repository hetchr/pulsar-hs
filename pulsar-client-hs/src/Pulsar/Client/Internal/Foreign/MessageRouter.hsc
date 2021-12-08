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
