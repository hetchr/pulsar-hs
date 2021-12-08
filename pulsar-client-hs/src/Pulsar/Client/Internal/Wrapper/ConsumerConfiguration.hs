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

mkConsumerConfiguration :: MonadResource m => ConsumerConfiguration -> m (Ptr C'_pulsar_consumer_configuration)
mkConsumerConfiguration ConsumerConfiguration {..} = undefined

nativeConsumerType :: ConsumerType -> C'pulsar_consumer_type
nativeConsumerType =
  \case
    ConsumerExclusive -> undefined
    ConsumerShared -> undefined
    ConsumerFailover -> undefined
    ConsumerKeyShared -> undefined

nativeInitialPosition :: InitialPosition -> C'initial_position
nativeInitialPosition =
  \case
    Latest -> undefined
    Earliest -> undefined

nativeConsumerCryptoFailureAction :: ConsumerCryptoFailureAction -> C'pulsar_consumer_crypto_failure_action
nativeConsumerCryptoFailureAction =
  \case
    ConsumerFail -> undefined
    ConsumerDiscard -> undefined
    ConsumerConsume -> undefined

-- undefined :: Pulsar.Client.Internal.Foreign.ProducerConfiguration.C'pulsar_schema_type -> String -> String -> Ptr Pulsar.Client.Internal.Foreign.StringMap.C'_pulsar_string_map
