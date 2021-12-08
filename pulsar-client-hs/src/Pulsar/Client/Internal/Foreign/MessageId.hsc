{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/message_id.h>
module Pulsar.Client.Internal.Foreign.MessageId where
import Foreign.Ptr
#strict_import

{- typedef struct _pulsar_message_id pulsar_message_id_t; -}
#opaque_t struct _pulsar_message_id
#synonym_t pulsar_message_id_t , <struct _pulsar_message_id>
