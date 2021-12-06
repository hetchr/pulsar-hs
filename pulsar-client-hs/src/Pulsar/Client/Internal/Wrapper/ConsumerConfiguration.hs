{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RecordWildCards #-}

module Pulsar.Client.Internal.Wrapper.ConsumerConfiguration
  ( ConsumerConfiguration (..),
    defaultConsumerConfiguration,
    ConsumerType (..),
    InitialPosition (..),
    ConsumerCryptoFailureAction (..),
    mkConsumerConfiguration,
  )
where

import Foreign.C.Types
import GHC.Ptr
import Pulsar.Client.Internal.Foreign.ConsumerConfiguration
import Pulsar.Client.Internal.Wrapper.Utils

data ConsumerConfiguration = ConsumerConfiguration
  { consumerType :: Maybe ConsumerType,
    consumerReceiverQueueSize :: Maybe Int32,
    consumerMaxTotalReceiverQueueSizeAcrossPartitions :: Maybe Int32,
    consumerName :: Maybe String,
    consumerUnackedMessagesTimeoutMs :: Maybe Word64,
    consumerNegativeAckRedeliveryDelayMs :: Maybe Int64,
    consumerAckGroupingTimeMs :: Maybe Int64,
    consumerAckGroupingMaxSize :: Maybe Int64,
    consumerDefaultCryptoKeyReader :: Maybe (String, String),
    consumerCryptoFailureAction :: Maybe ConsumerCryptoFailureAction,
    consumerReadCompacted :: Maybe Int32,
    consumerSubscriptionInitialPosition :: Maybe InitialPosition,
    consumerProperties :: Map String String
  }
  deriving (Eq, Show)

data ConsumerType
  = ConsumerExclusive
  | ConsumerShared
  | ConsumerFailover
  | ConsumerKeyShared
  deriving (Eq, Show)

data InitialPosition
  = Latest
  | Earliest
  deriving (Eq, Show)

data ConsumerCryptoFailureAction
  = ConsumerFail
  | ConsumerDiscard
  | ConsumerConsume
  deriving (Eq, Show)

defaultConsumerConfiguration :: ConsumerConfiguration
defaultConsumerConfiguration =
  ConsumerConfiguration
    { consumerType = Nothing,
      consumerReceiverQueueSize = Nothing,
      consumerMaxTotalReceiverQueueSizeAcrossPartitions = Nothing,
      consumerName = Nothing,
      consumerUnackedMessagesTimeoutMs = Nothing,
      consumerNegativeAckRedeliveryDelayMs = Nothing,
      consumerAckGroupingTimeMs = Nothing,
      consumerAckGroupingMaxSize = Nothing,
      consumerDefaultCryptoKeyReader = Nothing,
      consumerCryptoFailureAction = Nothing,
      consumerReadCompacted = Nothing,
      consumerSubscriptionInitialPosition = Nothing,
      consumerProperties = mempty
    }

mkConsumerConfiguration :: MonadIO m => ConsumerConfiguration -> ResourceT m (Ptr C'_pulsar_consumer_configuration)
mkConsumerConfiguration ConsumerConfiguration {..} = do
  config <- new c'pulsar_consumer_configuration_create c'pulsar_consumer_configuration_free
  whenOption consumerType $ c'pulsar_consumer_configuration_set_consumer_type config . nativeConsumerType
  whenOption consumerReceiverQueueSize $ c'pulsar_consumer_configuration_set_receiver_queue_size config . CInt
  whenOption consumerMaxTotalReceiverQueueSizeAcrossPartitions $ c'pulsar_consumer_set_max_total_receiver_queue_size_across_partitions config . CInt
  whenOptionString consumerName $ c'pulsar_consumer_set_consumer_name config
  whenOption consumerUnackedMessagesTimeoutMs $ c'pulsar_consumer_set_unacked_messages_timeout_ms config . CULong
  whenOption consumerNegativeAckRedeliveryDelayMs $ c'pulsar_configure_set_negative_ack_redelivery_delay_ms config . CLong
  whenOption consumerAckGroupingTimeMs $ c'pulsar_configure_set_ack_grouping_time_ms config . CLong
  whenOption consumerAckGroupingMaxSize $ c'pulsar_configure_set_ack_grouping_max_size config . CLong
  whenOptionStringTuple consumerDefaultCryptoKeyReader $ c'pulsar_consumer_configuration_set_default_crypto_key_reader config
  whenOption consumerCryptoFailureAction $ c'pulsar_consumer_configuration_set_crypto_failure_action config . nativeConsumerCryptoFailureAction
  whenOption consumerReadCompacted $ c'pulsar_consumer_set_read_compacted config . CInt
  whenOption consumerSubscriptionInitialPosition $ c'pulsar_consumer_set_subscription_initial_position config . nativeInitialPosition
  whenOptionMap consumerProperties $ c'pulsar_consumer_configuration_set_property config
  return config

nativeConsumerType :: ConsumerType -> C'pulsar_consumer_type
nativeConsumerType =
  \case
    ConsumerExclusive -> c'pulsar_ConsumerExclusive
    ConsumerShared -> c'pulsar_ConsumerShared
    ConsumerFailover -> c'pulsar_ConsumerFailover
    ConsumerKeyShared -> c'pulsar_ConsumerKeyShared

nativeInitialPosition :: InitialPosition -> C'initial_position
nativeInitialPosition =
  \case
    Latest -> c'initial_position_latest
    Earliest -> c'initial_position_earliest

nativeConsumerCryptoFailureAction :: ConsumerCryptoFailureAction -> C'pulsar_consumer_crypto_failure_action
nativeConsumerCryptoFailureAction =
  \case
    ConsumerFail -> c'pulsar_ConsumerFail
    ConsumerDiscard -> c'pulsar_ConsumerDiscard
    ConsumerConsume -> c'pulsar_ConsumerConsume

-- c'pulsar_consumer_configuration_set_schema_info :: Pulsar.Client.Internal.Foreign.ProducerConfiguration.C'pulsar_schema_type -> String -> String -> Ptr Pulsar.Client.Internal.Foreign.StringMap.C'_pulsar_string_map
