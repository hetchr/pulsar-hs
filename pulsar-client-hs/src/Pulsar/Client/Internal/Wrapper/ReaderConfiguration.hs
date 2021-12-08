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

mkReaderConfiguration :: MonadResource m => ReaderConfiguration -> m (Ptr C'_pulsar_reader_configuration)
mkReaderConfiguration ReaderConfiguration {..} = undefined
