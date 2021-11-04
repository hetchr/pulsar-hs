{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/authentication.h>
module Pulsar.Client.Internal.Foreign.Authentication where
import Foreign.Ptr
#strict_import

{- typedef struct _pulsar_authentication pulsar_authentication_t; -}
#opaque_t struct _pulsar_authentication
#synonym_t pulsar_authentication_t , <struct _pulsar_authentication>
#callback token_supplier , Ptr () -> IO CString
#ccall pulsar_authentication_create , CString -> CString -> IO (Ptr <struct _pulsar_authentication>)
#ccall pulsar_authentication_tls_create , CString -> CString -> IO (Ptr <struct _pulsar_authentication>)
#ccall pulsar_authentication_token_create , CString -> IO (Ptr <struct _pulsar_authentication>)
#ccall pulsar_authentication_token_create_with_supplier , <token_supplier> -> Ptr () -> IO (Ptr <struct _pulsar_authentication>)
#ccall pulsar_authentication_athenz_create , CString -> IO (Ptr <struct _pulsar_authentication>)
#ccall pulsar_authentication_oauth2_create , CString -> IO (Ptr <struct _pulsar_authentication>)
#ccall pulsar_authentication_free , Ptr <struct _pulsar_authentication> -> IO ()
