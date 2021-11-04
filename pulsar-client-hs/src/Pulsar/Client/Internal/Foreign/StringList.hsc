{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/string_list.h>
module Pulsar.Client.Internal.Foreign.StringList where
import Foreign.Ptr
#strict_import

{- typedef struct _pulsar_string_list pulsar_string_list_t; -}
#opaque_t struct _pulsar_string_list
#synonym_t pulsar_string_list_t , <struct _pulsar_string_list>
#ccall pulsar_string_list_create , IO (Ptr <struct _pulsar_string_list>)
#ccall pulsar_string_list_free , Ptr <struct _pulsar_string_list> -> IO ()
#ccall pulsar_string_list_size , Ptr <struct _pulsar_string_list> -> IO CInt
#ccall pulsar_string_list_append , Ptr <struct _pulsar_string_list> -> CString -> IO ()
#ccall pulsar_string_list_get , Ptr <struct _pulsar_string_list> -> CInt -> IO CString
