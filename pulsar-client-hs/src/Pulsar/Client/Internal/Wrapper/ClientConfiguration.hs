{-# LANGUAGE RecordWildCards #-}

module Pulsar.Client.Internal.Wrapper.ClientConfiguration
  ( ClientConfiguration (..),
    defaultClientConfiguration,
    mkClientConfiguration,
  )
where

import Foreign.C.Types
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
    clientValidateHostname :: Maybe Int32
  }
  deriving (Eq, Show)

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
      clientValidateHostname = Nothing
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
  return config
