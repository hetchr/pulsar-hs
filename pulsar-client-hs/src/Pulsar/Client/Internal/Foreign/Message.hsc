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
