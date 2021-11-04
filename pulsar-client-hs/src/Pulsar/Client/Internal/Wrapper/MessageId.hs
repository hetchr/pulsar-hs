module Pulsar.Client.Internal.Wrapper.MessageId
  ( MessageId (..),
    messageIdEarliest,
    messageIdLatest,
    messageIdShow,
    messageIdFree,
  )
where

import Control.Exception
import Foreign.Marshal.Alloc
import Pulsar.Client.Internal.Foreign.MessageId
import Pulsar.Client.Internal.Wrapper.Utils
import System.IO.Unsafe

newtype MessageId = MessageId {unMessageId :: Ptr C'_pulsar_message_id}

messageIdShow :: MessageId -> IO String
messageIdShow (MessageId x) = bracket (c'pulsar_message_id_str x) free peekCString

messageIdFree :: MessageId -> IO ()
messageIdFree = c'pulsar_message_id_free . unMessageId

messageIdEarliest :: MessageId
messageIdEarliest = unsafePerformIO $ MessageId <$> c'pulsar_message_id_earliest
{-# NOINLINE messageIdEarliest #-}

messageIdLatest :: MessageId
messageIdLatest = unsafePerformIO $ MessageId <$> c'pulsar_message_id_latest
{-# NOINLINE messageIdLatest #-}
