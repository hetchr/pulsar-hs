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
    MonadTrans,
    MonadUnliftIO,
    ReaderT,
    ResourceT,
    ReleaseKey,
    MonadReader,
    MonadResource,
    Ptr,
    module Reexport,
    CString,
    M.Map,
    liftIO,
    runReaderT,
    ask,
    lift,
    nullPtr,
    peekCString,
    withCString,
    allocate,
  )
where

import Control.Exception
import Control.Monad.IO.Class
import Control.Monad.Reader
import Control.Monad.Trans.Resource hiding (liftResourceT)
import qualified Control.Monad.Trans.Resource as T
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

new :: MonadResource m => IO a -> (a -> IO ()) -> m a
new create delete = snd <$> T.liftResourceT (liftResourceT $ allocate create delete)
{-# INLINE new #-}

toCString :: MonadResource m => String -> m CString
toCString x = new (newCString x) free
{-# INLINE toCString #-}

whenOption :: MonadResource m => Maybe a -> (a -> IO ()) -> m ()
whenOption (Just x) f = liftIO $ f x
whenOption Nothing _ = pure ()
{-# INLINE whenOption #-}

whenOptionByteString :: MonadResource m => Maybe ByteString -> (Ptr () -> CSize -> IO ()) -> m ()
whenOptionByteString (Just x) f =
  let (fPtr, start, size) = toForeignPtr x
   in liftIO $ assert (start == 0) $ withForeignPtr fPtr $ \ptr -> f (castPtr ptr) (fromIntegral size)
whenOptionByteString Nothing _ = pure ()
{-# INLINE whenOptionByteString #-}

whenOptionString :: MonadResource m => Maybe String -> (CString -> IO ()) -> m ()
whenOptionString (Just x) f = liftIO $ withCString x f
whenOptionString Nothing _ = pure ()
{-# INLINE whenOptionString #-}

whenOptionStringTuple :: MonadResource m => Maybe (String, String) -> (CString -> CString -> IO ()) -> m ()
whenOptionStringTuple (Just (x, y)) f = liftIO $ withCString x $ \x' -> withCString y $ \y' -> f x' y'
whenOptionStringTuple Nothing _ = pure ()
{-# INLINE whenOptionStringTuple #-}

whenOptionStringList :: MonadResource m => [String] -> (Ptr CString -> CSize -> IO ()) -> m ()
whenOptionStringList xs f = liftIO $ do
  cs <- traverse newCString xs
  withArrayLen cs $ \len ptr -> f ptr (fromIntegral len)
  traverse_ free cs
{-# INLINE whenOptionStringList #-}

whenOptionRaw :: MonadResource m => Maybe a -> (a -> ResourceT IO ()) -> m ()
whenOptionRaw (Just x) f = T.liftResourceT $ liftResourceT $ f x
whenOptionRaw Nothing _ = pure ()
{-# INLINE whenOptionRaw #-}

whenOptionMap :: MonadResource m => M.Map String String -> (CString -> CString -> IO ()) -> m ()
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
