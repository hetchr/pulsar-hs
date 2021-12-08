module Pulsar.Client.Unsafe
  ( createProducer,
  )
where

import Control.Monad.Trans.Resource
import Control.Monad.Trans.Resource.Internal
import Foreign.ForeignPtr
import Foreign.ForeignPtr.Unsafe
import Foreign.Storable
import GHC.Ptr
import Pulsar.Client.Internal.Foreign.Client
import Pulsar.Client.Internal.Wrapper.Pointers
import Pulsar.Client.Internal.Wrapper.Producer
import Pulsar.Client.Internal.Wrapper.ProducerConfiguration
import Pulsar.Client.Internal.Wrapper.Result
import Pulsar.Client.Internal.Wrapper.Utils

createProducer ::
  MonadUnliftIO m =>
  Client ->
  ProducerConfiguration ->
  String ->
  m (Either RawResult Producer, m ())
createProducer (Client client) configuration topic = do
  ((topic', ptrConfig), releaseParams) <-
    fromResourceT $
      (,)
        <$> toCString topic
        <*> mkProducerConfiguration configuration
  (ptrProducer, releasePtr) <- mkPtr
  result <- liftIO $ undefined client topic' ptrConfig ptrProducer
  producer <- peekOn (isOk $ RawResult result) ptrProducer (return $ Left $ RawResult result) (return . Right . Producer)
  return (producer, whenRight producer freeProducer >> releasePtr >> releaseParams)

fromResourceT :: MonadIO m => ResourceT m a -> m (a, m ())
fromResourceT f = do
  state <- createInternalState
  result <- unResourceT f state
  return (result, closeInternalState state)

mkPtr :: (MonadIO m, Storable a) => m (Ptr a, m ())
mkPtr = liftIO $ do
  foreignPtr <- mallocForeignPtr
  return (unsafeForeignPtrToPtr foreignPtr, liftIO $ touchForeignPtr foreignPtr >> finalizeForeignPtr foreignPtr)
