module Pulsar.Client.Internal.Wrapper.MessageId
  ( MessageId (..),
    FetchedMessageId (..),
    messageIdEarliest,
    messageIdLatest,
    withMessageId,
    messageIdShow,
  )
where

import Control.Exception
import Foreign.Marshal.Alloc
import Pulsar.Client.Internal.Foreign.MessageId
import Pulsar.Client.Internal.Wrapper.Pointers
import Pulsar.Client.Internal.Wrapper.Utils
import System.IO.Unsafe

withMessageId :: MonadIO m => FetchedMessageId s -> ReaderT (FetchedMessageId s) m a -> m a
withMessageId x f = undefined

messageIdShow :: (MonadIO m, MonadReader (FetchedMessageId s) m) => m String
messageIdShow = undefined

messageIdEarliest :: MessageId
messageIdEarliest = undefined
{-# NOINLINE messageIdEarliest #-}

messageIdLatest :: MessageId
messageIdLatest = undefined
{-# NOINLINE messageIdLatest #-}
