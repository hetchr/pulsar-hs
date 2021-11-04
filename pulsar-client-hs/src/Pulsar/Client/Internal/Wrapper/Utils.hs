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
    ResourceT,
    Ptr,
    module Reexport,
    M.Map,
    liftIO,
    nullPtr,
    peekCString,
    withCString,
  )
where

import Control.Exception
import Control.Monad.IO.Class
import Control.Monad.Trans.Resource
import Data.ByteString.Internal
import Data.Foldable
import Data.Int as Reexport
import qualified Data.Map.Strict as M
import Data.Word as Reexport
import Foreign.C.String
import Foreign.C.Types as Reexport
import Foreign.ForeignPtr
import Foreign.Marshal.Alloc
import Foreign.Marshal.Array
import Foreign.Storable
import GHC.Ptr

new :: IO a -> (a -> IO ()) -> ResourceT IO a
new create delete = snd <$> allocate create delete
{-# INLINE new #-}

toCString :: String -> ResourceT IO CString
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

whenOptionRaw :: MonadIO m => Maybe a -> (a -> ResourceT m ()) -> ResourceT m ()
whenOptionRaw (Just x) f = f x
whenOptionRaw Nothing _ = pure ()
{-# INLINE whenOptionRaw #-}

whenOptionMap :: MonadIO m => M.Map String String -> (CString -> CString -> IO ()) -> ResourceT m ()
whenOptionMap xs f = liftIO $ mapM_ (\(k, v) -> withCString k $ \k' -> withCString v $ \v' -> f k' v') $ M.toList xs
{-# INLINE whenOptionMap #-}

fromBool :: Bool -> CInt
fromBool x = if x then 1 else 0
{-# INLINE fromBool #-}

toBool :: CInt -> Bool
toBool x = x /= 0
{-# INLINE toBool #-}

withPtrPtr :: Storable a => MonadIO m => (Ptr a -> IO b) -> m b
withPtrPtr f = liftIO $ mallocForeignPtr >>= flip withForeignPtr f
{-# INLINE withPtrPtr #-}

peekOn :: Storable a => Bool -> Ptr a -> IO b -> (a -> IO b) -> IO b
peekOn cond ptr def f =
  if cond
    then peek ptr >>= f
    else def
{-# INLINE peekOn #-}

untilM :: Monad m => m Bool -> m a -> m [a]
untilM pred prod = do
  cond <- pred
  if cond
    then (:) <$> prod <*> untilM pred prod
    else return []
