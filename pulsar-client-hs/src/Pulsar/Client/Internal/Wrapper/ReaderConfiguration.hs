{-# LANGUAGE RecordWildCards #-}

module Pulsar.Client.Internal.Wrapper.ReaderConfiguration
  ( ReaderConfiguration (..),
    defaultReaderConfiguration,
    mkReaderConfiguration,
  )
where

import Foreign.C.Types
import GHC.Ptr
import Pulsar.Client.Internal.Foreign.ReaderConfiguration
import Pulsar.Client.Internal.Wrapper.Utils

data ReaderConfiguration = ReaderConfiguration
  { readerReceiverQueueSize :: Maybe Int32,
    readerName :: Maybe String,
    readerSubscriptionRolePrefix :: Maybe String,
    readerReadCompacted :: Maybe Int32
  }

defaultReaderConfiguration :: ReaderConfiguration
defaultReaderConfiguration =
  ReaderConfiguration
    { readerReceiverQueueSize = Nothing,
      readerName = Nothing,
      readerSubscriptionRolePrefix = Nothing,
      readerReadCompacted = Nothing
    }

mkReaderConfiguration :: MonadIO m => ReaderConfiguration -> ResourceT m (Ptr C'_pulsar_reader_configuration)
mkReaderConfiguration ReaderConfiguration {..} = do
  config <- new c'pulsar_reader_configuration_create c'pulsar_reader_configuration_free
  whenOption readerReceiverQueueSize $ c'pulsar_reader_configuration_set_receiver_queue_size config . CInt
  whenOptionString readerName $ c'pulsar_reader_configuration_set_reader_name config
  whenOptionString readerSubscriptionRolePrefix $ c'pulsar_reader_configuration_set_subscription_role_prefix config
  whenOption readerReadCompacted $ c'pulsar_reader_configuration_set_read_compacted config . CInt
  return config
