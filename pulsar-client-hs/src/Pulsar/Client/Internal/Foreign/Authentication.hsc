{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/authentication.h>
module Pulsar.Client.Internal.Foreign.Authentication where
import Foreign.Ptr
#strict_import

{- typedef struct _pulsar_authentication pulsar_authentication_t; -}
#opaque_t struct _pulsar_authentication
#synonym_t pulsar_authentication_t , <struct _pulsar_authentication>
