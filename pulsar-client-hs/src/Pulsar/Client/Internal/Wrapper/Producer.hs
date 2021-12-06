module Pulsar.Client.Internal.Wrapper.Producer
  ( Producer (..),
    withProducer',
    sendMessage,
    flushMessages,
    producerLastSequenceId,
  )
where

import Control.Monad.Trans.Reader
import Pulsar.Client.Internal.Foreign.Producer
import Pulsar.Client.Internal.Wrapper.Message
import Pulsar.Client.Internal.Wrapper.Result
import Pulsar.Client.Internal.Wrapper.Utils

newtype Producer = Producer {unProducer :: Ptr C'pulsar_producer_t}

withProducer' :: MonadIO m => Producer -> ReaderT Producer m a -> m a
withProducer' producer@(Producer ptrProducer) f = do
  result <- runReaderT f producer
  liftIO $ c'pulsar_producer_flush ptrProducer
  liftIO $ c'pulsar_producer_close ptrProducer
  liftIO $ c'pulsar_producer_free ptrProducer
  return result

sendMessage :: MonadIO m => Message -> ReaderT Producer m RawResult
sendMessage msg = do
  Producer producer <- ask
  liftIO $ RawResult <$> c'pulsar_producer_send producer (unMessage msg)

flushMessages :: MonadIO m => ReaderT Producer m RawResult
flushMessages = ask >>= liftIO . fmap RawResult . c'pulsar_producer_flush . unProducer

producerLastSequenceId :: MonadIO m => ReaderT Producer m Int64
producerLastSequenceId = ask >>= liftIO . fmap (\(CLong x) -> x) . c'pulsar_producer_get_last_sequence_id . unProducer
