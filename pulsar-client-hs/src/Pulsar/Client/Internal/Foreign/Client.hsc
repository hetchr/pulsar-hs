{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/client.h>
module Pulsar.Client.Internal.Foreign.Client where
import Foreign.Ptr
#strict_import

import Pulsar.Client.Internal.Foreign.ClientConfiguration
import Pulsar.Client.Internal.Foreign.Message
import Pulsar.Client.Internal.Foreign.MessageId
import Pulsar.Client.Internal.Foreign.Producer
import Pulsar.Client.Internal.Foreign.Consumer
import Pulsar.Client.Internal.Foreign.Reader
import Pulsar.Client.Internal.Foreign.ConsumerConfiguration
import Pulsar.Client.Internal.Foreign.ProducerConfiguration
import Pulsar.Client.Internal.Foreign.ReaderConfiguration
import Pulsar.Client.Internal.Foreign.Result
import Pulsar.Client.Internal.Foreign.StringList
{- typedef struct _pulsar_client pulsar_client_t; -}
#opaque_t struct _pulsar_client
#synonym_t pulsar_client_t , <struct _pulsar_client>
