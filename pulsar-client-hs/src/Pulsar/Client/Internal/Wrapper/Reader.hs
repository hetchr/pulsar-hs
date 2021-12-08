module Pulsar.Client.Internal.Wrapper.Reader
  ( Reader (..),
    withReader',
    consumeReader',
    readerNextMessage,
    readerNextMessageWithTimeout,
    readerHasNextMessage,
  )
where

import Control.Monad
import Pulsar.Client.Internal.Foreign.Reader
import Pulsar.Client.Internal.Foreign.Result
import Pulsar.Client.Internal.Wrapper.Message
import Pulsar.Client.Internal.Wrapper.Pointers
import Pulsar.Client.Internal.Wrapper.Result
import Pulsar.Client.Internal.Wrapper.Utils

withReader' :: MonadIO m => Reader -> ReaderT Reader m a -> m a
withReader' reader@(Reader ptrReader) f = undefined

consumeReader' :: MonadUnliftIO m => Reader -> ReaderT (FetchedMessage Reader) m a -> m [a]
consumeReader' reader f = undefined

readerNextMessage :: MonadUnliftIO m => (C'pulsar_result -> m a) -> ReaderT (FetchedMessage Reader) m a -> ReaderT Reader m a
readerNextMessage onFailed f = undefined

readerNextMessageWithTimeout :: MonadUnliftIO m => Int32 -> (C'pulsar_result -> m a) -> ReaderT (FetchedMessage Reader) m a -> ReaderT Reader m a
readerNextMessageWithTimeout timeout onFailed f = undefined

readerHasNextMessage :: MonadUnliftIO m => ReaderT Reader m Bool
readerHasNextMessage = undefined
