{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RecordWildCards #-}

module Pulsar.Client.Internal.Wrapper.Authentication
  ( AuthenticationConfig (..),
    mkAuthentication,
    -- Reexports
    C'_pulsar_authentication,
  )
where

import GHC.Ptr
import Pulsar.Client.Internal.Foreign.Authentication
import Pulsar.Client.Internal.Wrapper.Utils

data AuthenticationConfig
  = Dynamic {dynamicLibPath :: String, authParamsString :: String}
  | Tls {certificatePath :: String, privateKeyPath :: String}
  | Token {token :: String}
  | Athenz {authParamsString :: String}
  | Oauth2 {authParamsString :: String}
  deriving (Eq, Show)

mkAuthentication :: MonadResource m => AuthenticationConfig -> m (Ptr C'_pulsar_authentication)
mkAuthentication = undefined
