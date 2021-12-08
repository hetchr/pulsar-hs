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
