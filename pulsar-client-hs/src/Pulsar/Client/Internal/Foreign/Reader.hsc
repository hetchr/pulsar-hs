{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/reader.h>
module Pulsar.Client.Internal.Foreign.Reader where
import Foreign.Ptr
#strict_import

import Pulsar.Client.Internal.Foreign.Result
import Pulsar.Client.Internal.Foreign.Message
{- typedef struct _pulsar_reader pulsar_reader_t; -}
#opaque_t struct _pulsar_reader
#synonym_t pulsar_reader_t , <struct _pulsar_reader>
