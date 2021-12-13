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
withProducer' producer f = do
  result <- runReaderT f producer
  freeProducer producer
  return result

freeProducer :: MonadIO m => Producer -> m ()
freeProducer (Producer ptrProducer) = liftIO $ do
  c'pulsar_producer_flush ptrProducer
  c'pulsar_producer_close ptrProducer
  c'pulsar_producer_free ptrProducer

sendMessage :: (MonadIO m, MonadReader Producer m) => BuiltMessage -> m RawResult
sendMessage msg = do
  Producer producer <- ask
  liftIO $ RawResult <$> c'pulsar_producer_send producer (unMessage $ unBuiltMessage msg)

flushMessages :: (MonadIO m, MonadReader Producer m) => m RawResult
flushMessages = ask >>= liftIO . fmap RawResult . c'pulsar_producer_flush . unProducer

producerLastSequenceId :: (MonadIO m, MonadReader Producer m) => m Int64
producerLastSequenceId = ask >>= liftIO . fmap (\(CLong x) -> x) . c'pulsar_producer_get_last_sequence_id . unProducer
