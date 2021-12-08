{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <pulsar/c/result.h>
module Pulsar.Client.Internal.Foreign.Result where
import Foreign.Ptr
#strict_import

{- typedef enum {
            pulsar_result_Ok,
            pulsar_result_UnknownError,
            pulsar_result_InvalidConfiguration,
            pulsar_result_Timeout,
            pulsar_result_LookupError,
            pulsar_result_ConnectError,
            pulsar_result_ReadError,
            pulsar_result_AuthenticationError,
            pulsar_result_AuthorizationError,
            pulsar_result_ErrorGettingAuthenticationData,
            pulsar_result_BrokerMetadataError,
            pulsar_result_BrokerPersistenceError,
            pulsar_result_ChecksumError,
            pulsar_result_ConsumerBusy,
            pulsar_result_NotConnected,
            pulsar_result_AlreadyClosed,
            pulsar_result_InvalidMessage,
            pulsar_result_ConsumerNotInitialized,
            pulsar_result_ProducerNotInitialized,
            pulsar_result_TooManyLookupRequestException,
            pulsar_result_InvalidTopicName,
            pulsar_result_InvalidUrl,
            pulsar_result_ServiceUnitNotReady,
            pulsar_result_OperationNotSupported,
            pulsar_result_ProducerBlockedQuotaExceededError,
            pulsar_result_ProducerBlockedQuotaExceededException,
            pulsar_result_ProducerQueueIsFull,
            pulsar_result_MessageTooBig,
            pulsar_result_TopicNotFound,
            pulsar_result_SubscriptionNotFound,
            pulsar_result_ConsumerNotFound,
            pulsar_result_UnsupportedVersionError,
            pulsar_result_TopicTerminated,
            pulsar_result_CryptoError
        } pulsar_result; -}
#integral_t pulsar_result
#num pulsar_result_Ok
#num pulsar_result_UnknownError
#num pulsar_result_InvalidConfiguration
#num pulsar_result_Timeout
#num pulsar_result_LookupError
#num pulsar_result_ConnectError
#num pulsar_result_ReadError
#num pulsar_result_AuthenticationError
#num pulsar_result_AuthorizationError
#num pulsar_result_ErrorGettingAuthenticationData
#num pulsar_result_BrokerMetadataError
#num pulsar_result_BrokerPersistenceError
#num pulsar_result_ChecksumError
#num pulsar_result_ConsumerBusy
#num pulsar_result_NotConnected
#num pulsar_result_AlreadyClosed
#num pulsar_result_InvalidMessage
#num pulsar_result_ConsumerNotInitialized
#num pulsar_result_ProducerNotInitialized
#num pulsar_result_TooManyLookupRequestException
#num pulsar_result_InvalidTopicName
#num pulsar_result_InvalidUrl
#num pulsar_result_ServiceUnitNotReady
#num pulsar_result_OperationNotSupported
#num pulsar_result_ProducerBlockedQuotaExceededError
#num pulsar_result_ProducerBlockedQuotaExceededException
#num pulsar_result_ProducerQueueIsFull
#num pulsar_result_MessageTooBig
#num pulsar_result_TopicNotFound
#num pulsar_result_SubscriptionNotFound
#num pulsar_result_ConsumerNotFound
#num pulsar_result_UnsupportedVersionError
#num pulsar_result_TopicTerminated
#num pulsar_result_CryptoError
