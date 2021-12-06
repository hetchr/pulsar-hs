module Pulsar.Client.Internal.Wrapper.Result
  ( Result (..),
    RawResult (..),
    renderResult,
    explainResult,
    isOk,
  )
where

import Foreign.C.String
import Pulsar.Client.Internal.Foreign.Result
import Pulsar.Client.Internal.Wrapper.Pointers

data Result
  = Ok
  | UnknownError
  | InvalidConfiguration
  | Timeout
  | LookupError
  | ConnectError
  | ReadError
  | AuthenticationError
  | AuthorizationError
  | ErrorGettingAuthenticationData
  | BrokerMetadataError
  | BrokerPersistenceError
  | ChecksumError
  | ConsumerBusy
  | NotConnected
  | AlreadyClosed
  | InvalidMessage
  | ConsumerNotInitialized
  | ProducerNotInitialized
  | TooManyLookupRequestException
  | InvalidTopicName
  | InvalidUrl
  | ServiceUnitNotReady
  | OperationNotSupported
  | ProducerBlockedQuotaExceededError
  | ProducerBlockedQuotaExceededException
  | ProducerQueueIsFull
  | MessageTooBig
  | TopicNotFound
  | SubscriptionNotFound
  | ConsumerNotFound
  | UnsupportedVersionError
  | TopicTerminated
  | CryptoError
  deriving (Eq, Ord, Show)

renderResult :: RawResult -> Maybe Result
renderResult (RawResult x)
  | x == c'pulsar_result_Ok = Just Ok
  | x == c'pulsar_result_UnknownError = Just UnknownError
  | x == c'pulsar_result_InvalidConfiguration = Just InvalidConfiguration
  | x == c'pulsar_result_Timeout = Just Timeout
  | x == c'pulsar_result_LookupError = Just LookupError
  | x == c'pulsar_result_ConnectError = Just ConnectError
  | x == c'pulsar_result_ReadError = Just ReadError
  | x == c'pulsar_result_AuthenticationError = Just AuthenticationError
  | x == c'pulsar_result_AuthorizationError = Just AuthorizationError
  | x == c'pulsar_result_ErrorGettingAuthenticationData = Just ErrorGettingAuthenticationData
  | x == c'pulsar_result_BrokerMetadataError = Just BrokerMetadataError
  | x == c'pulsar_result_BrokerPersistenceError = Just BrokerPersistenceError
  | x == c'pulsar_result_ChecksumError = Just ChecksumError
  | x == c'pulsar_result_ConsumerBusy = Just ConsumerBusy
  | x == c'pulsar_result_NotConnected = Just NotConnected
  | x == c'pulsar_result_AlreadyClosed = Just AlreadyClosed
  | x == c'pulsar_result_InvalidMessage = Just InvalidMessage
  | x == c'pulsar_result_ConsumerNotInitialized = Just ConsumerNotInitialized
  | x == c'pulsar_result_ProducerNotInitialized = Just ProducerNotInitialized
  | x == c'pulsar_result_TooManyLookupRequestException = Just TooManyLookupRequestException
  | x == c'pulsar_result_InvalidTopicName = Just InvalidTopicName
  | x == c'pulsar_result_InvalidUrl = Just InvalidUrl
  | x == c'pulsar_result_ServiceUnitNotReady = Just ServiceUnitNotReady
  | x == c'pulsar_result_OperationNotSupported = Just OperationNotSupported
  | x == c'pulsar_result_ProducerBlockedQuotaExceededError = Just ProducerBlockedQuotaExceededError
  | x == c'pulsar_result_ProducerBlockedQuotaExceededException = Just ProducerBlockedQuotaExceededException
  | x == c'pulsar_result_ProducerQueueIsFull = Just ProducerQueueIsFull
  | x == c'pulsar_result_MessageTooBig = Just MessageTooBig
  | x == c'pulsar_result_TopicNotFound = Just TopicNotFound
  | x == c'pulsar_result_SubscriptionNotFound = Just SubscriptionNotFound
  | x == c'pulsar_result_ConsumerNotFound = Just ConsumerNotFound
  | x == c'pulsar_result_UnsupportedVersionError = Just UnsupportedVersionError
  | x == c'pulsar_result_TopicTerminated = Just TopicTerminated
  | x == c'pulsar_result_CryptoError = Just CryptoError
  | otherwise = Nothing

isOk :: C'pulsar_result -> Bool
isOk = (== c'pulsar_result_Ok)

explainResult :: Result -> IO String
explainResult x = c'pulsar_result_str result >>= peekCString
  where
    result =
      case x of
        Ok -> c'pulsar_result_Ok
        UnknownError -> c'pulsar_result_UnknownError
        InvalidConfiguration -> c'pulsar_result_InvalidConfiguration
        Timeout -> c'pulsar_result_Timeout
        LookupError -> c'pulsar_result_LookupError
        ConnectError -> c'pulsar_result_ConnectError
        ReadError -> c'pulsar_result_ReadError
        AuthenticationError -> c'pulsar_result_AuthenticationError
        AuthorizationError -> c'pulsar_result_AuthorizationError
        ErrorGettingAuthenticationData -> c'pulsar_result_ErrorGettingAuthenticationData
        BrokerMetadataError -> c'pulsar_result_BrokerMetadataError
        BrokerPersistenceError -> c'pulsar_result_BrokerPersistenceError
        ChecksumError -> c'pulsar_result_ChecksumError
        ConsumerBusy -> c'pulsar_result_ConsumerBusy
        NotConnected -> c'pulsar_result_NotConnected
        AlreadyClosed -> c'pulsar_result_AlreadyClosed
        InvalidMessage -> c'pulsar_result_InvalidMessage
        ConsumerNotInitialized -> c'pulsar_result_ConsumerNotInitialized
        ProducerNotInitialized -> c'pulsar_result_ProducerNotInitialized
        TooManyLookupRequestException -> c'pulsar_result_TooManyLookupRequestException
        InvalidTopicName -> c'pulsar_result_InvalidTopicName
        InvalidUrl -> c'pulsar_result_InvalidUrl
        ServiceUnitNotReady -> c'pulsar_result_ServiceUnitNotReady
        OperationNotSupported -> c'pulsar_result_OperationNotSupported
        ProducerBlockedQuotaExceededError -> c'pulsar_result_ProducerBlockedQuotaExceededError
        ProducerBlockedQuotaExceededException -> c'pulsar_result_ProducerBlockedQuotaExceededException
        ProducerQueueIsFull -> c'pulsar_result_ProducerQueueIsFull
        MessageTooBig -> c'pulsar_result_MessageTooBig
        TopicNotFound -> c'pulsar_result_TopicNotFound
        SubscriptionNotFound -> c'pulsar_result_SubscriptionNotFound
        ConsumerNotFound -> c'pulsar_result_ConsumerNotFound
        UnsupportedVersionError -> c'pulsar_result_UnsupportedVersionError
        TopicTerminated -> c'pulsar_result_TopicTerminated
        CryptoError -> c'pulsar_result_CryptoError
