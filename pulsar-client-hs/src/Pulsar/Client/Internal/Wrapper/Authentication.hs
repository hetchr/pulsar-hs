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
mkAuthentication =
  \case
    Dynamic {..} -> do
      dynamicLibPath' <- toCString dynamicLibPath
      authParamsString' <- toCString authParamsString
      new' $ c'pulsar_authentication_create dynamicLibPath' authParamsString'
    Tls {..} -> do
      certificatePath' <- toCString certificatePath
      privateKeyPath' <- toCString privateKeyPath
      new' $ c'pulsar_authentication_tls_create certificatePath' privateKeyPath'
    Token {..} -> toCString token >>= new' . c'pulsar_authentication_token_create
    Athenz {..} -> toCString authParamsString >>= new' . c'pulsar_authentication_athenz_create
    Oauth2 {..} -> toCString authParamsString >>= new' . c'pulsar_authentication_oauth2_create
  where
    new' f = new f c'pulsar_authentication_free
