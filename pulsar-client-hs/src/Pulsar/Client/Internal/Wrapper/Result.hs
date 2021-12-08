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
  | x == undefined = Just Ok
  | x == undefined = Just UnknownError
  | x == undefined = Just InvalidConfiguration
  | x == undefined = Just Timeout
  | x == undefined = Just LookupError
  | x == undefined = Just ConnectError
  | x == undefined = Just ReadError
  | x == undefined = Just AuthenticationError
  | x == undefined = Just AuthorizationError
  | x == undefined = Just ErrorGettingAuthenticationData
  | x == undefined = Just BrokerMetadataError
  | x == undefined = Just BrokerPersistenceError
  | x == undefined = Just ChecksumError
  | x == undefined = Just ConsumerBusy
  | x == undefined = Just NotConnected
  | x == undefined = Just AlreadyClosed
  | x == undefined = Just InvalidMessage
  | x == undefined = Just ConsumerNotInitialized
  | x == undefined = Just ProducerNotInitialized
  | x == undefined = Just TooManyLookupRequestException
  | x == undefined = Just InvalidTopicName
  | x == undefined = Just InvalidUrl
  | x == undefined = Just ServiceUnitNotReady
  | x == undefined = Just OperationNotSupported
  | x == undefined = Just ProducerBlockedQuotaExceededError
  | x == undefined = Just ProducerBlockedQuotaExceededException
  | x == undefined = Just ProducerQueueIsFull
  | x == undefined = Just MessageTooBig
  | x == undefined = Just TopicNotFound
  | x == undefined = Just SubscriptionNotFound
  | x == undefined = Just ConsumerNotFound
  | x == undefined = Just UnsupportedVersionError
  | x == undefined = Just TopicTerminated
  | x == undefined = Just CryptoError
  | otherwise = Nothing

isOk :: RawResult -> Bool
isOk = undefined

explainResult :: Result -> IO String
explainResult x = undefined result >>= peekCString
  where
    result =
      case x of
        Ok -> undefined
        UnknownError -> undefined
        InvalidConfiguration -> undefined
        Timeout -> undefined
        LookupError -> undefined
        ConnectError -> undefined
        ReadError -> undefined
        AuthenticationError -> undefined
        AuthorizationError -> undefined
        ErrorGettingAuthenticationData -> undefined
        BrokerMetadataError -> undefined
        BrokerPersistenceError -> undefined
        ChecksumError -> undefined
        ConsumerBusy -> undefined
        NotConnected -> undefined
        AlreadyClosed -> undefined
        InvalidMessage -> undefined
        ConsumerNotInitialized -> undefined
        ProducerNotInitialized -> undefined
        TooManyLookupRequestException -> undefined
        InvalidTopicName -> undefined
        InvalidUrl -> undefined
        ServiceUnitNotReady -> undefined
        OperationNotSupported -> undefined
        ProducerBlockedQuotaExceededError -> undefined
        ProducerBlockedQuotaExceededException -> undefined
        ProducerQueueIsFull -> undefined
        MessageTooBig -> undefined
        TopicNotFound -> undefined
        SubscriptionNotFound -> undefined
        ConsumerNotFound -> undefined
        UnsupportedVersionError -> undefined
        TopicTerminated -> undefined
        CryptoError -> undefined
