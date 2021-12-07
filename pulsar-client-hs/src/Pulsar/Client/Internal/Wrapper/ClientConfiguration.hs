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
mkClientConfiguration ClientConfiguration {..} = do
  config <- new c'pulsar_client_configuration_create c'pulsar_client_configuration_free
  whenOptionRaw clientAuth $ \authConfig -> do
    ptrAuthConfig <- mkAuthentication authConfig
    liftIO $ c'pulsar_client_configuration_set_auth config ptrAuthConfig
  whenOption clientMemoryLimit $ c'pulsar_client_configuration_set_memory_limit config . CULong
  whenOption clientOperationTimeoutSeconds $ c'pulsar_client_configuration_set_operation_timeout_seconds config . CInt
  whenOption clientIoThreads $ c'pulsar_client_configuration_set_io_threads config . CInt
  whenOption clientMessageListenerThreads $ c'pulsar_client_configuration_set_message_listener_threads config . CInt
  whenOption clientConcurrentLookupRequest $ c'pulsar_client_configuration_set_concurrent_lookup_request config . CInt
  whenOption clientUseTls $ c'pulsar_client_configuration_set_use_tls config . CInt
  whenOptionString clientTlsTrustCertsFilePath $ c'pulsar_client_configuration_set_tls_trust_certs_file_path config
  whenOption clientTlsAllowInsecureConnection $ c'pulsar_client_configuration_set_tls_allow_insecure_connection config . CInt
  whenOption clientStatsIntervalInSeconds $ c'pulsar_client_configuration_set_stats_interval_in_seconds config . CUInt
  whenOption clientValidateHostname $ c'pulsar_client_configuration_set_validate_hostname config . CInt
  whenOptionRaw clientLogger $ \hsLogger -> do
    let cLogger (CUInt level) filePtr (CInt line) messagePtr _contextPtr = do
          file <- peekCString filePtr
          message <- peekCString messagePtr
          hsLogger level file line message
    logger <- new (wrapLogger cLogger) freeHaskellFunPtr
    liftIO $ c'pulsar_client_configuration_set_logger config logger nullPtr
  return config

foreign import ccall "wrapper"
  wrapLogger ::
    (CUInt -> CString -> CInt -> CString -> Ptr () -> IO ()) ->
    IO (FunPtr (CUInt -> CString -> CInt -> CString -> Ptr () -> IO ()))
