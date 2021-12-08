{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/string_map.h>
module Pulsar.Client.Internal.Foreign.StringMap where
import Foreign.Ptr
#strict_import

{- typedef struct _pulsar_string_map pulsar_string_map_t; -}
#opaque_t struct _pulsar_string_map
#synonym_t pulsar_string_map_t , <struct _pulsar_string_map>
