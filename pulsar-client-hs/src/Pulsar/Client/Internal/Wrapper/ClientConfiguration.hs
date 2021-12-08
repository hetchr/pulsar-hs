{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE RecordWildCards #-}

module Pulsar.Client.Internal.Wrapper.ClientConfiguration
  ( ClientConfiguration (..),
    defaultClientConfiguration,
    mkClientConfiguration,
    LogLevel,
    LogFile,
    LogLine,
    LogMessage,
  )
where

import Foreign.Ptr (freeHaskellFunPtr)
import GHC.Ptr
import Pulsar.Client.Internal.Foreign.ClientConfiguration
import Pulsar.Client.Internal.Wrapper.Authentication
import Pulsar.Client.Internal.Wrapper.Utils

data ClientConfiguration = ClientConfiguration
  { clientAuth :: Maybe AuthenticationConfig,
    clientMemoryLimit :: Maybe Word64,
    clientOperationTimeoutSeconds :: Maybe Int32,
    clientIoThreads :: Maybe Int32,
    clientMessageListenerThreads :: Maybe Int32,
    clientConcurrentLookupRequest :: Maybe Int32,
    clientUseTls :: Maybe Int32,
    clientTlsTrustCertsFilePath :: Maybe String,
    clientTlsAllowInsecureConnection :: Maybe Int32,
    clientStatsIntervalInSeconds :: Maybe Word32,
    clientValidateHostname :: Maybe Int32,
    clientLogger :: Maybe (LogLevel -> LogFile -> LogLine -> LogMessage -> IO ())
  }

type LogLevel = Word32

type LogFile = String

type LogLine = Int32

type LogMessage = String

defaultClientConfiguration :: ClientConfiguration
defaultClientConfiguration =
  ClientConfiguration
    { clientAuth = Nothing,
      clientMemoryLimit = Nothing,
      clientOperationTimeoutSeconds = Nothing,
      clientIoThreads = Nothing,
      clientMessageListenerThreads = Nothing,
      clientConcurrentLookupRequest = Nothing,
      clientUseTls = Nothing,
      clientTlsTrustCertsFilePath = Nothing,
      clientTlsAllowInsecureConnection = Nothing,
      clientStatsIntervalInSeconds = Nothing,
      clientValidateHostname = Nothing,
      clientLogger = Nothing
    }

mkClientConfiguration :: MonadResource m => ClientConfiguration -> m (Ptr C'_pulsar_client_configuration)
mkClientConfiguration ClientConfiguration {..} = undefined

foreign import ccall "wrapper"
  wrapLogger ::
    (CUInt -> CString -> CInt -> CString -> Ptr () -> IO ()) ->
    IO (FunPtr (CUInt -> CString -> CInt -> CString -> Ptr () -> IO ()))
