module Pulsar.Client.Internal.Wrapper.MessageId
  ( MessageId (..),
    messageIdEarliest,
    messageIdLatest,
    withMessageId,
    messageIdShow,
  )
where

import Control.Exception
import Foreign.Marshal.Alloc
import Pulsar.Client.Internal.Foreign.MessageId
import Pulsar.Client.Internal.Wrapper.Utils
import System.IO.Unsafe

newtype MessageId = MessageId {unMessageId :: Ptr C'_pulsar_message_id}

withMessageId :: MonadIO m => MessageId -> ReaderT MessageId m a -> m a
withMessageId x f = do
  result <- runReaderT f x
  liftIO $ c'pulsar_message_id_free $ unMessageId x
  return result

messageIdShow :: MonadIO m => ReaderT MessageId m String
messageIdShow = ask >>= \(MessageId x) -> liftIO $ bracket (c'pulsar_message_id_str x) free peekCString

messageIdEarliest :: MessageId
messageIdEarliest = unsafePerformIO $ MessageId <$> c'pulsar_message_id_earliest
{-# NOINLINE messageIdEarliest #-}

messageIdLatest :: MessageId
messageIdLatest = unsafePerformIO $ MessageId <$> c'pulsar_message_id_latest
{-# NOINLINE messageIdLatest #-}
