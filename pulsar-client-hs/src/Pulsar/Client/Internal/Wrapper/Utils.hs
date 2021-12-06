module Pulsar.Client.Internal.Wrapper.Utils
  ( fromBool,
    new,
    toCString,
    toBool,
    untilM,
    whenOption,
    whenOptionByteString,
    whenOptionMap,
    whenOptionRaw,
    whenOptionString,
    whenOptionStringTuple,
    whenOptionStringList,
    withPtrPtr,
    peekOn,
    -- Reexports
    MonadIO,
    MonadUnliftIO,
    ReaderT,
    ResourceT,
    Ptr,
    module Reexport,
    M.Map,
    liftIO,
    runReaderT,
    ask,
    lift,
    nullPtr,
    peekCString,
    withCString,
  )
where

import Control.Exception
import Control.Monad.IO.Class
import Control.Monad.Trans.Class
import Control.Monad.Trans.Reader
import Control.Monad.Trans.Resource hiding (liftResourceT)
import Data.ByteString.Internal
import Data.Foldable
import Data.Int as Reexport
import qualified Data.Map.Strict as M
import Data.Word as Reexport
import Foreign.C.Types as Reexport
import Foreign.Storable
import GHC.Ptr
import UnliftIO.Foreign hiding (new)
import UnliftIO.Resource (liftResourceT)

new :: MonadIO m => IO a -> (a -> IO ()) -> ResourceT m a
new create delete = snd <$> liftResourceT (allocate create delete)
{-# INLINE new #-}

toCString :: MonadIO m => String -> ResourceT m CString
toCString x = new (newCString x) free
{-# INLINE toCString #-}

whenOption :: MonadIO m => Maybe a -> (a -> IO ()) -> ResourceT m ()
whenOption (Just x) f = liftIO $ f x
whenOption Nothing _ = pure ()
{-# INLINE whenOption #-}

whenOptionByteString :: MonadIO m => Maybe ByteString -> (Ptr () -> CSize -> IO ()) -> ResourceT m ()
whenOptionByteString (Just x) f =
  let (fPtr, start, size) = toForeignPtr x
   in liftIO $ assert (start == 0) $ withForeignPtr fPtr $ \ptr -> f (castPtr ptr) (fromIntegral size)
whenOptionByteString Nothing _ = pure ()
{-# INLINE whenOptionByteString #-}

whenOptionString :: MonadIO m => Maybe String -> (CString -> IO ()) -> ResourceT m ()
whenOptionString (Just x) f = liftIO $ withCString x f
whenOptionString Nothing _ = pure ()
{-# INLINE whenOptionString #-}

whenOptionStringTuple :: MonadIO m => Maybe (String, String) -> (CString -> CString -> IO ()) -> ResourceT m ()
whenOptionStringTuple (Just (x, y)) f = liftIO $ withCString x $ \x' -> withCString y $ \y' -> f x' y'
whenOptionStringTuple Nothing _ = pure ()
{-# INLINE whenOptionStringTuple #-}

whenOptionStringList :: MonadIO m => [String] -> (Ptr CString -> CSize -> IO ()) -> ResourceT m ()
whenOptionStringList xs f = liftIO $ do
  cs <- traverse newCString xs
  withArrayLen cs $ \len ptr -> f ptr (fromIntegral len)
  traverse_ free cs
{-# INLINE whenOptionStringList #-}

whenOptionRaw :: MonadIO m => Maybe a -> (a -> ResourceT IO ()) -> ResourceT m ()
whenOptionRaw (Just x) f = liftResourceT $ f x
whenOptionRaw Nothing _ = pure ()
{-# INLINE whenOptionRaw #-}

whenOptionMap :: MonadIO m => M.Map String String -> (CString -> CString -> IO ()) -> ResourceT m ()
whenOptionMap xs f = liftIO $ mapM_ (\(k, v) -> withCString k $ \k' -> withCString v $ \v' -> f k' v') $ M.toList xs
{-# INLINE whenOptionMap #-}

withPtrPtr :: (Storable a, MonadIO m, MonadUnliftIO m, MonadTrans t) => (Ptr a -> m b) -> t m b
withPtrPtr f = lift $ liftIO mallocForeignPtr >>= flip withForeignPtr f
{-# INLINE withPtrPtr #-}

peekOn :: (MonadIO m, Storable a) => Bool -> Ptr a -> m b -> (a -> m b) -> m b
peekOn cond ptr def f =
  if cond
    then liftIO (peek ptr) >>= f
    else def
{-# INLINE peekOn #-}

untilM :: Monad m => m Bool -> m a -> m [a]
untilM pred prod = do
  cond <- pred
  if cond
    then (:) <$> prod <*> untilM pred prod
    else return []
