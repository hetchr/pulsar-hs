{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# OPTIONS_GHC -fno-warn-unused-binds -fno-warn-unused-imports -freduction-depth=328 #-}

module Pulsar.Admin.API
  ( -- * Client
    bookiesDeleteBookieRackInfo,
    bookiesGetAllBookies,
    bookiesGetBookieRackInfo,
    bookiesGetBookiesRackInfo,
    bookiesUpdateBookieRackInfo,
    brokerStatsGetAllocatorStats,
    brokerStatsGetBrokerResourceAvailability,
    brokerStatsGetLoadReport,
    brokerStatsGetMBeans,
    brokerStatsGetMetrics,
    brokerStatsGetPendingBookieOpsStats,
    brokerStatsGetTopics2,
    brokersBacklogQuotaCheck,
    brokersDeleteDynamicConfiguration,
    brokersGetActiveBrokers,
    brokersGetAllDynamicConfigurations,
    brokersGetDynamicConfigurationName,
    brokersGetInternalConfigurationData,
    brokersGetLeaderBroker,
    brokersGetOwnedNamespaces,
    brokersGetRuntimeConfiguration,
    brokersHealthcheck,
    brokersIsReady,
    brokersUpdateDynamicConfiguration,
    brokersVersion,
    clustersCreateCluster,
    clustersDeleteCluster,
    clustersDeleteFailureDomain,
    clustersDeleteNamespaceIsolationPolicy,
    clustersGetBrokerWithNamespaceIsolationPolicy,
    clustersGetBrokersWithNamespaceIsolationPolicy,
    clustersGetCluster,
    clustersGetClusters,
    clustersGetDomain,
    clustersGetFailureDomains,
    clustersGetNamespaceIsolationPolicies,
    clustersGetNamespaceIsolationPolicy,
    clustersGetPeerCluster,
    clustersSetFailureDomain,
    clustersSetNamespaceIsolationPolicy,
    clustersSetPeerClusterNames,
    clustersUpdateCluster,
    workStatsGetMetrics,
    workStatsGetStats,
    workerGetAssignments,
    workerGetCluster,
    workerGetClusterLeader,
    workerGetConnectorsList,
    workerIsLeaderReady,
    workerRebalance,
    namespacesClearNamespaceBacklog,
    namespacesClearNamespaceBacklogForSubscription,
    namespacesClearNamespaceBundleBacklog,
    namespacesClearNamespaceBundleBacklogForSubscription,
    namespacesClearOffloadDeletionLag,
    namespacesClearProperties,
    namespacesCreateNamespace,
    namespacesDeleteBookieAffinityGroup,
    namespacesDeleteCompactionThreshold,
    namespacesDeleteDispatchRate,
    namespacesDeleteNamespace,
    namespacesDeleteNamespaceBundle,
    namespacesDeletePersistence,
    namespacesDeleteSubscribeRate,
    namespacesDeleteSubscriptionDispatchRate,
    namespacesGetAntiAffinityNamespaces,
    namespacesGetBacklogQuotaMap,
    namespacesGetBookieAffinityGroup,
    namespacesGetBundlesData,
    namespacesGetCompactionThreshold,
    namespacesGetDeduplication,
    namespacesGetDeduplicationSnapshotInterval,
    namespacesGetDelayedDeliveryPolicies,
    namespacesGetDispatchRate,
    namespacesGetInactiveTopicPolicies,
    namespacesGetIsAllowAutoUpdateSchema,
    namespacesGetMaxConsumersPerSubscription,
    namespacesGetMaxConsumersPerTopic,
    namespacesGetMaxProducersPerTopic,
    namespacesGetMaxSubscriptionsPerTopic,
    namespacesGetMaxTopicsPerNamespace,
    namespacesGetMaxUnackedMessagesPerConsumer,
    namespacesGetMaxUnackedmessagesPerSubscription,
    namespacesGetNamespaceAntiAffinityGroup,
    namespacesGetNamespaceMessageTTL,
    namespacesGetNamespaceReplicationClusters,
    namespacesGetNamespaceResourceGroup,
    namespacesGetOffloadDeletionLag,
    namespacesGetOffloadPolicies,
    namespacesGetOffloadThreshold,
    namespacesGetPermissions,
    namespacesGetPersistence,
    namespacesGetPolicies,
    namespacesGetProperties,
    namespacesGetProperty,
    namespacesGetReplicatorDispatchRate,
    namespacesGetRetention,
    namespacesGetSchemaAutoUpdateCompatibilityStrategy,
    namespacesGetSchemaCompatibilityStrategy,
    namespacesGetSchemaValidtionEnforced,
    namespacesGetSubscribeRate,
    namespacesGetSubscriptionDispatchRate,
    namespacesGetSubscriptionExpirationTime,
    namespacesGetSubscriptionTypesEnabled,
    namespacesGetTenantNamespaces,
    namespacesGetTopics,
    namespacesGrantPermissionOnNamespace,
    namespacesModifyDeduplication,
    namespacesModifyEncryptionRequired,
    namespacesRemoveAutoSubscriptionCreation,
    namespacesRemoveAutoTopicCreation,
    namespacesRemoveBacklogQuota,
    namespacesRemoveDeduplication,
    namespacesRemoveDelayedDeliveryPolicies,
    namespacesRemoveInactiveTopicPolicies,
    namespacesRemoveMaxConsumersPerSubscription,
    namespacesRemoveMaxConsumersPerTopic,
    namespacesRemoveMaxProducersPerTopic,
    namespacesRemoveMaxSubscriptionsPerTopic,
    namespacesRemoveMaxTopicsPerNamespace,
    namespacesRemoveMaxUnackedmessagesPerConsumer,
    namespacesRemoveMaxUnackedmessagesPerSubscription,
    namespacesRemoveNamespaceAntiAffinityGroup,
    namespacesRemoveNamespaceMessageTTL,
    namespacesRemoveNamespaceResourceGroup,
    namespacesRemoveOffloadPolicies,
    namespacesRemoveProperty,
    namespacesRemoveReplicatorDispatchRate,
    namespacesRemoveRetention,
    namespacesRemoveSubscriptionExpirationTime,
    namespacesRevokePermissionsOnNamespace,
    namespacesSetAutoSubscriptionCreation,
    namespacesSetAutoTopicCreation,
    namespacesSetBacklogQuota,
    namespacesSetBookieAffinityGroup,
    namespacesSetCompactionThreshold,
    namespacesSetDeduplicationSnapshotInterval,
    namespacesSetDelayedDeliveryPolicies,
    namespacesSetDispatchRate,
    namespacesSetInactiveTopicPolicies,
    namespacesSetIsAllowAutoUpdateSchema,
    namespacesSetMaxConsumersPerSubscription,
    namespacesSetMaxConsumersPerTopic,
    namespacesSetMaxProducersPerTopic,
    namespacesSetMaxSubscriptionsPerTopic,
    namespacesSetMaxTopicsPerNamespace,
    namespacesSetMaxUnackedMessagesPerConsumer,
    namespacesSetMaxUnackedMessagesPerSubscription,
    namespacesSetNamespaceAntiAffinityGroup,
    namespacesSetNamespaceMessageTTL,
    namespacesSetNamespaceReplicationClusters,
    namespacesSetNamespaceResourceGroup,
    namespacesSetOffloadDeletionLag,
    namespacesSetOffloadPolicies,
    namespacesSetOffloadThreshold,
    namespacesSetPersistence,
    namespacesSetProperties,
    namespacesSetProperty,
    namespacesSetReplicatorDispatchRate,
    namespacesSetRetention,
    namespacesSetSchemaAutoUpdateCompatibilityStrategy,
    namespacesSetSchemaCompatibilityStrategy,
    namespacesSetSchemaValidtionEnforced,
    namespacesSetSubscribeRate,
    namespacesSetSubscriptionAuthMode,
    namespacesSetSubscriptionDispatchRate,
    namespacesSetSubscriptionExpirationTime,
    namespacesSetSubscriptionTypesEnabled,
    namespacesSplitNamespaceBundle,
    namespacesUnloadNamespace,
    namespacesUnloadNamespaceBundle,
    namespacesUnsubscribeNamespace,
    namespacesUnsubscribeNamespaceBundle,
    nonPersistentCompact,
    nonPersistentCompactionStatus,
    nonPersistentCreateMissedPartitions,
    nonPersistentCreateNonPartitionedTopic,
    nonPersistentCreatePartitionedTopic,
    nonPersistentCreateSubscription,
    nonPersistentDeleteDeduplicationSnapshotInterval,
    nonPersistentDeleteDelayedDeliveryPolicies,
    nonPersistentDeleteInactiveTopicPolicies,
    nonPersistentDeleteMaxUnackedMessagesOnConsumer,
    nonPersistentDeleteMaxUnackedMessagesOnSubscription,
    nonPersistentDeletePartitionedTopic,
    nonPersistentDeleteSubscription,
    nonPersistentDeleteTopic,
    nonPersistentExamineMessage,
    nonPersistentExpireMessagesForAllSubscriptions,
    nonPersistentExpireTopicMessages,
    nonPersistentExpireTopicMessagesInSeconds,
    nonPersistentGetBacklog,
    nonPersistentGetBacklogQuotaMap,
    nonPersistentGetCompactionThreshold,
    nonPersistentGetDeduplication,
    nonPersistentGetDeduplicationSnapshotInterval,
    nonPersistentGetDelayedDeliveryPolicies,
    nonPersistentGetDispatchRate,
    nonPersistentGetInactiveTopicPolicies,
    nonPersistentGetInternalStats,
    nonPersistentGetLastMessageId,
    nonPersistentGetList,
    nonPersistentGetListFromBundle,
    nonPersistentGetManagedLedgerInfo,
    nonPersistentGetMaxConsumers,
    nonPersistentGetMaxConsumersPerSubscription,
    nonPersistentGetMaxMessageSize,
    nonPersistentGetMaxProducers,
    nonPersistentGetMaxSubscriptionsPerTopic,
    nonPersistentGetMaxUnackedMessagesOnConsumer,
    nonPersistentGetMaxUnackedMessagesOnSubscription,
    nonPersistentGetMessageById,
    nonPersistentGetMessageIdByTimestamp,
    nonPersistentGetMessageTTL,
    nonPersistentGetOffloadPolicies,
    nonPersistentGetPartitionedMetadata,
    nonPersistentGetPartitionedStats,
    nonPersistentGetPartitionedTopicList,
    nonPersistentGetPermissionsOnTopic,
    nonPersistentGetPersistence,
    nonPersistentGetPublishRate,
    nonPersistentGetReplicatorDispatchRate,
    nonPersistentGetRetention,
    nonPersistentGetStats,
    nonPersistentGetSubscribeRate,
    nonPersistentGetSubscriptionDispatchRate,
    nonPersistentGetSubscriptionTypesEnabled,
    nonPersistentGetSubscriptions,
    nonPersistentGrantPermissionsOnTopic,
    nonPersistentOffloadStatus,
    nonPersistentPeekNthMessage,
    nonPersistentRemoveBacklogQuota,
    nonPersistentRemoveCompactionThreshold,
    nonPersistentRemoveDeduplication,
    nonPersistentRemoveDispatchRate,
    nonPersistentRemoveMaxConsumers,
    nonPersistentRemoveMaxConsumersPerSubscription,
    nonPersistentRemoveMaxMessageSize,
    nonPersistentRemoveMaxProducers,
    nonPersistentRemoveMaxSubscriptionsPerTopic,
    nonPersistentRemoveMessageTTL,
    nonPersistentRemoveOffloadPolicies,
    nonPersistentRemovePersistence,
    nonPersistentRemovePublishRate,
    nonPersistentRemoveReplicatorDispatchRate,
    nonPersistentRemoveRetention,
    nonPersistentRemoveSubscribeRate,
    nonPersistentRemoveSubscriptionDispatchRate,
    nonPersistentResetCursor,
    nonPersistentResetCursorOnPosition,
    nonPersistentRevokePermissionsOnTopic,
    nonPersistentSetBacklogQuota,
    nonPersistentSetCompactionThreshold,
    nonPersistentSetDeduplication,
    nonPersistentSetDeduplicationSnapshotInterval,
    nonPersistentSetDelayedDeliveryPolicies,
    nonPersistentSetDispatchRate,
    nonPersistentSetInactiveTopicPolicies,
    nonPersistentSetMaxConsumers,
    nonPersistentSetMaxConsumersPerSubscription,
    nonPersistentSetMaxMessageSize,
    nonPersistentSetMaxProducers,
    nonPersistentSetMaxSubscriptionsPerTopic,
    nonPersistentSetMaxUnackedMessagesOnConsumer,
    nonPersistentSetMaxUnackedMessagesOnSubscription,
    nonPersistentSetMessageTTL,
    nonPersistentSetOffloadPolicies,
    nonPersistentSetPersistence,
    nonPersistentSetPublishRate,
    nonPersistentSetReplicatedSubscriptionStatus,
    nonPersistentSetReplicatorDispatchRate,
    nonPersistentSetRetention,
    nonPersistentSetSubscribeRate,
    nonPersistentSetSubscriptionDispatchRate,
    nonPersistentSetSubscriptionTypesEnabled,
    nonPersistentSkipAllMessages,
    nonPersistentSkipMessages,
    nonPersistentTerminate,
    nonPersistentTerminatePartitionedTopic,
    nonPersistentTriggerOffload,
    nonPersistentTruncateTopic,
    nonPersistentUnloadTopic,
    nonPersistentUpdatePartitionedTopic,
    persistentCompact,
    persistentCompactionStatus,
    persistentCreateMissedPartitions,
    persistentCreateNonPartitionedTopic,
    persistentCreatePartitionedTopic,
    persistentCreateSubscription,
    persistentDeleteDeduplicationSnapshotInterval,
    persistentDeleteDelayedDeliveryPolicies,
    persistentDeleteInactiveTopicPolicies,
    persistentDeleteMaxUnackedMessagesOnConsumer,
    persistentDeleteMaxUnackedMessagesOnSubscription,
    persistentDeletePartitionedTopic,
    persistentDeleteSubscription,
    persistentDeleteTopic,
    persistentExamineMessage,
    persistentExpireMessagesForAllSubscriptions,
    persistentExpireTopicMessages,
    persistentExpireTopicMessagesInSeconds,
    persistentGetBacklog,
    persistentGetBacklogQuotaMap,
    persistentGetCompactionThreshold,
    persistentGetDeduplication,
    persistentGetDeduplicationSnapshotInterval,
    persistentGetDelayedDeliveryPolicies,
    persistentGetDispatchRate,
    persistentGetInactiveTopicPolicies,
    persistentGetInternalStats,
    persistentGetLastMessageId,
    persistentGetList,
    persistentGetManagedLedgerInfo,
    persistentGetMaxConsumers,
    persistentGetMaxConsumersPerSubscription,
    persistentGetMaxMessageSize,
    persistentGetMaxProducers,
    persistentGetMaxSubscriptionsPerTopic,
    persistentGetMaxUnackedMessagesOnConsumer,
    persistentGetMaxUnackedMessagesOnSubscription,
    persistentGetMessageById,
    persistentGetMessageIdByTimestamp,
    persistentGetMessageTTL,
    persistentGetOffloadPolicies,
    persistentGetPartitionedMetadata,
    persistentGetPartitionedStats,
    persistentGetPartitionedTopicList,
    persistentGetPermissionsOnTopic,
    persistentGetPersistence,
    persistentGetPublishRate,
    persistentGetReplicatorDispatchRate,
    persistentGetRetention,
    persistentGetStats,
    persistentGetSubscribeRate,
    persistentGetSubscriptionDispatchRate,
    persistentGetSubscriptionTypesEnabled,
    persistentGetSubscriptions,
    persistentGrantPermissionsOnTopic,
    persistentOffloadStatus,
    persistentPeekNthMessage,
    persistentRemoveBacklogQuota,
    persistentRemoveCompactionThreshold,
    persistentRemoveDeduplication,
    persistentRemoveDispatchRate,
    persistentRemoveMaxConsumers,
    persistentRemoveMaxConsumersPerSubscription,
    persistentRemoveMaxMessageSize,
    persistentRemoveMaxProducers,
    persistentRemoveMaxSubscriptionsPerTopic,
    persistentRemoveMessageTTL,
    persistentRemoveOffloadPolicies,
    persistentRemovePersistence,
    persistentRemovePublishRate,
    persistentRemoveReplicatorDispatchRate,
    persistentRemoveRetention,
    persistentRemoveSubscribeRate,
    persistentRemoveSubscriptionDispatchRate,
    persistentResetCursor,
    persistentResetCursorOnPosition,
    persistentRevokePermissionsOnTopic,
    persistentSetBacklogQuota,
    persistentSetCompactionThreshold,
    persistentSetDeduplication,
    persistentSetDeduplicationSnapshotInterval,
    persistentSetDelayedDeliveryPolicies,
    persistentSetDispatchRate,
    persistentSetInactiveTopicPolicies,
    persistentSetMaxConsumers,
    persistentSetMaxConsumersPerSubscription,
    persistentSetMaxMessageSize,
    persistentSetMaxProducers,
    persistentSetMaxSubscriptionsPerTopic,
    persistentSetMaxUnackedMessagesOnConsumer,
    persistentSetMaxUnackedMessagesOnSubscription,
    persistentSetMessageTTL,
    persistentSetOffloadPolicies,
    persistentSetPersistence,
    persistentSetPublishRate,
    persistentSetReplicatedSubscriptionStatus,
    persistentSetReplicatorDispatchRate,
    persistentSetRetention,
    persistentSetSubscribeRate,
    persistentSetSubscriptionDispatchRate,
    persistentSetSubscriptionTypesEnabled,
    persistentSkipAllMessages,
    persistentSkipMessages,
    persistentTerminate,
    persistentTerminatePartitionedTopic,
    persistentTriggerOffload,
    persistentTruncateTopic,
    persistentUnloadTopic,
    persistentUpdatePartitionedTopic,
    resourceQuotasGetDefaultResourceQuota,
    resourceQuotasGetNamespaceBundleResourceQuota,
    resourceQuotasRemoveNamespaceBundleResourceQuota,
    resourceQuotasSetDefaultResourceQuota,
    resourceQuotasSetNamespaceBundleResourceQuota,
    resourcegroupsCreateOrUpdateResourceGroup,
    resourcegroupsDeleteResourceGroup,
    resourcegroupsGetResourceGroup,
    resourcegroupsGetResourceGroups,
    schemasDeleteSchema,
    schemasGetAllSchemas,
    schemasGetSchema,
    schemasGetSchemaVersion,
    schemasGetVersionBySchema,
    schemasPostSchema,
    schemasTestCompatibility,
    getTenants,
    tenantsCreateTenant,
    tenantsDeleteTenant,
    tenantsGetTenantAdmin,
    tenantsUpdateTenant,
  )
where

import Data.Aeson (Value)
import Data.Data (Data)
import Data.Function ((&))
import qualified Data.Map as Map
import Data.Monoid ((<>))
import Data.Proxy (Proxy (..))
import Data.Set (Set)
import Data.Text (Text)
import qualified Data.Text as T
import Data.Time
import Data.UUID (UUID)
import GHC.Exts (IsString (..))
import GHC.Generics (Generic)
import Pulsar.Admin.Types
import Servant.API
import Servant.API.Verbs (StdMethod (..), Verb)
import Servant.Client
  ( ClientEnv,
    ClientError,
    Scheme (Http),
    client,
    mkClientEnv,
    parseBaseUrl,
  )
import Servant.Client.Core (baseUrlHost, baseUrlPort)
import Servant.Client.Internal.HttpClient (ClientM (..))
import Web.FormUrlEncoded
import Web.HttpApiData

-- | List of elements parsed from a query.
newtype QueryList (p :: CollectionFormat) a = QueryList
  { fromQueryList :: [a]
  }
  deriving (Functor, Applicative, Monad, Foldable, Traversable)

-- | Formats in which a list can be encoded into a HTTP path.
data CollectionFormat
  = -- | CSV format for multiple parameters.
    CommaSeparated
  | -- | Also called "SSV"
    SpaceSeparated
  | -- | Also called "TSV"
    TabSeparated
  | -- | `value1|value2|value2`
    PipeSeparated
  | -- | Using multiple GET parameters, e.g. `foo=bar&foo=baz`. Only for GET params.
    MultiParamArray

instance FromHttpApiData a => FromHttpApiData (QueryList 'CommaSeparated a) where
  parseQueryParam = parseSeparatedQueryList ','

instance FromHttpApiData a => FromHttpApiData (QueryList 'TabSeparated a) where
  parseQueryParam = parseSeparatedQueryList '\t'

instance FromHttpApiData a => FromHttpApiData (QueryList 'SpaceSeparated a) where
  parseQueryParam = parseSeparatedQueryList ' '

instance FromHttpApiData a => FromHttpApiData (QueryList 'PipeSeparated a) where
  parseQueryParam = parseSeparatedQueryList '|'

instance FromHttpApiData a => FromHttpApiData (QueryList 'MultiParamArray a) where
  parseQueryParam = error "unimplemented FromHttpApiData for MultiParamArray collection format"

parseSeparatedQueryList :: FromHttpApiData a => Char -> Text -> Either Text (QueryList p a)
parseSeparatedQueryList char = fmap QueryList . mapM parseQueryParam . T.split (== char)

instance ToHttpApiData a => ToHttpApiData (QueryList 'CommaSeparated a) where
  toQueryParam = formatSeparatedQueryList ','

instance ToHttpApiData a => ToHttpApiData (QueryList 'TabSeparated a) where
  toQueryParam = formatSeparatedQueryList '\t'

instance ToHttpApiData a => ToHttpApiData (QueryList 'SpaceSeparated a) where
  toQueryParam = formatSeparatedQueryList ' '

instance ToHttpApiData a => ToHttpApiData (QueryList 'PipeSeparated a) where
  toQueryParam = formatSeparatedQueryList '|'

instance ToHttpApiData a => ToHttpApiData (QueryList 'MultiParamArray a) where
  toQueryParam = error "unimplemented ToHttpApiData for MultiParamArray collection format"

formatSeparatedQueryList :: ToHttpApiData a => Char -> QueryList p a -> Text
formatSeparatedQueryList char = T.intercalate (T.singleton char) . map toQueryParam . fromQueryList
-- Clients

-- ^

type BookiesDeleteBookieRackInfoAPI =
  "admin" :> "v2" :> "bookies" :> "racks-info" :> Capture "bookie" Text :> Verb 'DELETE 200 '[JSON] NoContent

bookiesDeleteBookieRackInfo :: Text -> ClientM NoContent
bookiesDeleteBookieRackInfo = client (Proxy :: Proxy BookiesDeleteBookieRackInfoAPI)
-- ^

type BookiesGetAllBookiesAPI =
  "admin" :> "v2" :> "bookies" :> "all" :> Verb 'GET 200 '[JSON] BookiesClusterInfo

bookiesGetAllBookies :: ClientM BookiesClusterInfo
bookiesGetAllBookies = client (Proxy :: Proxy BookiesGetAllBookiesAPI)
-- ^

type BookiesGetBookieRackInfoAPI =
  "admin" :> "v2" :> "bookies" :> "racks-info" :> Capture "bookie" Text :> Verb 'GET 200 '[JSON] BookieInfo

bookiesGetBookieRackInfo :: Text -> ClientM BookieInfo
bookiesGetBookieRackInfo = client (Proxy :: Proxy BookiesGetBookieRackInfoAPI)
-- ^

type BookiesGetBookiesRackInfoAPI =
  "admin" :> "v2" :> "bookies" :> "racks-info" :> Verb 'GET 200 '[JSON] ((Map.Map String (Map.Map String BookieInfo)))

bookiesGetBookiesRackInfo :: ClientM ((Map.Map String (Map.Map String BookieInfo)))
bookiesGetBookiesRackInfo = client (Proxy :: Proxy BookiesGetBookiesRackInfoAPI)
-- ^

type BookiesUpdateBookieRackInfoAPI =
  "admin" :> "v2" :> "bookies" :> "racks-info" :> Capture "bookie" Text :> QueryParam "group" Text :> Verb 'POST 200 '[JSON] NoContent

bookiesUpdateBookieRackInfo :: Text -> Maybe Text -> ClientM NoContent
bookiesUpdateBookieRackInfo = client (Proxy :: Proxy BookiesUpdateBookieRackInfoAPI)
-- ^

type BrokerStatsGetAllocatorStatsAPI =
  "admin" :> "v2" :> "broker-stats" :> "allocator-stats" :> Capture "allocator" Text :> Verb 'GET 200 '[JSON] AllocatorStats

brokerStatsGetAllocatorStats :: Text -> ClientM AllocatorStats
brokerStatsGetAllocatorStats = client (Proxy :: Proxy BrokerStatsGetAllocatorStatsAPI)
-- ^ This API gives the current broker availability in percent, each resource percentage usage is calculated and thensum of all of the resource usage percent is called broker-resource-availability<br/><br/>THIS API IS ONLY FOR USE BY TESTING FOR CONFIRMING NAMESPACE ALLOCATION ALGORITHM

type BrokerStatsGetBrokerResourceAvailabilityAPI =
  "admin" :> "v2" :> "broker-stats" :> "broker-resource-availability" :> Capture "tenant" Text :> Capture "namespace" Text :> Verb 'GET 200 '[JSON] ((Map.Map String ResourceUnit))

brokerStatsGetBrokerResourceAvailability :: Text -> Text -> ClientM ((Map.Map String ResourceUnit))
brokerStatsGetBrokerResourceAvailability = client (Proxy :: Proxy BrokerStatsGetBrokerResourceAvailabilityAPI)
-- ^ consists of topics stats & systemResourceUsage

type BrokerStatsGetLoadReportAPI =
  "admin" :> "v2" :> "broker-stats" :> "load-report" :> Verb 'GET 200 '[JSON] LoadReport

brokerStatsGetLoadReport :: ClientM LoadReport
brokerStatsGetLoadReport = client (Proxy :: Proxy BrokerStatsGetLoadReportAPI)
-- ^

type BrokerStatsGetMBeansAPI =
  "admin" :> "v2" :> "broker-stats" :> "mbeans" :> Verb 'GET 200 '[JSON] [Metrics]

brokerStatsGetMBeans :: ClientM [Metrics]
brokerStatsGetMBeans = client (Proxy :: Proxy BrokerStatsGetMBeansAPI)
-- ^ Requested should be executed by Monitoring agent on each broker to fetch the metrics

type BrokerStatsGetMetricsAPI =
  "admin" :> "v2" :> "broker-stats" :> "metrics" :> Verb 'GET 200 '[JSON] [Metrics]

brokerStatsGetMetrics :: ClientM [Metrics]
brokerStatsGetMetrics = client (Proxy :: Proxy BrokerStatsGetMetricsAPI)
-- ^

type BrokerStatsGetPendingBookieOpsStatsAPI =
  "admin" :> "v2" :> "broker-stats" :> "bookieops" :> Verb 'GET 200 '[JSON] ((Map.Map String PendingBookieOpsStats))

brokerStatsGetPendingBookieOpsStats :: ClientM ((Map.Map String PendingBookieOpsStats))
brokerStatsGetPendingBookieOpsStats = client (Proxy :: Proxy BrokerStatsGetPendingBookieOpsStatsAPI)
-- ^

type BrokerStatsGetTopics2API =
  "admin" :> "v2" :> "broker-stats" :> "topics" :> Verb 'GET 200 '[JSON] Value

brokerStatsGetTopics2 :: ClientM Value
brokerStatsGetTopics2 = client (Proxy :: Proxy BrokerStatsGetTopics2API)
-- ^

type BrokersBacklogQuotaCheckAPI =
  "admin" :> "v2" :> "brokers" :> "backlog-quota-check" :> Verb 'GET 200 '[JSON] NoContent

brokersBacklogQuotaCheck :: ClientM NoContent
brokersBacklogQuotaCheck = client (Proxy :: Proxy BrokersBacklogQuotaCheckAPI)
-- ^

type BrokersDeleteDynamicConfigurationAPI =
  "admin" :> "v2" :> "brokers" :> "configuration" :> Capture "configName" Text :> Verb 'DELETE 200 '[JSON] NoContent

brokersDeleteDynamicConfiguration :: Text -> ClientM NoContent
brokersDeleteDynamicConfiguration = client (Proxy :: Proxy BrokersDeleteDynamicConfigurationAPI)
-- ^

type BrokersGetActiveBrokersAPI =
  "admin" :> "v2" :> "brokers" :> Capture "cluster" Text :> Verb 'GET 200 '[JSON] [Text]

brokersGetActiveBrokers :: Text -> ClientM [Text]
brokersGetActiveBrokers = client (Proxy :: Proxy BrokersGetActiveBrokersAPI)
-- ^

type BrokersGetAllDynamicConfigurationsAPI =
  "admin" :> "v2" :> "brokers" :> "configuration" :> "values" :> Verb 'GET 200 '[JSON] ((Map.Map String Text))

brokersGetAllDynamicConfigurations :: ClientM ((Map.Map String Text))
brokersGetAllDynamicConfigurations = client (Proxy :: Proxy BrokersGetAllDynamicConfigurationsAPI)
-- ^

type BrokersGetDynamicConfigurationNameAPI =
  "admin" :> "v2" :> "brokers" :> "configuration" :> Verb 'GET 200 '[JSON] [Text]

brokersGetDynamicConfigurationName :: ClientM [Text]
brokersGetDynamicConfigurationName = client (Proxy :: Proxy BrokersGetDynamicConfigurationNameAPI)
-- ^

type BrokersGetInternalConfigurationDataAPI =
  "admin" :> "v2" :> "brokers" :> "internal-configuration" :> Verb 'GET 200 '[JSON] InternalConfigurationData

brokersGetInternalConfigurationData :: ClientM InternalConfigurationData
brokersGetInternalConfigurationData = client (Proxy :: Proxy BrokersGetInternalConfigurationDataAPI)
-- ^

type BrokersGetLeaderBrokerAPI =
  "admin" :> "v2" :> "brokers" :> "leaderBroker" :> Verb 'GET 200 '[JSON] BrokerInfo

brokersGetLeaderBroker :: ClientM BrokerInfo
brokersGetLeaderBroker = client (Proxy :: Proxy BrokersGetLeaderBrokerAPI)
-- ^

type BrokersGetOwnedNamespacesAPI =
  "admin" :> "v2" :> "brokers" :> Capture "clusterName" Text :> Capture "broker-webserviceurl" Text :> "ownedNamespaces" :> Verb 'GET 200 '[JSON] ((Map.Map String NamespaceOwnershipStatus))

brokersGetOwnedNamespaces :: Text -> Text -> ClientM ((Map.Map String NamespaceOwnershipStatus))
brokersGetOwnedNamespaces = client (Proxy :: Proxy BrokersGetOwnedNamespacesAPI)
-- ^

type BrokersGetRuntimeConfigurationAPI =
  "admin" :> "v2" :> "brokers" :> "configuration" :> "runtime" :> Verb 'GET 200 '[JSON] ((Map.Map String Text))

brokersGetRuntimeConfiguration :: ClientM ((Map.Map String Text))
brokersGetRuntimeConfiguration = client (Proxy :: Proxy BrokersGetRuntimeConfigurationAPI)
-- ^

type BrokersHealthcheckAPI =
  "admin" :> "v2" :> "brokers" :> "health" :> QueryParam "topicVersion" Text :> Verb 'GET 200 '[JSON] NoContent

brokersHealthcheck :: Maybe Text -> ClientM NoContent
brokersHealthcheck = client (Proxy :: Proxy BrokersHealthcheckAPI)
-- ^

type BrokersIsReadyAPI =
  "admin" :> "v2" :> "brokers" :> "ready" :> Verb 'GET 200 '[JSON] NoContent

brokersIsReady :: ClientM NoContent
brokersIsReady = client (Proxy :: Proxy BrokersIsReadyAPI)
-- ^

type BrokersUpdateDynamicConfigurationAPI =
  "admin" :> "v2" :> "brokers" :> "configuration" :> Capture "configName" Text :> Capture "configValue" Text :> Verb 'POST 200 '[JSON] NoContent

brokersUpdateDynamicConfiguration :: Text -> Text -> ClientM NoContent
brokersUpdateDynamicConfiguration = client (Proxy :: Proxy BrokersUpdateDynamicConfigurationAPI)
-- ^

type BrokersVersionAPI =
  "admin" :> "v2" :> "brokers" :> "version" :> Verb 'GET 200 '[JSON] Text

brokersVersion :: ClientM Text
brokersVersion = client (Proxy :: Proxy BrokersVersionAPI)
-- ^ This operation requires Pulsar superuser privileges, and the name cannot contain the '/' characters.

type ClustersCreateClusterAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> ReqBody '[JSON] ClusterData :> Verb 'PUT 200 '[JSON] NoContent

clustersCreateCluster :: Text -> ClusterData -> ClientM NoContent
clustersCreateCluster = client (Proxy :: Proxy ClustersCreateClusterAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersDeleteClusterAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> Verb 'DELETE 200 '[JSON] NoContent

clustersDeleteCluster :: Text -> ClientM NoContent
clustersDeleteCluster = client (Proxy :: Proxy ClustersDeleteClusterAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersDeleteFailureDomainAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "failureDomains" :> Capture "domainName" Text :> Verb 'DELETE 200 '[JSON] NoContent

clustersDeleteFailureDomain :: Text -> Text -> ClientM NoContent
clustersDeleteFailureDomain = client (Proxy :: Proxy ClustersDeleteFailureDomainAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersDeleteNamespaceIsolationPolicyAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "namespaceIsolationPolicies" :> Capture "policyName" Text :> Verb 'DELETE 200 '[JSON] NoContent

clustersDeleteNamespaceIsolationPolicy :: Text -> Text -> ClientM NoContent
clustersDeleteNamespaceIsolationPolicy = client (Proxy :: Proxy ClustersDeleteNamespaceIsolationPolicyAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetBrokerWithNamespaceIsolationPolicyAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "namespaceIsolationPolicies" :> "brokers" :> Capture "broker" Text :> Verb 'GET 200 '[JSON] BrokerNamespaceIsolationData

clustersGetBrokerWithNamespaceIsolationPolicy :: Text -> Text -> ClientM BrokerNamespaceIsolationData
clustersGetBrokerWithNamespaceIsolationPolicy = client (Proxy :: Proxy ClustersGetBrokerWithNamespaceIsolationPolicyAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetBrokersWithNamespaceIsolationPolicyAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "namespaceIsolationPolicies" :> "brokers" :> Verb 'GET 200 '[JSON] [BrokerNamespaceIsolationData]

clustersGetBrokersWithNamespaceIsolationPolicy :: Text -> ClientM [BrokerNamespaceIsolationData]
clustersGetBrokersWithNamespaceIsolationPolicy = client (Proxy :: Proxy ClustersGetBrokersWithNamespaceIsolationPolicyAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetClusterAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> Verb 'GET 200 '[JSON] ClusterData

clustersGetCluster :: Text -> ClientM ClusterData
clustersGetCluster = client (Proxy :: Proxy ClustersGetClusterAPI)
-- ^

type ClustersGetClustersAPI =
  "admin" :> "v2" :> "clusters" :> Verb 'GET 200 '[JSON] [Text]

clustersGetClusters :: ClientM [Text]
clustersGetClusters = client (Proxy :: Proxy ClustersGetClustersAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetDomainAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "failureDomains" :> Capture "domainName" Text :> Verb 'GET 200 '[JSON] FailureDomain

clustersGetDomain :: Text -> Text -> ClientM FailureDomain
clustersGetDomain = client (Proxy :: Proxy ClustersGetDomainAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetFailureDomainsAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "failureDomains" :> Verb 'GET 200 '[JSON] ((Map.Map String FailureDomain))

clustersGetFailureDomains :: Text -> ClientM ((Map.Map String FailureDomain))
clustersGetFailureDomains = client (Proxy :: Proxy ClustersGetFailureDomainsAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetNamespaceIsolationPoliciesAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "namespaceIsolationPolicies" :> Verb 'GET 200 '[JSON] ((Map.Map String NamespaceIsolationData))

clustersGetNamespaceIsolationPolicies :: Text -> ClientM ((Map.Map String NamespaceIsolationData))
clustersGetNamespaceIsolationPolicies = client (Proxy :: Proxy ClustersGetNamespaceIsolationPoliciesAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetNamespaceIsolationPolicyAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "namespaceIsolationPolicies" :> Capture "policyName" Text :> Verb 'GET 200 '[JSON] NamespaceIsolationData

clustersGetNamespaceIsolationPolicy :: Text -> Text -> ClientM NamespaceIsolationData
clustersGetNamespaceIsolationPolicy = client (Proxy :: Proxy ClustersGetNamespaceIsolationPolicyAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetPeerClusterAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "peers" :> Verb 'GET 200 '[JSON] [Text]

clustersGetPeerCluster :: Text -> ClientM [Text]
clustersGetPeerCluster = client (Proxy :: Proxy ClustersGetPeerClusterAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersSetFailureDomainAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "failureDomains" :> Capture "domainName" Text :> ReqBody '[JSON] FailureDomain :> Verb 'POST 200 '[JSON] NoContent

clustersSetFailureDomain :: Text -> Text -> FailureDomain -> ClientM NoContent
clustersSetFailureDomain = client (Proxy :: Proxy ClustersSetFailureDomainAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersSetNamespaceIsolationPolicyAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "namespaceIsolationPolicies" :> Capture "policyName" Text :> ReqBody '[JSON] NamespaceIsolationData :> Verb 'POST 200 '[JSON] NoContent

clustersSetNamespaceIsolationPolicy :: Text -> Text -> NamespaceIsolationData -> ClientM NoContent
clustersSetNamespaceIsolationPolicy = client (Proxy :: Proxy ClustersSetNamespaceIsolationPolicyAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersSetPeerClusterNamesAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "peers" :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

clustersSetPeerClusterNames :: Text -> [Text] -> ClientM NoContent
clustersSetPeerClusterNames = client (Proxy :: Proxy ClustersSetPeerClusterNamesAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersUpdateClusterAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> ReqBody '[JSON] ClusterData :> Verb 'POST 200 '[JSON] NoContent

clustersUpdateCluster :: Text -> ClusterData -> ClientM NoContent
clustersUpdateCluster = client (Proxy :: Proxy ClustersUpdateClusterAPI)
-- ^ Request should be executed by Monitoring agent on each worker to fetch the worker-metrics

type WorkStatsGetMetricsAPI =
  "admin" :> "v2" :> "worker-stats" :> "metrics" :> Verb 'GET 200 '[JSON] [Metrics]

workStatsGetMetrics :: ClientM [Metrics]
workStatsGetMetrics = client (Proxy :: Proxy WorkStatsGetMetricsAPI)
-- ^ Requested should be executed by Monitoring agent on each worker to fetch the metrics

type WorkStatsGetStatsAPI =
  "admin" :> "v2" :> "worker-stats" :> "functionsmetrics" :> Verb 'GET 200 '[JSON] [WorkerFunctionInstanceStats]

workStatsGetStats :: ClientM [WorkerFunctionInstanceStats]
workStatsGetStats = client (Proxy :: Proxy WorkStatsGetStatsAPI)
-- ^

type WorkerGetAssignmentsAPI =
  "admin" :> "v2" :> "worker" :> "assignments" :> Verb 'GET 200 '[JSON] ((Map.Map String Value))

workerGetAssignments :: ClientM ((Map.Map String Value))
workerGetAssignments = client (Proxy :: Proxy WorkerGetAssignmentsAPI)
-- ^

type WorkerGetClusterAPI =
  "admin" :> "v2" :> "worker" :> "cluster" :> Verb 'GET 200 '[JSON] [WorkerInfo]

workerGetCluster :: ClientM [WorkerInfo]
workerGetCluster = client (Proxy :: Proxy WorkerGetClusterAPI)
-- ^

type WorkerGetClusterLeaderAPI =
  "admin" :> "v2" :> "worker" :> "cluster" :> "leader" :> Verb 'GET 200 '[JSON] WorkerInfo

workerGetClusterLeader :: ClientM WorkerInfo
workerGetClusterLeader = client (Proxy :: Proxy WorkerGetClusterLeaderAPI)
-- ^

type WorkerGetConnectorsListAPI =
  "admin" :> "v2" :> "worker" :> "connectors" :> Verb 'GET 200 '[JSON] [Value]

workerGetConnectorsList :: ClientM [Value]
workerGetConnectorsList = client (Proxy :: Proxy WorkerGetConnectorsListAPI)
-- ^

type WorkerIsLeaderReadyAPI =
  "admin" :> "v2" :> "worker" :> "cluster" :> "leader" :> "ready" :> Verb 'GET 200 '[JSON] Bool

workerIsLeaderReady :: ClientM Bool
workerIsLeaderReady = client (Proxy :: Proxy WorkerIsLeaderReadyAPI)
-- ^

type WorkerRebalanceAPI =
  "admin" :> "v2" :> "worker" :> "rebalance" :> Verb 'PUT 200 '[JSON] NoContent

workerRebalance :: ClientM NoContent
workerRebalance = client (Proxy :: Proxy WorkerRebalanceAPI)
-- ^

type NamespacesClearNamespaceBacklogAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "clearBacklog" :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

namespacesClearNamespaceBacklog :: Text -> Text -> Maybe Bool -> ClientM NoContent
namespacesClearNamespaceBacklog = client (Proxy :: Proxy NamespacesClearNamespaceBacklogAPI)
-- ^

type NamespacesClearNamespaceBacklogForSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "clearBacklog" :> Capture "subscription" Text :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

namespacesClearNamespaceBacklogForSubscription :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
namespacesClearNamespaceBacklogForSubscription = client (Proxy :: Proxy NamespacesClearNamespaceBacklogForSubscriptionAPI)
-- ^

type NamespacesClearNamespaceBundleBacklogAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> "clearBacklog" :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

namespacesClearNamespaceBundleBacklog :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
namespacesClearNamespaceBundleBacklog = client (Proxy :: Proxy NamespacesClearNamespaceBundleBacklogAPI)
-- ^

type NamespacesClearNamespaceBundleBacklogForSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> "clearBacklog" :> Capture "subscription" Text :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

namespacesClearNamespaceBundleBacklogForSubscription :: Text -> Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
namespacesClearNamespaceBundleBacklogForSubscription = client (Proxy :: Proxy NamespacesClearNamespaceBundleBacklogForSubscriptionAPI)
-- ^

type NamespacesClearOffloadDeletionLagAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "offloadDeletionLagMs" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesClearOffloadDeletionLag :: Text -> Text -> ClientM NoContent
namespacesClearOffloadDeletionLag = client (Proxy :: Proxy NamespacesClearOffloadDeletionLagAPI)
-- ^

type NamespacesClearPropertiesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "properties" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesClearProperties :: Text -> Text -> ClientM NoContent
namespacesClearProperties = client (Proxy :: Proxy NamespacesClearPropertiesAPI)
-- ^

type NamespacesCreateNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> ReqBody '[JSON] Policies :> Verb 'PUT 200 '[JSON] NoContent

namespacesCreateNamespace :: Text -> Text -> Policies -> ClientM NoContent
namespacesCreateNamespace = client (Proxy :: Proxy NamespacesCreateNamespaceAPI)
-- ^

type NamespacesDeleteBookieAffinityGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "property" Text :> Capture "namespace" Text :> "persistence" :> "bookieAffinity" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesDeleteBookieAffinityGroup :: Text -> Text -> ClientM NoContent
namespacesDeleteBookieAffinityGroup = client (Proxy :: Proxy NamespacesDeleteBookieAffinityGroupAPI)
-- ^ The backlog size is compared to the threshold periodically. A threshold of 0 disabled automatic compaction

type NamespacesDeleteCompactionThresholdAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "compactionThreshold" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesDeleteCompactionThreshold :: Text -> Text -> ClientM NoContent
namespacesDeleteCompactionThreshold = client (Proxy :: Proxy NamespacesDeleteCompactionThresholdAPI)
-- ^

type NamespacesDeleteDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "dispatchRate" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesDeleteDispatchRate :: Text -> Text -> ClientM NoContent
namespacesDeleteDispatchRate = client (Proxy :: Proxy NamespacesDeleteDispatchRateAPI)
-- ^

type NamespacesDeleteNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

namespacesDeleteNamespace :: Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
namespacesDeleteNamespace = client (Proxy :: Proxy NamespacesDeleteNamespaceAPI)
-- ^

type NamespacesDeleteNamespaceBundleAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

namespacesDeleteNamespaceBundle :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
namespacesDeleteNamespaceBundle = client (Proxy :: Proxy NamespacesDeleteNamespaceBundleAPI)
-- ^

type NamespacesDeletePersistenceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "persistence" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesDeletePersistence :: Text -> Text -> ClientM NoContent
namespacesDeletePersistence = client (Proxy :: Proxy NamespacesDeletePersistenceAPI)
-- ^

type NamespacesDeleteSubscribeRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscribeRate" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesDeleteSubscribeRate :: Text -> Text -> ClientM NoContent
namespacesDeleteSubscribeRate = client (Proxy :: Proxy NamespacesDeleteSubscribeRateAPI)
-- ^

type NamespacesDeleteSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionDispatchRate" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesDeleteSubscriptionDispatchRate :: Text -> Text -> ClientM NoContent
namespacesDeleteSubscriptionDispatchRate = client (Proxy :: Proxy NamespacesDeleteSubscriptionDispatchRateAPI)
-- ^

type NamespacesGetAntiAffinityNamespacesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "cluster" Text :> "antiAffinity" :> Capture "group" Text :> QueryParam "tenant" Text :> Verb 'GET 200 '[JSON] [Text]

namespacesGetAntiAffinityNamespaces :: Text -> Text -> Maybe Text -> ClientM [Text]
namespacesGetAntiAffinityNamespaces = client (Proxy :: Proxy NamespacesGetAntiAffinityNamespacesAPI)
-- ^

type NamespacesGetBacklogQuotaMapAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "backlogQuotaMap" :> Verb 'GET 200 '[JSON] ((Map.Map String BacklogQuota))

namespacesGetBacklogQuotaMap :: Text -> Text -> ClientM ((Map.Map String BacklogQuota))
namespacesGetBacklogQuotaMap = client (Proxy :: Proxy NamespacesGetBacklogQuotaMapAPI)
-- ^

type NamespacesGetBookieAffinityGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "property" Text :> Capture "namespace" Text :> "persistence" :> "bookieAffinity" :> Verb 'GET 200 '[JSON] BookieAffinityGroupData

namespacesGetBookieAffinityGroup :: Text -> Text -> ClientM BookieAffinityGroupData
namespacesGetBookieAffinityGroup = client (Proxy :: Proxy NamespacesGetBookieAffinityGroupAPI)
-- ^

type NamespacesGetBundlesDataAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "bundles" :> Verb 'GET 200 '[JSON] BundlesData

namespacesGetBundlesData :: Text -> Text -> ClientM BundlesData
namespacesGetBundlesData = client (Proxy :: Proxy NamespacesGetBundlesDataAPI)
-- ^ The backlog size is compared to the threshold periodically. A threshold of 0 disabled automatic compaction

type NamespacesGetCompactionThresholdAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "compactionThreshold" :> Verb 'GET 200 '[JSON] Integer

namespacesGetCompactionThreshold :: Text -> Text -> ClientM Integer
namespacesGetCompactionThreshold = client (Proxy :: Proxy NamespacesGetCompactionThresholdAPI)
-- ^

type NamespacesGetDeduplicationAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "deduplication" :> Verb 'GET 200 '[JSON] Bool

namespacesGetDeduplication :: Text -> Text -> ClientM Bool
namespacesGetDeduplication = client (Proxy :: Proxy NamespacesGetDeduplicationAPI)
-- ^

type NamespacesGetDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "deduplicationSnapshotInterval" :> Verb 'GET 200 '[JSON] Int

namespacesGetDeduplicationSnapshotInterval :: Text -> Text -> ClientM Int
namespacesGetDeduplicationSnapshotInterval = client (Proxy :: Proxy NamespacesGetDeduplicationSnapshotIntervalAPI)
-- ^

type NamespacesGetDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "delayedDelivery" :> Verb 'GET 200 '[JSON] DelayedDeliveryPolicies

namespacesGetDelayedDeliveryPolicies :: Text -> Text -> ClientM DelayedDeliveryPolicies
namespacesGetDelayedDeliveryPolicies = client (Proxy :: Proxy NamespacesGetDelayedDeliveryPoliciesAPI)
-- ^

type NamespacesGetDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "dispatchRate" :> Verb 'GET 200 '[JSON] DispatchRate

namespacesGetDispatchRate :: Text -> Text -> ClientM DispatchRate
namespacesGetDispatchRate = client (Proxy :: Proxy NamespacesGetDispatchRateAPI)
-- ^

type NamespacesGetInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "inactiveTopicPolicies" :> Verb 'GET 200 '[JSON] InactiveTopicPolicies

namespacesGetInactiveTopicPolicies :: Text -> Text -> ClientM InactiveTopicPolicies
namespacesGetInactiveTopicPolicies = client (Proxy :: Proxy NamespacesGetInactiveTopicPoliciesAPI)
-- ^

type NamespacesGetIsAllowAutoUpdateSchemaAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "isAllowAutoUpdateSchema" :> Verb 'GET 200 '[JSON] Bool

namespacesGetIsAllowAutoUpdateSchema :: Text -> Text -> ClientM Bool
namespacesGetIsAllowAutoUpdateSchema = client (Proxy :: Proxy NamespacesGetIsAllowAutoUpdateSchemaAPI)
-- ^

type NamespacesGetMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxConsumersPerSubscription" :> Verb 'GET 200 '[JSON] Int

namespacesGetMaxConsumersPerSubscription :: Text -> Text -> ClientM Int
namespacesGetMaxConsumersPerSubscription = client (Proxy :: Proxy NamespacesGetMaxConsumersPerSubscriptionAPI)
-- ^

type NamespacesGetMaxConsumersPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxConsumersPerTopic" :> Verb 'GET 200 '[JSON] Int

namespacesGetMaxConsumersPerTopic :: Text -> Text -> ClientM Int
namespacesGetMaxConsumersPerTopic = client (Proxy :: Proxy NamespacesGetMaxConsumersPerTopicAPI)
-- ^

type NamespacesGetMaxProducersPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxProducersPerTopic" :> Verb 'GET 200 '[JSON] Int

namespacesGetMaxProducersPerTopic :: Text -> Text -> ClientM Int
namespacesGetMaxProducersPerTopic = client (Proxy :: Proxy NamespacesGetMaxProducersPerTopicAPI)
-- ^

type NamespacesGetMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxSubscriptionsPerTopic" :> Verb 'GET 200 '[JSON] Int

namespacesGetMaxSubscriptionsPerTopic :: Text -> Text -> ClientM Int
namespacesGetMaxSubscriptionsPerTopic = client (Proxy :: Proxy NamespacesGetMaxSubscriptionsPerTopicAPI)
-- ^

type NamespacesGetMaxTopicsPerNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxTopicsPerNamespace" :> Verb 'GET 200 '[JSON] Int

namespacesGetMaxTopicsPerNamespace :: Text -> Text -> ClientM Int
namespacesGetMaxTopicsPerNamespace = client (Proxy :: Proxy NamespacesGetMaxTopicsPerNamespaceAPI)
-- ^

type NamespacesGetMaxUnackedMessagesPerConsumerAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxUnackedMessagesPerConsumer" :> Verb 'GET 200 '[JSON] Int

namespacesGetMaxUnackedMessagesPerConsumer :: Text -> Text -> ClientM Int
namespacesGetMaxUnackedMessagesPerConsumer = client (Proxy :: Proxy NamespacesGetMaxUnackedMessagesPerConsumerAPI)
-- ^

type NamespacesGetMaxUnackedmessagesPerSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxUnackedMessagesPerSubscription" :> Verb 'GET 200 '[JSON] Int

namespacesGetMaxUnackedmessagesPerSubscription :: Text -> Text -> ClientM Int
namespacesGetMaxUnackedmessagesPerSubscription = client (Proxy :: Proxy NamespacesGetMaxUnackedmessagesPerSubscriptionAPI)
-- ^

type NamespacesGetNamespaceAntiAffinityGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "antiAffinity" :> Verb 'GET 200 '[JSON] Text

namespacesGetNamespaceAntiAffinityGroup :: Text -> Text -> ClientM Text
namespacesGetNamespaceAntiAffinityGroup = client (Proxy :: Proxy NamespacesGetNamespaceAntiAffinityGroupAPI)
-- ^

type NamespacesGetNamespaceMessageTTLAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "messageTTL" :> Verb 'GET 200 '[JSON] Int

namespacesGetNamespaceMessageTTL :: Text -> Text -> ClientM Int
namespacesGetNamespaceMessageTTL = client (Proxy :: Proxy NamespacesGetNamespaceMessageTTLAPI)
-- ^

type NamespacesGetNamespaceReplicationClustersAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "replication" :> Verb 'GET 200 '[JSON] [Text]

namespacesGetNamespaceReplicationClusters :: Text -> Text -> ClientM [Text]
namespacesGetNamespaceReplicationClusters = client (Proxy :: Proxy NamespacesGetNamespaceReplicationClustersAPI)
-- ^

type NamespacesGetNamespaceResourceGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "resourcegroup" :> Verb 'GET 200 '[JSON] Text

namespacesGetNamespaceResourceGroup :: Text -> Text -> ClientM Text
namespacesGetNamespaceResourceGroup = client (Proxy :: Proxy NamespacesGetNamespaceResourceGroupAPI)
-- ^ A negative value denotes that deletion has been completely disabled. 'null' denotes that the topics in the namespace will fall back to the broker default for deletion lag.

type NamespacesGetOffloadDeletionLagAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "offloadDeletionLagMs" :> Verb 'GET 200 '[JSON] Integer

namespacesGetOffloadDeletionLag :: Text -> Text -> ClientM Integer
namespacesGetOffloadDeletionLag = client (Proxy :: Proxy NamespacesGetOffloadDeletionLagAPI)
-- ^

type NamespacesGetOffloadPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "offloadPolicies" :> Verb 'GET 200 '[JSON] OffloadPoliciesImpl

namespacesGetOffloadPolicies :: Text -> Text -> ClientM OffloadPoliciesImpl
namespacesGetOffloadPolicies = client (Proxy :: Proxy NamespacesGetOffloadPoliciesAPI)
-- ^ A negative value disables automatic offloading

type NamespacesGetOffloadThresholdAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "offloadThreshold" :> Verb 'GET 200 '[JSON] Integer

namespacesGetOffloadThreshold :: Text -> Text -> ClientM Integer
namespacesGetOffloadThreshold = client (Proxy :: Proxy NamespacesGetOffloadThresholdAPI)
-- ^

type NamespacesGetPermissionsAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "permissions" :> Verb 'GET 200 '[JSON] ((Map.Map String [Text]))

namespacesGetPermissions :: Text -> Text -> ClientM ((Map.Map String [Text]))
namespacesGetPermissions = client (Proxy :: Proxy NamespacesGetPermissionsAPI)
-- ^

type NamespacesGetPersistenceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "persistence" :> Verb 'GET 200 '[JSON] PersistencePolicies

namespacesGetPersistence :: Text -> Text -> ClientM PersistencePolicies
namespacesGetPersistence = client (Proxy :: Proxy NamespacesGetPersistenceAPI)
-- ^

type NamespacesGetPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> Verb 'GET 200 '[JSON] Policies

namespacesGetPolicies :: Text -> Text -> ClientM Policies
namespacesGetPolicies = client (Proxy :: Proxy NamespacesGetPoliciesAPI)
-- ^

type NamespacesGetPropertiesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "properties" :> Verb 'GET 200 '[JSON] NoContent

namespacesGetProperties :: Text -> Text -> ClientM NoContent
namespacesGetProperties = client (Proxy :: Proxy NamespacesGetPropertiesAPI)
-- ^

type NamespacesGetPropertyAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "property" :> Capture "key" Text :> Verb 'GET 200 '[JSON] NoContent

namespacesGetProperty :: Text -> Text -> Text -> ClientM NoContent
namespacesGetProperty = client (Proxy :: Proxy NamespacesGetPropertyAPI)
-- ^

type NamespacesGetReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "replicatorDispatchRate" :> Verb 'GET 200 '[JSON] DispatchRate

namespacesGetReplicatorDispatchRate :: Text -> Text -> ClientM DispatchRate
namespacesGetReplicatorDispatchRate = client (Proxy :: Proxy NamespacesGetReplicatorDispatchRateAPI)
-- ^

type NamespacesGetRetentionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "retention" :> Verb 'GET 200 '[JSON] RetentionPolicies

namespacesGetRetention :: Text -> Text -> ClientM RetentionPolicies
namespacesGetRetention = client (Proxy :: Proxy NamespacesGetRetentionAPI)
-- ^ The value AutoUpdateDisabled prevents producers from updating the schema.  If set to AutoUpdateDisabled, schemas must be updated through the REST api

type NamespacesGetSchemaAutoUpdateCompatibilityStrategyAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "schemaAutoUpdateCompatibilityStrategy" :> Verb 'GET 200 '[JSON] Text

namespacesGetSchemaAutoUpdateCompatibilityStrategy :: Text -> Text -> ClientM Text
namespacesGetSchemaAutoUpdateCompatibilityStrategy = client (Proxy :: Proxy NamespacesGetSchemaAutoUpdateCompatibilityStrategyAPI)
-- ^

type NamespacesGetSchemaCompatibilityStrategyAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "schemaCompatibilityStrategy" :> Verb 'GET 200 '[JSON] Text

namespacesGetSchemaCompatibilityStrategy :: Text -> Text -> ClientM Text
namespacesGetSchemaCompatibilityStrategy = client (Proxy :: Proxy NamespacesGetSchemaCompatibilityStrategyAPI)
-- ^ If the flag is set to true, when a producer without a schema attempts to produce to a topic with schema in this namespace, the producer will be failed to connect. PLEASE be carefully on using this, since non-java clients don't support schema.if you enable this setting, it will cause non-java clients failed to produce.

type NamespacesGetSchemaValidtionEnforcedAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "schemaValidationEnforced" :> Verb 'GET 200 '[JSON] Bool

namespacesGetSchemaValidtionEnforced :: Text -> Text -> ClientM Bool
namespacesGetSchemaValidtionEnforced = client (Proxy :: Proxy NamespacesGetSchemaValidtionEnforcedAPI)
-- ^

type NamespacesGetSubscribeRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscribeRate" :> Verb 'GET 200 '[JSON] SubscribeRate

namespacesGetSubscribeRate :: Text -> Text -> ClientM SubscribeRate
namespacesGetSubscribeRate = client (Proxy :: Proxy NamespacesGetSubscribeRateAPI)
-- ^

type NamespacesGetSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionDispatchRate" :> Verb 'GET 200 '[JSON] DispatchRate

namespacesGetSubscriptionDispatchRate :: Text -> Text -> ClientM DispatchRate
namespacesGetSubscriptionDispatchRate = client (Proxy :: Proxy NamespacesGetSubscriptionDispatchRateAPI)
-- ^

type NamespacesGetSubscriptionExpirationTimeAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionExpirationTime" :> Verb 'GET 200 '[JSON] Int

namespacesGetSubscriptionExpirationTime :: Text -> Text -> ClientM Int
namespacesGetSubscriptionExpirationTime = client (Proxy :: Proxy NamespacesGetSubscriptionExpirationTimeAPI)
-- ^

type NamespacesGetSubscriptionTypesEnabledAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionTypesEnabled" :> Verb 'GET 200 '[JSON] [Text]

namespacesGetSubscriptionTypesEnabled :: Text -> Text -> ClientM [Text]
namespacesGetSubscriptionTypesEnabled = client (Proxy :: Proxy NamespacesGetSubscriptionTypesEnabledAPI)
-- ^

type NamespacesGetTenantNamespacesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Verb 'GET 200 '[JSON] [Text]

namespacesGetTenantNamespaces :: Text -> ClientM [Text]
namespacesGetTenantNamespaces = client (Proxy :: Proxy NamespacesGetTenantNamespacesAPI)
-- ^

type NamespacesGetTopicsAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "topics" :> QueryParam "mode" Text :> Verb 'GET 200 '[JSON] [Text]

namespacesGetTopics :: Text -> Text -> Maybe Text -> ClientM [Text]
namespacesGetTopics = client (Proxy :: Proxy NamespacesGetTopicsAPI)
-- ^

type NamespacesGrantPermissionOnNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "permissions" :> Capture "role" Text :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

namespacesGrantPermissionOnNamespace :: Text -> Text -> Text -> [Text] -> ClientM NoContent
namespacesGrantPermissionOnNamespace = client (Proxy :: Proxy NamespacesGrantPermissionOnNamespaceAPI)
-- ^

type NamespacesModifyDeduplicationAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "deduplication" :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

namespacesModifyDeduplication :: Text -> Text -> Bool -> ClientM NoContent
namespacesModifyDeduplication = client (Proxy :: Proxy NamespacesModifyDeduplicationAPI)
-- ^

type NamespacesModifyEncryptionRequiredAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "encryptionRequired" :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

namespacesModifyEncryptionRequired :: Text -> Text -> Bool -> ClientM NoContent
namespacesModifyEncryptionRequired = client (Proxy :: Proxy NamespacesModifyEncryptionRequiredAPI)
-- ^

type NamespacesRemoveAutoSubscriptionCreationAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "autoSubscriptionCreation" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveAutoSubscriptionCreation :: Text -> Text -> ClientM NoContent
namespacesRemoveAutoSubscriptionCreation = client (Proxy :: Proxy NamespacesRemoveAutoSubscriptionCreationAPI)
-- ^

type NamespacesRemoveAutoTopicCreationAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "autoTopicCreation" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveAutoTopicCreation :: Text -> Text -> ClientM NoContent
namespacesRemoveAutoTopicCreation = client (Proxy :: Proxy NamespacesRemoveAutoTopicCreationAPI)
-- ^

type NamespacesRemoveBacklogQuotaAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "backlogQuota" :> QueryParam "backlogQuotaType" Text :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveBacklogQuota :: Text -> Text -> Maybe Text -> ClientM NoContent
namespacesRemoveBacklogQuota = client (Proxy :: Proxy NamespacesRemoveBacklogQuotaAPI)
-- ^

type NamespacesRemoveDeduplicationAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "deduplication" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveDeduplication :: Text -> Text -> ClientM NoContent
namespacesRemoveDeduplication = client (Proxy :: Proxy NamespacesRemoveDeduplicationAPI)
-- ^

type NamespacesRemoveDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "delayedDelivery" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveDelayedDeliveryPolicies :: Text -> Text -> ClientM NoContent
namespacesRemoveDelayedDeliveryPolicies = client (Proxy :: Proxy NamespacesRemoveDelayedDeliveryPoliciesAPI)
-- ^

type NamespacesRemoveInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "inactiveTopicPolicies" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveInactiveTopicPolicies :: Text -> Text -> ClientM NoContent
namespacesRemoveInactiveTopicPolicies = client (Proxy :: Proxy NamespacesRemoveInactiveTopicPoliciesAPI)
-- ^

type NamespacesRemoveMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxConsumersPerSubscription" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveMaxConsumersPerSubscription :: Text -> Text -> ClientM NoContent
namespacesRemoveMaxConsumersPerSubscription = client (Proxy :: Proxy NamespacesRemoveMaxConsumersPerSubscriptionAPI)
-- ^

type NamespacesRemoveMaxConsumersPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxConsumersPerTopic" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveMaxConsumersPerTopic :: Text -> Text -> ClientM NoContent
namespacesRemoveMaxConsumersPerTopic = client (Proxy :: Proxy NamespacesRemoveMaxConsumersPerTopicAPI)
-- ^

type NamespacesRemoveMaxProducersPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxProducersPerTopic" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveMaxProducersPerTopic :: Text -> Text -> ClientM NoContent
namespacesRemoveMaxProducersPerTopic = client (Proxy :: Proxy NamespacesRemoveMaxProducersPerTopicAPI)
-- ^

type NamespacesRemoveMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxSubscriptionsPerTopic" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveMaxSubscriptionsPerTopic :: Text -> Text -> ClientM NoContent
namespacesRemoveMaxSubscriptionsPerTopic = client (Proxy :: Proxy NamespacesRemoveMaxSubscriptionsPerTopicAPI)
-- ^

type NamespacesRemoveMaxTopicsPerNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxTopicsPerNamespace" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveMaxTopicsPerNamespace :: Text -> Text -> ClientM NoContent
namespacesRemoveMaxTopicsPerNamespace = client (Proxy :: Proxy NamespacesRemoveMaxTopicsPerNamespaceAPI)
-- ^

type NamespacesRemoveMaxUnackedmessagesPerConsumerAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxUnackedMessagesPerConsumer" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveMaxUnackedmessagesPerConsumer :: Text -> Text -> ClientM NoContent
namespacesRemoveMaxUnackedmessagesPerConsumer = client (Proxy :: Proxy NamespacesRemoveMaxUnackedmessagesPerConsumerAPI)
-- ^

type NamespacesRemoveMaxUnackedmessagesPerSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxUnackedMessagesPerSubscription" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveMaxUnackedmessagesPerSubscription :: Text -> Text -> ClientM NoContent
namespacesRemoveMaxUnackedmessagesPerSubscription = client (Proxy :: Proxy NamespacesRemoveMaxUnackedmessagesPerSubscriptionAPI)
-- ^

type NamespacesRemoveNamespaceAntiAffinityGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "antiAffinity" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveNamespaceAntiAffinityGroup :: Text -> Text -> ClientM NoContent
namespacesRemoveNamespaceAntiAffinityGroup = client (Proxy :: Proxy NamespacesRemoveNamespaceAntiAffinityGroupAPI)
-- ^

type NamespacesRemoveNamespaceMessageTTLAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "messageTTL" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveNamespaceMessageTTL :: Text -> Text -> ClientM NoContent
namespacesRemoveNamespaceMessageTTL = client (Proxy :: Proxy NamespacesRemoveNamespaceMessageTTLAPI)
-- ^

type NamespacesRemoveNamespaceResourceGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "resourcegroup" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveNamespaceResourceGroup :: Text -> Text -> ClientM NoContent
namespacesRemoveNamespaceResourceGroup = client (Proxy :: Proxy NamespacesRemoveNamespaceResourceGroupAPI)
-- ^

type NamespacesRemoveOffloadPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "removeOffloadPolicies" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveOffloadPolicies :: Text -> Text -> ClientM NoContent
namespacesRemoveOffloadPolicies = client (Proxy :: Proxy NamespacesRemoveOffloadPoliciesAPI)
-- ^

type NamespacesRemovePropertyAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "property" :> Capture "key" Text :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveProperty :: Text -> Text -> Text -> ClientM NoContent
namespacesRemoveProperty = client (Proxy :: Proxy NamespacesRemovePropertyAPI)
-- ^

type NamespacesRemoveReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "replicatorDispatchRate" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveReplicatorDispatchRate :: Text -> Text -> ClientM NoContent
namespacesRemoveReplicatorDispatchRate = client (Proxy :: Proxy NamespacesRemoveReplicatorDispatchRateAPI)
-- ^

type NamespacesRemoveRetentionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "retention" :> ReqBody '[JSON] RetentionPolicies :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveRetention :: Text -> Text -> RetentionPolicies -> ClientM NoContent
namespacesRemoveRetention = client (Proxy :: Proxy NamespacesRemoveRetentionAPI)
-- ^

type NamespacesRemoveSubscriptionExpirationTimeAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionExpirationTime" :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRemoveSubscriptionExpirationTime :: Text -> Text -> ClientM NoContent
namespacesRemoveSubscriptionExpirationTime = client (Proxy :: Proxy NamespacesRemoveSubscriptionExpirationTimeAPI)
-- ^

type NamespacesRevokePermissionsOnNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "permissions" :> Capture "role" Text :> Verb 'DELETE 200 '[JSON] NoContent

namespacesRevokePermissionsOnNamespace :: Text -> Text -> Text -> ClientM NoContent
namespacesRevokePermissionsOnNamespace = client (Proxy :: Proxy NamespacesRevokePermissionsOnNamespaceAPI)
-- ^

type NamespacesSetAutoSubscriptionCreationAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "autoSubscriptionCreation" :> ReqBody '[JSON] AutoSubscriptionCreationOverride :> Verb 'POST 200 '[JSON] NoContent

namespacesSetAutoSubscriptionCreation :: Text -> Text -> AutoSubscriptionCreationOverride -> ClientM NoContent
namespacesSetAutoSubscriptionCreation = client (Proxy :: Proxy NamespacesSetAutoSubscriptionCreationAPI)
-- ^

type NamespacesSetAutoTopicCreationAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "autoTopicCreation" :> ReqBody '[JSON] AutoTopicCreationOverride :> Verb 'POST 200 '[JSON] NoContent

namespacesSetAutoTopicCreation :: Text -> Text -> AutoTopicCreationOverride -> ClientM NoContent
namespacesSetAutoTopicCreation = client (Proxy :: Proxy NamespacesSetAutoTopicCreationAPI)
-- ^

type NamespacesSetBacklogQuotaAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "backlogQuota" :> QueryParam "backlogQuotaType" Text :> ReqBody '[JSON] BacklogQuota :> Verb 'POST 200 '[JSON] NoContent

namespacesSetBacklogQuota :: Text -> Text -> Maybe Text -> BacklogQuota -> ClientM NoContent
namespacesSetBacklogQuota = client (Proxy :: Proxy NamespacesSetBacklogQuotaAPI)
-- ^

type NamespacesSetBookieAffinityGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "persistence" :> "bookieAffinity" :> ReqBody '[JSON] BookieAffinityGroupData :> Verb 'POST 200 '[JSON] NoContent

namespacesSetBookieAffinityGroup :: Text -> Text -> BookieAffinityGroupData -> ClientM NoContent
namespacesSetBookieAffinityGroup = client (Proxy :: Proxy NamespacesSetBookieAffinityGroupAPI)
-- ^ The backlog size is compared to the threshold periodically. A threshold of 0 disabled automatic compaction

type NamespacesSetCompactionThresholdAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "compactionThreshold" :> ReqBody '[JSON] Integer :> Verb 'PUT 200 '[JSON] NoContent

namespacesSetCompactionThreshold :: Text -> Text -> Integer -> ClientM NoContent
namespacesSetCompactionThreshold = client (Proxy :: Proxy NamespacesSetCompactionThresholdAPI)
-- ^

type NamespacesSetDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "deduplicationSnapshotInterval" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

namespacesSetDeduplicationSnapshotInterval :: Text -> Text -> Int -> ClientM NoContent
namespacesSetDeduplicationSnapshotInterval = client (Proxy :: Proxy NamespacesSetDeduplicationSnapshotIntervalAPI)
-- ^

type NamespacesSetDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "delayedDelivery" :> ReqBody '[JSON] DelayedDeliveryPolicies :> Verb 'POST 200 '[JSON] NoContent

namespacesSetDelayedDeliveryPolicies :: Text -> Text -> DelayedDeliveryPolicies -> ClientM NoContent
namespacesSetDelayedDeliveryPolicies = client (Proxy :: Proxy NamespacesSetDelayedDeliveryPoliciesAPI)
-- ^

type NamespacesSetDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "dispatchRate" :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

namespacesSetDispatchRate :: Text -> Text -> DispatchRateImpl -> ClientM NoContent
namespacesSetDispatchRate = client (Proxy :: Proxy NamespacesSetDispatchRateAPI)
-- ^

type NamespacesSetInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "inactiveTopicPolicies" :> ReqBody '[JSON] InactiveTopicPolicies :> Verb 'POST 200 '[JSON] NoContent

namespacesSetInactiveTopicPolicies :: Text -> Text -> InactiveTopicPolicies -> ClientM NoContent
namespacesSetInactiveTopicPolicies = client (Proxy :: Proxy NamespacesSetInactiveTopicPoliciesAPI)
-- ^

type NamespacesSetIsAllowAutoUpdateSchemaAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "isAllowAutoUpdateSchema" :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

namespacesSetIsAllowAutoUpdateSchema :: Text -> Text -> Bool -> ClientM NoContent
namespacesSetIsAllowAutoUpdateSchema = client (Proxy :: Proxy NamespacesSetIsAllowAutoUpdateSchemaAPI)
-- ^

type NamespacesSetMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxConsumersPerSubscription" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

namespacesSetMaxConsumersPerSubscription :: Text -> Text -> Int -> ClientM NoContent
namespacesSetMaxConsumersPerSubscription = client (Proxy :: Proxy NamespacesSetMaxConsumersPerSubscriptionAPI)
-- ^

type NamespacesSetMaxConsumersPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxConsumersPerTopic" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

namespacesSetMaxConsumersPerTopic :: Text -> Text -> Int -> ClientM NoContent
namespacesSetMaxConsumersPerTopic = client (Proxy :: Proxy NamespacesSetMaxConsumersPerTopicAPI)
-- ^

type NamespacesSetMaxProducersPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxProducersPerTopic" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

namespacesSetMaxProducersPerTopic :: Text -> Text -> Int -> ClientM NoContent
namespacesSetMaxProducersPerTopic = client (Proxy :: Proxy NamespacesSetMaxProducersPerTopicAPI)
-- ^

type NamespacesSetMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxSubscriptionsPerTopic" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

namespacesSetMaxSubscriptionsPerTopic :: Text -> Text -> Int -> ClientM NoContent
namespacesSetMaxSubscriptionsPerTopic = client (Proxy :: Proxy NamespacesSetMaxSubscriptionsPerTopicAPI)
-- ^

type NamespacesSetMaxTopicsPerNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxTopicsPerNamespace" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

namespacesSetMaxTopicsPerNamespace :: Text -> Text -> Int -> ClientM NoContent
namespacesSetMaxTopicsPerNamespace = client (Proxy :: Proxy NamespacesSetMaxTopicsPerNamespaceAPI)
-- ^

type NamespacesSetMaxUnackedMessagesPerConsumerAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxUnackedMessagesPerConsumer" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

namespacesSetMaxUnackedMessagesPerConsumer :: Text -> Text -> Int -> ClientM NoContent
namespacesSetMaxUnackedMessagesPerConsumer = client (Proxy :: Proxy NamespacesSetMaxUnackedMessagesPerConsumerAPI)
-- ^

type NamespacesSetMaxUnackedMessagesPerSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxUnackedMessagesPerSubscription" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

namespacesSetMaxUnackedMessagesPerSubscription :: Text -> Text -> Int -> ClientM NoContent
namespacesSetMaxUnackedMessagesPerSubscription = client (Proxy :: Proxy NamespacesSetMaxUnackedMessagesPerSubscriptionAPI)
-- ^

type NamespacesSetNamespaceAntiAffinityGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "antiAffinity" :> ReqBody '[JSON] Text :> Verb 'POST 200 '[JSON] NoContent

namespacesSetNamespaceAntiAffinityGroup :: Text -> Text -> Text -> ClientM NoContent
namespacesSetNamespaceAntiAffinityGroup = client (Proxy :: Proxy NamespacesSetNamespaceAntiAffinityGroupAPI)
-- ^

type NamespacesSetNamespaceMessageTTLAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "messageTTL" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

namespacesSetNamespaceMessageTTL :: Text -> Text -> Int -> ClientM NoContent
namespacesSetNamespaceMessageTTL = client (Proxy :: Proxy NamespacesSetNamespaceMessageTTLAPI)
-- ^

type NamespacesSetNamespaceReplicationClustersAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "replication" :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

namespacesSetNamespaceReplicationClusters :: Text -> Text -> [Text] -> ClientM NoContent
namespacesSetNamespaceReplicationClusters = client (Proxy :: Proxy NamespacesSetNamespaceReplicationClustersAPI)
-- ^

type NamespacesSetNamespaceResourceGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "resourcegroup" :> Capture "resourcegroup" Text :> Verb 'POST 200 '[JSON] NoContent

namespacesSetNamespaceResourceGroup :: Text -> Text -> Text -> ClientM NoContent
namespacesSetNamespaceResourceGroup = client (Proxy :: Proxy NamespacesSetNamespaceResourceGroupAPI)
-- ^ A negative value disables the deletion completely.

type NamespacesSetOffloadDeletionLagAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "offloadDeletionLagMs" :> ReqBody '[JSON] Integer :> Verb 'PUT 200 '[JSON] NoContent

namespacesSetOffloadDeletionLag :: Text -> Text -> Integer -> ClientM NoContent
namespacesSetOffloadDeletionLag = client (Proxy :: Proxy NamespacesSetOffloadDeletionLagAPI)
-- ^

type NamespacesSetOffloadPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "offloadPolicies" :> ReqBody '[JSON] OffloadPoliciesImpl :> Verb 'POST 200 '[JSON] NoContent

namespacesSetOffloadPolicies :: Text -> Text -> OffloadPoliciesImpl -> ClientM NoContent
namespacesSetOffloadPolicies = client (Proxy :: Proxy NamespacesSetOffloadPoliciesAPI)
-- ^ -1 will revert to using the cluster default. A negative value disables automatic offloading.

type NamespacesSetOffloadThresholdAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "offloadThreshold" :> ReqBody '[JSON] Integer :> Verb 'PUT 200 '[JSON] NoContent

namespacesSetOffloadThreshold :: Text -> Text -> Integer -> ClientM NoContent
namespacesSetOffloadThreshold = client (Proxy :: Proxy NamespacesSetOffloadThresholdAPI)
-- ^

type NamespacesSetPersistenceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "persistence" :> ReqBody '[JSON] PersistencePolicies :> Verb 'POST 200 '[JSON] NoContent

namespacesSetPersistence :: Text -> Text -> PersistencePolicies -> ClientM NoContent
namespacesSetPersistence = client (Proxy :: Proxy NamespacesSetPersistenceAPI)
-- ^

type NamespacesSetPropertiesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "properties" :> ReqBody '[JSON] (Map.Map String Text) :> Verb 'PUT 200 '[JSON] NoContent

namespacesSetProperties :: Text -> Text -> (Map.Map String Text) -> ClientM NoContent
namespacesSetProperties = client (Proxy :: Proxy NamespacesSetPropertiesAPI)
-- ^

type NamespacesSetPropertyAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "property" :> Capture "key" Text :> Capture "value" Text :> Verb 'PUT 200 '[JSON] NoContent

namespacesSetProperty :: Text -> Text -> Text -> Text -> ClientM NoContent
namespacesSetProperty = client (Proxy :: Proxy NamespacesSetPropertyAPI)
-- ^

type NamespacesSetReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "replicatorDispatchRate" :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

namespacesSetReplicatorDispatchRate :: Text -> Text -> DispatchRateImpl -> ClientM NoContent
namespacesSetReplicatorDispatchRate = client (Proxy :: Proxy NamespacesSetReplicatorDispatchRateAPI)
-- ^

type NamespacesSetRetentionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "retention" :> ReqBody '[JSON] RetentionPolicies :> Verb 'POST 200 '[JSON] NoContent

namespacesSetRetention :: Text -> Text -> RetentionPolicies -> ClientM NoContent
namespacesSetRetention = client (Proxy :: Proxy NamespacesSetRetentionAPI)
-- ^ The value AutoUpdateDisabled prevents producers from updating the schema.  If set to AutoUpdateDisabled, schemas must be updated through the REST api

type NamespacesSetSchemaAutoUpdateCompatibilityStrategyAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "schemaAutoUpdateCompatibilityStrategy" :> ReqBody '[JSON] Text :> Verb 'PUT 200 '[JSON] NoContent

namespacesSetSchemaAutoUpdateCompatibilityStrategy :: Text -> Text -> Text -> ClientM NoContent
namespacesSetSchemaAutoUpdateCompatibilityStrategy = client (Proxy :: Proxy NamespacesSetSchemaAutoUpdateCompatibilityStrategyAPI)
-- ^

type NamespacesSetSchemaCompatibilityStrategyAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "schemaCompatibilityStrategy" :> ReqBody '[JSON] Text :> Verb 'PUT 200 '[JSON] NoContent

namespacesSetSchemaCompatibilityStrategy :: Text -> Text -> Text -> ClientM NoContent
namespacesSetSchemaCompatibilityStrategy = client (Proxy :: Proxy NamespacesSetSchemaCompatibilityStrategyAPI)
-- ^ If the flag is set to true, when a producer without a schema attempts to produce to a topic with schema in this namespace, the producer will be failed to connect. PLEASE be carefully on using this, since non-java clients don't support schema.if you enable this setting, it will cause non-java clients failed to produce.

type NamespacesSetSchemaValidtionEnforcedAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "schemaValidationEnforced" :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

namespacesSetSchemaValidtionEnforced :: Text -> Text -> Bool -> ClientM NoContent
namespacesSetSchemaValidtionEnforced = client (Proxy :: Proxy NamespacesSetSchemaValidtionEnforcedAPI)
-- ^

type NamespacesSetSubscribeRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscribeRate" :> ReqBody '[JSON] SubscribeRate :> Verb 'POST 200 '[JSON] NoContent

namespacesSetSubscribeRate :: Text -> Text -> SubscribeRate -> ClientM NoContent
namespacesSetSubscribeRate = client (Proxy :: Proxy NamespacesSetSubscribeRateAPI)
-- ^

type NamespacesSetSubscriptionAuthModeAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionAuthMode" :> ReqBody '[JSON] Text :> Verb 'POST 200 '[JSON] NoContent

namespacesSetSubscriptionAuthMode :: Text -> Text -> Text -> ClientM NoContent
namespacesSetSubscriptionAuthMode = client (Proxy :: Proxy NamespacesSetSubscriptionAuthModeAPI)
-- ^

type NamespacesSetSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionDispatchRate" :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

namespacesSetSubscriptionDispatchRate :: Text -> Text -> DispatchRateImpl -> ClientM NoContent
namespacesSetSubscriptionDispatchRate = client (Proxy :: Proxy NamespacesSetSubscriptionDispatchRateAPI)
-- ^

type NamespacesSetSubscriptionExpirationTimeAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionExpirationTime" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

namespacesSetSubscriptionExpirationTime :: Text -> Text -> Int -> ClientM NoContent
namespacesSetSubscriptionExpirationTime = client (Proxy :: Proxy NamespacesSetSubscriptionExpirationTimeAPI)
-- ^

type NamespacesSetSubscriptionTypesEnabledAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionTypesEnabled" :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

namespacesSetSubscriptionTypesEnabled :: Text -> Text -> [Text] -> ClientM NoContent
namespacesSetSubscriptionTypesEnabled = client (Proxy :: Proxy NamespacesSetSubscriptionTypesEnabledAPI)
-- ^

type NamespacesSplitNamespaceBundleAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> "split" :> QueryParam "authoritative" Bool :> QueryParam "unload" Bool :> QueryParam "splitAlgorithmName" Text :> Verb 'PUT 200 '[JSON] NoContent

namespacesSplitNamespaceBundle :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> ClientM NoContent
namespacesSplitNamespaceBundle = client (Proxy :: Proxy NamespacesSplitNamespaceBundleAPI)
-- ^ Unload an active namespace from the current broker serving it. Performing this operation will let the brokerremoves all producers, consumers, and connections using this namespace, and close all topics (includingtheir persistent store). During that operation, the namespace is marked as tentatively unavailable until thebroker completes the unloading action. This operation requires strictly super user privileges, since it wouldresult in non-persistent message loss and unexpected connection closure to the clients.

type NamespacesUnloadNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "unload" :> Verb 'PUT 200 '[JSON] NoContent

namespacesUnloadNamespace :: Text -> Text -> ClientM NoContent
namespacesUnloadNamespace = client (Proxy :: Proxy NamespacesUnloadNamespaceAPI)
-- ^

type NamespacesUnloadNamespaceBundleAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> "unload" :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

namespacesUnloadNamespaceBundle :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
namespacesUnloadNamespaceBundle = client (Proxy :: Proxy NamespacesUnloadNamespaceBundleAPI)
-- ^

type NamespacesUnsubscribeNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "unsubscribe" :> Capture "subscription" Text :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

namespacesUnsubscribeNamespace :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
namespacesUnsubscribeNamespace = client (Proxy :: Proxy NamespacesUnsubscribeNamespaceAPI)
-- ^

type NamespacesUnsubscribeNamespaceBundleAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> "unsubscribe" :> Capture "subscription" Text :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

namespacesUnsubscribeNamespaceBundle :: Text -> Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
namespacesUnsubscribeNamespaceBundle = client (Proxy :: Proxy NamespacesUnsubscribeNamespaceBundleAPI)
-- ^

type NonPersistentCompactAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compaction" :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

nonPersistentCompact :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentCompact = client (Proxy :: Proxy NonPersistentCompactAPI)
-- ^

type NonPersistentCompactionStatusAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compaction" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] LongRunningProcessStatus

nonPersistentCompactionStatus :: Text -> Text -> Text -> Maybe Bool -> ClientM LongRunningProcessStatus
nonPersistentCompactionStatus = client (Proxy :: Proxy NonPersistentCompactionStatusAPI)
-- ^

type NonPersistentCreateMissedPartitionsAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "createMissedPartitions" :> Verb 'POST 200 '[JSON] NoContent

nonPersistentCreateMissedPartitions :: Text -> Text -> Text -> ClientM NoContent
nonPersistentCreateMissedPartitions = client (Proxy :: Proxy NonPersistentCreateMissedPartitionsAPI)
-- ^ This is the only REST endpoint from which non-partitioned topics could be created.

type NonPersistentCreateNonPartitionedTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

nonPersistentCreateNonPartitionedTopic :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentCreateNonPartitionedTopic = client (Proxy :: Proxy NonPersistentCreateNonPartitionedTopicAPI)
-- ^ It needs to be called before creating a producer on a partitioned topic.

type NonPersistentCreatePartitionedTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "createLocalTopicOnly" Bool :> ReqBody '[JSON] Int :> Verb 'PUT 200 '[JSON] NoContent

nonPersistentCreatePartitionedTopic :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
nonPersistentCreatePartitionedTopic = client (Proxy :: Proxy NonPersistentCreatePartitionedTopicAPI)
-- ^ Creates a subscription on the topic at the specified message id

type NonPersistentCreateSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subscriptionName" Text :> QueryParam "authoritative" Bool :> QueryParam "replicated" Bool :> ReqBody '[JSON] MessageIdImpl :> Verb 'PUT 200 '[JSON] NoContent

nonPersistentCreateSubscription :: Text -> Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> MessageIdImpl -> ClientM NoContent
nonPersistentCreateSubscription = client (Proxy :: Proxy NonPersistentCreateSubscriptionAPI)
-- ^

type NonPersistentDeleteDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationSnapshotInterval" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentDeleteDeduplicationSnapshotInterval :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentDeleteDeduplicationSnapshotInterval = client (Proxy :: Proxy NonPersistentDeleteDeduplicationSnapshotIntervalAPI)
-- ^

type NonPersistentDeleteDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "delayedDelivery" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentDeleteDelayedDeliveryPolicies :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentDeleteDelayedDeliveryPolicies = client (Proxy :: Proxy NonPersistentDeleteDelayedDeliveryPoliciesAPI)
-- ^

type NonPersistentDeleteInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "inactiveTopicPolicies" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentDeleteInactiveTopicPolicies :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentDeleteInactiveTopicPolicies = client (Proxy :: Proxy NonPersistentDeleteInactiveTopicPoliciesAPI)
-- ^

type NonPersistentDeleteMaxUnackedMessagesOnConsumerAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnConsumer" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentDeleteMaxUnackedMessagesOnConsumer :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentDeleteMaxUnackedMessagesOnConsumer = client (Proxy :: Proxy NonPersistentDeleteMaxUnackedMessagesOnConsumerAPI)
-- ^

type NonPersistentDeleteMaxUnackedMessagesOnSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnSubscription" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentDeleteMaxUnackedMessagesOnSubscription :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentDeleteMaxUnackedMessagesOnSubscription = client (Proxy :: Proxy NonPersistentDeleteMaxUnackedMessagesOnSubscriptionAPI)
-- ^ It will also delete all the partitions of the topic if it exists.

type NonPersistentDeletePartitionedTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> QueryParam "deleteSchema" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentDeletePartitionedTopic :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentDeletePartitionedTopic = client (Proxy :: Proxy NonPersistentDeletePartitionedTopicAPI)
-- ^ The subscription cannot be deleted if delete is not forcefully and there are any active consumers attached to it. Force delete ignores connected consumers and deletes subscription by explicitly closing them.

type NonPersistentDeleteSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentDeleteSubscription :: Text -> Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentDeleteSubscription = client (Proxy :: Proxy NonPersistentDeleteSubscriptionAPI)
-- ^ The topic cannot be deleted if delete is not forcefully and there's any active subscription or producer connected to the it. Force delete ignores connected clients and deletes topic by explicitly closing them.

type NonPersistentDeleteTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> QueryParam "deleteSchema" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentDeleteTopic :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentDeleteTopic = client (Proxy :: Proxy NonPersistentDeleteTopicAPI)
-- ^

type NonPersistentExamineMessageAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "examinemessage" :> QueryParam "initialPosition" Text :> QueryParam "messagePosition" Integer :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentExamineMessage :: Text -> Text -> Text -> Maybe Text -> Maybe Integer -> Maybe Bool -> ClientM NoContent
nonPersistentExamineMessage = client (Proxy :: Proxy NonPersistentExamineMessageAPI)
-- ^

type NonPersistentExpireMessagesForAllSubscriptionsAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "all_subscription" :> "expireMessages" :> Capture "expireTimeInSeconds" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

nonPersistentExpireMessagesForAllSubscriptions :: Text -> Text -> Text -> Int -> Maybe Bool -> ClientM NoContent
nonPersistentExpireMessagesForAllSubscriptions = client (Proxy :: Proxy NonPersistentExpireMessagesForAllSubscriptionsAPI)
-- ^

type NonPersistentExpireTopicMessagesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "expireMessages" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] ResetCursorData :> Verb 'POST 200 '[JSON] NoContent

nonPersistentExpireTopicMessages :: Text -> Text -> Text -> Text -> Maybe Bool -> ResetCursorData -> ClientM NoContent
nonPersistentExpireTopicMessages = client (Proxy :: Proxy NonPersistentExpireTopicMessagesAPI)
-- ^

type NonPersistentExpireTopicMessagesInSecondsAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "expireMessages" :> Capture "expireTimeInSeconds" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

nonPersistentExpireTopicMessagesInSeconds :: Text -> Text -> Text -> Text -> Int -> Maybe Bool -> ClientM NoContent
nonPersistentExpireTopicMessagesInSeconds = client (Proxy :: Proxy NonPersistentExpireTopicMessagesInSecondsAPI)
-- ^

type NonPersistentGetBacklogAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlog" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] PersistentOfflineTopicStats

nonPersistentGetBacklog :: Text -> Text -> Text -> Maybe Bool -> ClientM PersistentOfflineTopicStats
nonPersistentGetBacklog = client (Proxy :: Proxy NonPersistentGetBacklogAPI)
-- ^

type NonPersistentGetBacklogQuotaMapAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlogQuotaMap" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetBacklogQuotaMap :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetBacklogQuotaMap = client (Proxy :: Proxy NonPersistentGetBacklogQuotaMapAPI)
-- ^

type NonPersistentGetCompactionThresholdAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compactionThreshold" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetCompactionThreshold :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetCompactionThreshold = client (Proxy :: Proxy NonPersistentGetCompactionThresholdAPI)
-- ^

type NonPersistentGetDeduplicationAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationEnabled" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetDeduplication :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetDeduplication = client (Proxy :: Proxy NonPersistentGetDeduplicationAPI)
-- ^

type NonPersistentGetDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationSnapshotInterval" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetDeduplicationSnapshotInterval :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentGetDeduplicationSnapshotInterval = client (Proxy :: Proxy NonPersistentGetDeduplicationSnapshotIntervalAPI)
-- ^

type NonPersistentGetDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "delayedDelivery" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetDelayedDeliveryPolicies :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetDelayedDeliveryPolicies = client (Proxy :: Proxy NonPersistentGetDelayedDeliveryPoliciesAPI)
-- ^

type NonPersistentGetDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "dispatchRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetDispatchRate :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetDispatchRate = client (Proxy :: Proxy NonPersistentGetDispatchRateAPI)
-- ^

type NonPersistentGetInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "inactiveTopicPolicies" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetInactiveTopicPolicies :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetInactiveTopicPolicies = client (Proxy :: Proxy NonPersistentGetInactiveTopicPoliciesAPI)
-- ^

type NonPersistentGetInternalStatsAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "internalStats" :> QueryParam "authoritative" Bool :> QueryParam "metadata" Bool :> Verb 'GET 200 '[JSON] PersistentTopicInternalStats

nonPersistentGetInternalStats :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM PersistentTopicInternalStats
nonPersistentGetInternalStats = client (Proxy :: Proxy NonPersistentGetInternalStatsAPI)
-- ^

type NonPersistentGetLastMessageIdAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "lastMessageId" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetLastMessageId :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentGetLastMessageId = client (Proxy :: Proxy NonPersistentGetLastMessageIdAPI)
-- ^

type NonPersistentGetListAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Verb 'GET 200 '[JSON] [Text]

nonPersistentGetList :: Text -> Text -> ClientM [Text]
nonPersistentGetList = client (Proxy :: Proxy NonPersistentGetListAPI)
-- ^

type NonPersistentGetListFromBundleAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> Verb 'GET 200 '[JSON] [Text]

nonPersistentGetListFromBundle :: Text -> Text -> Text -> ClientM [Text]
nonPersistentGetListFromBundle = client (Proxy :: Proxy NonPersistentGetListFromBundleAPI)
-- ^

type NonPersistentGetManagedLedgerInfoAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "internal-info" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetManagedLedgerInfo :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentGetManagedLedgerInfo = client (Proxy :: Proxy NonPersistentGetManagedLedgerInfoAPI)
-- ^

type NonPersistentGetMaxConsumersAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumers" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetMaxConsumers :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetMaxConsumers = client (Proxy :: Proxy NonPersistentGetMaxConsumersAPI)
-- ^

type NonPersistentGetMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumersPerSubscription" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetMaxConsumersPerSubscription :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentGetMaxConsumersPerSubscription = client (Proxy :: Proxy NonPersistentGetMaxConsumersPerSubscriptionAPI)
-- ^

type NonPersistentGetMaxMessageSizeAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxMessageSize" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetMaxMessageSize :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentGetMaxMessageSize = client (Proxy :: Proxy NonPersistentGetMaxMessageSizeAPI)
-- ^

type NonPersistentGetMaxProducersAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxProducers" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetMaxProducers :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetMaxProducers = client (Proxy :: Proxy NonPersistentGetMaxProducersAPI)
-- ^

type NonPersistentGetMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxSubscriptionsPerTopic" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetMaxSubscriptionsPerTopic :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentGetMaxSubscriptionsPerTopic = client (Proxy :: Proxy NonPersistentGetMaxSubscriptionsPerTopicAPI)
-- ^

type NonPersistentGetMaxUnackedMessagesOnConsumerAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnConsumer" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetMaxUnackedMessagesOnConsumer :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetMaxUnackedMessagesOnConsumer = client (Proxy :: Proxy NonPersistentGetMaxUnackedMessagesOnConsumerAPI)
-- ^

type NonPersistentGetMaxUnackedMessagesOnSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnSubscription" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetMaxUnackedMessagesOnSubscription :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetMaxUnackedMessagesOnSubscription = client (Proxy :: Proxy NonPersistentGetMaxUnackedMessagesOnSubscriptionAPI)
-- ^

type NonPersistentGetMessageByIdAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "ledger" :> Capture "ledgerId" Integer :> "entry" :> Capture "entryId" Integer :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetMessageById :: Text -> Text -> Text -> Integer -> Integer -> Maybe Bool -> ClientM NoContent
nonPersistentGetMessageById = client (Proxy :: Proxy NonPersistentGetMessageByIdAPI)
-- ^

type NonPersistentGetMessageIdByTimestampAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageid" :> Capture "timestamp" Integer :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetMessageIdByTimestamp :: Text -> Text -> Text -> Integer -> Maybe Bool -> ClientM NoContent
nonPersistentGetMessageIdByTimestamp = client (Proxy :: Proxy NonPersistentGetMessageIdByTimestampAPI)
-- ^

type NonPersistentGetMessageTTLAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageTTL" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetMessageTTL :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetMessageTTL = client (Proxy :: Proxy NonPersistentGetMessageTTLAPI)
-- ^

type NonPersistentGetOffloadPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offloadPolicies" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetOffloadPolicies :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetOffloadPolicies = client (Proxy :: Proxy NonPersistentGetOffloadPoliciesAPI)
-- ^

type NonPersistentGetPartitionedMetadataAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "authoritative" Bool :> QueryParam "checkAllowAutoCreation" Bool :> Verb 'GET 200 '[JSON] PartitionedTopicMetadata

nonPersistentGetPartitionedMetadata :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM PartitionedTopicMetadata
nonPersistentGetPartitionedMetadata = client (Proxy :: Proxy NonPersistentGetPartitionedMetadataAPI)
-- ^

type NonPersistentGetPartitionedStatsAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitioned-stats" :> QueryParam "perPartition" Bool :> QueryParam "authoritative" Bool :> QueryParam "getPreciseBacklog" Bool :> QueryParam "subscriptionBacklogSize" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetPartitionedStats :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetPartitionedStats = client (Proxy :: Proxy NonPersistentGetPartitionedStatsAPI)
-- ^

type NonPersistentGetPartitionedTopicListAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> "partitioned" :> Verb 'GET 200 '[JSON] [Text]

nonPersistentGetPartitionedTopicList :: Text -> Text -> ClientM [Text]
nonPersistentGetPartitionedTopicList = client (Proxy :: Proxy NonPersistentGetPartitionedTopicListAPI)
-- ^ Retrieve the effective permissions for a topic. These permissions are defined by the permissions set at thenamespace level combined (union) with any eventual specific permission set on the topic.

type NonPersistentGetPermissionsOnTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "permissions" :> Verb 'GET 200 '[JSON] ((Map.Map String [Text]))

nonPersistentGetPermissionsOnTopic :: Text -> Text -> Text -> ClientM ((Map.Map String [Text]))
nonPersistentGetPermissionsOnTopic = client (Proxy :: Proxy NonPersistentGetPermissionsOnTopicAPI)
-- ^

type NonPersistentGetPersistenceAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "persistence" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetPersistence :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetPersistence = client (Proxy :: Proxy NonPersistentGetPersistenceAPI)
-- ^

type NonPersistentGetPublishRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "publishRate" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetPublishRate :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentGetPublishRate = client (Proxy :: Proxy NonPersistentGetPublishRateAPI)
-- ^

type NonPersistentGetReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "replicatorDispatchRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetReplicatorDispatchRate :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetReplicatorDispatchRate = client (Proxy :: Proxy NonPersistentGetReplicatorDispatchRateAPI)
-- ^

type NonPersistentGetRetentionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "retention" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetRetention :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetRetention = client (Proxy :: Proxy NonPersistentGetRetentionAPI)
-- ^

type NonPersistentGetStatsAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "stats" :> QueryParam "authoritative" Bool :> QueryParam "getPreciseBacklog" Bool :> QueryParam "subscriptionBacklogSize" Bool :> Verb 'GET 200 '[JSON] NonPersistentTopicStats

nonPersistentGetStats :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> Maybe Bool -> ClientM NonPersistentTopicStats
nonPersistentGetStats = client (Proxy :: Proxy NonPersistentGetStatsAPI)
-- ^

type NonPersistentGetSubscribeRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscribeRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetSubscribeRate :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetSubscribeRate = client (Proxy :: Proxy NonPersistentGetSubscribeRateAPI)
-- ^

type NonPersistentGetSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionDispatchRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetSubscriptionDispatchRate :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
nonPersistentGetSubscriptionDispatchRate = client (Proxy :: Proxy NonPersistentGetSubscriptionDispatchRateAPI)
-- ^

type NonPersistentGetSubscriptionTypesEnabledAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionTypesEnabled" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetSubscriptionTypesEnabled :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentGetSubscriptionTypesEnabled = client (Proxy :: Proxy NonPersistentGetSubscriptionTypesEnabledAPI)
-- ^

type NonPersistentGetSubscriptionsAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptions" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentGetSubscriptions :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentGetSubscriptions = client (Proxy :: Proxy NonPersistentGetSubscriptionsAPI)
-- ^

type NonPersistentGrantPermissionsOnTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "permissions" :> Capture "role" Text :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

nonPersistentGrantPermissionsOnTopic :: Text -> Text -> Text -> Text -> [Text] -> ClientM NoContent
nonPersistentGrantPermissionsOnTopic = client (Proxy :: Proxy NonPersistentGrantPermissionsOnTopicAPI)
-- ^

type NonPersistentOffloadStatusAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offload" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] OffloadProcessStatus

nonPersistentOffloadStatus :: Text -> Text -> Text -> Maybe Bool -> ClientM OffloadProcessStatus
nonPersistentOffloadStatus = client (Proxy :: Proxy NonPersistentOffloadStatusAPI)
-- ^

type NonPersistentPeekNthMessageAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "position" :> Capture "messagePosition" Int :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

nonPersistentPeekNthMessage :: Text -> Text -> Text -> Text -> Int -> Maybe Bool -> ClientM NoContent
nonPersistentPeekNthMessage = client (Proxy :: Proxy NonPersistentPeekNthMessageAPI)
-- ^

type NonPersistentRemoveBacklogQuotaAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlogQuota" :> QueryParam "backlogQuotaType" Text :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemoveBacklogQuota :: Text -> Text -> Text -> Maybe Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemoveBacklogQuota = client (Proxy :: Proxy NonPersistentRemoveBacklogQuotaAPI)
-- ^

type NonPersistentRemoveCompactionThresholdAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compactionThreshold" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemoveCompactionThreshold :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemoveCompactionThreshold = client (Proxy :: Proxy NonPersistentRemoveCompactionThresholdAPI)
-- ^

type NonPersistentRemoveDeduplicationAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationEnabled" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemoveDeduplication :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemoveDeduplication = client (Proxy :: Proxy NonPersistentRemoveDeduplicationAPI)
-- ^

type NonPersistentRemoveDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "dispatchRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemoveDispatchRate :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemoveDispatchRate = client (Proxy :: Proxy NonPersistentRemoveDispatchRateAPI)
-- ^

type NonPersistentRemoveMaxConsumersAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumers" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemoveMaxConsumers :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemoveMaxConsumers = client (Proxy :: Proxy NonPersistentRemoveMaxConsumersAPI)
-- ^

type NonPersistentRemoveMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumersPerSubscription" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemoveMaxConsumersPerSubscription :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemoveMaxConsumersPerSubscription = client (Proxy :: Proxy NonPersistentRemoveMaxConsumersPerSubscriptionAPI)
-- ^

type NonPersistentRemoveMaxMessageSizeAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxMessageSize" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemoveMaxMessageSize :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemoveMaxMessageSize = client (Proxy :: Proxy NonPersistentRemoveMaxMessageSizeAPI)
-- ^

type NonPersistentRemoveMaxProducersAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxProducers" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemoveMaxProducers :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemoveMaxProducers = client (Proxy :: Proxy NonPersistentRemoveMaxProducersAPI)
-- ^

type NonPersistentRemoveMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxSubscriptionsPerTopic" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemoveMaxSubscriptionsPerTopic :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemoveMaxSubscriptionsPerTopic = client (Proxy :: Proxy NonPersistentRemoveMaxSubscriptionsPerTopicAPI)
-- ^

type NonPersistentRemoveMessageTTLAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageTTL" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemoveMessageTTL :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemoveMessageTTL = client (Proxy :: Proxy NonPersistentRemoveMessageTTLAPI)
-- ^

type NonPersistentRemoveOffloadPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offloadPolicies" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemoveOffloadPolicies :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemoveOffloadPolicies = client (Proxy :: Proxy NonPersistentRemoveOffloadPoliciesAPI)
-- ^

type NonPersistentRemovePersistenceAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "persistence" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemovePersistence :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemovePersistence = client (Proxy :: Proxy NonPersistentRemovePersistenceAPI)
-- ^

type NonPersistentRemovePublishRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "publishRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemovePublishRate :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemovePublishRate = client (Proxy :: Proxy NonPersistentRemovePublishRateAPI)
-- ^

type NonPersistentRemoveReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "replicatorDispatchRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemoveReplicatorDispatchRate :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemoveReplicatorDispatchRate = client (Proxy :: Proxy NonPersistentRemoveReplicatorDispatchRateAPI)
-- ^

type NonPersistentRemoveRetentionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "retention" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemoveRetention :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemoveRetention = client (Proxy :: Proxy NonPersistentRemoveRetentionAPI)
-- ^

type NonPersistentRemoveSubscribeRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscribeRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] SubscribeRate :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemoveSubscribeRate :: Text -> Text -> Text -> Maybe Bool -> SubscribeRate -> ClientM NoContent
nonPersistentRemoveSubscribeRate = client (Proxy :: Proxy NonPersistentRemoveSubscribeRateAPI)
-- ^

type NonPersistentRemoveSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionDispatchRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRemoveSubscriptionDispatchRate :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentRemoveSubscriptionDispatchRate = client (Proxy :: Proxy NonPersistentRemoveSubscriptionDispatchRateAPI)
-- ^ It fence cursor and disconnects all active consumers before reseting cursor.

type NonPersistentResetCursorAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "resetcursor" :> Capture "timestamp" Integer :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

nonPersistentResetCursor :: Text -> Text -> Text -> Text -> Integer -> Maybe Bool -> ClientM NoContent
nonPersistentResetCursor = client (Proxy :: Proxy NonPersistentResetCursorAPI)
-- ^ It fence cursor and disconnects all active consumers before reseting cursor.

type NonPersistentResetCursorOnPositionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "resetcursor" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] ResetCursorData :> Verb 'POST 200 '[JSON] NoContent

nonPersistentResetCursorOnPosition :: Text -> Text -> Text -> Text -> Maybe Bool -> ResetCursorData -> ClientM NoContent
nonPersistentResetCursorOnPosition = client (Proxy :: Proxy NonPersistentResetCursorOnPositionAPI)
-- ^ Revoke permissions to a role on a single topic. If the permission was not set at the topiclevel, but rather at the namespace level, this operation will return an error (HTTP status code 412).

type NonPersistentRevokePermissionsOnTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "permissions" :> Capture "role" Text :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentRevokePermissionsOnTopic :: Text -> Text -> Text -> Text -> ClientM NoContent
nonPersistentRevokePermissionsOnTopic = client (Proxy :: Proxy NonPersistentRevokePermissionsOnTopicAPI)
-- ^

type NonPersistentSetBacklogQuotaAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlogQuota" :> QueryParam "authoritative" Bool :> QueryParam "backlogQuotaType" Text :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetBacklogQuota :: Text -> Text -> Text -> Maybe Bool -> Maybe Text -> ClientM NoContent
nonPersistentSetBacklogQuota = client (Proxy :: Proxy NonPersistentSetBacklogQuotaAPI)
-- ^

type NonPersistentSetCompactionThresholdAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compactionThreshold" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Integer :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetCompactionThreshold :: Text -> Text -> Text -> Maybe Bool -> Integer -> ClientM NoContent
nonPersistentSetCompactionThreshold = client (Proxy :: Proxy NonPersistentSetCompactionThresholdAPI)
-- ^

type NonPersistentSetDeduplicationAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationEnabled" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetDeduplication :: Text -> Text -> Text -> Maybe Bool -> Bool -> ClientM NoContent
nonPersistentSetDeduplication = client (Proxy :: Proxy NonPersistentSetDeduplicationAPI)
-- ^

type NonPersistentSetDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationSnapshotInterval" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetDeduplicationSnapshotInterval :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
nonPersistentSetDeduplicationSnapshotInterval = client (Proxy :: Proxy NonPersistentSetDeduplicationSnapshotIntervalAPI)
-- ^

type NonPersistentSetDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "delayedDelivery" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DelayedDeliveryPolicies :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetDelayedDeliveryPolicies :: Text -> Text -> Text -> Maybe Bool -> DelayedDeliveryPolicies -> ClientM NoContent
nonPersistentSetDelayedDeliveryPolicies = client (Proxy :: Proxy NonPersistentSetDelayedDeliveryPoliciesAPI)
-- ^

type NonPersistentSetDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "dispatchRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetDispatchRate :: Text -> Text -> Text -> Maybe Bool -> DispatchRateImpl -> ClientM NoContent
nonPersistentSetDispatchRate = client (Proxy :: Proxy NonPersistentSetDispatchRateAPI)
-- ^

type NonPersistentSetInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "inactiveTopicPolicies" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] InactiveTopicPolicies :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetInactiveTopicPolicies :: Text -> Text -> Text -> Maybe Bool -> InactiveTopicPolicies -> ClientM NoContent
nonPersistentSetInactiveTopicPolicies = client (Proxy :: Proxy NonPersistentSetInactiveTopicPoliciesAPI)
-- ^

type NonPersistentSetMaxConsumersAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumers" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetMaxConsumers :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
nonPersistentSetMaxConsumers = client (Proxy :: Proxy NonPersistentSetMaxConsumersAPI)
-- ^

type NonPersistentSetMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumersPerSubscription" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetMaxConsumersPerSubscription :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
nonPersistentSetMaxConsumersPerSubscription = client (Proxy :: Proxy NonPersistentSetMaxConsumersPerSubscriptionAPI)
-- ^

type NonPersistentSetMaxMessageSizeAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxMessageSize" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetMaxMessageSize :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
nonPersistentSetMaxMessageSize = client (Proxy :: Proxy NonPersistentSetMaxMessageSizeAPI)
-- ^

type NonPersistentSetMaxProducersAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxProducers" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetMaxProducers :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
nonPersistentSetMaxProducers = client (Proxy :: Proxy NonPersistentSetMaxProducersAPI)
-- ^

type NonPersistentSetMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxSubscriptionsPerTopic" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetMaxSubscriptionsPerTopic :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
nonPersistentSetMaxSubscriptionsPerTopic = client (Proxy :: Proxy NonPersistentSetMaxSubscriptionsPerTopicAPI)
-- ^

type NonPersistentSetMaxUnackedMessagesOnConsumerAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnConsumer" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetMaxUnackedMessagesOnConsumer :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
nonPersistentSetMaxUnackedMessagesOnConsumer = client (Proxy :: Proxy NonPersistentSetMaxUnackedMessagesOnConsumerAPI)
-- ^

type NonPersistentSetMaxUnackedMessagesOnSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnSubscription" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetMaxUnackedMessagesOnSubscription :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
nonPersistentSetMaxUnackedMessagesOnSubscription = client (Proxy :: Proxy NonPersistentSetMaxUnackedMessagesOnSubscriptionAPI)
-- ^

type NonPersistentSetMessageTTLAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageTTL" :> QueryParam "messageTTL" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetMessageTTL :: Text -> Text -> Text -> Maybe Int -> Maybe Bool -> ClientM NoContent
nonPersistentSetMessageTTL = client (Proxy :: Proxy NonPersistentSetMessageTTLAPI)
-- ^

type NonPersistentSetOffloadPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offloadPolicies" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] OffloadPoliciesImpl :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetOffloadPolicies :: Text -> Text -> Text -> Maybe Bool -> OffloadPoliciesImpl -> ClientM NoContent
nonPersistentSetOffloadPolicies = client (Proxy :: Proxy NonPersistentSetOffloadPoliciesAPI)
-- ^

type NonPersistentSetPersistenceAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "persistence" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] PersistencePolicies :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetPersistence :: Text -> Text -> Text -> Maybe Bool -> PersistencePolicies -> ClientM NoContent
nonPersistentSetPersistence = client (Proxy :: Proxy NonPersistentSetPersistenceAPI)
-- ^

type NonPersistentSetPublishRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "publishRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] PublishRate :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetPublishRate :: Text -> Text -> Text -> Maybe Bool -> PublishRate -> ClientM NoContent
nonPersistentSetPublishRate = client (Proxy :: Proxy NonPersistentSetPublishRateAPI)
-- ^

type NonPersistentSetReplicatedSubscriptionStatusAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "replicatedSubscriptionStatus" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetReplicatedSubscriptionStatus :: Text -> Text -> Text -> Text -> Maybe Bool -> Bool -> ClientM NoContent
nonPersistentSetReplicatedSubscriptionStatus = client (Proxy :: Proxy NonPersistentSetReplicatedSubscriptionStatusAPI)
-- ^

type NonPersistentSetReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "replicatorDispatchRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetReplicatorDispatchRate :: Text -> Text -> Text -> Maybe Bool -> DispatchRateImpl -> ClientM NoContent
nonPersistentSetReplicatorDispatchRate = client (Proxy :: Proxy NonPersistentSetReplicatorDispatchRateAPI)
-- ^

type NonPersistentSetRetentionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "retention" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] RetentionPolicies :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetRetention :: Text -> Text -> Text -> Maybe Bool -> RetentionPolicies -> ClientM NoContent
nonPersistentSetRetention = client (Proxy :: Proxy NonPersistentSetRetentionAPI)
-- ^

type NonPersistentSetSubscribeRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscribeRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] SubscribeRate :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetSubscribeRate :: Text -> Text -> Text -> Maybe Bool -> SubscribeRate -> ClientM NoContent
nonPersistentSetSubscribeRate = client (Proxy :: Proxy NonPersistentSetSubscribeRateAPI)
-- ^

type NonPersistentSetSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionDispatchRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetSubscriptionDispatchRate :: Text -> Text -> Text -> Maybe Bool -> DispatchRateImpl -> ClientM NoContent
nonPersistentSetSubscriptionDispatchRate = client (Proxy :: Proxy NonPersistentSetSubscriptionDispatchRateAPI)
-- ^

type NonPersistentSetSubscriptionTypesEnabledAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionTypesEnabled" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSetSubscriptionTypesEnabled :: Text -> Text -> Text -> Maybe Bool -> [Text] -> ClientM NoContent
nonPersistentSetSubscriptionTypesEnabled = client (Proxy :: Proxy NonPersistentSetSubscriptionTypesEnabledAPI)
-- ^ Completely clears the backlog on the subscription.

type NonPersistentSkipAllMessagesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "skip_all" :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSkipAllMessages :: Text -> Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentSkipAllMessages = client (Proxy :: Proxy NonPersistentSkipAllMessagesAPI)
-- ^

type NonPersistentSkipMessagesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "skip" :> Capture "numMessages" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

nonPersistentSkipMessages :: Text -> Text -> Text -> Text -> Int -> Maybe Bool -> ClientM NoContent
nonPersistentSkipMessages = client (Proxy :: Proxy NonPersistentSkipMessagesAPI)
-- ^

type NonPersistentTerminateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "terminate" :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] Value

nonPersistentTerminate :: Text -> Text -> Text -> Maybe Bool -> ClientM Value
nonPersistentTerminate = client (Proxy :: Proxy NonPersistentTerminateAPI)
-- ^

type NonPersistentTerminatePartitionedTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "terminate" :> "partitions" :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

nonPersistentTerminatePartitionedTopic :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentTerminatePartitionedTopic = client (Proxy :: Proxy NonPersistentTerminatePartitionedTopicAPI)
-- ^

type NonPersistentTriggerOffloadAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offload" :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

nonPersistentTriggerOffload :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentTriggerOffload = client (Proxy :: Proxy NonPersistentTriggerOffloadAPI)
-- ^ NonPersistentTopic does not support truncate.

type NonPersistentTruncateTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "truncate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

nonPersistentTruncateTopic :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentTruncateTopic = client (Proxy :: Proxy NonPersistentTruncateTopicAPI)
-- ^

type NonPersistentUnloadTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "unload" :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

nonPersistentUnloadTopic :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
nonPersistentUnloadTopic = client (Proxy :: Proxy NonPersistentUnloadTopicAPI)
-- ^ It only increments partitions of existing non-global partitioned-topic

type NonPersistentUpdatePartitionedTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "updateLocalTopicOnly" Bool :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

nonPersistentUpdatePartitionedTopic :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> Int -> ClientM NoContent
nonPersistentUpdatePartitionedTopic = client (Proxy :: Proxy NonPersistentUpdatePartitionedTopicAPI)
-- ^

type PersistentCompactAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compaction" :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

persistentCompact :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentCompact = client (Proxy :: Proxy PersistentCompactAPI)
-- ^

type PersistentCompactionStatusAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compaction" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] LongRunningProcessStatus

persistentCompactionStatus :: Text -> Text -> Text -> Maybe Bool -> ClientM LongRunningProcessStatus
persistentCompactionStatus = client (Proxy :: Proxy PersistentCompactionStatusAPI)
-- ^

type PersistentCreateMissedPartitionsAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "createMissedPartitions" :> Verb 'POST 200 '[JSON] NoContent

persistentCreateMissedPartitions :: Text -> Text -> Text -> ClientM NoContent
persistentCreateMissedPartitions = client (Proxy :: Proxy PersistentCreateMissedPartitionsAPI)
-- ^ This is the only REST endpoint from which non-partitioned topics could be created.

type PersistentCreateNonPartitionedTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

persistentCreateNonPartitionedTopic :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentCreateNonPartitionedTopic = client (Proxy :: Proxy PersistentCreateNonPartitionedTopicAPI)
-- ^ It needs to be called before creating a producer on a partitioned topic.

type PersistentCreatePartitionedTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "createLocalTopicOnly" Bool :> ReqBody '[JSON] Int :> Verb 'PUT 200 '[JSON] NoContent

persistentCreatePartitionedTopic :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
persistentCreatePartitionedTopic = client (Proxy :: Proxy PersistentCreatePartitionedTopicAPI)
-- ^ Creates a subscription on the topic at the specified message id

type PersistentCreateSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subscriptionName" Text :> QueryParam "authoritative" Bool :> QueryParam "replicated" Bool :> ReqBody '[JSON] MessageIdImpl :> Verb 'PUT 200 '[JSON] NoContent

persistentCreateSubscription :: Text -> Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> MessageIdImpl -> ClientM NoContent
persistentCreateSubscription = client (Proxy :: Proxy PersistentCreateSubscriptionAPI)
-- ^

type PersistentDeleteDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationSnapshotInterval" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentDeleteDeduplicationSnapshotInterval :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentDeleteDeduplicationSnapshotInterval = client (Proxy :: Proxy PersistentDeleteDeduplicationSnapshotIntervalAPI)
-- ^

type PersistentDeleteDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "delayedDelivery" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentDeleteDelayedDeliveryPolicies :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentDeleteDelayedDeliveryPolicies = client (Proxy :: Proxy PersistentDeleteDelayedDeliveryPoliciesAPI)
-- ^

type PersistentDeleteInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "inactiveTopicPolicies" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentDeleteInactiveTopicPolicies :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentDeleteInactiveTopicPolicies = client (Proxy :: Proxy PersistentDeleteInactiveTopicPoliciesAPI)
-- ^

type PersistentDeleteMaxUnackedMessagesOnConsumerAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnConsumer" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentDeleteMaxUnackedMessagesOnConsumer :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentDeleteMaxUnackedMessagesOnConsumer = client (Proxy :: Proxy PersistentDeleteMaxUnackedMessagesOnConsumerAPI)
-- ^

type PersistentDeleteMaxUnackedMessagesOnSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnSubscription" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentDeleteMaxUnackedMessagesOnSubscription :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentDeleteMaxUnackedMessagesOnSubscription = client (Proxy :: Proxy PersistentDeleteMaxUnackedMessagesOnSubscriptionAPI)
-- ^ It will also delete all the partitions of the topic if it exists.

type PersistentDeletePartitionedTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> QueryParam "deleteSchema" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentDeletePartitionedTopic :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentDeletePartitionedTopic = client (Proxy :: Proxy PersistentDeletePartitionedTopicAPI)
-- ^ The subscription cannot be deleted if delete is not forcefully and there are any active consumers attached to it. Force delete ignores connected consumers and deletes subscription by explicitly closing them.

type PersistentDeleteSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentDeleteSubscription :: Text -> Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentDeleteSubscription = client (Proxy :: Proxy PersistentDeleteSubscriptionAPI)
-- ^ The topic cannot be deleted if delete is not forcefully and there's any active subscription or producer connected to the it. Force delete ignores connected clients and deletes topic by explicitly closing them.

type PersistentDeleteTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> QueryParam "deleteSchema" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentDeleteTopic :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentDeleteTopic = client (Proxy :: Proxy PersistentDeleteTopicAPI)
-- ^

type PersistentExamineMessageAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "examinemessage" :> QueryParam "initialPosition" Text :> QueryParam "messagePosition" Integer :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentExamineMessage :: Text -> Text -> Text -> Maybe Text -> Maybe Integer -> Maybe Bool -> ClientM NoContent
persistentExamineMessage = client (Proxy :: Proxy PersistentExamineMessageAPI)
-- ^

type PersistentExpireMessagesForAllSubscriptionsAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "all_subscription" :> "expireMessages" :> Capture "expireTimeInSeconds" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

persistentExpireMessagesForAllSubscriptions :: Text -> Text -> Text -> Int -> Maybe Bool -> ClientM NoContent
persistentExpireMessagesForAllSubscriptions = client (Proxy :: Proxy PersistentExpireMessagesForAllSubscriptionsAPI)
-- ^

type PersistentExpireTopicMessagesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "expireMessages" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] ResetCursorData :> Verb 'POST 200 '[JSON] NoContent

persistentExpireTopicMessages :: Text -> Text -> Text -> Text -> Maybe Bool -> ResetCursorData -> ClientM NoContent
persistentExpireTopicMessages = client (Proxy :: Proxy PersistentExpireTopicMessagesAPI)
-- ^

type PersistentExpireTopicMessagesInSecondsAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "expireMessages" :> Capture "expireTimeInSeconds" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

persistentExpireTopicMessagesInSeconds :: Text -> Text -> Text -> Text -> Int -> Maybe Bool -> ClientM NoContent
persistentExpireTopicMessagesInSeconds = client (Proxy :: Proxy PersistentExpireTopicMessagesInSecondsAPI)
-- ^

type PersistentGetBacklogAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlog" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] PersistentOfflineTopicStats

persistentGetBacklog :: Text -> Text -> Text -> Maybe Bool -> ClientM PersistentOfflineTopicStats
persistentGetBacklog = client (Proxy :: Proxy PersistentGetBacklogAPI)
-- ^

type PersistentGetBacklogQuotaMapAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlogQuotaMap" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetBacklogQuotaMap :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetBacklogQuotaMap = client (Proxy :: Proxy PersistentGetBacklogQuotaMapAPI)
-- ^

type PersistentGetCompactionThresholdAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compactionThreshold" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetCompactionThreshold :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetCompactionThreshold = client (Proxy :: Proxy PersistentGetCompactionThresholdAPI)
-- ^

type PersistentGetDeduplicationAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationEnabled" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetDeduplication :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetDeduplication = client (Proxy :: Proxy PersistentGetDeduplicationAPI)
-- ^

type PersistentGetDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationSnapshotInterval" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetDeduplicationSnapshotInterval :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentGetDeduplicationSnapshotInterval = client (Proxy :: Proxy PersistentGetDeduplicationSnapshotIntervalAPI)
-- ^

type PersistentGetDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "delayedDelivery" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetDelayedDeliveryPolicies :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetDelayedDeliveryPolicies = client (Proxy :: Proxy PersistentGetDelayedDeliveryPoliciesAPI)
-- ^

type PersistentGetDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "dispatchRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetDispatchRate :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetDispatchRate = client (Proxy :: Proxy PersistentGetDispatchRateAPI)
-- ^

type PersistentGetInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "inactiveTopicPolicies" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetInactiveTopicPolicies :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetInactiveTopicPolicies = client (Proxy :: Proxy PersistentGetInactiveTopicPoliciesAPI)
-- ^

type PersistentGetInternalStatsAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "internalStats" :> QueryParam "authoritative" Bool :> QueryParam "metadata" Bool :> Verb 'GET 200 '[JSON] PersistentTopicInternalStats

persistentGetInternalStats :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM PersistentTopicInternalStats
persistentGetInternalStats = client (Proxy :: Proxy PersistentGetInternalStatsAPI)
-- ^

type PersistentGetLastMessageIdAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "lastMessageId" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetLastMessageId :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentGetLastMessageId = client (Proxy :: Proxy PersistentGetLastMessageIdAPI)
-- ^

type PersistentGetListAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Verb 'GET 200 '[JSON] [Text]

persistentGetList :: Text -> Text -> ClientM [Text]
persistentGetList = client (Proxy :: Proxy PersistentGetListAPI)
-- ^

type PersistentGetManagedLedgerInfoAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "internal-info" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetManagedLedgerInfo :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentGetManagedLedgerInfo = client (Proxy :: Proxy PersistentGetManagedLedgerInfoAPI)
-- ^

type PersistentGetMaxConsumersAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumers" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetMaxConsumers :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetMaxConsumers = client (Proxy :: Proxy PersistentGetMaxConsumersAPI)
-- ^

type PersistentGetMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumersPerSubscription" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetMaxConsumersPerSubscription :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentGetMaxConsumersPerSubscription = client (Proxy :: Proxy PersistentGetMaxConsumersPerSubscriptionAPI)
-- ^

type PersistentGetMaxMessageSizeAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxMessageSize" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetMaxMessageSize :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentGetMaxMessageSize = client (Proxy :: Proxy PersistentGetMaxMessageSizeAPI)
-- ^

type PersistentGetMaxProducersAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxProducers" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetMaxProducers :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetMaxProducers = client (Proxy :: Proxy PersistentGetMaxProducersAPI)
-- ^

type PersistentGetMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxSubscriptionsPerTopic" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetMaxSubscriptionsPerTopic :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentGetMaxSubscriptionsPerTopic = client (Proxy :: Proxy PersistentGetMaxSubscriptionsPerTopicAPI)
-- ^

type PersistentGetMaxUnackedMessagesOnConsumerAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnConsumer" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetMaxUnackedMessagesOnConsumer :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetMaxUnackedMessagesOnConsumer = client (Proxy :: Proxy PersistentGetMaxUnackedMessagesOnConsumerAPI)
-- ^

type PersistentGetMaxUnackedMessagesOnSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnSubscription" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetMaxUnackedMessagesOnSubscription :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetMaxUnackedMessagesOnSubscription = client (Proxy :: Proxy PersistentGetMaxUnackedMessagesOnSubscriptionAPI)
-- ^

type PersistentGetMessageByIdAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "ledger" :> Capture "ledgerId" Integer :> "entry" :> Capture "entryId" Integer :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetMessageById :: Text -> Text -> Text -> Integer -> Integer -> Maybe Bool -> ClientM NoContent
persistentGetMessageById = client (Proxy :: Proxy PersistentGetMessageByIdAPI)
-- ^

type PersistentGetMessageIdByTimestampAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageid" :> Capture "timestamp" Integer :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetMessageIdByTimestamp :: Text -> Text -> Text -> Integer -> Maybe Bool -> ClientM NoContent
persistentGetMessageIdByTimestamp = client (Proxy :: Proxy PersistentGetMessageIdByTimestampAPI)
-- ^

type PersistentGetMessageTTLAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageTTL" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetMessageTTL :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetMessageTTL = client (Proxy :: Proxy PersistentGetMessageTTLAPI)
-- ^

type PersistentGetOffloadPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offloadPolicies" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetOffloadPolicies :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetOffloadPolicies = client (Proxy :: Proxy PersistentGetOffloadPoliciesAPI)
-- ^

type PersistentGetPartitionedMetadataAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "authoritative" Bool :> QueryParam "checkAllowAutoCreation" Bool :> Verb 'GET 200 '[JSON] PartitionedTopicMetadata

persistentGetPartitionedMetadata :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM PartitionedTopicMetadata
persistentGetPartitionedMetadata = client (Proxy :: Proxy PersistentGetPartitionedMetadataAPI)
-- ^

type PersistentGetPartitionedStatsAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitioned-stats" :> QueryParam "perPartition" Bool :> QueryParam "authoritative" Bool :> QueryParam "getPreciseBacklog" Bool :> QueryParam "subscriptionBacklogSize" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetPartitionedStats :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetPartitionedStats = client (Proxy :: Proxy PersistentGetPartitionedStatsAPI)
-- ^

type PersistentGetPartitionedTopicListAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> "partitioned" :> Verb 'GET 200 '[JSON] [Text]

persistentGetPartitionedTopicList :: Text -> Text -> ClientM [Text]
persistentGetPartitionedTopicList = client (Proxy :: Proxy PersistentGetPartitionedTopicListAPI)
-- ^ Retrieve the effective permissions for a topic. These permissions are defined by the permissions set at thenamespace level combined (union) with any eventual specific permission set on the topic.

type PersistentGetPermissionsOnTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "permissions" :> Verb 'GET 200 '[JSON] ((Map.Map String [Text]))

persistentGetPermissionsOnTopic :: Text -> Text -> Text -> ClientM ((Map.Map String [Text]))
persistentGetPermissionsOnTopic = client (Proxy :: Proxy PersistentGetPermissionsOnTopicAPI)
-- ^

type PersistentGetPersistenceAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "persistence" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetPersistence :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetPersistence = client (Proxy :: Proxy PersistentGetPersistenceAPI)
-- ^

type PersistentGetPublishRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "publishRate" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetPublishRate :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentGetPublishRate = client (Proxy :: Proxy PersistentGetPublishRateAPI)
-- ^

type PersistentGetReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "replicatorDispatchRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetReplicatorDispatchRate :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetReplicatorDispatchRate = client (Proxy :: Proxy PersistentGetReplicatorDispatchRateAPI)
-- ^

type PersistentGetRetentionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "retention" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetRetention :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetRetention = client (Proxy :: Proxy PersistentGetRetentionAPI)
-- ^

type PersistentGetStatsAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "stats" :> QueryParam "authoritative" Bool :> QueryParam "getPreciseBacklog" Bool :> QueryParam "subscriptionBacklogSize" Bool :> Verb 'GET 200 '[JSON] TopicStats

persistentGetStats :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> Maybe Bool -> ClientM TopicStats
persistentGetStats = client (Proxy :: Proxy PersistentGetStatsAPI)
-- ^

type PersistentGetSubscribeRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscribeRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetSubscribeRate :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetSubscribeRate = client (Proxy :: Proxy PersistentGetSubscribeRateAPI)
-- ^

type PersistentGetSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionDispatchRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetSubscriptionDispatchRate :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> ClientM NoContent
persistentGetSubscriptionDispatchRate = client (Proxy :: Proxy PersistentGetSubscriptionDispatchRateAPI)
-- ^

type PersistentGetSubscriptionTypesEnabledAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionTypesEnabled" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetSubscriptionTypesEnabled :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentGetSubscriptionTypesEnabled = client (Proxy :: Proxy PersistentGetSubscriptionTypesEnabledAPI)
-- ^

type PersistentGetSubscriptionsAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptions" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentGetSubscriptions :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentGetSubscriptions = client (Proxy :: Proxy PersistentGetSubscriptionsAPI)
-- ^

type PersistentGrantPermissionsOnTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "permissions" :> Capture "role" Text :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

persistentGrantPermissionsOnTopic :: Text -> Text -> Text -> Text -> [Text] -> ClientM NoContent
persistentGrantPermissionsOnTopic = client (Proxy :: Proxy PersistentGrantPermissionsOnTopicAPI)
-- ^

type PersistentOffloadStatusAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offload" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] OffloadProcessStatus

persistentOffloadStatus :: Text -> Text -> Text -> Maybe Bool -> ClientM OffloadProcessStatus
persistentOffloadStatus = client (Proxy :: Proxy PersistentOffloadStatusAPI)
-- ^

type PersistentPeekNthMessageAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "position" :> Capture "messagePosition" Int :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

persistentPeekNthMessage :: Text -> Text -> Text -> Text -> Int -> Maybe Bool -> ClientM NoContent
persistentPeekNthMessage = client (Proxy :: Proxy PersistentPeekNthMessageAPI)
-- ^

type PersistentRemoveBacklogQuotaAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlogQuota" :> QueryParam "backlogQuotaType" Text :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemoveBacklogQuota :: Text -> Text -> Text -> Maybe Text -> Maybe Bool -> ClientM NoContent
persistentRemoveBacklogQuota = client (Proxy :: Proxy PersistentRemoveBacklogQuotaAPI)
-- ^

type PersistentRemoveCompactionThresholdAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compactionThreshold" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemoveCompactionThreshold :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentRemoveCompactionThreshold = client (Proxy :: Proxy PersistentRemoveCompactionThresholdAPI)
-- ^

type PersistentRemoveDeduplicationAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationEnabled" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemoveDeduplication :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentRemoveDeduplication = client (Proxy :: Proxy PersistentRemoveDeduplicationAPI)
-- ^

type PersistentRemoveDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "dispatchRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemoveDispatchRate :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentRemoveDispatchRate = client (Proxy :: Proxy PersistentRemoveDispatchRateAPI)
-- ^

type PersistentRemoveMaxConsumersAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumers" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemoveMaxConsumers :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentRemoveMaxConsumers = client (Proxy :: Proxy PersistentRemoveMaxConsumersAPI)
-- ^

type PersistentRemoveMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumersPerSubscription" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemoveMaxConsumersPerSubscription :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentRemoveMaxConsumersPerSubscription = client (Proxy :: Proxy PersistentRemoveMaxConsumersPerSubscriptionAPI)
-- ^

type PersistentRemoveMaxMessageSizeAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxMessageSize" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemoveMaxMessageSize :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentRemoveMaxMessageSize = client (Proxy :: Proxy PersistentRemoveMaxMessageSizeAPI)
-- ^

type PersistentRemoveMaxProducersAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxProducers" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemoveMaxProducers :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentRemoveMaxProducers = client (Proxy :: Proxy PersistentRemoveMaxProducersAPI)
-- ^

type PersistentRemoveMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxSubscriptionsPerTopic" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemoveMaxSubscriptionsPerTopic :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentRemoveMaxSubscriptionsPerTopic = client (Proxy :: Proxy PersistentRemoveMaxSubscriptionsPerTopicAPI)
-- ^

type PersistentRemoveMessageTTLAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageTTL" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemoveMessageTTL :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentRemoveMessageTTL = client (Proxy :: Proxy PersistentRemoveMessageTTLAPI)
-- ^

type PersistentRemoveOffloadPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offloadPolicies" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemoveOffloadPolicies :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentRemoveOffloadPolicies = client (Proxy :: Proxy PersistentRemoveOffloadPoliciesAPI)
-- ^

type PersistentRemovePersistenceAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "persistence" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemovePersistence :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentRemovePersistence = client (Proxy :: Proxy PersistentRemovePersistenceAPI)
-- ^

type PersistentRemovePublishRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "publishRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemovePublishRate :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentRemovePublishRate = client (Proxy :: Proxy PersistentRemovePublishRateAPI)
-- ^

type PersistentRemoveReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "replicatorDispatchRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemoveReplicatorDispatchRate :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentRemoveReplicatorDispatchRate = client (Proxy :: Proxy PersistentRemoveReplicatorDispatchRateAPI)
-- ^

type PersistentRemoveRetentionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "retention" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemoveRetention :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentRemoveRetention = client (Proxy :: Proxy PersistentRemoveRetentionAPI)
-- ^

type PersistentRemoveSubscribeRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscribeRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] SubscribeRate :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemoveSubscribeRate :: Text -> Text -> Text -> Maybe Bool -> SubscribeRate -> ClientM NoContent
persistentRemoveSubscribeRate = client (Proxy :: Proxy PersistentRemoveSubscribeRateAPI)
-- ^

type PersistentRemoveSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionDispatchRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentRemoveSubscriptionDispatchRate :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentRemoveSubscriptionDispatchRate = client (Proxy :: Proxy PersistentRemoveSubscriptionDispatchRateAPI)
-- ^ It fence cursor and disconnects all active consumers before reseting cursor.

type PersistentResetCursorAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "resetcursor" :> Capture "timestamp" Integer :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

persistentResetCursor :: Text -> Text -> Text -> Text -> Integer -> Maybe Bool -> ClientM NoContent
persistentResetCursor = client (Proxy :: Proxy PersistentResetCursorAPI)
-- ^ It fence cursor and disconnects all active consumers before reseting cursor.

type PersistentResetCursorOnPositionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "resetcursor" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] ResetCursorData :> Verb 'POST 200 '[JSON] NoContent

persistentResetCursorOnPosition :: Text -> Text -> Text -> Text -> Maybe Bool -> ResetCursorData -> ClientM NoContent
persistentResetCursorOnPosition = client (Proxy :: Proxy PersistentResetCursorOnPositionAPI)
-- ^ Revoke permissions to a role on a single topic. If the permission was not set at the topiclevel, but rather at the namespace level, this operation will return an error (HTTP status code 412).

type PersistentRevokePermissionsOnTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "permissions" :> Capture "role" Text :> Verb 'DELETE 200 '[JSON] NoContent

persistentRevokePermissionsOnTopic :: Text -> Text -> Text -> Text -> ClientM NoContent
persistentRevokePermissionsOnTopic = client (Proxy :: Proxy PersistentRevokePermissionsOnTopicAPI)
-- ^

type PersistentSetBacklogQuotaAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlogQuota" :> QueryParam "authoritative" Bool :> QueryParam "backlogQuotaType" Text :> Verb 'POST 200 '[JSON] NoContent

persistentSetBacklogQuota :: Text -> Text -> Text -> Maybe Bool -> Maybe Text -> ClientM NoContent
persistentSetBacklogQuota = client (Proxy :: Proxy PersistentSetBacklogQuotaAPI)
-- ^

type PersistentSetCompactionThresholdAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compactionThreshold" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Integer :> Verb 'POST 200 '[JSON] NoContent

persistentSetCompactionThreshold :: Text -> Text -> Text -> Maybe Bool -> Integer -> ClientM NoContent
persistentSetCompactionThreshold = client (Proxy :: Proxy PersistentSetCompactionThresholdAPI)
-- ^

type PersistentSetDeduplicationAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationEnabled" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

persistentSetDeduplication :: Text -> Text -> Text -> Maybe Bool -> Bool -> ClientM NoContent
persistentSetDeduplication = client (Proxy :: Proxy PersistentSetDeduplicationAPI)
-- ^

type PersistentSetDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationSnapshotInterval" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

persistentSetDeduplicationSnapshotInterval :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
persistentSetDeduplicationSnapshotInterval = client (Proxy :: Proxy PersistentSetDeduplicationSnapshotIntervalAPI)
-- ^

type PersistentSetDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "delayedDelivery" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DelayedDeliveryPolicies :> Verb 'POST 200 '[JSON] NoContent

persistentSetDelayedDeliveryPolicies :: Text -> Text -> Text -> Maybe Bool -> DelayedDeliveryPolicies -> ClientM NoContent
persistentSetDelayedDeliveryPolicies = client (Proxy :: Proxy PersistentSetDelayedDeliveryPoliciesAPI)
-- ^

type PersistentSetDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "dispatchRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

persistentSetDispatchRate :: Text -> Text -> Text -> Maybe Bool -> DispatchRateImpl -> ClientM NoContent
persistentSetDispatchRate = client (Proxy :: Proxy PersistentSetDispatchRateAPI)
-- ^

type PersistentSetInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "inactiveTopicPolicies" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] InactiveTopicPolicies :> Verb 'POST 200 '[JSON] NoContent

persistentSetInactiveTopicPolicies :: Text -> Text -> Text -> Maybe Bool -> InactiveTopicPolicies -> ClientM NoContent
persistentSetInactiveTopicPolicies = client (Proxy :: Proxy PersistentSetInactiveTopicPoliciesAPI)
-- ^

type PersistentSetMaxConsumersAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumers" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

persistentSetMaxConsumers :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
persistentSetMaxConsumers = client (Proxy :: Proxy PersistentSetMaxConsumersAPI)
-- ^

type PersistentSetMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumersPerSubscription" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

persistentSetMaxConsumersPerSubscription :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
persistentSetMaxConsumersPerSubscription = client (Proxy :: Proxy PersistentSetMaxConsumersPerSubscriptionAPI)
-- ^

type PersistentSetMaxMessageSizeAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxMessageSize" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

persistentSetMaxMessageSize :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
persistentSetMaxMessageSize = client (Proxy :: Proxy PersistentSetMaxMessageSizeAPI)
-- ^

type PersistentSetMaxProducersAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxProducers" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

persistentSetMaxProducers :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
persistentSetMaxProducers = client (Proxy :: Proxy PersistentSetMaxProducersAPI)
-- ^

type PersistentSetMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxSubscriptionsPerTopic" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

persistentSetMaxSubscriptionsPerTopic :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
persistentSetMaxSubscriptionsPerTopic = client (Proxy :: Proxy PersistentSetMaxSubscriptionsPerTopicAPI)
-- ^

type PersistentSetMaxUnackedMessagesOnConsumerAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnConsumer" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

persistentSetMaxUnackedMessagesOnConsumer :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
persistentSetMaxUnackedMessagesOnConsumer = client (Proxy :: Proxy PersistentSetMaxUnackedMessagesOnConsumerAPI)
-- ^

type PersistentSetMaxUnackedMessagesOnSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnSubscription" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

persistentSetMaxUnackedMessagesOnSubscription :: Text -> Text -> Text -> Maybe Bool -> Int -> ClientM NoContent
persistentSetMaxUnackedMessagesOnSubscription = client (Proxy :: Proxy PersistentSetMaxUnackedMessagesOnSubscriptionAPI)
-- ^

type PersistentSetMessageTTLAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageTTL" :> QueryParam "messageTTL" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

persistentSetMessageTTL :: Text -> Text -> Text -> Maybe Int -> Maybe Bool -> ClientM NoContent
persistentSetMessageTTL = client (Proxy :: Proxy PersistentSetMessageTTLAPI)
-- ^

type PersistentSetOffloadPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offloadPolicies" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] OffloadPoliciesImpl :> Verb 'POST 200 '[JSON] NoContent

persistentSetOffloadPolicies :: Text -> Text -> Text -> Maybe Bool -> OffloadPoliciesImpl -> ClientM NoContent
persistentSetOffloadPolicies = client (Proxy :: Proxy PersistentSetOffloadPoliciesAPI)
-- ^

type PersistentSetPersistenceAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "persistence" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] PersistencePolicies :> Verb 'POST 200 '[JSON] NoContent

persistentSetPersistence :: Text -> Text -> Text -> Maybe Bool -> PersistencePolicies -> ClientM NoContent
persistentSetPersistence = client (Proxy :: Proxy PersistentSetPersistenceAPI)
-- ^

type PersistentSetPublishRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "publishRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] PublishRate :> Verb 'POST 200 '[JSON] NoContent

persistentSetPublishRate :: Text -> Text -> Text -> Maybe Bool -> PublishRate -> ClientM NoContent
persistentSetPublishRate = client (Proxy :: Proxy PersistentSetPublishRateAPI)
-- ^

type PersistentSetReplicatedSubscriptionStatusAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "replicatedSubscriptionStatus" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

persistentSetReplicatedSubscriptionStatus :: Text -> Text -> Text -> Text -> Maybe Bool -> Bool -> ClientM NoContent
persistentSetReplicatedSubscriptionStatus = client (Proxy :: Proxy PersistentSetReplicatedSubscriptionStatusAPI)
-- ^

type PersistentSetReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "replicatorDispatchRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

persistentSetReplicatorDispatchRate :: Text -> Text -> Text -> Maybe Bool -> DispatchRateImpl -> ClientM NoContent
persistentSetReplicatorDispatchRate = client (Proxy :: Proxy PersistentSetReplicatorDispatchRateAPI)
-- ^

type PersistentSetRetentionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "retention" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] RetentionPolicies :> Verb 'POST 200 '[JSON] NoContent

persistentSetRetention :: Text -> Text -> Text -> Maybe Bool -> RetentionPolicies -> ClientM NoContent
persistentSetRetention = client (Proxy :: Proxy PersistentSetRetentionAPI)
-- ^

type PersistentSetSubscribeRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscribeRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] SubscribeRate :> Verb 'POST 200 '[JSON] NoContent

persistentSetSubscribeRate :: Text -> Text -> Text -> Maybe Bool -> SubscribeRate -> ClientM NoContent
persistentSetSubscribeRate = client (Proxy :: Proxy PersistentSetSubscribeRateAPI)
-- ^

type PersistentSetSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionDispatchRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

persistentSetSubscriptionDispatchRate :: Text -> Text -> Text -> Maybe Bool -> DispatchRateImpl -> ClientM NoContent
persistentSetSubscriptionDispatchRate = client (Proxy :: Proxy PersistentSetSubscriptionDispatchRateAPI)
-- ^

type PersistentSetSubscriptionTypesEnabledAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionTypesEnabled" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

persistentSetSubscriptionTypesEnabled :: Text -> Text -> Text -> Maybe Bool -> [Text] -> ClientM NoContent
persistentSetSubscriptionTypesEnabled = client (Proxy :: Proxy PersistentSetSubscriptionTypesEnabledAPI)
-- ^ Completely clears the backlog on the subscription.

type PersistentSkipAllMessagesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "skip_all" :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

persistentSkipAllMessages :: Text -> Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentSkipAllMessages = client (Proxy :: Proxy PersistentSkipAllMessagesAPI)
-- ^

type PersistentSkipMessagesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "skip" :> Capture "numMessages" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

persistentSkipMessages :: Text -> Text -> Text -> Text -> Int -> Maybe Bool -> ClientM NoContent
persistentSkipMessages = client (Proxy :: Proxy PersistentSkipMessagesAPI)
-- ^

type PersistentTerminateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "terminate" :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] Value

persistentTerminate :: Text -> Text -> Text -> Maybe Bool -> ClientM Value
persistentTerminate = client (Proxy :: Proxy PersistentTerminateAPI)
-- ^

type PersistentTerminatePartitionedTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "terminate" :> "partitions" :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

persistentTerminatePartitionedTopic :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentTerminatePartitionedTopic = client (Proxy :: Proxy PersistentTerminatePartitionedTopicAPI)
-- ^

type PersistentTriggerOffloadAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offload" :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

persistentTriggerOffload :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentTriggerOffload = client (Proxy :: Proxy PersistentTriggerOffloadAPI)
-- ^ The truncate operation will move all cursors to the end of the topic and delete all inactive ledgers.

type PersistentTruncateTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "truncate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

persistentTruncateTopic :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentTruncateTopic = client (Proxy :: Proxy PersistentTruncateTopicAPI)
-- ^

type PersistentUnloadTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "unload" :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

persistentUnloadTopic :: Text -> Text -> Text -> Maybe Bool -> ClientM NoContent
persistentUnloadTopic = client (Proxy :: Proxy PersistentUnloadTopicAPI)
-- ^ It only increments partitions of existing non-global partitioned-topic

type PersistentUpdatePartitionedTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "updateLocalTopicOnly" Bool :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

persistentUpdatePartitionedTopic :: Text -> Text -> Text -> Maybe Bool -> Maybe Bool -> Int -> ClientM NoContent
persistentUpdatePartitionedTopic = client (Proxy :: Proxy PersistentUpdatePartitionedTopicAPI)
-- ^

type ResourceQuotasGetDefaultResourceQuotaAPI =
  "admin" :> "v2" :> "resource-quotas" :> Verb 'GET 200 '[JSON] [Text]

resourceQuotasGetDefaultResourceQuota :: ClientM [Text]
resourceQuotasGetDefaultResourceQuota = client (Proxy :: Proxy ResourceQuotasGetDefaultResourceQuotaAPI)
-- ^

type ResourceQuotasGetNamespaceBundleResourceQuotaAPI =
  "admin" :> "v2" :> "resource-quotas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> Verb 'GET 200 '[JSON] ResourceQuota

resourceQuotasGetNamespaceBundleResourceQuota :: Text -> Text -> Text -> ClientM ResourceQuota
resourceQuotasGetNamespaceBundleResourceQuota = client (Proxy :: Proxy ResourceQuotasGetNamespaceBundleResourceQuotaAPI)
-- ^

type ResourceQuotasRemoveNamespaceBundleResourceQuotaAPI =
  "admin" :> "v2" :> "resource-quotas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> Verb 'DELETE 200 '[JSON] NoContent

resourceQuotasRemoveNamespaceBundleResourceQuota :: Text -> Text -> Text -> ClientM NoContent
resourceQuotasRemoveNamespaceBundleResourceQuota = client (Proxy :: Proxy ResourceQuotasRemoveNamespaceBundleResourceQuotaAPI)
-- ^

type ResourceQuotasSetDefaultResourceQuotaAPI =
  "admin" :> "v2" :> "resource-quotas" :> ReqBody '[JSON] ResourceQuota :> Verb 'POST 200 '[JSON] [Text]

resourceQuotasSetDefaultResourceQuota :: ResourceQuota -> ClientM [Text]
resourceQuotasSetDefaultResourceQuota = client (Proxy :: Proxy ResourceQuotasSetDefaultResourceQuotaAPI)
-- ^

type ResourceQuotasSetNamespaceBundleResourceQuotaAPI =
  "admin" :> "v2" :> "resource-quotas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> ReqBody '[JSON] ResourceQuota :> Verb 'POST 200 '[JSON] NoContent

resourceQuotasSetNamespaceBundleResourceQuota :: Text -> Text -> Text -> ResourceQuota -> ClientM NoContent
resourceQuotasSetNamespaceBundleResourceQuota = client (Proxy :: Proxy ResourceQuotasSetNamespaceBundleResourceQuotaAPI)
-- ^

type ResourcegroupsCreateOrUpdateResourceGroupAPI =
  "admin" :> "v2" :> "resourcegroups" :> Capture "resourcegroup" Text :> ReqBody '[JSON] ResourceGroup :> Verb 'PUT 200 '[JSON] NoContent

resourcegroupsCreateOrUpdateResourceGroup :: Text -> ResourceGroup -> ClientM NoContent
resourcegroupsCreateOrUpdateResourceGroup = client (Proxy :: Proxy ResourcegroupsCreateOrUpdateResourceGroupAPI)
-- ^

type ResourcegroupsDeleteResourceGroupAPI =
  "admin" :> "v2" :> "resourcegroups" :> Capture "resourcegroup" Text :> Verb 'DELETE 200 '[JSON] NoContent

resourcegroupsDeleteResourceGroup :: Text -> ClientM NoContent
resourcegroupsDeleteResourceGroup = client (Proxy :: Proxy ResourcegroupsDeleteResourceGroupAPI)
-- ^

type ResourcegroupsGetResourceGroupAPI =
  "admin" :> "v2" :> "resourcegroups" :> Capture "resourcegroup" Text :> Verb 'GET 200 '[JSON] ResourceGroup

resourcegroupsGetResourceGroup :: Text -> ClientM ResourceGroup
resourcegroupsGetResourceGroup = client (Proxy :: Proxy ResourcegroupsGetResourceGroupAPI)
-- ^

type ResourcegroupsGetResourceGroupsAPI =
  "admin" :> "v2" :> "resourcegroups" :> Verb 'GET 200 '[JSON] [Text]

resourcegroupsGetResourceGroups :: ClientM [Text]
resourcegroupsGetResourceGroups = client (Proxy :: Proxy ResourcegroupsGetResourceGroupsAPI)
-- ^

type SchemasDeleteSchemaAPI =
  "admin" :> "v2" :> "schemas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "schema" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] DeleteSchemaResponse

schemasDeleteSchema :: Text -> Text -> Text -> Maybe Bool -> ClientM DeleteSchemaResponse
schemasDeleteSchema = client (Proxy :: Proxy SchemasDeleteSchemaAPI)
-- ^

type SchemasGetAllSchemasAPI =
  "admin" :> "v2" :> "schemas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "schemas" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] GetAllVersionsSchemaResponse

schemasGetAllSchemas :: Text -> Text -> Text -> Maybe Bool -> ClientM GetAllVersionsSchemaResponse
schemasGetAllSchemas = client (Proxy :: Proxy SchemasGetAllSchemasAPI)
-- ^

type SchemasGetSchemaAPI =
  "admin" :> "v2" :> "schemas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "schema" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] GetSchemaResponse

schemasGetSchema :: Text -> Text -> Text -> Maybe Bool -> ClientM GetSchemaResponse
schemasGetSchema = client (Proxy :: Proxy SchemasGetSchemaAPI)
-- ^

type SchemasGetSchemaVersionAPI =
  "admin" :> "v2" :> "schemas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "schema" :> Capture "version" Text :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] GetSchemaResponse

schemasGetSchemaVersion :: Text -> Text -> Text -> Text -> Maybe Bool -> ClientM GetSchemaResponse
schemasGetSchemaVersion = client (Proxy :: Proxy SchemasGetSchemaVersionAPI)
-- ^

type SchemasGetVersionBySchemaAPI =
  "admin" :> "v2" :> "schemas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "version" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] PostSchemaPayload :> Verb 'POST 200 '[JSON] LongSchemaVersion

schemasGetVersionBySchema :: Text -> Text -> Text -> Maybe Bool -> PostSchemaPayload -> ClientM LongSchemaVersion
schemasGetVersionBySchema = client (Proxy :: Proxy SchemasGetVersionBySchemaAPI)
-- ^

type SchemasPostSchemaAPI =
  "admin" :> "v2" :> "schemas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "schema" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] PostSchemaPayload :> Verb 'POST 200 '[JSON] PostSchemaResponse

schemasPostSchema :: Text -> Text -> Text -> Maybe Bool -> PostSchemaPayload -> ClientM PostSchemaResponse
schemasPostSchema = client (Proxy :: Proxy SchemasPostSchemaAPI)
-- ^

type SchemasTestCompatibilityAPI =
  "admin" :> "v2" :> "schemas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compatibility" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] PostSchemaPayload :> Verb 'POST 200 '[JSON] IsCompatibilityResponse

schemasTestCompatibility :: Text -> Text -> Text -> Maybe Bool -> PostSchemaPayload -> ClientM IsCompatibilityResponse
schemasTestCompatibility = client (Proxy :: Proxy SchemasTestCompatibilityAPI)
-- ^

type GetTenantsAPI =
  "admin" :> "v2" :> "tenants" :> Verb 'GET 200 '[JSON] [Text]

getTenants :: ClientM [Text]
getTenants = client (Proxy :: Proxy GetTenantsAPI)
-- ^ This operation requires Pulsar super-user privileges.

type TenantsCreateTenantAPI =
  "admin" :> "v2" :> "tenants" :> Capture "tenant" Text :> ReqBody '[JSON] TenantInfo :> Verb 'PUT 200 '[JSON] NoContent

tenantsCreateTenant :: Text -> TenantInfo -> ClientM NoContent
tenantsCreateTenant = client (Proxy :: Proxy TenantsCreateTenantAPI)
-- ^

type TenantsDeleteTenantAPI =
  "admin" :> "v2" :> "tenants" :> Capture "tenant" Text :> QueryParam "force" Bool :> Verb 'DELETE 200 '[JSON] NoContent

tenantsDeleteTenant :: Text -> Maybe Bool -> ClientM NoContent
tenantsDeleteTenant = client (Proxy :: Proxy TenantsDeleteTenantAPI)
-- ^

type TenantsGetTenantAdminAPI =
  "admin" :> "v2" :> "tenants" :> Capture "tenant" Text :> Verb 'GET 200 '[JSON] NoContent

tenantsGetTenantAdmin :: Text -> ClientM NoContent
tenantsGetTenantAdmin = client (Proxy :: Proxy TenantsGetTenantAdminAPI)
-- ^ This operation requires Pulsar super-user privileges.

type TenantsUpdateTenantAPI =
  "admin" :> "v2" :> "tenants" :> Capture "tenant" Text :> ReqBody '[JSON] TenantInfo :> Verb 'POST 200 '[JSON] NoContent

tenantsUpdateTenant :: Text -> TenantInfo -> ClientM NoContent
tenantsUpdateTenant = client (Proxy :: Proxy TenantsUpdateTenantAPI)
