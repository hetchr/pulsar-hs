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
import Control.Monad.Trans.Reader (ReaderT, ask, runReaderT)
import Pulsar.Client.Internal.Foreign.Reader
import Pulsar.Client.Internal.Foreign.Result
import Pulsar.Client.Internal.Wrapper.Message
import Pulsar.Client.Internal.Wrapper.Result
import Pulsar.Client.Internal.Wrapper.Utils

newtype Reader = Reader {unReader :: Ptr C'pulsar_reader_t}

withReader' :: Reader -> ReaderT Reader IO a -> IO a
withReader' reader@(Reader ptrReader) f = do
  result <- runReaderT f reader
  c'pulsar_reader_close ptrReader
  c'pulsar_reader_free ptrReader
  return result

consumeReader' :: Reader -> ReaderT Message IO a -> IO [a]
consumeReader' reader f =
  fmap join $
    withReader' reader $
      untilM readerHasNextMessage $ readerNextMessage (const $ return []) $ fmap return f

readerNextMessage :: (C'pulsar_result -> IO a) -> ReaderT Message IO a -> ReaderT Reader IO a
readerNextMessage onFailed f = do
  Reader reader <- ask
  withPtrPtr $ \msgPtr -> do
    result <- c'pulsar_reader_read_next reader msgPtr
    peekOn (isOk result) msgPtr (onFailed result) $ flip (consumeMessage . Message) f

readerNextMessageWithTimeout :: Int32 -> (C'pulsar_result -> IO a) -> ReaderT Message IO a -> ReaderT Reader IO a
readerNextMessageWithTimeout timeout onFailed f = do
  Reader reader <- ask
  withPtrPtr $ \msgPtr -> do
    result <- c'pulsar_reader_read_next_with_timeout reader msgPtr $ CInt timeout
    peekOn (isOk result) msgPtr (onFailed result) $ flip (consumeMessage . Message) f

readerHasNextMessage :: ReaderT Reader IO Bool
readerHasNextMessage = do
  Reader reader <- ask
  withPtrPtr $ \countPtr -> do
    result <- c'pulsar_reader_has_message_available reader countPtr
    peekOn (isOk result) countPtr (return False) (return . toBool)
