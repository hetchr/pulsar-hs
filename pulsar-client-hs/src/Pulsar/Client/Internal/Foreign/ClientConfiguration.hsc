{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/client_configuration.h>
module Pulsar.Client.Internal.Foreign.ClientConfiguration where
import Pulsar.Client.Internal.Foreign.Authentication
import Foreign.Ptr
#strict_import

{- typedef enum {
            pulsar_DEBUG = 0,
            pulsar_INFO = 1,
            pulsar_WARN = 2,
            pulsar_ERROR = 3
        } pulsar_logger_level_t; -}
#integral_t pulsar_logger_level_t
#num pulsar_DEBUG
#num pulsar_INFO
#num pulsar_WARN
#num pulsar_ERROR
{- typedef struct _pulsar_client_configuration pulsar_client_configuration_t; -}
#opaque_t struct _pulsar_client_configuration
#synonym_t pulsar_client_configuration_t , <struct _pulsar_client_configuration>
