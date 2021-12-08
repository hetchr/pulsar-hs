module Pulsar.Client.Internal.Wrapper.Producer
  ( Producer (..),
    withProducer',
    freeProducer,
    sendMessage,
    flushMessages,
    producerLastSequenceId,
  )
where

import Pulsar.Client.Internal.Foreign.Producer
import Pulsar.Client.Internal.Wrapper.Message
import Pulsar.Client.Internal.Wrapper.Pointers
import Pulsar.Client.Internal.Wrapper.Utils

withProducer' :: MonadIO m => Producer -> ReaderT Producer m a -> m a
withProducer' producer@(Producer ptrProducer) f = undefined

freeProducer :: MonadIO m => Producer -> m ()
freeProducer _ = undefined

sendMessage :: (MonadIO m, MonadReader Producer m) => BuiltMessage -> m RawResult
sendMessage msg = undefined

flushMessages :: (MonadIO m, MonadReader Producer m) => m RawResult
flushMessages = undefined

producerLastSequenceId :: (MonadIO m, MonadReader Producer m) => m Int64
producerLastSequenceId = undefined
