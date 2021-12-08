{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/reader_configuration.h>
module Pulsar.Client.Internal.Foreign.ReaderConfiguration where
import Foreign.Ptr
#strict_import

import Pulsar.Client.Internal.Foreign.Reader
import Pulsar.Client.Internal.Foreign.Message
{- typedef struct _pulsar_reader_configuration pulsar_reader_configuration_t; -}
#opaque_t struct _pulsar_reader_configuration
#synonym_t pulsar_reader_configuration_t , <struct _pulsar_reader_configuration>
