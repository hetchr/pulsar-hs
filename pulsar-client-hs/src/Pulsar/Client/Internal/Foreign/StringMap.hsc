{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/string_map.h>
module Pulsar.Client.Internal.Foreign.StringMap where
import Foreign.Ptr
#strict_import

{- typedef struct _pulsar_string_map pulsar_string_map_t; -}
#opaque_t struct _pulsar_string_map
#synonym_t pulsar_string_map_t , <struct _pulsar_string_map>
#ccall pulsar_string_map_create , IO (Ptr <struct _pulsar_string_map>)
#ccall pulsar_string_map_free , Ptr <struct _pulsar_string_map> -> IO ()
#ccall pulsar_string_map_size , Ptr <struct _pulsar_string_map> -> IO CInt
#ccall pulsar_string_map_put , Ptr <struct _pulsar_string_map> -> CString -> CString -> IO ()
#ccall pulsar_string_map_get , Ptr <struct _pulsar_string_map> -> CString -> IO CString
#ccall pulsar_string_map_get_key , Ptr <struct _pulsar_string_map> -> CInt -> IO CString
#ccall pulsar_string_map_get_value , Ptr <struct _pulsar_string_map> -> CInt -> IO CString
