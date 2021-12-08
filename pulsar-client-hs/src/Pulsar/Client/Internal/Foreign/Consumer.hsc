{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/consumer.h>
module Pulsar.Client.Internal.Foreign.Consumer where
import Foreign.Ptr
#strict_import

import Pulsar.Client.Internal.Foreign.Result
import Pulsar.Client.Internal.Foreign.Message
import Pulsar.Client.Internal.Foreign.MessageId
{- typedef struct _pulsar_consumer pulsar_consumer_t; -}
#opaque_t struct _pulsar_consumer
#synonym_t pulsar_consumer_t , <struct _pulsar_consumer>
