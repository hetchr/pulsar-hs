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
import Pulsar.Client.Internal.Wrapper.Result
import Pulsar.Client.Internal.Wrapper.Utils

newtype Reader = Reader {unReader :: Ptr C'pulsar_reader_t}

withReader' :: MonadIO m => Reader -> ReaderT Reader m a -> m a
withReader' reader@(Reader ptrReader) f = do
  result <- runReaderT f reader
  liftIO $ c'pulsar_reader_close ptrReader
  liftIO $ c'pulsar_reader_free ptrReader
  return result

consumeReader' :: MonadUnliftIO m => Reader -> ReaderT Message m a -> m [a]
consumeReader' reader f =
  fmap join $
    withReader' reader $
      untilM readerHasNextMessage $ readerNextMessage (const $ return []) $ fmap return f

readerNextMessage :: MonadUnliftIO m => (C'pulsar_result -> m a) -> ReaderT Message m a -> ReaderT Reader m a
readerNextMessage onFailed f = do
  Reader reader <- ask
  withPtrPtr $ \msgPtr -> do
    result <- liftIO $ c'pulsar_reader_read_next reader msgPtr
    peekOn (isOk result) msgPtr (onFailed result) $ flip (consumeMessage . Message) f

readerNextMessageWithTimeout :: MonadUnliftIO m => Int32 -> (C'pulsar_result -> m a) -> ReaderT Message m a -> ReaderT Reader m a
readerNextMessageWithTimeout timeout onFailed f = do
  Reader reader <- ask
  withPtrPtr $ \msgPtr -> do
    result <- liftIO $ c'pulsar_reader_read_next_with_timeout reader msgPtr $ CInt timeout
    peekOn (isOk result) msgPtr (onFailed result) $ flip (consumeMessage . Message) f

readerHasNextMessage :: MonadUnliftIO m => ReaderT Reader m Bool
readerHasNextMessage = do
  Reader reader <- ask
  withPtrPtr $ \countPtr -> do
    result <- liftIO $ c'pulsar_reader_has_message_available reader countPtr
    peekOn (isOk result) countPtr (return False) (return . toBool)
