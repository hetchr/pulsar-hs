{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/string_list.h>
module Pulsar.Client.Internal.Foreign.StringList where
import Foreign.Ptr
#strict_import

{- typedef struct _pulsar_string_list pulsar_string_list_t; -}
#opaque_t struct _pulsar_string_list
#synonym_t pulsar_string_list_t , <struct _pulsar_string_list>
