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
withMessageId x f = do
  result <- runReaderT f x
  liftIO $ c'pulsar_message_id_free $ unMessageId $ unFetchedMessageId x
  return result

messageIdShow :: (MonadIO m, MonadReader (FetchedMessageId s) m) => m String
messageIdShow = ask >>= \x -> liftIO $ bracket (c'pulsar_message_id_str $ unMessageId $ unFetchedMessageId x) free peekCString

messageIdEarliest :: MessageId
messageIdEarliest = unsafePerformIO $ MessageId <$> c'pulsar_message_id_earliest
{-# NOINLINE messageIdEarliest #-}

messageIdLatest :: MessageId
messageIdLatest = unsafePerformIO $ MessageId <$> c'pulsar_message_id_latest
{-# NOINLINE messageIdLatest #-}
