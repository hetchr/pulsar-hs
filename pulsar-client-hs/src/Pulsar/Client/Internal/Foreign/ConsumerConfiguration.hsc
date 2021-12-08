{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/consumer_configuration.h>
module Pulsar.Client.Internal.Foreign.ConsumerConfiguration where
import Foreign.Ptr
#strict_import

import Pulsar.Client.Internal.Foreign.Consumer
import Pulsar.Client.Internal.Foreign.Message
import Pulsar.Client.Internal.Foreign.ProducerConfiguration
import Pulsar.Client.Internal.Foreign.StringMap
{- typedef struct _pulsar_consumer_configuration pulsar_consumer_configuration_t; -}
#opaque_t struct _pulsar_consumer_configuration
#synonym_t pulsar_consumer_configuration_t , <struct _pulsar_consumer_configuration>
{- typedef enum {
            pulsar_ConsumerExclusive,
            pulsar_ConsumerShared,
            pulsar_ConsumerFailover,
            pulsar_ConsumerKeyShared
        } pulsar_consumer_type; -}
#integral_t pulsar_consumer_type
#num pulsar_ConsumerExclusive
#num pulsar_ConsumerShared
#num pulsar_ConsumerFailover
#num pulsar_ConsumerKeyShared
{- typedef enum {
            initial_position_latest, initial_position_earliest
        } initial_position; -}
#integral_t initial_position
#num initial_position_latest
#num initial_position_earliest
{- typedef enum {
            pulsar_ConsumerFail, pulsar_ConsumerDiscard, pulsar_ConsumerConsume
        } pulsar_consumer_crypto_failure_action; -}
#integral_t pulsar_consumer_crypto_failure_action
#num pulsar_ConsumerFail
#num pulsar_ConsumerDiscard
#num pulsar_ConsumerConsume
