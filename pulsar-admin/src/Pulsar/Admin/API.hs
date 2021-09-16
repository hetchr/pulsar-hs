{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

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
    BookiesDeleteBookieRackInfoParameters (..),
    BookiesGetBookieRackInfoParameters (..),
    BookiesUpdateBookieRackInfoParameters (..),
    BrokerStatsGetAllocatorStatsParameters (..),
    BrokerStatsGetBrokerResourceAvailabilityParameters (..),
    BrokersDeleteDynamicConfigurationParameters (..),
    BrokersGetActiveBrokersParameters (..),
    BrokersGetOwnedNamespacesParameters (..),
    BrokersHealthcheckParameters (..),
    BrokersUpdateDynamicConfigurationParameters (..),
    ClustersCreateClusterParameters (..),
    ClustersDeleteClusterParameters (..),
    ClustersDeleteFailureDomainParameters (..),
    ClustersDeleteNamespaceIsolationPolicyParameters (..),
    ClustersGetBrokerWithNamespaceIsolationPolicyParameters (..),
    ClustersGetBrokersWithNamespaceIsolationPolicyParameters (..),
    ClustersGetClusterParameters (..),
    ClustersGetDomainParameters (..),
    ClustersGetFailureDomainsParameters (..),
    ClustersGetNamespaceIsolationPoliciesParameters (..),
    ClustersGetNamespaceIsolationPolicyParameters (..),
    ClustersGetPeerClusterParameters (..),
    ClustersSetFailureDomainParameters (..),
    ClustersSetNamespaceIsolationPolicyParameters (..),
    ClustersSetPeerClusterNamesParameters (..),
    ClustersUpdateClusterParameters (..),
    NamespacesClearNamespaceBacklogParameters (..),
    NamespacesClearNamespaceBacklogForSubscriptionParameters (..),
    NamespacesClearNamespaceBundleBacklogParameters (..),
    NamespacesClearNamespaceBundleBacklogForSubscriptionParameters (..),
    NamespacesClearOffloadDeletionLagParameters (..),
    NamespacesClearPropertiesParameters (..),
    NamespacesCreateNamespaceParameters (..),
    NamespacesDeleteBookieAffinityGroupParameters (..),
    NamespacesDeleteCompactionThresholdParameters (..),
    NamespacesDeleteDispatchRateParameters (..),
    NamespacesDeleteNamespaceParameters (..),
    NamespacesDeleteNamespaceBundleParameters (..),
    NamespacesDeletePersistenceParameters (..),
    NamespacesDeleteSubscribeRateParameters (..),
    NamespacesDeleteSubscriptionDispatchRateParameters (..),
    NamespacesGetAntiAffinityNamespacesParameters (..),
    NamespacesGetBacklogQuotaMapParameters (..),
    NamespacesGetBookieAffinityGroupParameters (..),
    NamespacesGetBundlesDataParameters (..),
    NamespacesGetCompactionThresholdParameters (..),
    NamespacesGetDeduplicationParameters (..),
    NamespacesGetDeduplicationSnapshotIntervalParameters (..),
    NamespacesGetDelayedDeliveryPoliciesParameters (..),
    NamespacesGetDispatchRateParameters (..),
    NamespacesGetInactiveTopicPoliciesParameters (..),
    NamespacesGetIsAllowAutoUpdateSchemaParameters (..),
    NamespacesGetMaxConsumersPerSubscriptionParameters (..),
    NamespacesGetMaxConsumersPerTopicParameters (..),
    NamespacesGetMaxProducersPerTopicParameters (..),
    NamespacesGetMaxSubscriptionsPerTopicParameters (..),
    NamespacesGetMaxTopicsPerNamespaceParameters (..),
    NamespacesGetMaxUnackedMessagesPerConsumerParameters (..),
    NamespacesGetMaxUnackedmessagesPerSubscriptionParameters (..),
    NamespacesGetNamespaceAntiAffinityGroupParameters (..),
    NamespacesGetNamespaceMessageTTLParameters (..),
    NamespacesGetNamespaceReplicationClustersParameters (..),
    NamespacesGetNamespaceResourceGroupParameters (..),
    NamespacesGetOffloadDeletionLagParameters (..),
    NamespacesGetOffloadPoliciesParameters (..),
    NamespacesGetOffloadThresholdParameters (..),
    NamespacesGetPermissionsParameters (..),
    NamespacesGetPersistenceParameters (..),
    NamespacesGetPoliciesParameters (..),
    NamespacesGetPropertiesParameters (..),
    NamespacesGetPropertyParameters (..),
    NamespacesGetReplicatorDispatchRateParameters (..),
    NamespacesGetRetentionParameters (..),
    NamespacesGetSchemaAutoUpdateCompatibilityStrategyParameters (..),
    NamespacesGetSchemaCompatibilityStrategyParameters (..),
    NamespacesGetSchemaValidtionEnforcedParameters (..),
    NamespacesGetSubscribeRateParameters (..),
    NamespacesGetSubscriptionDispatchRateParameters (..),
    NamespacesGetSubscriptionExpirationTimeParameters (..),
    NamespacesGetSubscriptionTypesEnabledParameters (..),
    NamespacesGetTenantNamespacesParameters (..),
    NamespacesGetTopicsParameters (..),
    NamespacesGrantPermissionOnNamespaceParameters (..),
    NamespacesModifyDeduplicationParameters (..),
    NamespacesModifyEncryptionRequiredParameters (..),
    NamespacesRemoveAutoSubscriptionCreationParameters (..),
    NamespacesRemoveAutoTopicCreationParameters (..),
    NamespacesRemoveBacklogQuotaParameters (..),
    NamespacesRemoveDeduplicationParameters (..),
    NamespacesRemoveDelayedDeliveryPoliciesParameters (..),
    NamespacesRemoveInactiveTopicPoliciesParameters (..),
    NamespacesRemoveMaxConsumersPerSubscriptionParameters (..),
    NamespacesRemoveMaxConsumersPerTopicParameters (..),
    NamespacesRemoveMaxProducersPerTopicParameters (..),
    NamespacesRemoveMaxSubscriptionsPerTopicParameters (..),
    NamespacesRemoveMaxTopicsPerNamespaceParameters (..),
    NamespacesRemoveMaxUnackedmessagesPerConsumerParameters (..),
    NamespacesRemoveMaxUnackedmessagesPerSubscriptionParameters (..),
    NamespacesRemoveNamespaceAntiAffinityGroupParameters (..),
    NamespacesRemoveNamespaceMessageTTLParameters (..),
    NamespacesRemoveNamespaceResourceGroupParameters (..),
    NamespacesRemoveOffloadPoliciesParameters (..),
    NamespacesRemovePropertyParameters (..),
    NamespacesRemoveReplicatorDispatchRateParameters (..),
    NamespacesRemoveRetentionParameters (..),
    NamespacesRemoveSubscriptionExpirationTimeParameters (..),
    NamespacesRevokePermissionsOnNamespaceParameters (..),
    NamespacesSetAutoSubscriptionCreationParameters (..),
    NamespacesSetAutoTopicCreationParameters (..),
    NamespacesSetBacklogQuotaParameters (..),
    NamespacesSetBookieAffinityGroupParameters (..),
    NamespacesSetCompactionThresholdParameters (..),
    NamespacesSetDeduplicationSnapshotIntervalParameters (..),
    NamespacesSetDelayedDeliveryPoliciesParameters (..),
    NamespacesSetDispatchRateParameters (..),
    NamespacesSetInactiveTopicPoliciesParameters (..),
    NamespacesSetIsAllowAutoUpdateSchemaParameters (..),
    NamespacesSetMaxConsumersPerSubscriptionParameters (..),
    NamespacesSetMaxConsumersPerTopicParameters (..),
    NamespacesSetMaxProducersPerTopicParameters (..),
    NamespacesSetMaxSubscriptionsPerTopicParameters (..),
    NamespacesSetMaxTopicsPerNamespaceParameters (..),
    NamespacesSetMaxUnackedMessagesPerConsumerParameters (..),
    NamespacesSetMaxUnackedMessagesPerSubscriptionParameters (..),
    NamespacesSetNamespaceAntiAffinityGroupParameters (..),
    NamespacesSetNamespaceMessageTTLParameters (..),
    NamespacesSetNamespaceReplicationClustersParameters (..),
    NamespacesSetNamespaceResourceGroupParameters (..),
    NamespacesSetOffloadDeletionLagParameters (..),
    NamespacesSetOffloadPoliciesParameters (..),
    NamespacesSetOffloadThresholdParameters (..),
    NamespacesSetPersistenceParameters (..),
    NamespacesSetPropertiesParameters (..),
    NamespacesSetPropertyParameters (..),
    NamespacesSetReplicatorDispatchRateParameters (..),
    NamespacesSetRetentionParameters (..),
    NamespacesSetSchemaAutoUpdateCompatibilityStrategyParameters (..),
    NamespacesSetSchemaCompatibilityStrategyParameters (..),
    NamespacesSetSchemaValidtionEnforcedParameters (..),
    NamespacesSetSubscribeRateParameters (..),
    NamespacesSetSubscriptionAuthModeParameters (..),
    NamespacesSetSubscriptionDispatchRateParameters (..),
    NamespacesSetSubscriptionExpirationTimeParameters (..),
    NamespacesSetSubscriptionTypesEnabledParameters (..),
    NamespacesSplitNamespaceBundleParameters (..),
    NamespacesUnloadNamespaceParameters (..),
    NamespacesUnloadNamespaceBundleParameters (..),
    NamespacesUnsubscribeNamespaceParameters (..),
    NamespacesUnsubscribeNamespaceBundleParameters (..),
    NonPersistentCompactParameters (..),
    NonPersistentCompactionStatusParameters (..),
    NonPersistentCreateMissedPartitionsParameters (..),
    NonPersistentCreateNonPartitionedTopicParameters (..),
    NonPersistentCreatePartitionedTopicParameters (..),
    NonPersistentCreateSubscriptionParameters (..),
    NonPersistentDeleteDeduplicationSnapshotIntervalParameters (..),
    NonPersistentDeleteDelayedDeliveryPoliciesParameters (..),
    NonPersistentDeleteInactiveTopicPoliciesParameters (..),
    NonPersistentDeleteMaxUnackedMessagesOnConsumerParameters (..),
    NonPersistentDeleteMaxUnackedMessagesOnSubscriptionParameters (..),
    NonPersistentDeletePartitionedTopicParameters (..),
    NonPersistentDeleteSubscriptionParameters (..),
    NonPersistentDeleteTopicParameters (..),
    NonPersistentExamineMessageParameters (..),
    NonPersistentExpireMessagesForAllSubscriptionsParameters (..),
    NonPersistentExpireTopicMessagesParameters (..),
    NonPersistentExpireTopicMessagesInSecondsParameters (..),
    NonPersistentGetBacklogParameters (..),
    NonPersistentGetBacklogQuotaMapParameters (..),
    NonPersistentGetCompactionThresholdParameters (..),
    NonPersistentGetDeduplicationParameters (..),
    NonPersistentGetDeduplicationSnapshotIntervalParameters (..),
    NonPersistentGetDelayedDeliveryPoliciesParameters (..),
    NonPersistentGetDispatchRateParameters (..),
    NonPersistentGetInactiveTopicPoliciesParameters (..),
    NonPersistentGetInternalStatsParameters (..),
    NonPersistentGetLastMessageIdParameters (..),
    NonPersistentGetListParameters (..),
    NonPersistentGetListFromBundleParameters (..),
    NonPersistentGetManagedLedgerInfoParameters (..),
    NonPersistentGetMaxConsumersParameters (..),
    NonPersistentGetMaxConsumersPerSubscriptionParameters (..),
    NonPersistentGetMaxMessageSizeParameters (..),
    NonPersistentGetMaxProducersParameters (..),
    NonPersistentGetMaxSubscriptionsPerTopicParameters (..),
    NonPersistentGetMaxUnackedMessagesOnConsumerParameters (..),
    NonPersistentGetMaxUnackedMessagesOnSubscriptionParameters (..),
    NonPersistentGetMessageByIdParameters (..),
    NonPersistentGetMessageIdByTimestampParameters (..),
    NonPersistentGetMessageTTLParameters (..),
    NonPersistentGetOffloadPoliciesParameters (..),
    NonPersistentGetPartitionedMetadataParameters (..),
    NonPersistentGetPartitionedStatsParameters (..),
    NonPersistentGetPartitionedTopicListParameters (..),
    NonPersistentGetPermissionsOnTopicParameters (..),
    NonPersistentGetPersistenceParameters (..),
    NonPersistentGetPublishRateParameters (..),
    NonPersistentGetReplicatorDispatchRateParameters (..),
    NonPersistentGetRetentionParameters (..),
    NonPersistentGetStatsParameters (..),
    NonPersistentGetSubscribeRateParameters (..),
    NonPersistentGetSubscriptionDispatchRateParameters (..),
    NonPersistentGetSubscriptionTypesEnabledParameters (..),
    NonPersistentGetSubscriptionsParameters (..),
    NonPersistentGrantPermissionsOnTopicParameters (..),
    NonPersistentOffloadStatusParameters (..),
    NonPersistentPeekNthMessageParameters (..),
    NonPersistentRemoveBacklogQuotaParameters (..),
    NonPersistentRemoveCompactionThresholdParameters (..),
    NonPersistentRemoveDeduplicationParameters (..),
    NonPersistentRemoveDispatchRateParameters (..),
    NonPersistentRemoveMaxConsumersParameters (..),
    NonPersistentRemoveMaxConsumersPerSubscriptionParameters (..),
    NonPersistentRemoveMaxMessageSizeParameters (..),
    NonPersistentRemoveMaxProducersParameters (..),
    NonPersistentRemoveMaxSubscriptionsPerTopicParameters (..),
    NonPersistentRemoveMessageTTLParameters (..),
    NonPersistentRemoveOffloadPoliciesParameters (..),
    NonPersistentRemovePersistenceParameters (..),
    NonPersistentRemovePublishRateParameters (..),
    NonPersistentRemoveReplicatorDispatchRateParameters (..),
    NonPersistentRemoveRetentionParameters (..),
    NonPersistentRemoveSubscribeRateParameters (..),
    NonPersistentRemoveSubscriptionDispatchRateParameters (..),
    NonPersistentResetCursorParameters (..),
    NonPersistentResetCursorOnPositionParameters (..),
    NonPersistentRevokePermissionsOnTopicParameters (..),
    NonPersistentSetBacklogQuotaParameters (..),
    NonPersistentSetCompactionThresholdParameters (..),
    NonPersistentSetDeduplicationParameters (..),
    NonPersistentSetDeduplicationSnapshotIntervalParameters (..),
    NonPersistentSetDelayedDeliveryPoliciesParameters (..),
    NonPersistentSetDispatchRateParameters (..),
    NonPersistentSetInactiveTopicPoliciesParameters (..),
    NonPersistentSetMaxConsumersParameters (..),
    NonPersistentSetMaxConsumersPerSubscriptionParameters (..),
    NonPersistentSetMaxMessageSizeParameters (..),
    NonPersistentSetMaxProducersParameters (..),
    NonPersistentSetMaxSubscriptionsPerTopicParameters (..),
    NonPersistentSetMaxUnackedMessagesOnConsumerParameters (..),
    NonPersistentSetMaxUnackedMessagesOnSubscriptionParameters (..),
    NonPersistentSetMessageTTLParameters (..),
    NonPersistentSetOffloadPoliciesParameters (..),
    NonPersistentSetPersistenceParameters (..),
    NonPersistentSetPublishRateParameters (..),
    NonPersistentSetReplicatedSubscriptionStatusParameters (..),
    NonPersistentSetReplicatorDispatchRateParameters (..),
    NonPersistentSetRetentionParameters (..),
    NonPersistentSetSubscribeRateParameters (..),
    NonPersistentSetSubscriptionDispatchRateParameters (..),
    NonPersistentSetSubscriptionTypesEnabledParameters (..),
    NonPersistentSkipAllMessagesParameters (..),
    NonPersistentSkipMessagesParameters (..),
    NonPersistentTerminateParameters (..),
    NonPersistentTerminatePartitionedTopicParameters (..),
    NonPersistentTriggerOffloadParameters (..),
    NonPersistentTruncateTopicParameters (..),
    NonPersistentUnloadTopicParameters (..),
    NonPersistentUpdatePartitionedTopicParameters (..),
    PersistentCompactParameters (..),
    PersistentCompactionStatusParameters (..),
    PersistentCreateMissedPartitionsParameters (..),
    PersistentCreateNonPartitionedTopicParameters (..),
    PersistentCreatePartitionedTopicParameters (..),
    PersistentCreateSubscriptionParameters (..),
    PersistentDeleteDeduplicationSnapshotIntervalParameters (..),
    PersistentDeleteDelayedDeliveryPoliciesParameters (..),
    PersistentDeleteInactiveTopicPoliciesParameters (..),
    PersistentDeleteMaxUnackedMessagesOnConsumerParameters (..),
    PersistentDeleteMaxUnackedMessagesOnSubscriptionParameters (..),
    PersistentDeletePartitionedTopicParameters (..),
    PersistentDeleteSubscriptionParameters (..),
    PersistentDeleteTopicParameters (..),
    PersistentExamineMessageParameters (..),
    PersistentExpireMessagesForAllSubscriptionsParameters (..),
    PersistentExpireTopicMessagesParameters (..),
    PersistentExpireTopicMessagesInSecondsParameters (..),
    PersistentGetBacklogParameters (..),
    PersistentGetBacklogQuotaMapParameters (..),
    PersistentGetCompactionThresholdParameters (..),
    PersistentGetDeduplicationParameters (..),
    PersistentGetDeduplicationSnapshotIntervalParameters (..),
    PersistentGetDelayedDeliveryPoliciesParameters (..),
    PersistentGetDispatchRateParameters (..),
    PersistentGetInactiveTopicPoliciesParameters (..),
    PersistentGetInternalStatsParameters (..),
    PersistentGetLastMessageIdParameters (..),
    PersistentGetListParameters (..),
    PersistentGetManagedLedgerInfoParameters (..),
    PersistentGetMaxConsumersParameters (..),
    PersistentGetMaxConsumersPerSubscriptionParameters (..),
    PersistentGetMaxMessageSizeParameters (..),
    PersistentGetMaxProducersParameters (..),
    PersistentGetMaxSubscriptionsPerTopicParameters (..),
    PersistentGetMaxUnackedMessagesOnConsumerParameters (..),
    PersistentGetMaxUnackedMessagesOnSubscriptionParameters (..),
    PersistentGetMessageByIdParameters (..),
    PersistentGetMessageIdByTimestampParameters (..),
    PersistentGetMessageTTLParameters (..),
    PersistentGetOffloadPoliciesParameters (..),
    PersistentGetPartitionedMetadataParameters (..),
    PersistentGetPartitionedStatsParameters (..),
    PersistentGetPartitionedTopicListParameters (..),
    PersistentGetPermissionsOnTopicParameters (..),
    PersistentGetPersistenceParameters (..),
    PersistentGetPublishRateParameters (..),
    PersistentGetReplicatorDispatchRateParameters (..),
    PersistentGetRetentionParameters (..),
    PersistentGetStatsParameters (..),
    PersistentGetSubscribeRateParameters (..),
    PersistentGetSubscriptionDispatchRateParameters (..),
    PersistentGetSubscriptionTypesEnabledParameters (..),
    PersistentGetSubscriptionsParameters (..),
    PersistentGrantPermissionsOnTopicParameters (..),
    PersistentOffloadStatusParameters (..),
    PersistentPeekNthMessageParameters (..),
    PersistentRemoveBacklogQuotaParameters (..),
    PersistentRemoveCompactionThresholdParameters (..),
    PersistentRemoveDeduplicationParameters (..),
    PersistentRemoveDispatchRateParameters (..),
    PersistentRemoveMaxConsumersParameters (..),
    PersistentRemoveMaxConsumersPerSubscriptionParameters (..),
    PersistentRemoveMaxMessageSizeParameters (..),
    PersistentRemoveMaxProducersParameters (..),
    PersistentRemoveMaxSubscriptionsPerTopicParameters (..),
    PersistentRemoveMessageTTLParameters (..),
    PersistentRemoveOffloadPoliciesParameters (..),
    PersistentRemovePersistenceParameters (..),
    PersistentRemovePublishRateParameters (..),
    PersistentRemoveReplicatorDispatchRateParameters (..),
    PersistentRemoveRetentionParameters (..),
    PersistentRemoveSubscribeRateParameters (..),
    PersistentRemoveSubscriptionDispatchRateParameters (..),
    PersistentResetCursorParameters (..),
    PersistentResetCursorOnPositionParameters (..),
    PersistentRevokePermissionsOnTopicParameters (..),
    PersistentSetBacklogQuotaParameters (..),
    PersistentSetCompactionThresholdParameters (..),
    PersistentSetDeduplicationParameters (..),
    PersistentSetDeduplicationSnapshotIntervalParameters (..),
    PersistentSetDelayedDeliveryPoliciesParameters (..),
    PersistentSetDispatchRateParameters (..),
    PersistentSetInactiveTopicPoliciesParameters (..),
    PersistentSetMaxConsumersParameters (..),
    PersistentSetMaxConsumersPerSubscriptionParameters (..),
    PersistentSetMaxMessageSizeParameters (..),
    PersistentSetMaxProducersParameters (..),
    PersistentSetMaxSubscriptionsPerTopicParameters (..),
    PersistentSetMaxUnackedMessagesOnConsumerParameters (..),
    PersistentSetMaxUnackedMessagesOnSubscriptionParameters (..),
    PersistentSetMessageTTLParameters (..),
    PersistentSetOffloadPoliciesParameters (..),
    PersistentSetPersistenceParameters (..),
    PersistentSetPublishRateParameters (..),
    PersistentSetReplicatedSubscriptionStatusParameters (..),
    PersistentSetReplicatorDispatchRateParameters (..),
    PersistentSetRetentionParameters (..),
    PersistentSetSubscribeRateParameters (..),
    PersistentSetSubscriptionDispatchRateParameters (..),
    PersistentSetSubscriptionTypesEnabledParameters (..),
    PersistentSkipAllMessagesParameters (..),
    PersistentSkipMessagesParameters (..),
    PersistentTerminateParameters (..),
    PersistentTerminatePartitionedTopicParameters (..),
    PersistentTriggerOffloadParameters (..),
    PersistentTruncateTopicParameters (..),
    PersistentUnloadTopicParameters (..),
    PersistentUpdatePartitionedTopicParameters (..),
    ResourceQuotasGetNamespaceBundleResourceQuotaParameters (..),
    ResourceQuotasRemoveNamespaceBundleResourceQuotaParameters (..),
    ResourceQuotasSetDefaultResourceQuotaParameters (..),
    ResourceQuotasSetNamespaceBundleResourceQuotaParameters (..),
    ResourcegroupsCreateOrUpdateResourceGroupParameters (..),
    ResourcegroupsDeleteResourceGroupParameters (..),
    ResourcegroupsGetResourceGroupParameters (..),
    SchemasDeleteSchemaParameters (..),
    SchemasGetAllSchemasParameters (..),
    SchemasGetSchemaParameters (..),
    SchemasGetSchemaVersionParameters (..),
    SchemasGetVersionBySchemaParameters (..),
    SchemasPostSchemaParameters (..),
    SchemasTestCompatibilityParameters (..),
    TenantsCreateTenantParameters (..),
    TenantsDeleteTenantParameters (..),
    TenantsGetTenantAdminParameters (..),
    TenantsUpdateTenantParameters (..),
  )
where

import Data.Aeson (Value)
import qualified Data.Map as Map
import Data.Proxy (Proxy (..))
import Data.Text (Text)
import qualified Data.Text as T
import GHC.Generics (Generic)
import Pulsar.Admin.Types
import Servant.API
import Servant.Client (client)
import Servant.Client.Internal.HttpClient (ClientM (..))

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

data BookiesDeleteBookieRackInfoParameters = BookiesDeleteBookieRackInfoParameters
  { -- |
    bookiesDeleteBookieRackInfoBookie :: Text
  }
  deriving (Show, Eq, Generic)

bookiesDeleteBookieRackInfo :: BookiesDeleteBookieRackInfoParameters -> ClientM NoContent
bookiesDeleteBookieRackInfo BookiesDeleteBookieRackInfoParameters {..} = client (Proxy :: Proxy BookiesDeleteBookieRackInfoAPI) (bookiesDeleteBookieRackInfoBookie)
-- ^

type BookiesGetAllBookiesAPI =
  "admin" :> "v2" :> "bookies" :> "all" :> Verb 'GET 200 '[JSON] BookiesClusterInfo

bookiesGetAllBookies :: ClientM BookiesClusterInfo
bookiesGetAllBookies = client (Proxy :: Proxy BookiesGetAllBookiesAPI)
-- ^

type BookiesGetBookieRackInfoAPI =
  "admin" :> "v2" :> "bookies" :> "racks-info" :> Capture "bookie" Text :> Verb 'GET 200 '[JSON] BookieInfo

data BookiesGetBookieRackInfoParameters = BookiesGetBookieRackInfoParameters
  { -- |
    bookiesGetBookieRackInfoBookie :: Text
  }
  deriving (Show, Eq, Generic)

bookiesGetBookieRackInfo :: BookiesGetBookieRackInfoParameters -> ClientM BookieInfo
bookiesGetBookieRackInfo BookiesGetBookieRackInfoParameters {..} = client (Proxy :: Proxy BookiesGetBookieRackInfoAPI) (bookiesGetBookieRackInfoBookie)
-- ^

type BookiesGetBookiesRackInfoAPI =
  "admin" :> "v2" :> "bookies" :> "racks-info" :> Verb 'GET 200 '[JSON] ((Map.Map String (Map.Map String BookieInfo)))

bookiesGetBookiesRackInfo :: ClientM (Map.Map String (Map.Map String BookieInfo))
bookiesGetBookiesRackInfo = client (Proxy :: Proxy BookiesGetBookiesRackInfoAPI)
-- ^

type BookiesUpdateBookieRackInfoAPI =
  "admin" :> "v2" :> "bookies" :> "racks-info" :> Capture "bookie" Text :> QueryParam "group" Text :> Verb 'POST 200 '[JSON] NoContent

data BookiesUpdateBookieRackInfoParameters = BookiesUpdateBookieRackInfoParameters
  { -- |
    bookiesUpdateBookieRackInfoBookie :: Text,
    -- |
    bookiesUpdateBookieRackInfoGroup :: Maybe Text
  }
  deriving (Show, Eq, Generic)

bookiesUpdateBookieRackInfo :: BookiesUpdateBookieRackInfoParameters -> ClientM NoContent
bookiesUpdateBookieRackInfo BookiesUpdateBookieRackInfoParameters {..} = client (Proxy :: Proxy BookiesUpdateBookieRackInfoAPI) (bookiesUpdateBookieRackInfoBookie) (bookiesUpdateBookieRackInfoGroup)
-- ^

type BrokerStatsGetAllocatorStatsAPI =
  "admin" :> "v2" :> "broker-stats" :> "allocator-stats" :> Capture "allocator" Text :> Verb 'GET 200 '[JSON] AllocatorStats

data BrokerStatsGetAllocatorStatsParameters = BrokerStatsGetAllocatorStatsParameters
  { -- |
    brokerStatsGetAllocatorStatsAllocator :: Text
  }
  deriving (Show, Eq, Generic)

brokerStatsGetAllocatorStats :: BrokerStatsGetAllocatorStatsParameters -> ClientM AllocatorStats
brokerStatsGetAllocatorStats BrokerStatsGetAllocatorStatsParameters {..} = client (Proxy :: Proxy BrokerStatsGetAllocatorStatsAPI) (brokerStatsGetAllocatorStatsAllocator)
-- ^ This API gives the current broker availability in percent, each resource percentage usage is calculated and thensum of all of the resource usage percent is called broker-resource-availability<br/><br/>THIS API IS ONLY FOR USE BY TESTING FOR CONFIRMING NAMESPACE ALLOCATION ALGORITHM

type BrokerStatsGetBrokerResourceAvailabilityAPI =
  "admin" :> "v2" :> "broker-stats" :> "broker-resource-availability" :> Capture "tenant" Text :> Capture "namespace" Text :> Verb 'GET 200 '[JSON] ((Map.Map String ResourceUnit))

data BrokerStatsGetBrokerResourceAvailabilityParameters = BrokerStatsGetBrokerResourceAvailabilityParameters
  { -- |
    brokerStatsGetBrokerResourceAvailabilityTenant :: Text,
    -- |
    brokerStatsGetBrokerResourceAvailabilityNamespace :: Text
  }
  deriving (Show, Eq, Generic)

brokerStatsGetBrokerResourceAvailability :: BrokerStatsGetBrokerResourceAvailabilityParameters -> ClientM (Map.Map String ResourceUnit)
brokerStatsGetBrokerResourceAvailability BrokerStatsGetBrokerResourceAvailabilityParameters {..} = client (Proxy :: Proxy BrokerStatsGetBrokerResourceAvailabilityAPI) (brokerStatsGetBrokerResourceAvailabilityTenant) (brokerStatsGetBrokerResourceAvailabilityNamespace)
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

brokerStatsGetPendingBookieOpsStats :: ClientM (Map.Map String PendingBookieOpsStats)
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

data BrokersDeleteDynamicConfigurationParameters = BrokersDeleteDynamicConfigurationParameters
  { -- |
    brokersDeleteDynamicConfigurationConfigName :: Text
  }
  deriving (Show, Eq, Generic)

brokersDeleteDynamicConfiguration :: BrokersDeleteDynamicConfigurationParameters -> ClientM NoContent
brokersDeleteDynamicConfiguration BrokersDeleteDynamicConfigurationParameters {..} = client (Proxy :: Proxy BrokersDeleteDynamicConfigurationAPI) (brokersDeleteDynamicConfigurationConfigName)
-- ^

type BrokersGetActiveBrokersAPI =
  "admin" :> "v2" :> "brokers" :> Capture "cluster" Text :> Verb 'GET 200 '[JSON] [Text]

data BrokersGetActiveBrokersParameters = BrokersGetActiveBrokersParameters
  { -- |
    brokersGetActiveBrokersCluster :: Text
  }
  deriving (Show, Eq, Generic)

brokersGetActiveBrokers :: BrokersGetActiveBrokersParameters -> ClientM [Text]
brokersGetActiveBrokers BrokersGetActiveBrokersParameters {..} = client (Proxy :: Proxy BrokersGetActiveBrokersAPI) (brokersGetActiveBrokersCluster)
-- ^

type BrokersGetAllDynamicConfigurationsAPI =
  "admin" :> "v2" :> "brokers" :> "configuration" :> "values" :> Verb 'GET 200 '[JSON] ((Map.Map String Text))

brokersGetAllDynamicConfigurations :: ClientM (Map.Map String Text)
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

data BrokersGetOwnedNamespacesParameters = BrokersGetOwnedNamespacesParameters
  { -- |
    brokersGetOwnedNamespacesClusterName :: Text,
    -- |
    brokersGetOwnedNamespacesBrokerWebserviceurl :: Text
  }
  deriving (Show, Eq, Generic)

brokersGetOwnedNamespaces :: BrokersGetOwnedNamespacesParameters -> ClientM (Map.Map String NamespaceOwnershipStatus)
brokersGetOwnedNamespaces BrokersGetOwnedNamespacesParameters {..} = client (Proxy :: Proxy BrokersGetOwnedNamespacesAPI) (brokersGetOwnedNamespacesClusterName) (brokersGetOwnedNamespacesBrokerWebserviceurl)
-- ^

type BrokersGetRuntimeConfigurationAPI =
  "admin" :> "v2" :> "brokers" :> "configuration" :> "runtime" :> Verb 'GET 200 '[JSON] ((Map.Map String Text))

brokersGetRuntimeConfiguration :: ClientM (Map.Map String Text)
brokersGetRuntimeConfiguration = client (Proxy :: Proxy BrokersGetRuntimeConfigurationAPI)
-- ^

type BrokersHealthcheckAPI =
  "admin" :> "v2" :> "brokers" :> "health" :> QueryParam "topicVersion" Text :> Verb 'GET 200 '[JSON] NoContent

data BrokersHealthcheckParameters = BrokersHealthcheckParameters
  { -- |
    brokersHealthcheckTopicVersion :: Maybe Text
  }
  deriving (Show, Eq, Generic)

brokersHealthcheck :: BrokersHealthcheckParameters -> ClientM NoContent
brokersHealthcheck BrokersHealthcheckParameters {..} = client (Proxy :: Proxy BrokersHealthcheckAPI) (brokersHealthcheckTopicVersion)
-- ^

type BrokersIsReadyAPI =
  "admin" :> "v2" :> "brokers" :> "ready" :> Verb 'GET 200 '[JSON] NoContent

brokersIsReady :: ClientM NoContent
brokersIsReady = client (Proxy :: Proxy BrokersIsReadyAPI)
-- ^

type BrokersUpdateDynamicConfigurationAPI =
  "admin" :> "v2" :> "brokers" :> "configuration" :> Capture "configName" Text :> Capture "configValue" Text :> Verb 'POST 200 '[JSON] NoContent

data BrokersUpdateDynamicConfigurationParameters = BrokersUpdateDynamicConfigurationParameters
  { -- |
    brokersUpdateDynamicConfigurationConfigName :: Text,
    -- |
    brokersUpdateDynamicConfigurationConfigValue :: Text
  }
  deriving (Show, Eq, Generic)

brokersUpdateDynamicConfiguration :: BrokersUpdateDynamicConfigurationParameters -> ClientM NoContent
brokersUpdateDynamicConfiguration BrokersUpdateDynamicConfigurationParameters {..} = client (Proxy :: Proxy BrokersUpdateDynamicConfigurationAPI) (brokersUpdateDynamicConfigurationConfigName) (brokersUpdateDynamicConfigurationConfigValue)
-- ^

type BrokersVersionAPI =
  "admin" :> "v2" :> "brokers" :> "version" :> Verb 'GET 200 '[JSON] Text

brokersVersion :: ClientM Text
brokersVersion = client (Proxy :: Proxy BrokersVersionAPI)
-- ^ This operation requires Pulsar superuser privileges, and the name cannot contain the '/' characters.

type ClustersCreateClusterAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> ReqBody '[JSON] ClusterData :> Verb 'PUT 200 '[JSON] NoContent

data ClustersCreateClusterParameters = ClustersCreateClusterParameters
  { -- | The cluster name
    clustersCreateClusterCluster :: Text,
    -- | The cluster data
    clustersCreateClusterBody :: ClusterData
  }
  deriving (Show, Eq, Generic)

clustersCreateCluster :: ClustersCreateClusterParameters -> ClientM NoContent
clustersCreateCluster ClustersCreateClusterParameters {..} = client (Proxy :: Proxy ClustersCreateClusterAPI) (clustersCreateClusterCluster) clustersCreateClusterBody
-- ^ This operation requires Pulsar superuser privileges.

type ClustersDeleteClusterAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> Verb 'DELETE 200 '[JSON] NoContent

data ClustersDeleteClusterParameters = ClustersDeleteClusterParameters
  { -- | The cluster name
    clustersDeleteClusterCluster :: Text
  }
  deriving (Show, Eq, Generic)

clustersDeleteCluster :: ClustersDeleteClusterParameters -> ClientM NoContent
clustersDeleteCluster ClustersDeleteClusterParameters {..} = client (Proxy :: Proxy ClustersDeleteClusterAPI) (clustersDeleteClusterCluster)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersDeleteFailureDomainAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "failureDomains" :> Capture "domainName" Text :> Verb 'DELETE 200 '[JSON] NoContent

data ClustersDeleteFailureDomainParameters = ClustersDeleteFailureDomainParameters
  { -- | The cluster name
    clustersDeleteFailureDomainCluster :: Text,
    -- | The failure domain name
    clustersDeleteFailureDomainDomainName :: Text
  }
  deriving (Show, Eq, Generic)

clustersDeleteFailureDomain :: ClustersDeleteFailureDomainParameters -> ClientM NoContent
clustersDeleteFailureDomain ClustersDeleteFailureDomainParameters {..} = client (Proxy :: Proxy ClustersDeleteFailureDomainAPI) (clustersDeleteFailureDomainCluster) (clustersDeleteFailureDomainDomainName)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersDeleteNamespaceIsolationPolicyAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "namespaceIsolationPolicies" :> Capture "policyName" Text :> Verb 'DELETE 200 '[JSON] NoContent

data ClustersDeleteNamespaceIsolationPolicyParameters = ClustersDeleteNamespaceIsolationPolicyParameters
  { -- | The cluster name
    clustersDeleteNamespaceIsolationPolicyCluster :: Text,
    -- | The namespace isolation policy name
    clustersDeleteNamespaceIsolationPolicyPolicyName :: Text
  }
  deriving (Show, Eq, Generic)

clustersDeleteNamespaceIsolationPolicy :: ClustersDeleteNamespaceIsolationPolicyParameters -> ClientM NoContent
clustersDeleteNamespaceIsolationPolicy ClustersDeleteNamespaceIsolationPolicyParameters {..} = client (Proxy :: Proxy ClustersDeleteNamespaceIsolationPolicyAPI) (clustersDeleteNamespaceIsolationPolicyCluster) (clustersDeleteNamespaceIsolationPolicyPolicyName)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetBrokerWithNamespaceIsolationPolicyAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "namespaceIsolationPolicies" :> "brokers" :> Capture "broker" Text :> Verb 'GET 200 '[JSON] BrokerNamespaceIsolationData

data ClustersGetBrokerWithNamespaceIsolationPolicyParameters = ClustersGetBrokerWithNamespaceIsolationPolicyParameters
  { -- | The cluster name
    clustersGetBrokerWithNamespaceIsolationPolicyCluster :: Text,
    -- | The broker name (<broker-hostname>:<web-service-port>)
    clustersGetBrokerWithNamespaceIsolationPolicyBroker :: Text
  }
  deriving (Show, Eq, Generic)

clustersGetBrokerWithNamespaceIsolationPolicy :: ClustersGetBrokerWithNamespaceIsolationPolicyParameters -> ClientM BrokerNamespaceIsolationData
clustersGetBrokerWithNamespaceIsolationPolicy ClustersGetBrokerWithNamespaceIsolationPolicyParameters {..} = client (Proxy :: Proxy ClustersGetBrokerWithNamespaceIsolationPolicyAPI) (clustersGetBrokerWithNamespaceIsolationPolicyCluster) (clustersGetBrokerWithNamespaceIsolationPolicyBroker)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetBrokersWithNamespaceIsolationPolicyAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "namespaceIsolationPolicies" :> "brokers" :> Verb 'GET 200 '[JSON] [BrokerNamespaceIsolationData]

data ClustersGetBrokersWithNamespaceIsolationPolicyParameters = ClustersGetBrokersWithNamespaceIsolationPolicyParameters
  { -- | The cluster name
    clustersGetBrokersWithNamespaceIsolationPolicyCluster :: Text
  }
  deriving (Show, Eq, Generic)

clustersGetBrokersWithNamespaceIsolationPolicy :: ClustersGetBrokersWithNamespaceIsolationPolicyParameters -> ClientM [BrokerNamespaceIsolationData]
clustersGetBrokersWithNamespaceIsolationPolicy ClustersGetBrokersWithNamespaceIsolationPolicyParameters {..} = client (Proxy :: Proxy ClustersGetBrokersWithNamespaceIsolationPolicyAPI) (clustersGetBrokersWithNamespaceIsolationPolicyCluster)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetClusterAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> Verb 'GET 200 '[JSON] ClusterData

data ClustersGetClusterParameters = ClustersGetClusterParameters
  { -- | The cluster name
    clustersGetClusterCluster :: Text
  }
  deriving (Show, Eq, Generic)

clustersGetCluster :: ClustersGetClusterParameters -> ClientM ClusterData
clustersGetCluster ClustersGetClusterParameters {..} = client (Proxy :: Proxy ClustersGetClusterAPI) (clustersGetClusterCluster)
-- ^

type ClustersGetClustersAPI =
  "admin" :> "v2" :> "clusters" :> Verb 'GET 200 '[JSON] [Text]

clustersGetClusters :: ClientM [Text]
clustersGetClusters = client (Proxy :: Proxy ClustersGetClustersAPI)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetDomainAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "failureDomains" :> Capture "domainName" Text :> Verb 'GET 200 '[JSON] FailureDomain

data ClustersGetDomainParameters = ClustersGetDomainParameters
  { -- | The cluster name
    clustersGetDomainCluster :: Text,
    -- | The failure domain name
    clustersGetDomainDomainName :: Text
  }
  deriving (Show, Eq, Generic)

clustersGetDomain :: ClustersGetDomainParameters -> ClientM FailureDomain
clustersGetDomain ClustersGetDomainParameters {..} = client (Proxy :: Proxy ClustersGetDomainAPI) (clustersGetDomainCluster) (clustersGetDomainDomainName)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetFailureDomainsAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "failureDomains" :> Verb 'GET 200 '[JSON] ((Map.Map String FailureDomain))

data ClustersGetFailureDomainsParameters = ClustersGetFailureDomainsParameters
  { -- | The cluster name
    clustersGetFailureDomainsCluster :: Text
  }
  deriving (Show, Eq, Generic)

clustersGetFailureDomains :: ClustersGetFailureDomainsParameters -> ClientM (Map.Map String FailureDomain)
clustersGetFailureDomains ClustersGetFailureDomainsParameters {..} = client (Proxy :: Proxy ClustersGetFailureDomainsAPI) (clustersGetFailureDomainsCluster)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetNamespaceIsolationPoliciesAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "namespaceIsolationPolicies" :> Verb 'GET 200 '[JSON] ((Map.Map String NamespaceIsolationData))

data ClustersGetNamespaceIsolationPoliciesParameters = ClustersGetNamespaceIsolationPoliciesParameters
  { -- | The cluster name
    clustersGetNamespaceIsolationPoliciesCluster :: Text
  }
  deriving (Show, Eq, Generic)

clustersGetNamespaceIsolationPolicies :: ClustersGetNamespaceIsolationPoliciesParameters -> ClientM (Map.Map String NamespaceIsolationData)
clustersGetNamespaceIsolationPolicies ClustersGetNamespaceIsolationPoliciesParameters {..} = client (Proxy :: Proxy ClustersGetNamespaceIsolationPoliciesAPI) (clustersGetNamespaceIsolationPoliciesCluster)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetNamespaceIsolationPolicyAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "namespaceIsolationPolicies" :> Capture "policyName" Text :> Verb 'GET 200 '[JSON] NamespaceIsolationData

data ClustersGetNamespaceIsolationPolicyParameters = ClustersGetNamespaceIsolationPolicyParameters
  { -- | The cluster name
    clustersGetNamespaceIsolationPolicyCluster :: Text,
    -- | The name of the namespace isolation policy
    clustersGetNamespaceIsolationPolicyPolicyName :: Text
  }
  deriving (Show, Eq, Generic)

clustersGetNamespaceIsolationPolicy :: ClustersGetNamespaceIsolationPolicyParameters -> ClientM NamespaceIsolationData
clustersGetNamespaceIsolationPolicy ClustersGetNamespaceIsolationPolicyParameters {..} = client (Proxy :: Proxy ClustersGetNamespaceIsolationPolicyAPI) (clustersGetNamespaceIsolationPolicyCluster) (clustersGetNamespaceIsolationPolicyPolicyName)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersGetPeerClusterAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "peers" :> Verb 'GET 200 '[JSON] [Text]

data ClustersGetPeerClusterParameters = ClustersGetPeerClusterParameters
  { -- | The cluster name
    clustersGetPeerClusterCluster :: Text
  }
  deriving (Show, Eq, Generic)

clustersGetPeerCluster :: ClustersGetPeerClusterParameters -> ClientM [Text]
clustersGetPeerCluster ClustersGetPeerClusterParameters {..} = client (Proxy :: Proxy ClustersGetPeerClusterAPI) (clustersGetPeerClusterCluster)
-- ^ This operation requires Pulsar superuser privileges.

type ClustersSetFailureDomainAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "failureDomains" :> Capture "domainName" Text :> ReqBody '[JSON] FailureDomain :> Verb 'POST 200 '[JSON] NoContent

data ClustersSetFailureDomainParameters = ClustersSetFailureDomainParameters
  { -- | The cluster name
    clustersSetFailureDomainCluster :: Text,
    -- | The failure domain name
    clustersSetFailureDomainDomainName :: Text,
    -- | The configuration data of a failure domain
    clustersSetFailureDomainBody :: FailureDomain
  }
  deriving (Show, Eq, Generic)

clustersSetFailureDomain :: ClustersSetFailureDomainParameters -> ClientM NoContent
clustersSetFailureDomain ClustersSetFailureDomainParameters {..} = client (Proxy :: Proxy ClustersSetFailureDomainAPI) (clustersSetFailureDomainCluster) (clustersSetFailureDomainDomainName) clustersSetFailureDomainBody
-- ^ This operation requires Pulsar superuser privileges.

type ClustersSetNamespaceIsolationPolicyAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "namespaceIsolationPolicies" :> Capture "policyName" Text :> ReqBody '[JSON] NamespaceIsolationData :> Verb 'POST 200 '[JSON] NoContent

data ClustersSetNamespaceIsolationPolicyParameters = ClustersSetNamespaceIsolationPolicyParameters
  { -- | The cluster name
    clustersSetNamespaceIsolationPolicyCluster :: Text,
    -- | The namespace isolation policy name
    clustersSetNamespaceIsolationPolicyPolicyName :: Text,
    -- | The namespace isolation policy data
    clustersSetNamespaceIsolationPolicyBody :: NamespaceIsolationData
  }
  deriving (Show, Eq, Generic)

clustersSetNamespaceIsolationPolicy :: ClustersSetNamespaceIsolationPolicyParameters -> ClientM NoContent
clustersSetNamespaceIsolationPolicy ClustersSetNamespaceIsolationPolicyParameters {..} = client (Proxy :: Proxy ClustersSetNamespaceIsolationPolicyAPI) (clustersSetNamespaceIsolationPolicyCluster) (clustersSetNamespaceIsolationPolicyPolicyName) clustersSetNamespaceIsolationPolicyBody
-- ^ This operation requires Pulsar superuser privileges.

type ClustersSetPeerClusterNamesAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> "peers" :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

data ClustersSetPeerClusterNamesParameters = ClustersSetPeerClusterNamesParameters
  { -- | The cluster name
    clustersSetPeerClusterNamesCluster :: Text,
    -- | The list of peer cluster names
    clustersSetPeerClusterNamesBody :: [Text]
  }
  deriving (Show, Eq, Generic)

clustersSetPeerClusterNames :: ClustersSetPeerClusterNamesParameters -> ClientM NoContent
clustersSetPeerClusterNames ClustersSetPeerClusterNamesParameters {..} = client (Proxy :: Proxy ClustersSetPeerClusterNamesAPI) (clustersSetPeerClusterNamesCluster) clustersSetPeerClusterNamesBody
-- ^ This operation requires Pulsar superuser privileges.

type ClustersUpdateClusterAPI =
  "admin" :> "v2" :> "clusters" :> Capture "cluster" Text :> ReqBody '[JSON] ClusterData :> Verb 'POST 200 '[JSON] NoContent

data ClustersUpdateClusterParameters = ClustersUpdateClusterParameters
  { -- | The cluster name
    clustersUpdateClusterCluster :: Text,
    -- | The cluster data
    clustersUpdateClusterBody :: ClusterData
  }
  deriving (Show, Eq, Generic)

clustersUpdateCluster :: ClustersUpdateClusterParameters -> ClientM NoContent
clustersUpdateCluster ClustersUpdateClusterParameters {..} = client (Proxy :: Proxy ClustersUpdateClusterAPI) (clustersUpdateClusterCluster) clustersUpdateClusterBody
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

workerGetAssignments :: ClientM (Map.Map String Value)
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

data NamespacesClearNamespaceBacklogParameters = NamespacesClearNamespaceBacklogParameters
  { -- |
    namespacesClearNamespaceBacklogTenant :: Text,
    -- |
    namespacesClearNamespaceBacklogNamespace :: Text,
    -- |
    namespacesClearNamespaceBacklogAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

namespacesClearNamespaceBacklog :: NamespacesClearNamespaceBacklogParameters -> ClientM NoContent
namespacesClearNamespaceBacklog NamespacesClearNamespaceBacklogParameters {..} = client (Proxy :: Proxy NamespacesClearNamespaceBacklogAPI) (namespacesClearNamespaceBacklogTenant) (namespacesClearNamespaceBacklogNamespace) (namespacesClearNamespaceBacklogAuthoritative)
-- ^

type NamespacesClearNamespaceBacklogForSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "clearBacklog" :> Capture "subscription" Text :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data NamespacesClearNamespaceBacklogForSubscriptionParameters = NamespacesClearNamespaceBacklogForSubscriptionParameters
  { -- |
    namespacesClearNamespaceBacklogForSubscriptionTenant :: Text,
    -- |
    namespacesClearNamespaceBacklogForSubscriptionNamespace :: Text,
    -- |
    namespacesClearNamespaceBacklogForSubscriptionSubscription :: Text,
    -- |
    namespacesClearNamespaceBacklogForSubscriptionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

namespacesClearNamespaceBacklogForSubscription :: NamespacesClearNamespaceBacklogForSubscriptionParameters -> ClientM NoContent
namespacesClearNamespaceBacklogForSubscription NamespacesClearNamespaceBacklogForSubscriptionParameters {..} = client (Proxy :: Proxy NamespacesClearNamespaceBacklogForSubscriptionAPI) (namespacesClearNamespaceBacklogForSubscriptionTenant) (namespacesClearNamespaceBacklogForSubscriptionNamespace) (namespacesClearNamespaceBacklogForSubscriptionSubscription) (namespacesClearNamespaceBacklogForSubscriptionAuthoritative)
-- ^

type NamespacesClearNamespaceBundleBacklogAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> "clearBacklog" :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data NamespacesClearNamespaceBundleBacklogParameters = NamespacesClearNamespaceBundleBacklogParameters
  { -- |
    namespacesClearNamespaceBundleBacklogTenant :: Text,
    -- |
    namespacesClearNamespaceBundleBacklogNamespace :: Text,
    -- |
    namespacesClearNamespaceBundleBacklogBundle :: Text,
    -- |
    namespacesClearNamespaceBundleBacklogAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

namespacesClearNamespaceBundleBacklog :: NamespacesClearNamespaceBundleBacklogParameters -> ClientM NoContent
namespacesClearNamespaceBundleBacklog NamespacesClearNamespaceBundleBacklogParameters {..} = client (Proxy :: Proxy NamespacesClearNamespaceBundleBacklogAPI) (namespacesClearNamespaceBundleBacklogTenant) (namespacesClearNamespaceBundleBacklogNamespace) (namespacesClearNamespaceBundleBacklogBundle) (namespacesClearNamespaceBundleBacklogAuthoritative)
-- ^

type NamespacesClearNamespaceBundleBacklogForSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> "clearBacklog" :> Capture "subscription" Text :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data NamespacesClearNamespaceBundleBacklogForSubscriptionParameters = NamespacesClearNamespaceBundleBacklogForSubscriptionParameters
  { -- |
    namespacesClearNamespaceBundleBacklogForSubscriptionTenant :: Text,
    -- |
    namespacesClearNamespaceBundleBacklogForSubscriptionNamespace :: Text,
    -- |
    namespacesClearNamespaceBundleBacklogForSubscriptionSubscription :: Text,
    -- |
    namespacesClearNamespaceBundleBacklogForSubscriptionBundle :: Text,
    -- |
    namespacesClearNamespaceBundleBacklogForSubscriptionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

namespacesClearNamespaceBundleBacklogForSubscription :: NamespacesClearNamespaceBundleBacklogForSubscriptionParameters -> ClientM NoContent
namespacesClearNamespaceBundleBacklogForSubscription NamespacesClearNamespaceBundleBacklogForSubscriptionParameters {..} = client (Proxy :: Proxy NamespacesClearNamespaceBundleBacklogForSubscriptionAPI) (namespacesClearNamespaceBundleBacklogForSubscriptionTenant) (namespacesClearNamespaceBundleBacklogForSubscriptionNamespace) (namespacesClearNamespaceBundleBacklogForSubscriptionSubscription) (namespacesClearNamespaceBundleBacklogForSubscriptionBundle) (namespacesClearNamespaceBundleBacklogForSubscriptionAuthoritative)
-- ^

type NamespacesClearOffloadDeletionLagAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "offloadDeletionLagMs" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesClearOffloadDeletionLagParameters = NamespacesClearOffloadDeletionLagParameters
  { -- |
    namespacesClearOffloadDeletionLagTenant :: Text,
    -- |
    namespacesClearOffloadDeletionLagNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesClearOffloadDeletionLag :: NamespacesClearOffloadDeletionLagParameters -> ClientM NoContent
namespacesClearOffloadDeletionLag NamespacesClearOffloadDeletionLagParameters {..} = client (Proxy :: Proxy NamespacesClearOffloadDeletionLagAPI) (namespacesClearOffloadDeletionLagTenant) (namespacesClearOffloadDeletionLagNamespace)
-- ^

type NamespacesClearPropertiesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "properties" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesClearPropertiesParameters = NamespacesClearPropertiesParameters
  { -- |
    namespacesClearPropertiesTenant :: Text,
    -- |
    namespacesClearPropertiesNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesClearProperties :: NamespacesClearPropertiesParameters -> ClientM NoContent
namespacesClearProperties NamespacesClearPropertiesParameters {..} = client (Proxy :: Proxy NamespacesClearPropertiesAPI) (namespacesClearPropertiesTenant) (namespacesClearPropertiesNamespace)
-- ^

type NamespacesCreateNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> ReqBody '[JSON] Policies :> Verb 'PUT 200 '[JSON] NoContent

data NamespacesCreateNamespaceParameters = NamespacesCreateNamespaceParameters
  { -- |
    namespacesCreateNamespaceTenant :: Text,
    -- |
    namespacesCreateNamespaceNamespace :: Text,
    -- | Policies for the namespace
    namespacesCreateNamespaceBody :: Policies
  }
  deriving (Show, Eq, Generic)

namespacesCreateNamespace :: NamespacesCreateNamespaceParameters -> ClientM NoContent
namespacesCreateNamespace NamespacesCreateNamespaceParameters {..} = client (Proxy :: Proxy NamespacesCreateNamespaceAPI) (namespacesCreateNamespaceTenant) (namespacesCreateNamespaceNamespace) namespacesCreateNamespaceBody
-- ^

type NamespacesDeleteBookieAffinityGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "property" Text :> Capture "namespace" Text :> "persistence" :> "bookieAffinity" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesDeleteBookieAffinityGroupParameters = NamespacesDeleteBookieAffinityGroupParameters
  { -- |
    namespacesDeleteBookieAffinityGroupProperty :: Text,
    -- |
    namespacesDeleteBookieAffinityGroupNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesDeleteBookieAffinityGroup :: NamespacesDeleteBookieAffinityGroupParameters -> ClientM NoContent
namespacesDeleteBookieAffinityGroup NamespacesDeleteBookieAffinityGroupParameters {..} = client (Proxy :: Proxy NamespacesDeleteBookieAffinityGroupAPI) (namespacesDeleteBookieAffinityGroupProperty) (namespacesDeleteBookieAffinityGroupNamespace)
-- ^ The backlog size is compared to the threshold periodically. A threshold of 0 disabled automatic compaction

type NamespacesDeleteCompactionThresholdAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "compactionThreshold" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesDeleteCompactionThresholdParameters = NamespacesDeleteCompactionThresholdParameters
  { -- |
    namespacesDeleteCompactionThresholdTenant :: Text,
    -- |
    namespacesDeleteCompactionThresholdNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesDeleteCompactionThreshold :: NamespacesDeleteCompactionThresholdParameters -> ClientM NoContent
namespacesDeleteCompactionThreshold NamespacesDeleteCompactionThresholdParameters {..} = client (Proxy :: Proxy NamespacesDeleteCompactionThresholdAPI) (namespacesDeleteCompactionThresholdTenant) (namespacesDeleteCompactionThresholdNamespace)
-- ^

type NamespacesDeleteDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "dispatchRate" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesDeleteDispatchRateParameters = NamespacesDeleteDispatchRateParameters
  { -- |
    namespacesDeleteDispatchRateTenant :: Text,
    -- |
    namespacesDeleteDispatchRateNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesDeleteDispatchRate :: NamespacesDeleteDispatchRateParameters -> ClientM NoContent
namespacesDeleteDispatchRate NamespacesDeleteDispatchRateParameters {..} = client (Proxy :: Proxy NamespacesDeleteDispatchRateAPI) (namespacesDeleteDispatchRateTenant) (namespacesDeleteDispatchRateNamespace)
-- ^

type NamespacesDeleteNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesDeleteNamespaceParameters = NamespacesDeleteNamespaceParameters
  { -- |
    namespacesDeleteNamespaceTenant :: Text,
    -- |
    namespacesDeleteNamespaceNamespace :: Text,
    -- |
    namespacesDeleteNamespaceForce :: Maybe Bool,
    -- |
    namespacesDeleteNamespaceAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

namespacesDeleteNamespace :: NamespacesDeleteNamespaceParameters -> ClientM NoContent
namespacesDeleteNamespace NamespacesDeleteNamespaceParameters {..} = client (Proxy :: Proxy NamespacesDeleteNamespaceAPI) (namespacesDeleteNamespaceTenant) (namespacesDeleteNamespaceNamespace) (namespacesDeleteNamespaceForce) (namespacesDeleteNamespaceAuthoritative)
-- ^

type NamespacesDeleteNamespaceBundleAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesDeleteNamespaceBundleParameters = NamespacesDeleteNamespaceBundleParameters
  { -- |
    namespacesDeleteNamespaceBundleTenant :: Text,
    -- |
    namespacesDeleteNamespaceBundleNamespace :: Text,
    -- |
    namespacesDeleteNamespaceBundleBundle :: Text,
    -- |
    namespacesDeleteNamespaceBundleForce :: Maybe Bool,
    -- |
    namespacesDeleteNamespaceBundleAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

namespacesDeleteNamespaceBundle :: NamespacesDeleteNamespaceBundleParameters -> ClientM NoContent
namespacesDeleteNamespaceBundle NamespacesDeleteNamespaceBundleParameters {..} = client (Proxy :: Proxy NamespacesDeleteNamespaceBundleAPI) (namespacesDeleteNamespaceBundleTenant) (namespacesDeleteNamespaceBundleNamespace) (namespacesDeleteNamespaceBundleBundle) (namespacesDeleteNamespaceBundleForce) (namespacesDeleteNamespaceBundleAuthoritative)
-- ^

type NamespacesDeletePersistenceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "persistence" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesDeletePersistenceParameters = NamespacesDeletePersistenceParameters
  { -- |
    namespacesDeletePersistenceTenant :: Text,
    -- |
    namespacesDeletePersistenceNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesDeletePersistence :: NamespacesDeletePersistenceParameters -> ClientM NoContent
namespacesDeletePersistence NamespacesDeletePersistenceParameters {..} = client (Proxy :: Proxy NamespacesDeletePersistenceAPI) (namespacesDeletePersistenceTenant) (namespacesDeletePersistenceNamespace)
-- ^

type NamespacesDeleteSubscribeRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscribeRate" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesDeleteSubscribeRateParameters = NamespacesDeleteSubscribeRateParameters
  { -- |
    namespacesDeleteSubscribeRateTenant :: Text,
    -- |
    namespacesDeleteSubscribeRateNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesDeleteSubscribeRate :: NamespacesDeleteSubscribeRateParameters -> ClientM NoContent
namespacesDeleteSubscribeRate NamespacesDeleteSubscribeRateParameters {..} = client (Proxy :: Proxy NamespacesDeleteSubscribeRateAPI) (namespacesDeleteSubscribeRateTenant) (namespacesDeleteSubscribeRateNamespace)
-- ^

type NamespacesDeleteSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionDispatchRate" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesDeleteSubscriptionDispatchRateParameters = NamespacesDeleteSubscriptionDispatchRateParameters
  { -- |
    namespacesDeleteSubscriptionDispatchRateTenant :: Text,
    -- |
    namespacesDeleteSubscriptionDispatchRateNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesDeleteSubscriptionDispatchRate :: NamespacesDeleteSubscriptionDispatchRateParameters -> ClientM NoContent
namespacesDeleteSubscriptionDispatchRate NamespacesDeleteSubscriptionDispatchRateParameters {..} = client (Proxy :: Proxy NamespacesDeleteSubscriptionDispatchRateAPI) (namespacesDeleteSubscriptionDispatchRateTenant) (namespacesDeleteSubscriptionDispatchRateNamespace)
-- ^

type NamespacesGetAntiAffinityNamespacesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "cluster" Text :> "antiAffinity" :> Capture "group" Text :> QueryParam "tenant" Text :> Verb 'GET 200 '[JSON] [Text]

data NamespacesGetAntiAffinityNamespacesParameters = NamespacesGetAntiAffinityNamespacesParameters
  { -- |
    namespacesGetAntiAffinityNamespacesCluster :: Text,
    -- |
    namespacesGetAntiAffinityNamespacesGroup :: Text,
    -- |
    namespacesGetAntiAffinityNamespacesTenant :: Maybe Text
  }
  deriving (Show, Eq, Generic)

namespacesGetAntiAffinityNamespaces :: NamespacesGetAntiAffinityNamespacesParameters -> ClientM [Text]
namespacesGetAntiAffinityNamespaces NamespacesGetAntiAffinityNamespacesParameters {..} = client (Proxy :: Proxy NamespacesGetAntiAffinityNamespacesAPI) (namespacesGetAntiAffinityNamespacesCluster) (namespacesGetAntiAffinityNamespacesGroup) (namespacesGetAntiAffinityNamespacesTenant)
-- ^

type NamespacesGetBacklogQuotaMapAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "backlogQuotaMap" :> Verb 'GET 200 '[JSON] ((Map.Map String BacklogQuota))

data NamespacesGetBacklogQuotaMapParameters = NamespacesGetBacklogQuotaMapParameters
  { -- |
    namespacesGetBacklogQuotaMapTenant :: Text,
    -- |
    namespacesGetBacklogQuotaMapNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetBacklogQuotaMap :: NamespacesGetBacklogQuotaMapParameters -> ClientM (Map.Map String BacklogQuota)
namespacesGetBacklogQuotaMap NamespacesGetBacklogQuotaMapParameters {..} = client (Proxy :: Proxy NamespacesGetBacklogQuotaMapAPI) (namespacesGetBacklogQuotaMapTenant) (namespacesGetBacklogQuotaMapNamespace)
-- ^

type NamespacesGetBookieAffinityGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "property" Text :> Capture "namespace" Text :> "persistence" :> "bookieAffinity" :> Verb 'GET 200 '[JSON] BookieAffinityGroupData

data NamespacesGetBookieAffinityGroupParameters = NamespacesGetBookieAffinityGroupParameters
  { -- |
    namespacesGetBookieAffinityGroupProperty :: Text,
    -- |
    namespacesGetBookieAffinityGroupNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetBookieAffinityGroup :: NamespacesGetBookieAffinityGroupParameters -> ClientM BookieAffinityGroupData
namespacesGetBookieAffinityGroup NamespacesGetBookieAffinityGroupParameters {..} = client (Proxy :: Proxy NamespacesGetBookieAffinityGroupAPI) (namespacesGetBookieAffinityGroupProperty) (namespacesGetBookieAffinityGroupNamespace)
-- ^

type NamespacesGetBundlesDataAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "bundles" :> Verb 'GET 200 '[JSON] BundlesData

data NamespacesGetBundlesDataParameters = NamespacesGetBundlesDataParameters
  { -- |
    namespacesGetBundlesDataTenant :: Text,
    -- |
    namespacesGetBundlesDataNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetBundlesData :: NamespacesGetBundlesDataParameters -> ClientM BundlesData
namespacesGetBundlesData NamespacesGetBundlesDataParameters {..} = client (Proxy :: Proxy NamespacesGetBundlesDataAPI) (namespacesGetBundlesDataTenant) (namespacesGetBundlesDataNamespace)
-- ^ The backlog size is compared to the threshold periodically. A threshold of 0 disabled automatic compaction

type NamespacesGetCompactionThresholdAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "compactionThreshold" :> Verb 'GET 200 '[JSON] Integer

data NamespacesGetCompactionThresholdParameters = NamespacesGetCompactionThresholdParameters
  { -- |
    namespacesGetCompactionThresholdTenant :: Text,
    -- |
    namespacesGetCompactionThresholdNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetCompactionThreshold :: NamespacesGetCompactionThresholdParameters -> ClientM Integer
namespacesGetCompactionThreshold NamespacesGetCompactionThresholdParameters {..} = client (Proxy :: Proxy NamespacesGetCompactionThresholdAPI) (namespacesGetCompactionThresholdTenant) (namespacesGetCompactionThresholdNamespace)
-- ^

type NamespacesGetDeduplicationAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "deduplication" :> Verb 'GET 200 '[JSON] Bool

data NamespacesGetDeduplicationParameters = NamespacesGetDeduplicationParameters
  { -- |
    namespacesGetDeduplicationTenant :: Text,
    -- |
    namespacesGetDeduplicationNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetDeduplication :: NamespacesGetDeduplicationParameters -> ClientM Bool
namespacesGetDeduplication NamespacesGetDeduplicationParameters {..} = client (Proxy :: Proxy NamespacesGetDeduplicationAPI) (namespacesGetDeduplicationTenant) (namespacesGetDeduplicationNamespace)
-- ^

type NamespacesGetDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "deduplicationSnapshotInterval" :> Verb 'GET 200 '[JSON] Int

data NamespacesGetDeduplicationSnapshotIntervalParameters = NamespacesGetDeduplicationSnapshotIntervalParameters
  { -- |
    namespacesGetDeduplicationSnapshotIntervalTenant :: Text,
    -- |
    namespacesGetDeduplicationSnapshotIntervalNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetDeduplicationSnapshotInterval :: NamespacesGetDeduplicationSnapshotIntervalParameters -> ClientM Int
namespacesGetDeduplicationSnapshotInterval NamespacesGetDeduplicationSnapshotIntervalParameters {..} = client (Proxy :: Proxy NamespacesGetDeduplicationSnapshotIntervalAPI) (namespacesGetDeduplicationSnapshotIntervalTenant) (namespacesGetDeduplicationSnapshotIntervalNamespace)
-- ^

type NamespacesGetDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "delayedDelivery" :> Verb 'GET 200 '[JSON] DelayedDeliveryPolicies

data NamespacesGetDelayedDeliveryPoliciesParameters = NamespacesGetDelayedDeliveryPoliciesParameters
  { -- |
    namespacesGetDelayedDeliveryPoliciesTenant :: Text,
    -- |
    namespacesGetDelayedDeliveryPoliciesNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetDelayedDeliveryPolicies :: NamespacesGetDelayedDeliveryPoliciesParameters -> ClientM DelayedDeliveryPolicies
namespacesGetDelayedDeliveryPolicies NamespacesGetDelayedDeliveryPoliciesParameters {..} = client (Proxy :: Proxy NamespacesGetDelayedDeliveryPoliciesAPI) (namespacesGetDelayedDeliveryPoliciesTenant) (namespacesGetDelayedDeliveryPoliciesNamespace)
-- ^

type NamespacesGetDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "dispatchRate" :> Verb 'GET 200 '[JSON] DispatchRate

data NamespacesGetDispatchRateParameters = NamespacesGetDispatchRateParameters
  { -- |
    namespacesGetDispatchRateTenant :: Text,
    -- |
    namespacesGetDispatchRateNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetDispatchRate :: NamespacesGetDispatchRateParameters -> ClientM DispatchRate
namespacesGetDispatchRate NamespacesGetDispatchRateParameters {..} = client (Proxy :: Proxy NamespacesGetDispatchRateAPI) (namespacesGetDispatchRateTenant) (namespacesGetDispatchRateNamespace)
-- ^

type NamespacesGetInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "inactiveTopicPolicies" :> Verb 'GET 200 '[JSON] InactiveTopicPolicies

data NamespacesGetInactiveTopicPoliciesParameters = NamespacesGetInactiveTopicPoliciesParameters
  { -- |
    namespacesGetInactiveTopicPoliciesTenant :: Text,
    -- |
    namespacesGetInactiveTopicPoliciesNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetInactiveTopicPolicies :: NamespacesGetInactiveTopicPoliciesParameters -> ClientM InactiveTopicPolicies
namespacesGetInactiveTopicPolicies NamespacesGetInactiveTopicPoliciesParameters {..} = client (Proxy :: Proxy NamespacesGetInactiveTopicPoliciesAPI) (namespacesGetInactiveTopicPoliciesTenant) (namespacesGetInactiveTopicPoliciesNamespace)
-- ^

type NamespacesGetIsAllowAutoUpdateSchemaAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "isAllowAutoUpdateSchema" :> Verb 'GET 200 '[JSON] Bool

data NamespacesGetIsAllowAutoUpdateSchemaParameters = NamespacesGetIsAllowAutoUpdateSchemaParameters
  { -- |
    namespacesGetIsAllowAutoUpdateSchemaTenant :: Text,
    -- |
    namespacesGetIsAllowAutoUpdateSchemaNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetIsAllowAutoUpdateSchema :: NamespacesGetIsAllowAutoUpdateSchemaParameters -> ClientM Bool
namespacesGetIsAllowAutoUpdateSchema NamespacesGetIsAllowAutoUpdateSchemaParameters {..} = client (Proxy :: Proxy NamespacesGetIsAllowAutoUpdateSchemaAPI) (namespacesGetIsAllowAutoUpdateSchemaTenant) (namespacesGetIsAllowAutoUpdateSchemaNamespace)
-- ^

type NamespacesGetMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxConsumersPerSubscription" :> Verb 'GET 200 '[JSON] Int

data NamespacesGetMaxConsumersPerSubscriptionParameters = NamespacesGetMaxConsumersPerSubscriptionParameters
  { -- |
    namespacesGetMaxConsumersPerSubscriptionTenant :: Text,
    -- |
    namespacesGetMaxConsumersPerSubscriptionNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetMaxConsumersPerSubscription :: NamespacesGetMaxConsumersPerSubscriptionParameters -> ClientM Int
namespacesGetMaxConsumersPerSubscription NamespacesGetMaxConsumersPerSubscriptionParameters {..} = client (Proxy :: Proxy NamespacesGetMaxConsumersPerSubscriptionAPI) (namespacesGetMaxConsumersPerSubscriptionTenant) (namespacesGetMaxConsumersPerSubscriptionNamespace)
-- ^

type NamespacesGetMaxConsumersPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxConsumersPerTopic" :> Verb 'GET 200 '[JSON] Int

data NamespacesGetMaxConsumersPerTopicParameters = NamespacesGetMaxConsumersPerTopicParameters
  { -- |
    namespacesGetMaxConsumersPerTopicTenant :: Text,
    -- |
    namespacesGetMaxConsumersPerTopicNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetMaxConsumersPerTopic :: NamespacesGetMaxConsumersPerTopicParameters -> ClientM Int
namespacesGetMaxConsumersPerTopic NamespacesGetMaxConsumersPerTopicParameters {..} = client (Proxy :: Proxy NamespacesGetMaxConsumersPerTopicAPI) (namespacesGetMaxConsumersPerTopicTenant) (namespacesGetMaxConsumersPerTopicNamespace)
-- ^

type NamespacesGetMaxProducersPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxProducersPerTopic" :> Verb 'GET 200 '[JSON] Int

data NamespacesGetMaxProducersPerTopicParameters = NamespacesGetMaxProducersPerTopicParameters
  { -- |
    namespacesGetMaxProducersPerTopicTenant :: Text,
    -- |
    namespacesGetMaxProducersPerTopicNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetMaxProducersPerTopic :: NamespacesGetMaxProducersPerTopicParameters -> ClientM Int
namespacesGetMaxProducersPerTopic NamespacesGetMaxProducersPerTopicParameters {..} = client (Proxy :: Proxy NamespacesGetMaxProducersPerTopicAPI) (namespacesGetMaxProducersPerTopicTenant) (namespacesGetMaxProducersPerTopicNamespace)
-- ^

type NamespacesGetMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxSubscriptionsPerTopic" :> Verb 'GET 200 '[JSON] Int

data NamespacesGetMaxSubscriptionsPerTopicParameters = NamespacesGetMaxSubscriptionsPerTopicParameters
  { -- |
    namespacesGetMaxSubscriptionsPerTopicTenant :: Text,
    -- |
    namespacesGetMaxSubscriptionsPerTopicNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetMaxSubscriptionsPerTopic :: NamespacesGetMaxSubscriptionsPerTopicParameters -> ClientM Int
namespacesGetMaxSubscriptionsPerTopic NamespacesGetMaxSubscriptionsPerTopicParameters {..} = client (Proxy :: Proxy NamespacesGetMaxSubscriptionsPerTopicAPI) (namespacesGetMaxSubscriptionsPerTopicTenant) (namespacesGetMaxSubscriptionsPerTopicNamespace)
-- ^

type NamespacesGetMaxTopicsPerNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxTopicsPerNamespace" :> Verb 'GET 200 '[JSON] Int

data NamespacesGetMaxTopicsPerNamespaceParameters = NamespacesGetMaxTopicsPerNamespaceParameters
  { -- |
    namespacesGetMaxTopicsPerNamespaceTenant :: Text,
    -- |
    namespacesGetMaxTopicsPerNamespaceNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetMaxTopicsPerNamespace :: NamespacesGetMaxTopicsPerNamespaceParameters -> ClientM Int
namespacesGetMaxTopicsPerNamespace NamespacesGetMaxTopicsPerNamespaceParameters {..} = client (Proxy :: Proxy NamespacesGetMaxTopicsPerNamespaceAPI) (namespacesGetMaxTopicsPerNamespaceTenant) (namespacesGetMaxTopicsPerNamespaceNamespace)
-- ^

type NamespacesGetMaxUnackedMessagesPerConsumerAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxUnackedMessagesPerConsumer" :> Verb 'GET 200 '[JSON] Int

data NamespacesGetMaxUnackedMessagesPerConsumerParameters = NamespacesGetMaxUnackedMessagesPerConsumerParameters
  { -- |
    namespacesGetMaxUnackedMessagesPerConsumerTenant :: Text,
    -- |
    namespacesGetMaxUnackedMessagesPerConsumerNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetMaxUnackedMessagesPerConsumer :: NamespacesGetMaxUnackedMessagesPerConsumerParameters -> ClientM Int
namespacesGetMaxUnackedMessagesPerConsumer NamespacesGetMaxUnackedMessagesPerConsumerParameters {..} = client (Proxy :: Proxy NamespacesGetMaxUnackedMessagesPerConsumerAPI) (namespacesGetMaxUnackedMessagesPerConsumerTenant) (namespacesGetMaxUnackedMessagesPerConsumerNamespace)
-- ^

type NamespacesGetMaxUnackedmessagesPerSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxUnackedMessagesPerSubscription" :> Verb 'GET 200 '[JSON] Int

data NamespacesGetMaxUnackedmessagesPerSubscriptionParameters = NamespacesGetMaxUnackedmessagesPerSubscriptionParameters
  { -- |
    namespacesGetMaxUnackedmessagesPerSubscriptionTenant :: Text,
    -- |
    namespacesGetMaxUnackedmessagesPerSubscriptionNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetMaxUnackedmessagesPerSubscription :: NamespacesGetMaxUnackedmessagesPerSubscriptionParameters -> ClientM Int
namespacesGetMaxUnackedmessagesPerSubscription NamespacesGetMaxUnackedmessagesPerSubscriptionParameters {..} = client (Proxy :: Proxy NamespacesGetMaxUnackedmessagesPerSubscriptionAPI) (namespacesGetMaxUnackedmessagesPerSubscriptionTenant) (namespacesGetMaxUnackedmessagesPerSubscriptionNamespace)
-- ^

type NamespacesGetNamespaceAntiAffinityGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "antiAffinity" :> Verb 'GET 200 '[JSON] Text

data NamespacesGetNamespaceAntiAffinityGroupParameters = NamespacesGetNamespaceAntiAffinityGroupParameters
  { -- |
    namespacesGetNamespaceAntiAffinityGroupTenant :: Text,
    -- |
    namespacesGetNamespaceAntiAffinityGroupNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetNamespaceAntiAffinityGroup :: NamespacesGetNamespaceAntiAffinityGroupParameters -> ClientM Text
namespacesGetNamespaceAntiAffinityGroup NamespacesGetNamespaceAntiAffinityGroupParameters {..} = client (Proxy :: Proxy NamespacesGetNamespaceAntiAffinityGroupAPI) (namespacesGetNamespaceAntiAffinityGroupTenant) (namespacesGetNamespaceAntiAffinityGroupNamespace)
-- ^

type NamespacesGetNamespaceMessageTTLAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "messageTTL" :> Verb 'GET 200 '[JSON] Int

data NamespacesGetNamespaceMessageTTLParameters = NamespacesGetNamespaceMessageTTLParameters
  { -- |
    namespacesGetNamespaceMessageTTLTenant :: Text,
    -- |
    namespacesGetNamespaceMessageTTLNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetNamespaceMessageTTL :: NamespacesGetNamespaceMessageTTLParameters -> ClientM Int
namespacesGetNamespaceMessageTTL NamespacesGetNamespaceMessageTTLParameters {..} = client (Proxy :: Proxy NamespacesGetNamespaceMessageTTLAPI) (namespacesGetNamespaceMessageTTLTenant) (namespacesGetNamespaceMessageTTLNamespace)
-- ^

type NamespacesGetNamespaceReplicationClustersAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "replication" :> Verb 'GET 200 '[JSON] [Text]

data NamespacesGetNamespaceReplicationClustersParameters = NamespacesGetNamespaceReplicationClustersParameters
  { -- |
    namespacesGetNamespaceReplicationClustersTenant :: Text,
    -- |
    namespacesGetNamespaceReplicationClustersNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetNamespaceReplicationClusters :: NamespacesGetNamespaceReplicationClustersParameters -> ClientM [Text]
namespacesGetNamespaceReplicationClusters NamespacesGetNamespaceReplicationClustersParameters {..} = client (Proxy :: Proxy NamespacesGetNamespaceReplicationClustersAPI) (namespacesGetNamespaceReplicationClustersTenant) (namespacesGetNamespaceReplicationClustersNamespace)
-- ^

type NamespacesGetNamespaceResourceGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "resourcegroup" :> Verb 'GET 200 '[JSON] Text

data NamespacesGetNamespaceResourceGroupParameters = NamespacesGetNamespaceResourceGroupParameters
  { -- |
    namespacesGetNamespaceResourceGroupTenant :: Text,
    -- |
    namespacesGetNamespaceResourceGroupNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetNamespaceResourceGroup :: NamespacesGetNamespaceResourceGroupParameters -> ClientM Text
namespacesGetNamespaceResourceGroup NamespacesGetNamespaceResourceGroupParameters {..} = client (Proxy :: Proxy NamespacesGetNamespaceResourceGroupAPI) (namespacesGetNamespaceResourceGroupTenant) (namespacesGetNamespaceResourceGroupNamespace)
-- ^ A negative value denotes that deletion has been completely disabled. 'null' denotes that the topics in the namespace will fall back to the broker default for deletion lag.

type NamespacesGetOffloadDeletionLagAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "offloadDeletionLagMs" :> Verb 'GET 200 '[JSON] Integer

data NamespacesGetOffloadDeletionLagParameters = NamespacesGetOffloadDeletionLagParameters
  { -- |
    namespacesGetOffloadDeletionLagTenant :: Text,
    -- |
    namespacesGetOffloadDeletionLagNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetOffloadDeletionLag :: NamespacesGetOffloadDeletionLagParameters -> ClientM Integer
namespacesGetOffloadDeletionLag NamespacesGetOffloadDeletionLagParameters {..} = client (Proxy :: Proxy NamespacesGetOffloadDeletionLagAPI) (namespacesGetOffloadDeletionLagTenant) (namespacesGetOffloadDeletionLagNamespace)
-- ^

type NamespacesGetOffloadPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "offloadPolicies" :> Verb 'GET 200 '[JSON] OffloadPoliciesImpl

data NamespacesGetOffloadPoliciesParameters = NamespacesGetOffloadPoliciesParameters
  { -- |
    namespacesGetOffloadPoliciesTenant :: Text,
    -- |
    namespacesGetOffloadPoliciesNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetOffloadPolicies :: NamespacesGetOffloadPoliciesParameters -> ClientM OffloadPoliciesImpl
namespacesGetOffloadPolicies NamespacesGetOffloadPoliciesParameters {..} = client (Proxy :: Proxy NamespacesGetOffloadPoliciesAPI) (namespacesGetOffloadPoliciesTenant) (namespacesGetOffloadPoliciesNamespace)
-- ^ A negative value disables automatic offloading

type NamespacesGetOffloadThresholdAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "offloadThreshold" :> Verb 'GET 200 '[JSON] Integer

data NamespacesGetOffloadThresholdParameters = NamespacesGetOffloadThresholdParameters
  { -- |
    namespacesGetOffloadThresholdTenant :: Text,
    -- |
    namespacesGetOffloadThresholdNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetOffloadThreshold :: NamespacesGetOffloadThresholdParameters -> ClientM Integer
namespacesGetOffloadThreshold NamespacesGetOffloadThresholdParameters {..} = client (Proxy :: Proxy NamespacesGetOffloadThresholdAPI) (namespacesGetOffloadThresholdTenant) (namespacesGetOffloadThresholdNamespace)
-- ^

type NamespacesGetPermissionsAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "permissions" :> Verb 'GET 200 '[JSON] ((Map.Map String [Text]))

data NamespacesGetPermissionsParameters = NamespacesGetPermissionsParameters
  { -- |
    namespacesGetPermissionsTenant :: Text,
    -- |
    namespacesGetPermissionsNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetPermissions :: NamespacesGetPermissionsParameters -> ClientM (Map.Map String [Text])
namespacesGetPermissions NamespacesGetPermissionsParameters {..} = client (Proxy :: Proxy NamespacesGetPermissionsAPI) (namespacesGetPermissionsTenant) (namespacesGetPermissionsNamespace)
-- ^

type NamespacesGetPersistenceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "persistence" :> Verb 'GET 200 '[JSON] PersistencePolicies

data NamespacesGetPersistenceParameters = NamespacesGetPersistenceParameters
  { -- |
    namespacesGetPersistenceTenant :: Text,
    -- |
    namespacesGetPersistenceNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetPersistence :: NamespacesGetPersistenceParameters -> ClientM PersistencePolicies
namespacesGetPersistence NamespacesGetPersistenceParameters {..} = client (Proxy :: Proxy NamespacesGetPersistenceAPI) (namespacesGetPersistenceTenant) (namespacesGetPersistenceNamespace)
-- ^

type NamespacesGetPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> Verb 'GET 200 '[JSON] Policies

data NamespacesGetPoliciesParameters = NamespacesGetPoliciesParameters
  { -- |
    namespacesGetPoliciesTenant :: Text,
    -- |
    namespacesGetPoliciesNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetPolicies :: NamespacesGetPoliciesParameters -> ClientM Policies
namespacesGetPolicies NamespacesGetPoliciesParameters {..} = client (Proxy :: Proxy NamespacesGetPoliciesAPI) (namespacesGetPoliciesTenant) (namespacesGetPoliciesNamespace)
-- ^

type NamespacesGetPropertiesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "properties" :> Verb 'GET 200 '[JSON] NoContent

data NamespacesGetPropertiesParameters = NamespacesGetPropertiesParameters
  { -- |
    namespacesGetPropertiesTenant :: Text,
    -- |
    namespacesGetPropertiesNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetProperties :: NamespacesGetPropertiesParameters -> ClientM NoContent
namespacesGetProperties NamespacesGetPropertiesParameters {..} = client (Proxy :: Proxy NamespacesGetPropertiesAPI) (namespacesGetPropertiesTenant) (namespacesGetPropertiesNamespace)
-- ^

type NamespacesGetPropertyAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "property" :> Capture "key" Text :> Verb 'GET 200 '[JSON] NoContent

data NamespacesGetPropertyParameters = NamespacesGetPropertyParameters
  { -- |
    namespacesGetPropertyTenant :: Text,
    -- |
    namespacesGetPropertyNamespace :: Text,
    -- |
    namespacesGetPropertyKey :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetProperty :: NamespacesGetPropertyParameters -> ClientM NoContent
namespacesGetProperty NamespacesGetPropertyParameters {..} = client (Proxy :: Proxy NamespacesGetPropertyAPI) (namespacesGetPropertyTenant) (namespacesGetPropertyNamespace) (namespacesGetPropertyKey)
-- ^

type NamespacesGetReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "replicatorDispatchRate" :> Verb 'GET 200 '[JSON] DispatchRate

data NamespacesGetReplicatorDispatchRateParameters = NamespacesGetReplicatorDispatchRateParameters
  { -- |
    namespacesGetReplicatorDispatchRateTenant :: Text,
    -- |
    namespacesGetReplicatorDispatchRateNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetReplicatorDispatchRate :: NamespacesGetReplicatorDispatchRateParameters -> ClientM DispatchRate
namespacesGetReplicatorDispatchRate NamespacesGetReplicatorDispatchRateParameters {..} = client (Proxy :: Proxy NamespacesGetReplicatorDispatchRateAPI) (namespacesGetReplicatorDispatchRateTenant) (namespacesGetReplicatorDispatchRateNamespace)
-- ^

type NamespacesGetRetentionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "retention" :> Verb 'GET 200 '[JSON] RetentionPolicies

data NamespacesGetRetentionParameters = NamespacesGetRetentionParameters
  { -- |
    namespacesGetRetentionTenant :: Text,
    -- |
    namespacesGetRetentionNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetRetention :: NamespacesGetRetentionParameters -> ClientM RetentionPolicies
namespacesGetRetention NamespacesGetRetentionParameters {..} = client (Proxy :: Proxy NamespacesGetRetentionAPI) (namespacesGetRetentionTenant) (namespacesGetRetentionNamespace)
-- ^ The value AutoUpdateDisabled prevents producers from updating the schema.  If set to AutoUpdateDisabled, schemas must be updated through the REST api

type NamespacesGetSchemaAutoUpdateCompatibilityStrategyAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "schemaAutoUpdateCompatibilityStrategy" :> Verb 'GET 200 '[JSON] Text

data NamespacesGetSchemaAutoUpdateCompatibilityStrategyParameters = NamespacesGetSchemaAutoUpdateCompatibilityStrategyParameters
  { -- |
    namespacesGetSchemaAutoUpdateCompatibilityStrategyTenant :: Text,
    -- |
    namespacesGetSchemaAutoUpdateCompatibilityStrategyNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetSchemaAutoUpdateCompatibilityStrategy :: NamespacesGetSchemaAutoUpdateCompatibilityStrategyParameters -> ClientM Text
namespacesGetSchemaAutoUpdateCompatibilityStrategy NamespacesGetSchemaAutoUpdateCompatibilityStrategyParameters {..} = client (Proxy :: Proxy NamespacesGetSchemaAutoUpdateCompatibilityStrategyAPI) (namespacesGetSchemaAutoUpdateCompatibilityStrategyTenant) (namespacesGetSchemaAutoUpdateCompatibilityStrategyNamespace)
-- ^

type NamespacesGetSchemaCompatibilityStrategyAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "schemaCompatibilityStrategy" :> Verb 'GET 200 '[JSON] Text

data NamespacesGetSchemaCompatibilityStrategyParameters = NamespacesGetSchemaCompatibilityStrategyParameters
  { -- |
    namespacesGetSchemaCompatibilityStrategyTenant :: Text,
    -- |
    namespacesGetSchemaCompatibilityStrategyNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetSchemaCompatibilityStrategy :: NamespacesGetSchemaCompatibilityStrategyParameters -> ClientM Text
namespacesGetSchemaCompatibilityStrategy NamespacesGetSchemaCompatibilityStrategyParameters {..} = client (Proxy :: Proxy NamespacesGetSchemaCompatibilityStrategyAPI) (namespacesGetSchemaCompatibilityStrategyTenant) (namespacesGetSchemaCompatibilityStrategyNamespace)
-- ^ If the flag is set to true, when a producer without a schema attempts to produce to a topic with schema in this namespace, the producer will be failed to connect. PLEASE be carefully on using this, since non-java clients don't support schema.if you enable this setting, it will cause non-java clients failed to produce.

type NamespacesGetSchemaValidtionEnforcedAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "schemaValidationEnforced" :> Verb 'GET 200 '[JSON] Bool

data NamespacesGetSchemaValidtionEnforcedParameters = NamespacesGetSchemaValidtionEnforcedParameters
  { -- |
    namespacesGetSchemaValidtionEnforcedTenant :: Text,
    -- |
    namespacesGetSchemaValidtionEnforcedNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetSchemaValidtionEnforced :: NamespacesGetSchemaValidtionEnforcedParameters -> ClientM Bool
namespacesGetSchemaValidtionEnforced NamespacesGetSchemaValidtionEnforcedParameters {..} = client (Proxy :: Proxy NamespacesGetSchemaValidtionEnforcedAPI) (namespacesGetSchemaValidtionEnforcedTenant) (namespacesGetSchemaValidtionEnforcedNamespace)
-- ^

type NamespacesGetSubscribeRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscribeRate" :> Verb 'GET 200 '[JSON] SubscribeRate

data NamespacesGetSubscribeRateParameters = NamespacesGetSubscribeRateParameters
  { -- |
    namespacesGetSubscribeRateTenant :: Text,
    -- |
    namespacesGetSubscribeRateNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetSubscribeRate :: NamespacesGetSubscribeRateParameters -> ClientM SubscribeRate
namespacesGetSubscribeRate NamespacesGetSubscribeRateParameters {..} = client (Proxy :: Proxy NamespacesGetSubscribeRateAPI) (namespacesGetSubscribeRateTenant) (namespacesGetSubscribeRateNamespace)
-- ^

type NamespacesGetSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionDispatchRate" :> Verb 'GET 200 '[JSON] DispatchRate

data NamespacesGetSubscriptionDispatchRateParameters = NamespacesGetSubscriptionDispatchRateParameters
  { -- |
    namespacesGetSubscriptionDispatchRateTenant :: Text,
    -- |
    namespacesGetSubscriptionDispatchRateNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetSubscriptionDispatchRate :: NamespacesGetSubscriptionDispatchRateParameters -> ClientM DispatchRate
namespacesGetSubscriptionDispatchRate NamespacesGetSubscriptionDispatchRateParameters {..} = client (Proxy :: Proxy NamespacesGetSubscriptionDispatchRateAPI) (namespacesGetSubscriptionDispatchRateTenant) (namespacesGetSubscriptionDispatchRateNamespace)
-- ^

type NamespacesGetSubscriptionExpirationTimeAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionExpirationTime" :> Verb 'GET 200 '[JSON] Int

data NamespacesGetSubscriptionExpirationTimeParameters = NamespacesGetSubscriptionExpirationTimeParameters
  { -- |
    namespacesGetSubscriptionExpirationTimeTenant :: Text,
    -- |
    namespacesGetSubscriptionExpirationTimeNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetSubscriptionExpirationTime :: NamespacesGetSubscriptionExpirationTimeParameters -> ClientM Int
namespacesGetSubscriptionExpirationTime NamespacesGetSubscriptionExpirationTimeParameters {..} = client (Proxy :: Proxy NamespacesGetSubscriptionExpirationTimeAPI) (namespacesGetSubscriptionExpirationTimeTenant) (namespacesGetSubscriptionExpirationTimeNamespace)
-- ^

type NamespacesGetSubscriptionTypesEnabledAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionTypesEnabled" :> Verb 'GET 200 '[JSON] [Text]

data NamespacesGetSubscriptionTypesEnabledParameters = NamespacesGetSubscriptionTypesEnabledParameters
  { -- |
    namespacesGetSubscriptionTypesEnabledTenant :: Text,
    -- |
    namespacesGetSubscriptionTypesEnabledNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetSubscriptionTypesEnabled :: NamespacesGetSubscriptionTypesEnabledParameters -> ClientM [Text]
namespacesGetSubscriptionTypesEnabled NamespacesGetSubscriptionTypesEnabledParameters {..} = client (Proxy :: Proxy NamespacesGetSubscriptionTypesEnabledAPI) (namespacesGetSubscriptionTypesEnabledTenant) (namespacesGetSubscriptionTypesEnabledNamespace)
-- ^

type NamespacesGetTenantNamespacesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Verb 'GET 200 '[JSON] [Text]

data NamespacesGetTenantNamespacesParameters = NamespacesGetTenantNamespacesParameters
  { -- |
    namespacesGetTenantNamespacesTenant :: Text
  }
  deriving (Show, Eq, Generic)

namespacesGetTenantNamespaces :: NamespacesGetTenantNamespacesParameters -> ClientM [Text]
namespacesGetTenantNamespaces NamespacesGetTenantNamespacesParameters {..} = client (Proxy :: Proxy NamespacesGetTenantNamespacesAPI) (namespacesGetTenantNamespacesTenant)
-- ^

type NamespacesGetTopicsAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "topics" :> QueryParam "mode" Text :> Verb 'GET 200 '[JSON] [Text]

data NamespacesGetTopicsParameters = NamespacesGetTopicsParameters
  { -- |
    namespacesGetTopicsTenant :: Text,
    -- |
    namespacesGetTopicsNamespace :: Text,
    -- |
    namespacesGetTopicsMode :: Maybe Text
  }
  deriving (Show, Eq, Generic)

namespacesGetTopics :: NamespacesGetTopicsParameters -> ClientM [Text]
namespacesGetTopics NamespacesGetTopicsParameters {..} = client (Proxy :: Proxy NamespacesGetTopicsAPI) (namespacesGetTopicsTenant) (namespacesGetTopicsNamespace) (namespacesGetTopicsMode)
-- ^

type NamespacesGrantPermissionOnNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "permissions" :> Capture "role" Text :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

data NamespacesGrantPermissionOnNamespaceParameters = NamespacesGrantPermissionOnNamespaceParameters
  { -- |
    namespacesGrantPermissionOnNamespaceTenant :: Text,
    -- |
    namespacesGrantPermissionOnNamespaceNamespace :: Text,
    -- |
    namespacesGrantPermissionOnNamespaceRole :: Text,
    -- | List of permissions for the specified role
    namespacesGrantPermissionOnNamespaceBody :: [Text]
  }
  deriving (Show, Eq, Generic)

namespacesGrantPermissionOnNamespace :: NamespacesGrantPermissionOnNamespaceParameters -> ClientM NoContent
namespacesGrantPermissionOnNamespace NamespacesGrantPermissionOnNamespaceParameters {..} = client (Proxy :: Proxy NamespacesGrantPermissionOnNamespaceAPI) (namespacesGrantPermissionOnNamespaceTenant) (namespacesGrantPermissionOnNamespaceNamespace) (namespacesGrantPermissionOnNamespaceRole) namespacesGrantPermissionOnNamespaceBody
-- ^

type NamespacesModifyDeduplicationAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "deduplication" :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

data NamespacesModifyDeduplicationParameters = NamespacesModifyDeduplicationParameters
  { -- |
    namespacesModifyDeduplicationTenant :: Text,
    -- |
    namespacesModifyDeduplicationNamespace :: Text,
    -- | Flag for disabling or enabling broker side deduplication for all topics in the specified namespace
    namespacesModifyDeduplicationBody :: Bool
  }
  deriving (Show, Eq, Generic)

namespacesModifyDeduplication :: NamespacesModifyDeduplicationParameters -> ClientM NoContent
namespacesModifyDeduplication NamespacesModifyDeduplicationParameters {..} = client (Proxy :: Proxy NamespacesModifyDeduplicationAPI) (namespacesModifyDeduplicationTenant) (namespacesModifyDeduplicationNamespace) namespacesModifyDeduplicationBody
-- ^

type NamespacesModifyEncryptionRequiredAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "encryptionRequired" :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

data NamespacesModifyEncryptionRequiredParameters = NamespacesModifyEncryptionRequiredParameters
  { -- |
    namespacesModifyEncryptionRequiredTenant :: Text,
    -- |
    namespacesModifyEncryptionRequiredNamespace :: Text,
    -- | Flag defining if message encryption is required
    namespacesModifyEncryptionRequiredBody :: Bool
  }
  deriving (Show, Eq, Generic)

namespacesModifyEncryptionRequired :: NamespacesModifyEncryptionRequiredParameters -> ClientM NoContent
namespacesModifyEncryptionRequired NamespacesModifyEncryptionRequiredParameters {..} = client (Proxy :: Proxy NamespacesModifyEncryptionRequiredAPI) (namespacesModifyEncryptionRequiredTenant) (namespacesModifyEncryptionRequiredNamespace) namespacesModifyEncryptionRequiredBody
-- ^

type NamespacesRemoveAutoSubscriptionCreationAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "autoSubscriptionCreation" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveAutoSubscriptionCreationParameters = NamespacesRemoveAutoSubscriptionCreationParameters
  { -- |
    namespacesRemoveAutoSubscriptionCreationTenant :: Text,
    -- |
    namespacesRemoveAutoSubscriptionCreationNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveAutoSubscriptionCreation :: NamespacesRemoveAutoSubscriptionCreationParameters -> ClientM NoContent
namespacesRemoveAutoSubscriptionCreation NamespacesRemoveAutoSubscriptionCreationParameters {..} = client (Proxy :: Proxy NamespacesRemoveAutoSubscriptionCreationAPI) (namespacesRemoveAutoSubscriptionCreationTenant) (namespacesRemoveAutoSubscriptionCreationNamespace)
-- ^

type NamespacesRemoveAutoTopicCreationAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "autoTopicCreation" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveAutoTopicCreationParameters = NamespacesRemoveAutoTopicCreationParameters
  { -- |
    namespacesRemoveAutoTopicCreationTenant :: Text,
    -- |
    namespacesRemoveAutoTopicCreationNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveAutoTopicCreation :: NamespacesRemoveAutoTopicCreationParameters -> ClientM NoContent
namespacesRemoveAutoTopicCreation NamespacesRemoveAutoTopicCreationParameters {..} = client (Proxy :: Proxy NamespacesRemoveAutoTopicCreationAPI) (namespacesRemoveAutoTopicCreationTenant) (namespacesRemoveAutoTopicCreationNamespace)
-- ^

type NamespacesRemoveBacklogQuotaAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "backlogQuota" :> QueryParam "backlogQuotaType" Text :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveBacklogQuotaParameters = NamespacesRemoveBacklogQuotaParameters
  { -- |
    namespacesRemoveBacklogQuotaTenant :: Text,
    -- |
    namespacesRemoveBacklogQuotaNamespace :: Text,
    -- |
    namespacesRemoveBacklogQuotaBacklogQuotaType :: Maybe Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveBacklogQuota :: NamespacesRemoveBacklogQuotaParameters -> ClientM NoContent
namespacesRemoveBacklogQuota NamespacesRemoveBacklogQuotaParameters {..} = client (Proxy :: Proxy NamespacesRemoveBacklogQuotaAPI) (namespacesRemoveBacklogQuotaTenant) (namespacesRemoveBacklogQuotaNamespace) (namespacesRemoveBacklogQuotaBacklogQuotaType)
-- ^

type NamespacesRemoveDeduplicationAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "deduplication" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveDeduplicationParameters = NamespacesRemoveDeduplicationParameters
  { -- |
    namespacesRemoveDeduplicationTenant :: Text,
    -- |
    namespacesRemoveDeduplicationNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveDeduplication :: NamespacesRemoveDeduplicationParameters -> ClientM NoContent
namespacesRemoveDeduplication NamespacesRemoveDeduplicationParameters {..} = client (Proxy :: Proxy NamespacesRemoveDeduplicationAPI) (namespacesRemoveDeduplicationTenant) (namespacesRemoveDeduplicationNamespace)
-- ^

type NamespacesRemoveDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "delayedDelivery" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveDelayedDeliveryPoliciesParameters = NamespacesRemoveDelayedDeliveryPoliciesParameters
  { -- |
    namespacesRemoveDelayedDeliveryPoliciesTenant :: Text,
    -- |
    namespacesRemoveDelayedDeliveryPoliciesNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveDelayedDeliveryPolicies :: NamespacesRemoveDelayedDeliveryPoliciesParameters -> ClientM NoContent
namespacesRemoveDelayedDeliveryPolicies NamespacesRemoveDelayedDeliveryPoliciesParameters {..} = client (Proxy :: Proxy NamespacesRemoveDelayedDeliveryPoliciesAPI) (namespacesRemoveDelayedDeliveryPoliciesTenant) (namespacesRemoveDelayedDeliveryPoliciesNamespace)
-- ^

type NamespacesRemoveInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "inactiveTopicPolicies" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveInactiveTopicPoliciesParameters = NamespacesRemoveInactiveTopicPoliciesParameters
  { -- |
    namespacesRemoveInactiveTopicPoliciesTenant :: Text,
    -- |
    namespacesRemoveInactiveTopicPoliciesNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveInactiveTopicPolicies :: NamespacesRemoveInactiveTopicPoliciesParameters -> ClientM NoContent
namespacesRemoveInactiveTopicPolicies NamespacesRemoveInactiveTopicPoliciesParameters {..} = client (Proxy :: Proxy NamespacesRemoveInactiveTopicPoliciesAPI) (namespacesRemoveInactiveTopicPoliciesTenant) (namespacesRemoveInactiveTopicPoliciesNamespace)
-- ^

type NamespacesRemoveMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxConsumersPerSubscription" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveMaxConsumersPerSubscriptionParameters = NamespacesRemoveMaxConsumersPerSubscriptionParameters
  { -- |
    namespacesRemoveMaxConsumersPerSubscriptionTenant :: Text,
    -- |
    namespacesRemoveMaxConsumersPerSubscriptionNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveMaxConsumersPerSubscription :: NamespacesRemoveMaxConsumersPerSubscriptionParameters -> ClientM NoContent
namespacesRemoveMaxConsumersPerSubscription NamespacesRemoveMaxConsumersPerSubscriptionParameters {..} = client (Proxy :: Proxy NamespacesRemoveMaxConsumersPerSubscriptionAPI) (namespacesRemoveMaxConsumersPerSubscriptionTenant) (namespacesRemoveMaxConsumersPerSubscriptionNamespace)
-- ^

type NamespacesRemoveMaxConsumersPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxConsumersPerTopic" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveMaxConsumersPerTopicParameters = NamespacesRemoveMaxConsumersPerTopicParameters
  { -- |
    namespacesRemoveMaxConsumersPerTopicTenant :: Text,
    -- |
    namespacesRemoveMaxConsumersPerTopicNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveMaxConsumersPerTopic :: NamespacesRemoveMaxConsumersPerTopicParameters -> ClientM NoContent
namespacesRemoveMaxConsumersPerTopic NamespacesRemoveMaxConsumersPerTopicParameters {..} = client (Proxy :: Proxy NamespacesRemoveMaxConsumersPerTopicAPI) (namespacesRemoveMaxConsumersPerTopicTenant) (namespacesRemoveMaxConsumersPerTopicNamespace)
-- ^

type NamespacesRemoveMaxProducersPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxProducersPerTopic" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveMaxProducersPerTopicParameters = NamespacesRemoveMaxProducersPerTopicParameters
  { -- |
    namespacesRemoveMaxProducersPerTopicTenant :: Text,
    -- |
    namespacesRemoveMaxProducersPerTopicNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveMaxProducersPerTopic :: NamespacesRemoveMaxProducersPerTopicParameters -> ClientM NoContent
namespacesRemoveMaxProducersPerTopic NamespacesRemoveMaxProducersPerTopicParameters {..} = client (Proxy :: Proxy NamespacesRemoveMaxProducersPerTopicAPI) (namespacesRemoveMaxProducersPerTopicTenant) (namespacesRemoveMaxProducersPerTopicNamespace)
-- ^

type NamespacesRemoveMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxSubscriptionsPerTopic" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveMaxSubscriptionsPerTopicParameters = NamespacesRemoveMaxSubscriptionsPerTopicParameters
  { -- |
    namespacesRemoveMaxSubscriptionsPerTopicTenant :: Text,
    -- |
    namespacesRemoveMaxSubscriptionsPerTopicNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveMaxSubscriptionsPerTopic :: NamespacesRemoveMaxSubscriptionsPerTopicParameters -> ClientM NoContent
namespacesRemoveMaxSubscriptionsPerTopic NamespacesRemoveMaxSubscriptionsPerTopicParameters {..} = client (Proxy :: Proxy NamespacesRemoveMaxSubscriptionsPerTopicAPI) (namespacesRemoveMaxSubscriptionsPerTopicTenant) (namespacesRemoveMaxSubscriptionsPerTopicNamespace)
-- ^

type NamespacesRemoveMaxTopicsPerNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxTopicsPerNamespace" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveMaxTopicsPerNamespaceParameters = NamespacesRemoveMaxTopicsPerNamespaceParameters
  { -- |
    namespacesRemoveMaxTopicsPerNamespaceTenant :: Text,
    -- |
    namespacesRemoveMaxTopicsPerNamespaceNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveMaxTopicsPerNamespace :: NamespacesRemoveMaxTopicsPerNamespaceParameters -> ClientM NoContent
namespacesRemoveMaxTopicsPerNamespace NamespacesRemoveMaxTopicsPerNamespaceParameters {..} = client (Proxy :: Proxy NamespacesRemoveMaxTopicsPerNamespaceAPI) (namespacesRemoveMaxTopicsPerNamespaceTenant) (namespacesRemoveMaxTopicsPerNamespaceNamespace)
-- ^

type NamespacesRemoveMaxUnackedmessagesPerConsumerAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxUnackedMessagesPerConsumer" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveMaxUnackedmessagesPerConsumerParameters = NamespacesRemoveMaxUnackedmessagesPerConsumerParameters
  { -- |
    namespacesRemoveMaxUnackedmessagesPerConsumerTenant :: Text,
    -- |
    namespacesRemoveMaxUnackedmessagesPerConsumerNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveMaxUnackedmessagesPerConsumer :: NamespacesRemoveMaxUnackedmessagesPerConsumerParameters -> ClientM NoContent
namespacesRemoveMaxUnackedmessagesPerConsumer NamespacesRemoveMaxUnackedmessagesPerConsumerParameters {..} = client (Proxy :: Proxy NamespacesRemoveMaxUnackedmessagesPerConsumerAPI) (namespacesRemoveMaxUnackedmessagesPerConsumerTenant) (namespacesRemoveMaxUnackedmessagesPerConsumerNamespace)
-- ^

type NamespacesRemoveMaxUnackedmessagesPerSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxUnackedMessagesPerSubscription" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveMaxUnackedmessagesPerSubscriptionParameters = NamespacesRemoveMaxUnackedmessagesPerSubscriptionParameters
  { -- |
    namespacesRemoveMaxUnackedmessagesPerSubscriptionTenant :: Text,
    -- |
    namespacesRemoveMaxUnackedmessagesPerSubscriptionNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveMaxUnackedmessagesPerSubscription :: NamespacesRemoveMaxUnackedmessagesPerSubscriptionParameters -> ClientM NoContent
namespacesRemoveMaxUnackedmessagesPerSubscription NamespacesRemoveMaxUnackedmessagesPerSubscriptionParameters {..} = client (Proxy :: Proxy NamespacesRemoveMaxUnackedmessagesPerSubscriptionAPI) (namespacesRemoveMaxUnackedmessagesPerSubscriptionTenant) (namespacesRemoveMaxUnackedmessagesPerSubscriptionNamespace)
-- ^

type NamespacesRemoveNamespaceAntiAffinityGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "antiAffinity" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveNamespaceAntiAffinityGroupParameters = NamespacesRemoveNamespaceAntiAffinityGroupParameters
  { -- |
    namespacesRemoveNamespaceAntiAffinityGroupTenant :: Text,
    -- |
    namespacesRemoveNamespaceAntiAffinityGroupNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveNamespaceAntiAffinityGroup :: NamespacesRemoveNamespaceAntiAffinityGroupParameters -> ClientM NoContent
namespacesRemoveNamespaceAntiAffinityGroup NamespacesRemoveNamespaceAntiAffinityGroupParameters {..} = client (Proxy :: Proxy NamespacesRemoveNamespaceAntiAffinityGroupAPI) (namespacesRemoveNamespaceAntiAffinityGroupTenant) (namespacesRemoveNamespaceAntiAffinityGroupNamespace)
-- ^

type NamespacesRemoveNamespaceMessageTTLAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "messageTTL" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveNamespaceMessageTTLParameters = NamespacesRemoveNamespaceMessageTTLParameters
  { -- |
    namespacesRemoveNamespaceMessageTTLTenant :: Text,
    -- |
    namespacesRemoveNamespaceMessageTTLNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveNamespaceMessageTTL :: NamespacesRemoveNamespaceMessageTTLParameters -> ClientM NoContent
namespacesRemoveNamespaceMessageTTL NamespacesRemoveNamespaceMessageTTLParameters {..} = client (Proxy :: Proxy NamespacesRemoveNamespaceMessageTTLAPI) (namespacesRemoveNamespaceMessageTTLTenant) (namespacesRemoveNamespaceMessageTTLNamespace)
-- ^

type NamespacesRemoveNamespaceResourceGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "resourcegroup" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveNamespaceResourceGroupParameters = NamespacesRemoveNamespaceResourceGroupParameters
  { -- |
    namespacesRemoveNamespaceResourceGroupTenant :: Text,
    -- |
    namespacesRemoveNamespaceResourceGroupNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveNamespaceResourceGroup :: NamespacesRemoveNamespaceResourceGroupParameters -> ClientM NoContent
namespacesRemoveNamespaceResourceGroup NamespacesRemoveNamespaceResourceGroupParameters {..} = client (Proxy :: Proxy NamespacesRemoveNamespaceResourceGroupAPI) (namespacesRemoveNamespaceResourceGroupTenant) (namespacesRemoveNamespaceResourceGroupNamespace)
-- ^

type NamespacesRemoveOffloadPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "removeOffloadPolicies" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveOffloadPoliciesParameters = NamespacesRemoveOffloadPoliciesParameters
  { -- |
    namespacesRemoveOffloadPoliciesTenant :: Text,
    -- |
    namespacesRemoveOffloadPoliciesNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveOffloadPolicies :: NamespacesRemoveOffloadPoliciesParameters -> ClientM NoContent
namespacesRemoveOffloadPolicies NamespacesRemoveOffloadPoliciesParameters {..} = client (Proxy :: Proxy NamespacesRemoveOffloadPoliciesAPI) (namespacesRemoveOffloadPoliciesTenant) (namespacesRemoveOffloadPoliciesNamespace)
-- ^

type NamespacesRemovePropertyAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "property" :> Capture "key" Text :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemovePropertyParameters = NamespacesRemovePropertyParameters
  { -- |
    namespacesRemovePropertyTenant :: Text,
    -- |
    namespacesRemovePropertyNamespace :: Text,
    -- |
    namespacesRemovePropertyKey :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveProperty :: NamespacesRemovePropertyParameters -> ClientM NoContent
namespacesRemoveProperty NamespacesRemovePropertyParameters {..} = client (Proxy :: Proxy NamespacesRemovePropertyAPI) (namespacesRemovePropertyTenant) (namespacesRemovePropertyNamespace) (namespacesRemovePropertyKey)
-- ^

type NamespacesRemoveReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "replicatorDispatchRate" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveReplicatorDispatchRateParameters = NamespacesRemoveReplicatorDispatchRateParameters
  { -- |
    namespacesRemoveReplicatorDispatchRateTenant :: Text,
    -- |
    namespacesRemoveReplicatorDispatchRateNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveReplicatorDispatchRate :: NamespacesRemoveReplicatorDispatchRateParameters -> ClientM NoContent
namespacesRemoveReplicatorDispatchRate NamespacesRemoveReplicatorDispatchRateParameters {..} = client (Proxy :: Proxy NamespacesRemoveReplicatorDispatchRateAPI) (namespacesRemoveReplicatorDispatchRateTenant) (namespacesRemoveReplicatorDispatchRateNamespace)
-- ^

type NamespacesRemoveRetentionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "retention" :> ReqBody '[JSON] RetentionPolicies :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveRetentionParameters = NamespacesRemoveRetentionParameters
  { -- |
    namespacesRemoveRetentionTenant :: Text,
    -- |
    namespacesRemoveRetentionNamespace :: Text,
    -- | Retention policies for the specified namespace
    namespacesRemoveRetentionBody :: RetentionPolicies
  }
  deriving (Show, Eq, Generic)

namespacesRemoveRetention :: NamespacesRemoveRetentionParameters -> ClientM NoContent
namespacesRemoveRetention NamespacesRemoveRetentionParameters {..} = client (Proxy :: Proxy NamespacesRemoveRetentionAPI) (namespacesRemoveRetentionTenant) (namespacesRemoveRetentionNamespace) namespacesRemoveRetentionBody
-- ^

type NamespacesRemoveSubscriptionExpirationTimeAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionExpirationTime" :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRemoveSubscriptionExpirationTimeParameters = NamespacesRemoveSubscriptionExpirationTimeParameters
  { -- |
    namespacesRemoveSubscriptionExpirationTimeTenant :: Text,
    -- |
    namespacesRemoveSubscriptionExpirationTimeNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRemoveSubscriptionExpirationTime :: NamespacesRemoveSubscriptionExpirationTimeParameters -> ClientM NoContent
namespacesRemoveSubscriptionExpirationTime NamespacesRemoveSubscriptionExpirationTimeParameters {..} = client (Proxy :: Proxy NamespacesRemoveSubscriptionExpirationTimeAPI) (namespacesRemoveSubscriptionExpirationTimeTenant) (namespacesRemoveSubscriptionExpirationTimeNamespace)
-- ^

type NamespacesRevokePermissionsOnNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "permissions" :> Capture "role" Text :> Verb 'DELETE 200 '[JSON] NoContent

data NamespacesRevokePermissionsOnNamespaceParameters = NamespacesRevokePermissionsOnNamespaceParameters
  { -- |
    namespacesRevokePermissionsOnNamespaceTenant :: Text,
    -- |
    namespacesRevokePermissionsOnNamespaceNamespace :: Text,
    -- |
    namespacesRevokePermissionsOnNamespaceRole :: Text
  }
  deriving (Show, Eq, Generic)

namespacesRevokePermissionsOnNamespace :: NamespacesRevokePermissionsOnNamespaceParameters -> ClientM NoContent
namespacesRevokePermissionsOnNamespace NamespacesRevokePermissionsOnNamespaceParameters {..} = client (Proxy :: Proxy NamespacesRevokePermissionsOnNamespaceAPI) (namespacesRevokePermissionsOnNamespaceTenant) (namespacesRevokePermissionsOnNamespaceNamespace) (namespacesRevokePermissionsOnNamespaceRole)
-- ^

type NamespacesSetAutoSubscriptionCreationAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "autoSubscriptionCreation" :> ReqBody '[JSON] AutoSubscriptionCreationOverride :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetAutoSubscriptionCreationParameters = NamespacesSetAutoSubscriptionCreationParameters
  { -- |
    namespacesSetAutoSubscriptionCreationTenant :: Text,
    -- |
    namespacesSetAutoSubscriptionCreationNamespace :: Text,
    -- | Settings for automatic subscription creation
    namespacesSetAutoSubscriptionCreationBody :: AutoSubscriptionCreationOverride
  }
  deriving (Show, Eq, Generic)

namespacesSetAutoSubscriptionCreation :: NamespacesSetAutoSubscriptionCreationParameters -> ClientM NoContent
namespacesSetAutoSubscriptionCreation NamespacesSetAutoSubscriptionCreationParameters {..} = client (Proxy :: Proxy NamespacesSetAutoSubscriptionCreationAPI) (namespacesSetAutoSubscriptionCreationTenant) (namespacesSetAutoSubscriptionCreationNamespace) namespacesSetAutoSubscriptionCreationBody
-- ^

type NamespacesSetAutoTopicCreationAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "autoTopicCreation" :> ReqBody '[JSON] AutoTopicCreationOverride :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetAutoTopicCreationParameters = NamespacesSetAutoTopicCreationParameters
  { -- |
    namespacesSetAutoTopicCreationTenant :: Text,
    -- |
    namespacesSetAutoTopicCreationNamespace :: Text,
    -- | Settings for automatic topic creation
    namespacesSetAutoTopicCreationBody :: AutoTopicCreationOverride
  }
  deriving (Show, Eq, Generic)

namespacesSetAutoTopicCreation :: NamespacesSetAutoTopicCreationParameters -> ClientM NoContent
namespacesSetAutoTopicCreation NamespacesSetAutoTopicCreationParameters {..} = client (Proxy :: Proxy NamespacesSetAutoTopicCreationAPI) (namespacesSetAutoTopicCreationTenant) (namespacesSetAutoTopicCreationNamespace) namespacesSetAutoTopicCreationBody
-- ^

type NamespacesSetBacklogQuotaAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "backlogQuota" :> QueryParam "backlogQuotaType" Text :> ReqBody '[JSON] BacklogQuota :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetBacklogQuotaParameters = NamespacesSetBacklogQuotaParameters
  { -- |
    namespacesSetBacklogQuotaTenant :: Text,
    -- |
    namespacesSetBacklogQuotaNamespace :: Text,
    -- |
    namespacesSetBacklogQuotaBacklogQuotaType :: Maybe Text,
    -- | Backlog quota for all topics of the specified namespace
    namespacesSetBacklogQuotaBody :: BacklogQuota
  }
  deriving (Show, Eq, Generic)

namespacesSetBacklogQuota :: NamespacesSetBacklogQuotaParameters -> ClientM NoContent
namespacesSetBacklogQuota NamespacesSetBacklogQuotaParameters {..} = client (Proxy :: Proxy NamespacesSetBacklogQuotaAPI) (namespacesSetBacklogQuotaTenant) (namespacesSetBacklogQuotaNamespace) (namespacesSetBacklogQuotaBacklogQuotaType) namespacesSetBacklogQuotaBody
-- ^

type NamespacesSetBookieAffinityGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "persistence" :> "bookieAffinity" :> ReqBody '[JSON] BookieAffinityGroupData :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetBookieAffinityGroupParameters = NamespacesSetBookieAffinityGroupParameters
  { -- |
    namespacesSetBookieAffinityGroupTenant :: Text,
    -- |
    namespacesSetBookieAffinityGroupNamespace :: Text,
    -- | Bookie affinity group for the specified namespace
    namespacesSetBookieAffinityGroupBody :: BookieAffinityGroupData
  }
  deriving (Show, Eq, Generic)

namespacesSetBookieAffinityGroup :: NamespacesSetBookieAffinityGroupParameters -> ClientM NoContent
namespacesSetBookieAffinityGroup NamespacesSetBookieAffinityGroupParameters {..} = client (Proxy :: Proxy NamespacesSetBookieAffinityGroupAPI) (namespacesSetBookieAffinityGroupTenant) (namespacesSetBookieAffinityGroupNamespace) namespacesSetBookieAffinityGroupBody
-- ^ The backlog size is compared to the threshold periodically. A threshold of 0 disabled automatic compaction

type NamespacesSetCompactionThresholdAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "compactionThreshold" :> ReqBody '[JSON] Integer :> Verb 'PUT 200 '[JSON] NoContent

data NamespacesSetCompactionThresholdParameters = NamespacesSetCompactionThresholdParameters
  { -- |
    namespacesSetCompactionThresholdTenant :: Text,
    -- |
    namespacesSetCompactionThresholdNamespace :: Text,
    -- | Maximum number of uncompacted bytes in a topic of the specified namespace
    namespacesSetCompactionThresholdBody :: Integer
  }
  deriving (Show, Eq, Generic)

namespacesSetCompactionThreshold :: NamespacesSetCompactionThresholdParameters -> ClientM NoContent
namespacesSetCompactionThreshold NamespacesSetCompactionThresholdParameters {..} = client (Proxy :: Proxy NamespacesSetCompactionThresholdAPI) (namespacesSetCompactionThresholdTenant) (namespacesSetCompactionThresholdNamespace) namespacesSetCompactionThresholdBody
-- ^

type NamespacesSetDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "deduplicationSnapshotInterval" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetDeduplicationSnapshotIntervalParameters = NamespacesSetDeduplicationSnapshotIntervalParameters
  { -- |
    namespacesSetDeduplicationSnapshotIntervalTenant :: Text,
    -- |
    namespacesSetDeduplicationSnapshotIntervalNamespace :: Text,
    -- | Interval to take deduplication snapshot per topic
    namespacesSetDeduplicationSnapshotIntervalBody :: Int
  }
  deriving (Show, Eq, Generic)

namespacesSetDeduplicationSnapshotInterval :: NamespacesSetDeduplicationSnapshotIntervalParameters -> ClientM NoContent
namespacesSetDeduplicationSnapshotInterval NamespacesSetDeduplicationSnapshotIntervalParameters {..} = client (Proxy :: Proxy NamespacesSetDeduplicationSnapshotIntervalAPI) (namespacesSetDeduplicationSnapshotIntervalTenant) (namespacesSetDeduplicationSnapshotIntervalNamespace) namespacesSetDeduplicationSnapshotIntervalBody
-- ^

type NamespacesSetDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "delayedDelivery" :> ReqBody '[JSON] DelayedDeliveryPolicies :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetDelayedDeliveryPoliciesParameters = NamespacesSetDelayedDeliveryPoliciesParameters
  { -- |
    namespacesSetDelayedDeliveryPoliciesTenant :: Text,
    -- |
    namespacesSetDelayedDeliveryPoliciesNamespace :: Text,
    -- | Delayed delivery policies for the specified namespace
    namespacesSetDelayedDeliveryPoliciesBody :: DelayedDeliveryPolicies
  }
  deriving (Show, Eq, Generic)

namespacesSetDelayedDeliveryPolicies :: NamespacesSetDelayedDeliveryPoliciesParameters -> ClientM NoContent
namespacesSetDelayedDeliveryPolicies NamespacesSetDelayedDeliveryPoliciesParameters {..} = client (Proxy :: Proxy NamespacesSetDelayedDeliveryPoliciesAPI) (namespacesSetDelayedDeliveryPoliciesTenant) (namespacesSetDelayedDeliveryPoliciesNamespace) namespacesSetDelayedDeliveryPoliciesBody
-- ^

type NamespacesSetDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "dispatchRate" :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetDispatchRateParameters = NamespacesSetDispatchRateParameters
  { -- |
    namespacesSetDispatchRateTenant :: Text,
    -- |
    namespacesSetDispatchRateNamespace :: Text,
    -- | Dispatch rate for all topics of the specified namespace
    namespacesSetDispatchRateBody :: DispatchRateImpl
  }
  deriving (Show, Eq, Generic)

namespacesSetDispatchRate :: NamespacesSetDispatchRateParameters -> ClientM NoContent
namespacesSetDispatchRate NamespacesSetDispatchRateParameters {..} = client (Proxy :: Proxy NamespacesSetDispatchRateAPI) (namespacesSetDispatchRateTenant) (namespacesSetDispatchRateNamespace) namespacesSetDispatchRateBody
-- ^

type NamespacesSetInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "inactiveTopicPolicies" :> ReqBody '[JSON] InactiveTopicPolicies :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetInactiveTopicPoliciesParameters = NamespacesSetInactiveTopicPoliciesParameters
  { -- |
    namespacesSetInactiveTopicPoliciesTenant :: Text,
    -- |
    namespacesSetInactiveTopicPoliciesNamespace :: Text,
    -- | Inactive topic policies for the specified namespace
    namespacesSetInactiveTopicPoliciesBody :: InactiveTopicPolicies
  }
  deriving (Show, Eq, Generic)

namespacesSetInactiveTopicPolicies :: NamespacesSetInactiveTopicPoliciesParameters -> ClientM NoContent
namespacesSetInactiveTopicPolicies NamespacesSetInactiveTopicPoliciesParameters {..} = client (Proxy :: Proxy NamespacesSetInactiveTopicPoliciesAPI) (namespacesSetInactiveTopicPoliciesTenant) (namespacesSetInactiveTopicPoliciesNamespace) namespacesSetInactiveTopicPoliciesBody
-- ^

type NamespacesSetIsAllowAutoUpdateSchemaAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "isAllowAutoUpdateSchema" :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetIsAllowAutoUpdateSchemaParameters = NamespacesSetIsAllowAutoUpdateSchemaParameters
  { -- |
    namespacesSetIsAllowAutoUpdateSchemaTenant :: Text,
    -- |
    namespacesSetIsAllowAutoUpdateSchemaNamespace :: Text,
    -- | Flag of whether to allow auto update schema
    namespacesSetIsAllowAutoUpdateSchemaBody :: Bool
  }
  deriving (Show, Eq, Generic)

namespacesSetIsAllowAutoUpdateSchema :: NamespacesSetIsAllowAutoUpdateSchemaParameters -> ClientM NoContent
namespacesSetIsAllowAutoUpdateSchema NamespacesSetIsAllowAutoUpdateSchemaParameters {..} = client (Proxy :: Proxy NamespacesSetIsAllowAutoUpdateSchemaAPI) (namespacesSetIsAllowAutoUpdateSchemaTenant) (namespacesSetIsAllowAutoUpdateSchemaNamespace) namespacesSetIsAllowAutoUpdateSchemaBody
-- ^

type NamespacesSetMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxConsumersPerSubscription" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetMaxConsumersPerSubscriptionParameters = NamespacesSetMaxConsumersPerSubscriptionParameters
  { -- |
    namespacesSetMaxConsumersPerSubscriptionTenant :: Text,
    -- |
    namespacesSetMaxConsumersPerSubscriptionNamespace :: Text,
    -- | Number of maximum consumers per subscription
    namespacesSetMaxConsumersPerSubscriptionBody :: Int
  }
  deriving (Show, Eq, Generic)

namespacesSetMaxConsumersPerSubscription :: NamespacesSetMaxConsumersPerSubscriptionParameters -> ClientM NoContent
namespacesSetMaxConsumersPerSubscription NamespacesSetMaxConsumersPerSubscriptionParameters {..} = client (Proxy :: Proxy NamespacesSetMaxConsumersPerSubscriptionAPI) (namespacesSetMaxConsumersPerSubscriptionTenant) (namespacesSetMaxConsumersPerSubscriptionNamespace) namespacesSetMaxConsumersPerSubscriptionBody
-- ^

type NamespacesSetMaxConsumersPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxConsumersPerTopic" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetMaxConsumersPerTopicParameters = NamespacesSetMaxConsumersPerTopicParameters
  { -- |
    namespacesSetMaxConsumersPerTopicTenant :: Text,
    -- |
    namespacesSetMaxConsumersPerTopicNamespace :: Text,
    -- | Number of maximum consumers per topic
    namespacesSetMaxConsumersPerTopicBody :: Int
  }
  deriving (Show, Eq, Generic)

namespacesSetMaxConsumersPerTopic :: NamespacesSetMaxConsumersPerTopicParameters -> ClientM NoContent
namespacesSetMaxConsumersPerTopic NamespacesSetMaxConsumersPerTopicParameters {..} = client (Proxy :: Proxy NamespacesSetMaxConsumersPerTopicAPI) (namespacesSetMaxConsumersPerTopicTenant) (namespacesSetMaxConsumersPerTopicNamespace) namespacesSetMaxConsumersPerTopicBody
-- ^

type NamespacesSetMaxProducersPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxProducersPerTopic" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetMaxProducersPerTopicParameters = NamespacesSetMaxProducersPerTopicParameters
  { -- |
    namespacesSetMaxProducersPerTopicTenant :: Text,
    -- |
    namespacesSetMaxProducersPerTopicNamespace :: Text,
    -- | Number of maximum producers per topic
    namespacesSetMaxProducersPerTopicBody :: Int
  }
  deriving (Show, Eq, Generic)

namespacesSetMaxProducersPerTopic :: NamespacesSetMaxProducersPerTopicParameters -> ClientM NoContent
namespacesSetMaxProducersPerTopic NamespacesSetMaxProducersPerTopicParameters {..} = client (Proxy :: Proxy NamespacesSetMaxProducersPerTopicAPI) (namespacesSetMaxProducersPerTopicTenant) (namespacesSetMaxProducersPerTopicNamespace) namespacesSetMaxProducersPerTopicBody
-- ^

type NamespacesSetMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxSubscriptionsPerTopic" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetMaxSubscriptionsPerTopicParameters = NamespacesSetMaxSubscriptionsPerTopicParameters
  { -- |
    namespacesSetMaxSubscriptionsPerTopicTenant :: Text,
    -- |
    namespacesSetMaxSubscriptionsPerTopicNamespace :: Text,
    -- | Number of maximum subscriptions per topic
    namespacesSetMaxSubscriptionsPerTopicBody :: Int
  }
  deriving (Show, Eq, Generic)

namespacesSetMaxSubscriptionsPerTopic :: NamespacesSetMaxSubscriptionsPerTopicParameters -> ClientM NoContent
namespacesSetMaxSubscriptionsPerTopic NamespacesSetMaxSubscriptionsPerTopicParameters {..} = client (Proxy :: Proxy NamespacesSetMaxSubscriptionsPerTopicAPI) (namespacesSetMaxSubscriptionsPerTopicTenant) (namespacesSetMaxSubscriptionsPerTopicNamespace) namespacesSetMaxSubscriptionsPerTopicBody
-- ^

type NamespacesSetMaxTopicsPerNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxTopicsPerNamespace" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetMaxTopicsPerNamespaceParameters = NamespacesSetMaxTopicsPerNamespaceParameters
  { -- |
    namespacesSetMaxTopicsPerNamespaceTenant :: Text,
    -- |
    namespacesSetMaxTopicsPerNamespaceNamespace :: Text,
    -- | Number of maximum topics for specific namespace
    namespacesSetMaxTopicsPerNamespaceBody :: Int
  }
  deriving (Show, Eq, Generic)

namespacesSetMaxTopicsPerNamespace :: NamespacesSetMaxTopicsPerNamespaceParameters -> ClientM NoContent
namespacesSetMaxTopicsPerNamespace NamespacesSetMaxTopicsPerNamespaceParameters {..} = client (Proxy :: Proxy NamespacesSetMaxTopicsPerNamespaceAPI) (namespacesSetMaxTopicsPerNamespaceTenant) (namespacesSetMaxTopicsPerNamespaceNamespace) namespacesSetMaxTopicsPerNamespaceBody
-- ^

type NamespacesSetMaxUnackedMessagesPerConsumerAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxUnackedMessagesPerConsumer" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetMaxUnackedMessagesPerConsumerParameters = NamespacesSetMaxUnackedMessagesPerConsumerParameters
  { -- |
    namespacesSetMaxUnackedMessagesPerConsumerTenant :: Text,
    -- |
    namespacesSetMaxUnackedMessagesPerConsumerNamespace :: Text,
    -- | Number of maximum unacked messages per consumer
    namespacesSetMaxUnackedMessagesPerConsumerBody :: Int
  }
  deriving (Show, Eq, Generic)

namespacesSetMaxUnackedMessagesPerConsumer :: NamespacesSetMaxUnackedMessagesPerConsumerParameters -> ClientM NoContent
namespacesSetMaxUnackedMessagesPerConsumer NamespacesSetMaxUnackedMessagesPerConsumerParameters {..} = client (Proxy :: Proxy NamespacesSetMaxUnackedMessagesPerConsumerAPI) (namespacesSetMaxUnackedMessagesPerConsumerTenant) (namespacesSetMaxUnackedMessagesPerConsumerNamespace) namespacesSetMaxUnackedMessagesPerConsumerBody
-- ^

type NamespacesSetMaxUnackedMessagesPerSubscriptionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "maxUnackedMessagesPerSubscription" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetMaxUnackedMessagesPerSubscriptionParameters = NamespacesSetMaxUnackedMessagesPerSubscriptionParameters
  { -- |
    namespacesSetMaxUnackedMessagesPerSubscriptionTenant :: Text,
    -- |
    namespacesSetMaxUnackedMessagesPerSubscriptionNamespace :: Text,
    -- | Number of maximum unacked messages per subscription
    namespacesSetMaxUnackedMessagesPerSubscriptionBody :: Int
  }
  deriving (Show, Eq, Generic)

namespacesSetMaxUnackedMessagesPerSubscription :: NamespacesSetMaxUnackedMessagesPerSubscriptionParameters -> ClientM NoContent
namespacesSetMaxUnackedMessagesPerSubscription NamespacesSetMaxUnackedMessagesPerSubscriptionParameters {..} = client (Proxy :: Proxy NamespacesSetMaxUnackedMessagesPerSubscriptionAPI) (namespacesSetMaxUnackedMessagesPerSubscriptionTenant) (namespacesSetMaxUnackedMessagesPerSubscriptionNamespace) namespacesSetMaxUnackedMessagesPerSubscriptionBody
-- ^

type NamespacesSetNamespaceAntiAffinityGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "antiAffinity" :> ReqBody '[JSON] Text :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetNamespaceAntiAffinityGroupParameters = NamespacesSetNamespaceAntiAffinityGroupParameters
  { -- |
    namespacesSetNamespaceAntiAffinityGroupTenant :: Text,
    -- |
    namespacesSetNamespaceAntiAffinityGroupNamespace :: Text,
    -- | Anti-affinity group for the specified namespace
    namespacesSetNamespaceAntiAffinityGroupBody :: Text
  }
  deriving (Show, Eq, Generic)

namespacesSetNamespaceAntiAffinityGroup :: NamespacesSetNamespaceAntiAffinityGroupParameters -> ClientM NoContent
namespacesSetNamespaceAntiAffinityGroup NamespacesSetNamespaceAntiAffinityGroupParameters {..} = client (Proxy :: Proxy NamespacesSetNamespaceAntiAffinityGroupAPI) (namespacesSetNamespaceAntiAffinityGroupTenant) (namespacesSetNamespaceAntiAffinityGroupNamespace) namespacesSetNamespaceAntiAffinityGroupBody
-- ^

type NamespacesSetNamespaceMessageTTLAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "messageTTL" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetNamespaceMessageTTLParameters = NamespacesSetNamespaceMessageTTLParameters
  { -- |
    namespacesSetNamespaceMessageTTLTenant :: Text,
    -- |
    namespacesSetNamespaceMessageTTLNamespace :: Text,
    -- | TTL in seconds for the specified namespace
    namespacesSetNamespaceMessageTTLBody :: Int
  }
  deriving (Show, Eq, Generic)

namespacesSetNamespaceMessageTTL :: NamespacesSetNamespaceMessageTTLParameters -> ClientM NoContent
namespacesSetNamespaceMessageTTL NamespacesSetNamespaceMessageTTLParameters {..} = client (Proxy :: Proxy NamespacesSetNamespaceMessageTTLAPI) (namespacesSetNamespaceMessageTTLTenant) (namespacesSetNamespaceMessageTTLNamespace) namespacesSetNamespaceMessageTTLBody
-- ^

type NamespacesSetNamespaceReplicationClustersAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "replication" :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetNamespaceReplicationClustersParameters = NamespacesSetNamespaceReplicationClustersParameters
  { -- |
    namespacesSetNamespaceReplicationClustersTenant :: Text,
    -- |
    namespacesSetNamespaceReplicationClustersNamespace :: Text,
    -- | List of replication clusters
    namespacesSetNamespaceReplicationClustersBody :: [Text]
  }
  deriving (Show, Eq, Generic)

namespacesSetNamespaceReplicationClusters :: NamespacesSetNamespaceReplicationClustersParameters -> ClientM NoContent
namespacesSetNamespaceReplicationClusters NamespacesSetNamespaceReplicationClustersParameters {..} = client (Proxy :: Proxy NamespacesSetNamespaceReplicationClustersAPI) (namespacesSetNamespaceReplicationClustersTenant) (namespacesSetNamespaceReplicationClustersNamespace) namespacesSetNamespaceReplicationClustersBody
-- ^

type NamespacesSetNamespaceResourceGroupAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "resourcegroup" :> Capture "resourcegroup" Text :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetNamespaceResourceGroupParameters = NamespacesSetNamespaceResourceGroupParameters
  { -- |
    namespacesSetNamespaceResourceGroupTenant :: Text,
    -- |
    namespacesSetNamespaceResourceGroupNamespace :: Text,
    -- |
    namespacesSetNamespaceResourceGroupResourcegroup :: Text
  }
  deriving (Show, Eq, Generic)

namespacesSetNamespaceResourceGroup :: NamespacesSetNamespaceResourceGroupParameters -> ClientM NoContent
namespacesSetNamespaceResourceGroup NamespacesSetNamespaceResourceGroupParameters {..} = client (Proxy :: Proxy NamespacesSetNamespaceResourceGroupAPI) (namespacesSetNamespaceResourceGroupTenant) (namespacesSetNamespaceResourceGroupNamespace) (namespacesSetNamespaceResourceGroupResourcegroup)
-- ^ A negative value disables the deletion completely.

type NamespacesSetOffloadDeletionLagAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "offloadDeletionLagMs" :> ReqBody '[JSON] Integer :> Verb 'PUT 200 '[JSON] NoContent

data NamespacesSetOffloadDeletionLagParameters = NamespacesSetOffloadDeletionLagParameters
  { -- |
    namespacesSetOffloadDeletionLagTenant :: Text,
    -- |
    namespacesSetOffloadDeletionLagNamespace :: Text,
    -- | New number of milliseconds to wait before deleting a ledger segment which has been offloaded
    namespacesSetOffloadDeletionLagBody :: Integer
  }
  deriving (Show, Eq, Generic)

namespacesSetOffloadDeletionLag :: NamespacesSetOffloadDeletionLagParameters -> ClientM NoContent
namespacesSetOffloadDeletionLag NamespacesSetOffloadDeletionLagParameters {..} = client (Proxy :: Proxy NamespacesSetOffloadDeletionLagAPI) (namespacesSetOffloadDeletionLagTenant) (namespacesSetOffloadDeletionLagNamespace) namespacesSetOffloadDeletionLagBody
-- ^

type NamespacesSetOffloadPoliciesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "offloadPolicies" :> ReqBody '[JSON] OffloadPoliciesImpl :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetOffloadPoliciesParameters = NamespacesSetOffloadPoliciesParameters
  { -- |
    namespacesSetOffloadPoliciesTenant :: Text,
    -- |
    namespacesSetOffloadPoliciesNamespace :: Text,
    -- | Offload policies for the specified namespace
    namespacesSetOffloadPoliciesBody :: OffloadPoliciesImpl
  }
  deriving (Show, Eq, Generic)

namespacesSetOffloadPolicies :: NamespacesSetOffloadPoliciesParameters -> ClientM NoContent
namespacesSetOffloadPolicies NamespacesSetOffloadPoliciesParameters {..} = client (Proxy :: Proxy NamespacesSetOffloadPoliciesAPI) (namespacesSetOffloadPoliciesTenant) (namespacesSetOffloadPoliciesNamespace) namespacesSetOffloadPoliciesBody
-- ^ -1 will revert to using the cluster default. A negative value disables automatic offloading.

type NamespacesSetOffloadThresholdAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "offloadThreshold" :> ReqBody '[JSON] Integer :> Verb 'PUT 200 '[JSON] NoContent

data NamespacesSetOffloadThresholdParameters = NamespacesSetOffloadThresholdParameters
  { -- |
    namespacesSetOffloadThresholdTenant :: Text,
    -- |
    namespacesSetOffloadThresholdNamespace :: Text,
    -- | Maximum number of bytes stored on the pulsar cluster for a topic of the specified namespace
    namespacesSetOffloadThresholdBody :: Integer
  }
  deriving (Show, Eq, Generic)

namespacesSetOffloadThreshold :: NamespacesSetOffloadThresholdParameters -> ClientM NoContent
namespacesSetOffloadThreshold NamespacesSetOffloadThresholdParameters {..} = client (Proxy :: Proxy NamespacesSetOffloadThresholdAPI) (namespacesSetOffloadThresholdTenant) (namespacesSetOffloadThresholdNamespace) namespacesSetOffloadThresholdBody
-- ^

type NamespacesSetPersistenceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "persistence" :> ReqBody '[JSON] PersistencePolicies :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetPersistenceParameters = NamespacesSetPersistenceParameters
  { -- |
    namespacesSetPersistenceTenant :: Text,
    -- |
    namespacesSetPersistenceNamespace :: Text,
    -- | Persistence policies for the specified namespace
    namespacesSetPersistenceBody :: PersistencePolicies
  }
  deriving (Show, Eq, Generic)

namespacesSetPersistence :: NamespacesSetPersistenceParameters -> ClientM NoContent
namespacesSetPersistence NamespacesSetPersistenceParameters {..} = client (Proxy :: Proxy NamespacesSetPersistenceAPI) (namespacesSetPersistenceTenant) (namespacesSetPersistenceNamespace) namespacesSetPersistenceBody
-- ^

type NamespacesSetPropertiesAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "properties" :> ReqBody '[JSON] (Map.Map String Text) :> Verb 'PUT 200 '[JSON] NoContent

data NamespacesSetPropertiesParameters = NamespacesSetPropertiesParameters
  { -- |
    namespacesSetPropertiesTenant :: Text,
    -- |
    namespacesSetPropertiesNamespace :: Text,
    -- | Key value pair properties for the namespace
    namespacesSetPropertiesBody :: (Map.Map String Text)
  }
  deriving (Show, Eq, Generic)

namespacesSetProperties :: NamespacesSetPropertiesParameters -> ClientM NoContent
namespacesSetProperties NamespacesSetPropertiesParameters {..} = client (Proxy :: Proxy NamespacesSetPropertiesAPI) (namespacesSetPropertiesTenant) (namespacesSetPropertiesNamespace) namespacesSetPropertiesBody
-- ^

type NamespacesSetPropertyAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "property" :> Capture "key" Text :> Capture "value" Text :> Verb 'PUT 200 '[JSON] NoContent

data NamespacesSetPropertyParameters = NamespacesSetPropertyParameters
  { -- |
    namespacesSetPropertyTenant :: Text,
    -- |
    namespacesSetPropertyNamespace :: Text,
    -- |
    namespacesSetPropertyKey :: Text,
    -- |
    namespacesSetPropertyValue :: Text
  }
  deriving (Show, Eq, Generic)

namespacesSetProperty :: NamespacesSetPropertyParameters -> ClientM NoContent
namespacesSetProperty NamespacesSetPropertyParameters {..} = client (Proxy :: Proxy NamespacesSetPropertyAPI) (namespacesSetPropertyTenant) (namespacesSetPropertyNamespace) (namespacesSetPropertyKey) (namespacesSetPropertyValue)
-- ^

type NamespacesSetReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "replicatorDispatchRate" :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetReplicatorDispatchRateParameters = NamespacesSetReplicatorDispatchRateParameters
  { -- |
    namespacesSetReplicatorDispatchRateTenant :: Text,
    -- |
    namespacesSetReplicatorDispatchRateNamespace :: Text,
    -- | Replicator dispatch rate for all topics of the specified namespace
    namespacesSetReplicatorDispatchRateBody :: DispatchRateImpl
  }
  deriving (Show, Eq, Generic)

namespacesSetReplicatorDispatchRate :: NamespacesSetReplicatorDispatchRateParameters -> ClientM NoContent
namespacesSetReplicatorDispatchRate NamespacesSetReplicatorDispatchRateParameters {..} = client (Proxy :: Proxy NamespacesSetReplicatorDispatchRateAPI) (namespacesSetReplicatorDispatchRateTenant) (namespacesSetReplicatorDispatchRateNamespace) namespacesSetReplicatorDispatchRateBody
-- ^

type NamespacesSetRetentionAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "retention" :> ReqBody '[JSON] RetentionPolicies :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetRetentionParameters = NamespacesSetRetentionParameters
  { -- |
    namespacesSetRetentionTenant :: Text,
    -- |
    namespacesSetRetentionNamespace :: Text,
    -- | Retention policies for the specified namespace
    namespacesSetRetentionBody :: RetentionPolicies
  }
  deriving (Show, Eq, Generic)

namespacesSetRetention :: NamespacesSetRetentionParameters -> ClientM NoContent
namespacesSetRetention NamespacesSetRetentionParameters {..} = client (Proxy :: Proxy NamespacesSetRetentionAPI) (namespacesSetRetentionTenant) (namespacesSetRetentionNamespace) namespacesSetRetentionBody
-- ^ The value AutoUpdateDisabled prevents producers from updating the schema.  If set to AutoUpdateDisabled, schemas must be updated through the REST api

type NamespacesSetSchemaAutoUpdateCompatibilityStrategyAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "schemaAutoUpdateCompatibilityStrategy" :> ReqBody '[JSON] Text :> Verb 'PUT 200 '[JSON] NoContent

data NamespacesSetSchemaAutoUpdateCompatibilityStrategyParameters = NamespacesSetSchemaAutoUpdateCompatibilityStrategyParameters
  { -- |
    namespacesSetSchemaAutoUpdateCompatibilityStrategyTenant :: Text,
    -- |
    namespacesSetSchemaAutoUpdateCompatibilityStrategyNamespace :: Text,
    -- | Strategy used to check the compatibility of new schemas
    namespacesSetSchemaAutoUpdateCompatibilityStrategyBody :: Text
  }
  deriving (Show, Eq, Generic)

namespacesSetSchemaAutoUpdateCompatibilityStrategy :: NamespacesSetSchemaAutoUpdateCompatibilityStrategyParameters -> ClientM NoContent
namespacesSetSchemaAutoUpdateCompatibilityStrategy NamespacesSetSchemaAutoUpdateCompatibilityStrategyParameters {..} = client (Proxy :: Proxy NamespacesSetSchemaAutoUpdateCompatibilityStrategyAPI) (namespacesSetSchemaAutoUpdateCompatibilityStrategyTenant) (namespacesSetSchemaAutoUpdateCompatibilityStrategyNamespace) namespacesSetSchemaAutoUpdateCompatibilityStrategyBody
-- ^

type NamespacesSetSchemaCompatibilityStrategyAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "schemaCompatibilityStrategy" :> ReqBody '[JSON] Text :> Verb 'PUT 200 '[JSON] NoContent

data NamespacesSetSchemaCompatibilityStrategyParameters = NamespacesSetSchemaCompatibilityStrategyParameters
  { -- |
    namespacesSetSchemaCompatibilityStrategyTenant :: Text,
    -- |
    namespacesSetSchemaCompatibilityStrategyNamespace :: Text,
    -- | Strategy used to check the compatibility of new schema
    namespacesSetSchemaCompatibilityStrategyBody :: Text
  }
  deriving (Show, Eq, Generic)

namespacesSetSchemaCompatibilityStrategy :: NamespacesSetSchemaCompatibilityStrategyParameters -> ClientM NoContent
namespacesSetSchemaCompatibilityStrategy NamespacesSetSchemaCompatibilityStrategyParameters {..} = client (Proxy :: Proxy NamespacesSetSchemaCompatibilityStrategyAPI) (namespacesSetSchemaCompatibilityStrategyTenant) (namespacesSetSchemaCompatibilityStrategyNamespace) namespacesSetSchemaCompatibilityStrategyBody
-- ^ If the flag is set to true, when a producer without a schema attempts to produce to a topic with schema in this namespace, the producer will be failed to connect. PLEASE be carefully on using this, since non-java clients don't support schema.if you enable this setting, it will cause non-java clients failed to produce.

type NamespacesSetSchemaValidtionEnforcedAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "schemaValidationEnforced" :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetSchemaValidtionEnforcedParameters = NamespacesSetSchemaValidtionEnforcedParameters
  { -- |
    namespacesSetSchemaValidtionEnforcedTenant :: Text,
    -- |
    namespacesSetSchemaValidtionEnforcedNamespace :: Text,
    -- | Flag of whether validation is enforced on the specified namespace
    namespacesSetSchemaValidtionEnforcedBody :: Bool
  }
  deriving (Show, Eq, Generic)

namespacesSetSchemaValidtionEnforced :: NamespacesSetSchemaValidtionEnforcedParameters -> ClientM NoContent
namespacesSetSchemaValidtionEnforced NamespacesSetSchemaValidtionEnforcedParameters {..} = client (Proxy :: Proxy NamespacesSetSchemaValidtionEnforcedAPI) (namespacesSetSchemaValidtionEnforcedTenant) (namespacesSetSchemaValidtionEnforcedNamespace) namespacesSetSchemaValidtionEnforcedBody
-- ^

type NamespacesSetSubscribeRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscribeRate" :> ReqBody '[JSON] SubscribeRate :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetSubscribeRateParameters = NamespacesSetSubscribeRateParameters
  { -- |
    namespacesSetSubscribeRateTenant :: Text,
    -- |
    namespacesSetSubscribeRateNamespace :: Text,
    -- | Subscribe rate for all topics of the specified namespace
    namespacesSetSubscribeRateBody :: SubscribeRate
  }
  deriving (Show, Eq, Generic)

namespacesSetSubscribeRate :: NamespacesSetSubscribeRateParameters -> ClientM NoContent
namespacesSetSubscribeRate NamespacesSetSubscribeRateParameters {..} = client (Proxy :: Proxy NamespacesSetSubscribeRateAPI) (namespacesSetSubscribeRateTenant) (namespacesSetSubscribeRateNamespace) namespacesSetSubscribeRateBody
-- ^

type NamespacesSetSubscriptionAuthModeAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionAuthMode" :> ReqBody '[JSON] Text :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetSubscriptionAuthModeParameters = NamespacesSetSubscriptionAuthModeParameters
  { -- |
    namespacesSetSubscriptionAuthModeTenant :: Text,
    -- |
    namespacesSetSubscriptionAuthModeNamespace :: Text,
    -- | Subscription auth mode for all topics of the specified namespace
    namespacesSetSubscriptionAuthModeBody :: Text
  }
  deriving (Show, Eq, Generic)

namespacesSetSubscriptionAuthMode :: NamespacesSetSubscriptionAuthModeParameters -> ClientM NoContent
namespacesSetSubscriptionAuthMode NamespacesSetSubscriptionAuthModeParameters {..} = client (Proxy :: Proxy NamespacesSetSubscriptionAuthModeAPI) (namespacesSetSubscriptionAuthModeTenant) (namespacesSetSubscriptionAuthModeNamespace) namespacesSetSubscriptionAuthModeBody
-- ^

type NamespacesSetSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionDispatchRate" :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetSubscriptionDispatchRateParameters = NamespacesSetSubscriptionDispatchRateParameters
  { -- |
    namespacesSetSubscriptionDispatchRateTenant :: Text,
    -- |
    namespacesSetSubscriptionDispatchRateNamespace :: Text,
    -- | Subscription dispatch rate for all topics of the specified namespace
    namespacesSetSubscriptionDispatchRateBody :: DispatchRateImpl
  }
  deriving (Show, Eq, Generic)

namespacesSetSubscriptionDispatchRate :: NamespacesSetSubscriptionDispatchRateParameters -> ClientM NoContent
namespacesSetSubscriptionDispatchRate NamespacesSetSubscriptionDispatchRateParameters {..} = client (Proxy :: Proxy NamespacesSetSubscriptionDispatchRateAPI) (namespacesSetSubscriptionDispatchRateTenant) (namespacesSetSubscriptionDispatchRateNamespace) namespacesSetSubscriptionDispatchRateBody
-- ^

type NamespacesSetSubscriptionExpirationTimeAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionExpirationTime" :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetSubscriptionExpirationTimeParameters = NamespacesSetSubscriptionExpirationTimeParameters
  { -- |
    namespacesSetSubscriptionExpirationTimeTenant :: Text,
    -- |
    namespacesSetSubscriptionExpirationTimeNamespace :: Text,
    -- | Expiration time in minutes for the specified namespace
    namespacesSetSubscriptionExpirationTimeBody :: Int
  }
  deriving (Show, Eq, Generic)

namespacesSetSubscriptionExpirationTime :: NamespacesSetSubscriptionExpirationTimeParameters -> ClientM NoContent
namespacesSetSubscriptionExpirationTime NamespacesSetSubscriptionExpirationTimeParameters {..} = client (Proxy :: Proxy NamespacesSetSubscriptionExpirationTimeAPI) (namespacesSetSubscriptionExpirationTimeTenant) (namespacesSetSubscriptionExpirationTimeNamespace) namespacesSetSubscriptionExpirationTimeBody
-- ^

type NamespacesSetSubscriptionTypesEnabledAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "subscriptionTypesEnabled" :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

data NamespacesSetSubscriptionTypesEnabledParameters = NamespacesSetSubscriptionTypesEnabledParameters
  { -- |
    namespacesSetSubscriptionTypesEnabledTenant :: Text,
    -- |
    namespacesSetSubscriptionTypesEnabledNamespace :: Text,
    -- | Set of whether allow subscription types
    namespacesSetSubscriptionTypesEnabledBody :: [Text]
  }
  deriving (Show, Eq, Generic)

namespacesSetSubscriptionTypesEnabled :: NamespacesSetSubscriptionTypesEnabledParameters -> ClientM NoContent
namespacesSetSubscriptionTypesEnabled NamespacesSetSubscriptionTypesEnabledParameters {..} = client (Proxy :: Proxy NamespacesSetSubscriptionTypesEnabledAPI) (namespacesSetSubscriptionTypesEnabledTenant) (namespacesSetSubscriptionTypesEnabledNamespace) namespacesSetSubscriptionTypesEnabledBody
-- ^

type NamespacesSplitNamespaceBundleAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> "split" :> QueryParam "authoritative" Bool :> QueryParam "unload" Bool :> QueryParam "splitAlgorithmName" Text :> Verb 'PUT 200 '[JSON] NoContent

data NamespacesSplitNamespaceBundleParameters = NamespacesSplitNamespaceBundleParameters
  { -- |
    namespacesSplitNamespaceBundleTenant :: Text,
    -- |
    namespacesSplitNamespaceBundleNamespace :: Text,
    -- |
    namespacesSplitNamespaceBundleBundle :: Text,
    -- |
    namespacesSplitNamespaceBundleAuthoritative :: Maybe Bool,
    -- |
    namespacesSplitNamespaceBundleUnload :: Maybe Bool,
    -- |
    namespacesSplitNamespaceBundleSplitAlgorithmName :: Maybe Text
  }
  deriving (Show, Eq, Generic)

namespacesSplitNamespaceBundle :: NamespacesSplitNamespaceBundleParameters -> ClientM NoContent
namespacesSplitNamespaceBundle NamespacesSplitNamespaceBundleParameters {..} = client (Proxy :: Proxy NamespacesSplitNamespaceBundleAPI) (namespacesSplitNamespaceBundleTenant) (namespacesSplitNamespaceBundleNamespace) (namespacesSplitNamespaceBundleBundle) (namespacesSplitNamespaceBundleAuthoritative) (namespacesSplitNamespaceBundleUnload) (namespacesSplitNamespaceBundleSplitAlgorithmName)
-- ^ Unload an active namespace from the current broker serving it. Performing this operation will let the brokerremoves all producers, consumers, and connections using this namespace, and close all topics (includingtheir persistent store). During that operation, the namespace is marked as tentatively unavailable until thebroker completes the unloading action. This operation requires strictly super user privileges, since it wouldresult in non-persistent message loss and unexpected connection closure to the clients.

type NamespacesUnloadNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "unload" :> Verb 'PUT 200 '[JSON] NoContent

data NamespacesUnloadNamespaceParameters = NamespacesUnloadNamespaceParameters
  { -- |
    namespacesUnloadNamespaceTenant :: Text,
    -- |
    namespacesUnloadNamespaceNamespace :: Text
  }
  deriving (Show, Eq, Generic)

namespacesUnloadNamespace :: NamespacesUnloadNamespaceParameters -> ClientM NoContent
namespacesUnloadNamespace NamespacesUnloadNamespaceParameters {..} = client (Proxy :: Proxy NamespacesUnloadNamespaceAPI) (namespacesUnloadNamespaceTenant) (namespacesUnloadNamespaceNamespace)
-- ^

type NamespacesUnloadNamespaceBundleAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> "unload" :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

data NamespacesUnloadNamespaceBundleParameters = NamespacesUnloadNamespaceBundleParameters
  { -- |
    namespacesUnloadNamespaceBundleTenant :: Text,
    -- |
    namespacesUnloadNamespaceBundleNamespace :: Text,
    -- |
    namespacesUnloadNamespaceBundleBundle :: Text,
    -- |
    namespacesUnloadNamespaceBundleAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

namespacesUnloadNamespaceBundle :: NamespacesUnloadNamespaceBundleParameters -> ClientM NoContent
namespacesUnloadNamespaceBundle NamespacesUnloadNamespaceBundleParameters {..} = client (Proxy :: Proxy NamespacesUnloadNamespaceBundleAPI) (namespacesUnloadNamespaceBundleTenant) (namespacesUnloadNamespaceBundleNamespace) (namespacesUnloadNamespaceBundleBundle) (namespacesUnloadNamespaceBundleAuthoritative)
-- ^

type NamespacesUnsubscribeNamespaceAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> "unsubscribe" :> Capture "subscription" Text :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data NamespacesUnsubscribeNamespaceParameters = NamespacesUnsubscribeNamespaceParameters
  { -- |
    namespacesUnsubscribeNamespaceTenant :: Text,
    -- |
    namespacesUnsubscribeNamespaceNamespace :: Text,
    -- |
    namespacesUnsubscribeNamespaceSubscription :: Text,
    -- |
    namespacesUnsubscribeNamespaceAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

namespacesUnsubscribeNamespace :: NamespacesUnsubscribeNamespaceParameters -> ClientM NoContent
namespacesUnsubscribeNamespace NamespacesUnsubscribeNamespaceParameters {..} = client (Proxy :: Proxy NamespacesUnsubscribeNamespaceAPI) (namespacesUnsubscribeNamespaceTenant) (namespacesUnsubscribeNamespaceNamespace) (namespacesUnsubscribeNamespaceSubscription) (namespacesUnsubscribeNamespaceAuthoritative)
-- ^

type NamespacesUnsubscribeNamespaceBundleAPI =
  "admin" :> "v2" :> "namespaces" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> "unsubscribe" :> Capture "subscription" Text :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data NamespacesUnsubscribeNamespaceBundleParameters = NamespacesUnsubscribeNamespaceBundleParameters
  { -- |
    namespacesUnsubscribeNamespaceBundleTenant :: Text,
    -- |
    namespacesUnsubscribeNamespaceBundleNamespace :: Text,
    -- |
    namespacesUnsubscribeNamespaceBundleSubscription :: Text,
    -- |
    namespacesUnsubscribeNamespaceBundleBundle :: Text,
    -- |
    namespacesUnsubscribeNamespaceBundleAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

namespacesUnsubscribeNamespaceBundle :: NamespacesUnsubscribeNamespaceBundleParameters -> ClientM NoContent
namespacesUnsubscribeNamespaceBundle NamespacesUnsubscribeNamespaceBundleParameters {..} = client (Proxy :: Proxy NamespacesUnsubscribeNamespaceBundleAPI) (namespacesUnsubscribeNamespaceBundleTenant) (namespacesUnsubscribeNamespaceBundleNamespace) (namespacesUnsubscribeNamespaceBundleSubscription) (namespacesUnsubscribeNamespaceBundleBundle) (namespacesUnsubscribeNamespaceBundleAuthoritative)
-- ^

type NonPersistentCompactAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compaction" :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

data NonPersistentCompactParameters = NonPersistentCompactParameters
  { -- | Specify the tenant
    nonPersistentCompactTenant :: Text,
    -- | Specify the namespace
    nonPersistentCompactNamespace :: Text,
    -- | Specify topic name
    nonPersistentCompactTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentCompactAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentCompact :: NonPersistentCompactParameters -> ClientM NoContent
nonPersistentCompact NonPersistentCompactParameters {..} = client (Proxy :: Proxy NonPersistentCompactAPI) (nonPersistentCompactTenant) (nonPersistentCompactNamespace) (nonPersistentCompactTopic) (nonPersistentCompactAuthoritative)
-- ^

type NonPersistentCompactionStatusAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compaction" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] LongRunningProcessStatus

data NonPersistentCompactionStatusParameters = NonPersistentCompactionStatusParameters
  { -- | Specify the tenant
    nonPersistentCompactionStatusTenant :: Text,
    -- | Specify the namespace
    nonPersistentCompactionStatusNamespace :: Text,
    -- | Specify topic name
    nonPersistentCompactionStatusTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentCompactionStatusAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentCompactionStatus :: NonPersistentCompactionStatusParameters -> ClientM LongRunningProcessStatus
nonPersistentCompactionStatus NonPersistentCompactionStatusParameters {..} = client (Proxy :: Proxy NonPersistentCompactionStatusAPI) (nonPersistentCompactionStatusTenant) (nonPersistentCompactionStatusNamespace) (nonPersistentCompactionStatusTopic) (nonPersistentCompactionStatusAuthoritative)
-- ^

type NonPersistentCreateMissedPartitionsAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "createMissedPartitions" :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentCreateMissedPartitionsParameters = NonPersistentCreateMissedPartitionsParameters
  { -- | Specify the tenant
    nonPersistentCreateMissedPartitionsTenant :: Text,
    -- | Specify the namespace
    nonPersistentCreateMissedPartitionsNamespace :: Text,
    -- | Specify topic name
    nonPersistentCreateMissedPartitionsTopic :: Text
  }
  deriving (Show, Eq, Generic)

nonPersistentCreateMissedPartitions :: NonPersistentCreateMissedPartitionsParameters -> ClientM NoContent
nonPersistentCreateMissedPartitions NonPersistentCreateMissedPartitionsParameters {..} = client (Proxy :: Proxy NonPersistentCreateMissedPartitionsAPI) (nonPersistentCreateMissedPartitionsTenant) (nonPersistentCreateMissedPartitionsNamespace) (nonPersistentCreateMissedPartitionsTopic)
-- ^ This is the only REST endpoint from which non-partitioned topics could be created.

type NonPersistentCreateNonPartitionedTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

data NonPersistentCreateNonPartitionedTopicParameters = NonPersistentCreateNonPartitionedTopicParameters
  { -- | Specify the tenant
    nonPersistentCreateNonPartitionedTopicTenant :: Text,
    -- | Specify the namespace
    nonPersistentCreateNonPartitionedTopicNamespace :: Text,
    -- | Specify topic name
    nonPersistentCreateNonPartitionedTopicTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentCreateNonPartitionedTopicAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentCreateNonPartitionedTopic :: NonPersistentCreateNonPartitionedTopicParameters -> ClientM NoContent
nonPersistentCreateNonPartitionedTopic NonPersistentCreateNonPartitionedTopicParameters {..} = client (Proxy :: Proxy NonPersistentCreateNonPartitionedTopicAPI) (nonPersistentCreateNonPartitionedTopicTenant) (nonPersistentCreateNonPartitionedTopicNamespace) (nonPersistentCreateNonPartitionedTopicTopic) (nonPersistentCreateNonPartitionedTopicAuthoritative)
-- ^ It needs to be called before creating a producer on a partitioned topic.

type NonPersistentCreatePartitionedTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "createLocalTopicOnly" Bool :> ReqBody '[JSON] Int :> Verb 'PUT 200 '[JSON] NoContent

data NonPersistentCreatePartitionedTopicParameters = NonPersistentCreatePartitionedTopicParameters
  { -- | Specify the tenant
    nonPersistentCreatePartitionedTopicTenant :: Text,
    -- | Specify the namespace
    nonPersistentCreatePartitionedTopicNamespace :: Text,
    -- | Specify topic name
    nonPersistentCreatePartitionedTopicTopic :: Text,
    -- | The number of partitions for the topic
    nonPersistentCreatePartitionedTopicBody :: Int,
    -- |
    nonPersistentCreatePartitionedTopicCreateLocalTopicOnly :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentCreatePartitionedTopic :: NonPersistentCreatePartitionedTopicParameters -> ClientM NoContent
nonPersistentCreatePartitionedTopic NonPersistentCreatePartitionedTopicParameters {..} = client (Proxy :: Proxy NonPersistentCreatePartitionedTopicAPI) (nonPersistentCreatePartitionedTopicTenant) (nonPersistentCreatePartitionedTopicNamespace) (nonPersistentCreatePartitionedTopicTopic) (nonPersistentCreatePartitionedTopicCreateLocalTopicOnly) nonPersistentCreatePartitionedTopicBody
-- ^ Creates a subscription on the topic at the specified message id

type NonPersistentCreateSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subscriptionName" Text :> QueryParam "authoritative" Bool :> QueryParam "replicated" Bool :> ReqBody '[JSON] MessageIdImpl :> Verb 'PUT 200 '[JSON] NoContent

data NonPersistentCreateSubscriptionParameters = NonPersistentCreateSubscriptionParameters
  { -- | Specify the tenant
    nonPersistentCreateSubscriptionTenant :: Text,
    -- | Specify the namespace
    nonPersistentCreateSubscriptionNamespace :: Text,
    -- | Specify topic name
    nonPersistentCreateSubscriptionTopic :: Text,
    -- | Subscription to create position on
    nonPersistentCreateSubscriptionSubscriptionName :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentCreateSubscriptionAuthoritative :: Maybe Bool,
    -- | Is replicated required to perform this operation
    nonPersistentCreateSubscriptionReplicated :: Maybe Bool,
    -- | messageId where to create the subscription. It can be 'latest', 'earliest' or (ledgerId:entryId)
    nonPersistentCreateSubscriptionMessageId :: MessageIdImpl
  }
  deriving (Show, Eq, Generic)

nonPersistentCreateSubscription :: NonPersistentCreateSubscriptionParameters -> ClientM NoContent
nonPersistentCreateSubscription NonPersistentCreateSubscriptionParameters {..} = client (Proxy :: Proxy NonPersistentCreateSubscriptionAPI) (nonPersistentCreateSubscriptionTenant) (nonPersistentCreateSubscriptionNamespace) (nonPersistentCreateSubscriptionTopic) (nonPersistentCreateSubscriptionSubscriptionName) (nonPersistentCreateSubscriptionAuthoritative) (nonPersistentCreateSubscriptionReplicated) nonPersistentCreateSubscriptionMessageId
-- ^

type NonPersistentDeleteDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationSnapshotInterval" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentDeleteDeduplicationSnapshotIntervalParameters = NonPersistentDeleteDeduplicationSnapshotIntervalParameters
  { -- |
    nonPersistentDeleteDeduplicationSnapshotIntervalTenant :: Text,
    -- |
    nonPersistentDeleteDeduplicationSnapshotIntervalNamespace :: Text,
    -- |
    nonPersistentDeleteDeduplicationSnapshotIntervalTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentDeleteDeduplicationSnapshotIntervalAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentDeleteDeduplicationSnapshotInterval :: NonPersistentDeleteDeduplicationSnapshotIntervalParameters -> ClientM NoContent
nonPersistentDeleteDeduplicationSnapshotInterval NonPersistentDeleteDeduplicationSnapshotIntervalParameters {..} = client (Proxy :: Proxy NonPersistentDeleteDeduplicationSnapshotIntervalAPI) (nonPersistentDeleteDeduplicationSnapshotIntervalTenant) (nonPersistentDeleteDeduplicationSnapshotIntervalNamespace) (nonPersistentDeleteDeduplicationSnapshotIntervalTopic) (nonPersistentDeleteDeduplicationSnapshotIntervalAuthoritative)
-- ^

type NonPersistentDeleteDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "delayedDelivery" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentDeleteDelayedDeliveryPoliciesParameters = NonPersistentDeleteDelayedDeliveryPoliciesParameters
  { -- |
    nonPersistentDeleteDelayedDeliveryPoliciesTenant :: Text,
    -- |
    nonPersistentDeleteDelayedDeliveryPoliciesNamespace :: Text,
    -- |
    nonPersistentDeleteDelayedDeliveryPoliciesTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentDeleteDelayedDeliveryPoliciesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentDeleteDelayedDeliveryPolicies :: NonPersistentDeleteDelayedDeliveryPoliciesParameters -> ClientM NoContent
nonPersistentDeleteDelayedDeliveryPolicies NonPersistentDeleteDelayedDeliveryPoliciesParameters {..} = client (Proxy :: Proxy NonPersistentDeleteDelayedDeliveryPoliciesAPI) (nonPersistentDeleteDelayedDeliveryPoliciesTenant) (nonPersistentDeleteDelayedDeliveryPoliciesNamespace) (nonPersistentDeleteDelayedDeliveryPoliciesTopic) (nonPersistentDeleteDelayedDeliveryPoliciesAuthoritative)
-- ^

type NonPersistentDeleteInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "inactiveTopicPolicies" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentDeleteInactiveTopicPoliciesParameters = NonPersistentDeleteInactiveTopicPoliciesParameters
  { -- |
    nonPersistentDeleteInactiveTopicPoliciesTenant :: Text,
    -- |
    nonPersistentDeleteInactiveTopicPoliciesNamespace :: Text,
    -- |
    nonPersistentDeleteInactiveTopicPoliciesTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentDeleteInactiveTopicPoliciesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentDeleteInactiveTopicPolicies :: NonPersistentDeleteInactiveTopicPoliciesParameters -> ClientM NoContent
nonPersistentDeleteInactiveTopicPolicies NonPersistentDeleteInactiveTopicPoliciesParameters {..} = client (Proxy :: Proxy NonPersistentDeleteInactiveTopicPoliciesAPI) (nonPersistentDeleteInactiveTopicPoliciesTenant) (nonPersistentDeleteInactiveTopicPoliciesNamespace) (nonPersistentDeleteInactiveTopicPoliciesTopic) (nonPersistentDeleteInactiveTopicPoliciesAuthoritative)
-- ^

type NonPersistentDeleteMaxUnackedMessagesOnConsumerAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnConsumer" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentDeleteMaxUnackedMessagesOnConsumerParameters = NonPersistentDeleteMaxUnackedMessagesOnConsumerParameters
  { -- |
    nonPersistentDeleteMaxUnackedMessagesOnConsumerTenant :: Text,
    -- |
    nonPersistentDeleteMaxUnackedMessagesOnConsumerNamespace :: Text,
    -- |
    nonPersistentDeleteMaxUnackedMessagesOnConsumerTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentDeleteMaxUnackedMessagesOnConsumerAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentDeleteMaxUnackedMessagesOnConsumer :: NonPersistentDeleteMaxUnackedMessagesOnConsumerParameters -> ClientM NoContent
nonPersistentDeleteMaxUnackedMessagesOnConsumer NonPersistentDeleteMaxUnackedMessagesOnConsumerParameters {..} = client (Proxy :: Proxy NonPersistentDeleteMaxUnackedMessagesOnConsumerAPI) (nonPersistentDeleteMaxUnackedMessagesOnConsumerTenant) (nonPersistentDeleteMaxUnackedMessagesOnConsumerNamespace) (nonPersistentDeleteMaxUnackedMessagesOnConsumerTopic) (nonPersistentDeleteMaxUnackedMessagesOnConsumerAuthoritative)
-- ^

type NonPersistentDeleteMaxUnackedMessagesOnSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnSubscription" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentDeleteMaxUnackedMessagesOnSubscriptionParameters = NonPersistentDeleteMaxUnackedMessagesOnSubscriptionParameters
  { -- |
    nonPersistentDeleteMaxUnackedMessagesOnSubscriptionTenant :: Text,
    -- |
    nonPersistentDeleteMaxUnackedMessagesOnSubscriptionNamespace :: Text,
    -- |
    nonPersistentDeleteMaxUnackedMessagesOnSubscriptionTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentDeleteMaxUnackedMessagesOnSubscriptionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentDeleteMaxUnackedMessagesOnSubscription :: NonPersistentDeleteMaxUnackedMessagesOnSubscriptionParameters -> ClientM NoContent
nonPersistentDeleteMaxUnackedMessagesOnSubscription NonPersistentDeleteMaxUnackedMessagesOnSubscriptionParameters {..} = client (Proxy :: Proxy NonPersistentDeleteMaxUnackedMessagesOnSubscriptionAPI) (nonPersistentDeleteMaxUnackedMessagesOnSubscriptionTenant) (nonPersistentDeleteMaxUnackedMessagesOnSubscriptionNamespace) (nonPersistentDeleteMaxUnackedMessagesOnSubscriptionTopic) (nonPersistentDeleteMaxUnackedMessagesOnSubscriptionAuthoritative)
-- ^ It will also delete all the partitions of the topic if it exists.

type NonPersistentDeletePartitionedTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> QueryParam "deleteSchema" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentDeletePartitionedTopicParameters = NonPersistentDeletePartitionedTopicParameters
  { -- | Specify the tenant
    nonPersistentDeletePartitionedTopicTenant :: Text,
    -- | Specify the namespace
    nonPersistentDeletePartitionedTopicNamespace :: Text,
    -- | Specify topic name
    nonPersistentDeletePartitionedTopicTopic :: Text,
    -- | Stop all producer/consumer/replicator and delete topic forcefully
    nonPersistentDeletePartitionedTopicForce :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentDeletePartitionedTopicAuthoritative :: Maybe Bool,
    -- | Delete the topic's schema storage
    nonPersistentDeletePartitionedTopicDeleteSchema :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentDeletePartitionedTopic :: NonPersistentDeletePartitionedTopicParameters -> ClientM NoContent
nonPersistentDeletePartitionedTopic NonPersistentDeletePartitionedTopicParameters {..} = client (Proxy :: Proxy NonPersistentDeletePartitionedTopicAPI) (nonPersistentDeletePartitionedTopicTenant) (nonPersistentDeletePartitionedTopicNamespace) (nonPersistentDeletePartitionedTopicTopic) (nonPersistentDeletePartitionedTopicForce) (nonPersistentDeletePartitionedTopicAuthoritative) (nonPersistentDeletePartitionedTopicDeleteSchema)
-- ^ The subscription cannot be deleted if delete is not forcefully and there are any active consumers attached to it. Force delete ignores connected consumers and deletes subscription by explicitly closing them.

type NonPersistentDeleteSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentDeleteSubscriptionParameters = NonPersistentDeleteSubscriptionParameters
  { -- | Specify the tenant
    nonPersistentDeleteSubscriptionTenant :: Text,
    -- | Specify the namespace
    nonPersistentDeleteSubscriptionNamespace :: Text,
    -- | Specify topic name
    nonPersistentDeleteSubscriptionTopic :: Text,
    -- | Subscription to be deleted
    nonPersistentDeleteSubscriptionSubName :: Text,
    -- | Disconnect and close all consumers and delete subscription forcefully
    nonPersistentDeleteSubscriptionForce :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentDeleteSubscriptionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentDeleteSubscription :: NonPersistentDeleteSubscriptionParameters -> ClientM NoContent
nonPersistentDeleteSubscription NonPersistentDeleteSubscriptionParameters {..} = client (Proxy :: Proxy NonPersistentDeleteSubscriptionAPI) (nonPersistentDeleteSubscriptionTenant) (nonPersistentDeleteSubscriptionNamespace) (nonPersistentDeleteSubscriptionTopic) (nonPersistentDeleteSubscriptionSubName) (nonPersistentDeleteSubscriptionForce) (nonPersistentDeleteSubscriptionAuthoritative)
-- ^ The topic cannot be deleted if delete is not forcefully and there's any active subscription or producer connected to the it. Force delete ignores connected clients and deletes topic by explicitly closing them.

type NonPersistentDeleteTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> QueryParam "deleteSchema" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentDeleteTopicParameters = NonPersistentDeleteTopicParameters
  { -- | Specify the tenant
    nonPersistentDeleteTopicTenant :: Text,
    -- | Specify the namespace
    nonPersistentDeleteTopicNamespace :: Text,
    -- | Specify topic name
    nonPersistentDeleteTopicTopic :: Text,
    -- | Stop all producer/consumer/replicator and delete topic forcefully
    nonPersistentDeleteTopicForce :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentDeleteTopicAuthoritative :: Maybe Bool,
    -- | Delete the topic's schema storage
    nonPersistentDeleteTopicDeleteSchema :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentDeleteTopic :: NonPersistentDeleteTopicParameters -> ClientM NoContent
nonPersistentDeleteTopic NonPersistentDeleteTopicParameters {..} = client (Proxy :: Proxy NonPersistentDeleteTopicAPI) (nonPersistentDeleteTopicTenant) (nonPersistentDeleteTopicNamespace) (nonPersistentDeleteTopicTopic) (nonPersistentDeleteTopicForce) (nonPersistentDeleteTopicAuthoritative) (nonPersistentDeleteTopicDeleteSchema)
-- ^

type NonPersistentExamineMessageAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "examinemessage" :> QueryParam "initialPosition" Text :> QueryParam "messagePosition" Integer :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentExamineMessageParameters = NonPersistentExamineMessageParameters
  { -- | Specify the tenant
    nonPersistentExamineMessageTenant :: Text,
    -- | Specify the namespace
    nonPersistentExamineMessageNamespace :: Text,
    -- | Specify topic name
    nonPersistentExamineMessageTopic :: Text,
    -- | Relative start position to examine message.It can be 'latest' or 'earliest'
    nonPersistentExamineMessageInitialPosition :: Maybe Text,
    -- | The position of messages (default 1)
    nonPersistentExamineMessageMessagePosition :: Maybe Integer,
    -- | Is authentication required to perform this operation
    nonPersistentExamineMessageAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentExamineMessage :: NonPersistentExamineMessageParameters -> ClientM NoContent
nonPersistentExamineMessage NonPersistentExamineMessageParameters {..} = client (Proxy :: Proxy NonPersistentExamineMessageAPI) (nonPersistentExamineMessageTenant) (nonPersistentExamineMessageNamespace) (nonPersistentExamineMessageTopic) (nonPersistentExamineMessageInitialPosition) (nonPersistentExamineMessageMessagePosition) (nonPersistentExamineMessageAuthoritative)
-- ^

type NonPersistentExpireMessagesForAllSubscriptionsAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "all_subscription" :> "expireMessages" :> Capture "expireTimeInSeconds" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentExpireMessagesForAllSubscriptionsParameters = NonPersistentExpireMessagesForAllSubscriptionsParameters
  { -- | Specify the tenant
    nonPersistentExpireMessagesForAllSubscriptionsTenant :: Text,
    -- | Specify the namespace
    nonPersistentExpireMessagesForAllSubscriptionsNamespace :: Text,
    -- | Specify topic name
    nonPersistentExpireMessagesForAllSubscriptionsTopic :: Text,
    -- | Expires beyond the specified number of seconds
    nonPersistentExpireMessagesForAllSubscriptionsExpireTimeInSeconds :: Int,
    -- | Is authentication required to perform this operation
    nonPersistentExpireMessagesForAllSubscriptionsAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentExpireMessagesForAllSubscriptions :: NonPersistentExpireMessagesForAllSubscriptionsParameters -> ClientM NoContent
nonPersistentExpireMessagesForAllSubscriptions NonPersistentExpireMessagesForAllSubscriptionsParameters {..} = client (Proxy :: Proxy NonPersistentExpireMessagesForAllSubscriptionsAPI) (nonPersistentExpireMessagesForAllSubscriptionsTenant) (nonPersistentExpireMessagesForAllSubscriptionsNamespace) (nonPersistentExpireMessagesForAllSubscriptionsTopic) (nonPersistentExpireMessagesForAllSubscriptionsExpireTimeInSeconds) (nonPersistentExpireMessagesForAllSubscriptionsAuthoritative)
-- ^

type NonPersistentExpireTopicMessagesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "expireMessages" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] ResetCursorData :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentExpireTopicMessagesParameters = NonPersistentExpireTopicMessagesParameters
  { -- | Specify the tenant
    nonPersistentExpireTopicMessagesTenant :: Text,
    -- | Specify the namespace
    nonPersistentExpireTopicMessagesNamespace :: Text,
    -- | Specify topic name
    nonPersistentExpireTopicMessagesTopic :: Text,
    -- | Subscription to be Expiry messages on
    nonPersistentExpireTopicMessagesSubName :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentExpireTopicMessagesAuthoritative :: Maybe Bool,
    -- | messageId to reset back to (ledgerId:entryId)
    nonPersistentExpireTopicMessagesMessageId :: ResetCursorData
  }
  deriving (Show, Eq, Generic)

nonPersistentExpireTopicMessages :: NonPersistentExpireTopicMessagesParameters -> ClientM NoContent
nonPersistentExpireTopicMessages NonPersistentExpireTopicMessagesParameters {..} = client (Proxy :: Proxy NonPersistentExpireTopicMessagesAPI) (nonPersistentExpireTopicMessagesTenant) (nonPersistentExpireTopicMessagesNamespace) (nonPersistentExpireTopicMessagesTopic) (nonPersistentExpireTopicMessagesSubName) (nonPersistentExpireTopicMessagesAuthoritative) nonPersistentExpireTopicMessagesMessageId
-- ^

type NonPersistentExpireTopicMessagesInSecondsAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "expireMessages" :> Capture "expireTimeInSeconds" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentExpireTopicMessagesInSecondsParameters = NonPersistentExpireTopicMessagesInSecondsParameters
  { -- | Specify the tenant
    nonPersistentExpireTopicMessagesInSecondsTenant :: Text,
    -- | Specify the namespace
    nonPersistentExpireTopicMessagesInSecondsNamespace :: Text,
    -- | Specify topic name
    nonPersistentExpireTopicMessagesInSecondsTopic :: Text,
    -- | Subscription to be Expiry messages on
    nonPersistentExpireTopicMessagesInSecondsSubName :: Text,
    -- | Expires beyond the specified number of seconds
    nonPersistentExpireTopicMessagesInSecondsExpireTimeInSeconds :: Int,
    -- | Is authentication required to perform this operation
    nonPersistentExpireTopicMessagesInSecondsAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentExpireTopicMessagesInSeconds :: NonPersistentExpireTopicMessagesInSecondsParameters -> ClientM NoContent
nonPersistentExpireTopicMessagesInSeconds NonPersistentExpireTopicMessagesInSecondsParameters {..} = client (Proxy :: Proxy NonPersistentExpireTopicMessagesInSecondsAPI) (nonPersistentExpireTopicMessagesInSecondsTenant) (nonPersistentExpireTopicMessagesInSecondsNamespace) (nonPersistentExpireTopicMessagesInSecondsTopic) (nonPersistentExpireTopicMessagesInSecondsSubName) (nonPersistentExpireTopicMessagesInSecondsExpireTimeInSeconds) (nonPersistentExpireTopicMessagesInSecondsAuthoritative)
-- ^

type NonPersistentGetBacklogAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlog" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] PersistentOfflineTopicStats

data NonPersistentGetBacklogParameters = NonPersistentGetBacklogParameters
  { -- | Specify the tenant
    nonPersistentGetBacklogTenant :: Text,
    -- | Specify the namespace
    nonPersistentGetBacklogNamespace :: Text,
    -- | Specify topic name
    nonPersistentGetBacklogTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentGetBacklogAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetBacklog :: NonPersistentGetBacklogParameters -> ClientM PersistentOfflineTopicStats
nonPersistentGetBacklog NonPersistentGetBacklogParameters {..} = client (Proxy :: Proxy NonPersistentGetBacklogAPI) (nonPersistentGetBacklogTenant) (nonPersistentGetBacklogNamespace) (nonPersistentGetBacklogTopic) (nonPersistentGetBacklogAuthoritative)
-- ^

type NonPersistentGetBacklogQuotaMapAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlogQuotaMap" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetBacklogQuotaMapParameters = NonPersistentGetBacklogQuotaMapParameters
  { -- |
    nonPersistentGetBacklogQuotaMapTenant :: Text,
    -- |
    nonPersistentGetBacklogQuotaMapNamespace :: Text,
    -- |
    nonPersistentGetBacklogQuotaMapTopic :: Text,
    -- |
    nonPersistentGetBacklogQuotaMapApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetBacklogQuotaMapAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetBacklogQuotaMap :: NonPersistentGetBacklogQuotaMapParameters -> ClientM NoContent
nonPersistentGetBacklogQuotaMap NonPersistentGetBacklogQuotaMapParameters {..} = client (Proxy :: Proxy NonPersistentGetBacklogQuotaMapAPI) (nonPersistentGetBacklogQuotaMapTenant) (nonPersistentGetBacklogQuotaMapNamespace) (nonPersistentGetBacklogQuotaMapTopic) (nonPersistentGetBacklogQuotaMapApplied) (nonPersistentGetBacklogQuotaMapAuthoritative)
-- ^

type NonPersistentGetCompactionThresholdAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compactionThreshold" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetCompactionThresholdParameters = NonPersistentGetCompactionThresholdParameters
  { -- |
    nonPersistentGetCompactionThresholdTenant :: Text,
    -- |
    nonPersistentGetCompactionThresholdNamespace :: Text,
    -- |
    nonPersistentGetCompactionThresholdTopic :: Text,
    -- |
    nonPersistentGetCompactionThresholdApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetCompactionThresholdAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetCompactionThreshold :: NonPersistentGetCompactionThresholdParameters -> ClientM NoContent
nonPersistentGetCompactionThreshold NonPersistentGetCompactionThresholdParameters {..} = client (Proxy :: Proxy NonPersistentGetCompactionThresholdAPI) (nonPersistentGetCompactionThresholdTenant) (nonPersistentGetCompactionThresholdNamespace) (nonPersistentGetCompactionThresholdTopic) (nonPersistentGetCompactionThresholdApplied) (nonPersistentGetCompactionThresholdAuthoritative)
-- ^

type NonPersistentGetDeduplicationAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationEnabled" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetDeduplicationParameters = NonPersistentGetDeduplicationParameters
  { -- |
    nonPersistentGetDeduplicationTenant :: Text,
    -- |
    nonPersistentGetDeduplicationNamespace :: Text,
    -- |
    nonPersistentGetDeduplicationTopic :: Text,
    -- |
    nonPersistentGetDeduplicationApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetDeduplicationAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetDeduplication :: NonPersistentGetDeduplicationParameters -> ClientM NoContent
nonPersistentGetDeduplication NonPersistentGetDeduplicationParameters {..} = client (Proxy :: Proxy NonPersistentGetDeduplicationAPI) (nonPersistentGetDeduplicationTenant) (nonPersistentGetDeduplicationNamespace) (nonPersistentGetDeduplicationTopic) (nonPersistentGetDeduplicationApplied) (nonPersistentGetDeduplicationAuthoritative)
-- ^

type NonPersistentGetDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationSnapshotInterval" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetDeduplicationSnapshotIntervalParameters = NonPersistentGetDeduplicationSnapshotIntervalParameters
  { -- |
    nonPersistentGetDeduplicationSnapshotIntervalTenant :: Text,
    -- |
    nonPersistentGetDeduplicationSnapshotIntervalNamespace :: Text,
    -- |
    nonPersistentGetDeduplicationSnapshotIntervalTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentGetDeduplicationSnapshotIntervalAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetDeduplicationSnapshotInterval :: NonPersistentGetDeduplicationSnapshotIntervalParameters -> ClientM NoContent
nonPersistentGetDeduplicationSnapshotInterval NonPersistentGetDeduplicationSnapshotIntervalParameters {..} = client (Proxy :: Proxy NonPersistentGetDeduplicationSnapshotIntervalAPI) (nonPersistentGetDeduplicationSnapshotIntervalTenant) (nonPersistentGetDeduplicationSnapshotIntervalNamespace) (nonPersistentGetDeduplicationSnapshotIntervalTopic) (nonPersistentGetDeduplicationSnapshotIntervalAuthoritative)
-- ^

type NonPersistentGetDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "delayedDelivery" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetDelayedDeliveryPoliciesParameters = NonPersistentGetDelayedDeliveryPoliciesParameters
  { -- |
    nonPersistentGetDelayedDeliveryPoliciesTenant :: Text,
    -- |
    nonPersistentGetDelayedDeliveryPoliciesNamespace :: Text,
    -- |
    nonPersistentGetDelayedDeliveryPoliciesTopic :: Text,
    -- |
    nonPersistentGetDelayedDeliveryPoliciesApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetDelayedDeliveryPoliciesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetDelayedDeliveryPolicies :: NonPersistentGetDelayedDeliveryPoliciesParameters -> ClientM NoContent
nonPersistentGetDelayedDeliveryPolicies NonPersistentGetDelayedDeliveryPoliciesParameters {..} = client (Proxy :: Proxy NonPersistentGetDelayedDeliveryPoliciesAPI) (nonPersistentGetDelayedDeliveryPoliciesTenant) (nonPersistentGetDelayedDeliveryPoliciesNamespace) (nonPersistentGetDelayedDeliveryPoliciesTopic) (nonPersistentGetDelayedDeliveryPoliciesApplied) (nonPersistentGetDelayedDeliveryPoliciesAuthoritative)
-- ^

type NonPersistentGetDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "dispatchRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetDispatchRateParameters = NonPersistentGetDispatchRateParameters
  { -- |
    nonPersistentGetDispatchRateTenant :: Text,
    -- |
    nonPersistentGetDispatchRateNamespace :: Text,
    -- |
    nonPersistentGetDispatchRateTopic :: Text,
    -- |
    nonPersistentGetDispatchRateApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetDispatchRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetDispatchRate :: NonPersistentGetDispatchRateParameters -> ClientM NoContent
nonPersistentGetDispatchRate NonPersistentGetDispatchRateParameters {..} = client (Proxy :: Proxy NonPersistentGetDispatchRateAPI) (nonPersistentGetDispatchRateTenant) (nonPersistentGetDispatchRateNamespace) (nonPersistentGetDispatchRateTopic) (nonPersistentGetDispatchRateApplied) (nonPersistentGetDispatchRateAuthoritative)
-- ^

type NonPersistentGetInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "inactiveTopicPolicies" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetInactiveTopicPoliciesParameters = NonPersistentGetInactiveTopicPoliciesParameters
  { -- |
    nonPersistentGetInactiveTopicPoliciesTenant :: Text,
    -- |
    nonPersistentGetInactiveTopicPoliciesNamespace :: Text,
    -- |
    nonPersistentGetInactiveTopicPoliciesTopic :: Text,
    -- |
    nonPersistentGetInactiveTopicPoliciesApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetInactiveTopicPoliciesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetInactiveTopicPolicies :: NonPersistentGetInactiveTopicPoliciesParameters -> ClientM NoContent
nonPersistentGetInactiveTopicPolicies NonPersistentGetInactiveTopicPoliciesParameters {..} = client (Proxy :: Proxy NonPersistentGetInactiveTopicPoliciesAPI) (nonPersistentGetInactiveTopicPoliciesTenant) (nonPersistentGetInactiveTopicPoliciesNamespace) (nonPersistentGetInactiveTopicPoliciesTopic) (nonPersistentGetInactiveTopicPoliciesApplied) (nonPersistentGetInactiveTopicPoliciesAuthoritative)
-- ^

type NonPersistentGetInternalStatsAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "internalStats" :> QueryParam "authoritative" Bool :> QueryParam "metadata" Bool :> Verb 'GET 200 '[JSON] PersistentTopicInternalStats

data NonPersistentGetInternalStatsParameters = NonPersistentGetInternalStatsParameters
  { -- | Specify the tenant
    nonPersistentGetInternalStatsTenant :: Text,
    -- | Specify the namespace
    nonPersistentGetInternalStatsNamespace :: Text,
    -- | Specify topic name
    nonPersistentGetInternalStatsTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentGetInternalStatsAuthoritative :: Maybe Bool,
    -- |
    nonPersistentGetInternalStatsMetadata :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetInternalStats :: NonPersistentGetInternalStatsParameters -> ClientM PersistentTopicInternalStats
nonPersistentGetInternalStats NonPersistentGetInternalStatsParameters {..} = client (Proxy :: Proxy NonPersistentGetInternalStatsAPI) (nonPersistentGetInternalStatsTenant) (nonPersistentGetInternalStatsNamespace) (nonPersistentGetInternalStatsTopic) (nonPersistentGetInternalStatsAuthoritative) (nonPersistentGetInternalStatsMetadata)
-- ^

type NonPersistentGetLastMessageIdAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "lastMessageId" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetLastMessageIdParameters = NonPersistentGetLastMessageIdParameters
  { -- | Specify the tenant
    nonPersistentGetLastMessageIdTenant :: Text,
    -- | Specify the namespace
    nonPersistentGetLastMessageIdNamespace :: Text,
    -- | Specify topic name
    nonPersistentGetLastMessageIdTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentGetLastMessageIdAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetLastMessageId :: NonPersistentGetLastMessageIdParameters -> ClientM NoContent
nonPersistentGetLastMessageId NonPersistentGetLastMessageIdParameters {..} = client (Proxy :: Proxy NonPersistentGetLastMessageIdAPI) (nonPersistentGetLastMessageIdTenant) (nonPersistentGetLastMessageIdNamespace) (nonPersistentGetLastMessageIdTopic) (nonPersistentGetLastMessageIdAuthoritative)
-- ^

type NonPersistentGetListAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Verb 'GET 200 '[JSON] [Text]

data NonPersistentGetListParameters = NonPersistentGetListParameters
  { -- | Specify the tenant
    nonPersistentGetListTenant :: Text,
    -- | Specify the namespace
    nonPersistentGetListNamespace :: Text
  }
  deriving (Show, Eq, Generic)

nonPersistentGetList :: NonPersistentGetListParameters -> ClientM [Text]
nonPersistentGetList NonPersistentGetListParameters {..} = client (Proxy :: Proxy NonPersistentGetListAPI) (nonPersistentGetListTenant) (nonPersistentGetListNamespace)
-- ^

type NonPersistentGetListFromBundleAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> Verb 'GET 200 '[JSON] [Text]

data NonPersistentGetListFromBundleParameters = NonPersistentGetListFromBundleParameters
  { -- | Specify the tenant
    nonPersistentGetListFromBundleTenant :: Text,
    -- | Specify the namespace
    nonPersistentGetListFromBundleNamespace :: Text,
    -- | Bundle range of a topic
    nonPersistentGetListFromBundleBundle :: Text
  }
  deriving (Show, Eq, Generic)

nonPersistentGetListFromBundle :: NonPersistentGetListFromBundleParameters -> ClientM [Text]
nonPersistentGetListFromBundle NonPersistentGetListFromBundleParameters {..} = client (Proxy :: Proxy NonPersistentGetListFromBundleAPI) (nonPersistentGetListFromBundleTenant) (nonPersistentGetListFromBundleNamespace) (nonPersistentGetListFromBundleBundle)
-- ^

type NonPersistentGetManagedLedgerInfoAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "internal-info" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetManagedLedgerInfoParameters = NonPersistentGetManagedLedgerInfoParameters
  { -- | Specify the tenant
    nonPersistentGetManagedLedgerInfoTenant :: Text,
    -- | Specify the namespace
    nonPersistentGetManagedLedgerInfoNamespace :: Text,
    -- | Specify topic name
    nonPersistentGetManagedLedgerInfoTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentGetManagedLedgerInfoAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetManagedLedgerInfo :: NonPersistentGetManagedLedgerInfoParameters -> ClientM NoContent
nonPersistentGetManagedLedgerInfo NonPersistentGetManagedLedgerInfoParameters {..} = client (Proxy :: Proxy NonPersistentGetManagedLedgerInfoAPI) (nonPersistentGetManagedLedgerInfoTenant) (nonPersistentGetManagedLedgerInfoNamespace) (nonPersistentGetManagedLedgerInfoTopic) (nonPersistentGetManagedLedgerInfoAuthoritative)
-- ^

type NonPersistentGetMaxConsumersAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumers" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetMaxConsumersParameters = NonPersistentGetMaxConsumersParameters
  { -- |
    nonPersistentGetMaxConsumersTenant :: Text,
    -- |
    nonPersistentGetMaxConsumersNamespace :: Text,
    -- |
    nonPersistentGetMaxConsumersTopic :: Text,
    -- |
    nonPersistentGetMaxConsumersApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetMaxConsumersAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetMaxConsumers :: NonPersistentGetMaxConsumersParameters -> ClientM NoContent
nonPersistentGetMaxConsumers NonPersistentGetMaxConsumersParameters {..} = client (Proxy :: Proxy NonPersistentGetMaxConsumersAPI) (nonPersistentGetMaxConsumersTenant) (nonPersistentGetMaxConsumersNamespace) (nonPersistentGetMaxConsumersTopic) (nonPersistentGetMaxConsumersApplied) (nonPersistentGetMaxConsumersAuthoritative)
-- ^

type NonPersistentGetMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumersPerSubscription" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetMaxConsumersPerSubscriptionParameters = NonPersistentGetMaxConsumersPerSubscriptionParameters
  { -- |
    nonPersistentGetMaxConsumersPerSubscriptionTenant :: Text,
    -- |
    nonPersistentGetMaxConsumersPerSubscriptionNamespace :: Text,
    -- |
    nonPersistentGetMaxConsumersPerSubscriptionTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentGetMaxConsumersPerSubscriptionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetMaxConsumersPerSubscription :: NonPersistentGetMaxConsumersPerSubscriptionParameters -> ClientM NoContent
nonPersistentGetMaxConsumersPerSubscription NonPersistentGetMaxConsumersPerSubscriptionParameters {..} = client (Proxy :: Proxy NonPersistentGetMaxConsumersPerSubscriptionAPI) (nonPersistentGetMaxConsumersPerSubscriptionTenant) (nonPersistentGetMaxConsumersPerSubscriptionNamespace) (nonPersistentGetMaxConsumersPerSubscriptionTopic) (nonPersistentGetMaxConsumersPerSubscriptionAuthoritative)
-- ^

type NonPersistentGetMaxMessageSizeAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxMessageSize" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetMaxMessageSizeParameters = NonPersistentGetMaxMessageSizeParameters
  { -- |
    nonPersistentGetMaxMessageSizeTenant :: Text,
    -- |
    nonPersistentGetMaxMessageSizeNamespace :: Text,
    -- |
    nonPersistentGetMaxMessageSizeTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentGetMaxMessageSizeAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetMaxMessageSize :: NonPersistentGetMaxMessageSizeParameters -> ClientM NoContent
nonPersistentGetMaxMessageSize NonPersistentGetMaxMessageSizeParameters {..} = client (Proxy :: Proxy NonPersistentGetMaxMessageSizeAPI) (nonPersistentGetMaxMessageSizeTenant) (nonPersistentGetMaxMessageSizeNamespace) (nonPersistentGetMaxMessageSizeTopic) (nonPersistentGetMaxMessageSizeAuthoritative)
-- ^

type NonPersistentGetMaxProducersAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxProducers" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetMaxProducersParameters = NonPersistentGetMaxProducersParameters
  { -- |
    nonPersistentGetMaxProducersTenant :: Text,
    -- |
    nonPersistentGetMaxProducersNamespace :: Text,
    -- |
    nonPersistentGetMaxProducersTopic :: Text,
    -- |
    nonPersistentGetMaxProducersApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetMaxProducersAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetMaxProducers :: NonPersistentGetMaxProducersParameters -> ClientM NoContent
nonPersistentGetMaxProducers NonPersistentGetMaxProducersParameters {..} = client (Proxy :: Proxy NonPersistentGetMaxProducersAPI) (nonPersistentGetMaxProducersTenant) (nonPersistentGetMaxProducersNamespace) (nonPersistentGetMaxProducersTopic) (nonPersistentGetMaxProducersApplied) (nonPersistentGetMaxProducersAuthoritative)
-- ^

type NonPersistentGetMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxSubscriptionsPerTopic" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetMaxSubscriptionsPerTopicParameters = NonPersistentGetMaxSubscriptionsPerTopicParameters
  { -- |
    nonPersistentGetMaxSubscriptionsPerTopicTenant :: Text,
    -- |
    nonPersistentGetMaxSubscriptionsPerTopicNamespace :: Text,
    -- |
    nonPersistentGetMaxSubscriptionsPerTopicTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentGetMaxSubscriptionsPerTopicAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetMaxSubscriptionsPerTopic :: NonPersistentGetMaxSubscriptionsPerTopicParameters -> ClientM NoContent
nonPersistentGetMaxSubscriptionsPerTopic NonPersistentGetMaxSubscriptionsPerTopicParameters {..} = client (Proxy :: Proxy NonPersistentGetMaxSubscriptionsPerTopicAPI) (nonPersistentGetMaxSubscriptionsPerTopicTenant) (nonPersistentGetMaxSubscriptionsPerTopicNamespace) (nonPersistentGetMaxSubscriptionsPerTopicTopic) (nonPersistentGetMaxSubscriptionsPerTopicAuthoritative)
-- ^

type NonPersistentGetMaxUnackedMessagesOnConsumerAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnConsumer" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetMaxUnackedMessagesOnConsumerParameters = NonPersistentGetMaxUnackedMessagesOnConsumerParameters
  { -- |
    nonPersistentGetMaxUnackedMessagesOnConsumerTenant :: Text,
    -- |
    nonPersistentGetMaxUnackedMessagesOnConsumerNamespace :: Text,
    -- |
    nonPersistentGetMaxUnackedMessagesOnConsumerTopic :: Text,
    -- |
    nonPersistentGetMaxUnackedMessagesOnConsumerApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetMaxUnackedMessagesOnConsumerAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetMaxUnackedMessagesOnConsumer :: NonPersistentGetMaxUnackedMessagesOnConsumerParameters -> ClientM NoContent
nonPersistentGetMaxUnackedMessagesOnConsumer NonPersistentGetMaxUnackedMessagesOnConsumerParameters {..} = client (Proxy :: Proxy NonPersistentGetMaxUnackedMessagesOnConsumerAPI) (nonPersistentGetMaxUnackedMessagesOnConsumerTenant) (nonPersistentGetMaxUnackedMessagesOnConsumerNamespace) (nonPersistentGetMaxUnackedMessagesOnConsumerTopic) (nonPersistentGetMaxUnackedMessagesOnConsumerApplied) (nonPersistentGetMaxUnackedMessagesOnConsumerAuthoritative)
-- ^

type NonPersistentGetMaxUnackedMessagesOnSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnSubscription" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetMaxUnackedMessagesOnSubscriptionParameters = NonPersistentGetMaxUnackedMessagesOnSubscriptionParameters
  { -- |
    nonPersistentGetMaxUnackedMessagesOnSubscriptionTenant :: Text,
    -- |
    nonPersistentGetMaxUnackedMessagesOnSubscriptionNamespace :: Text,
    -- |
    nonPersistentGetMaxUnackedMessagesOnSubscriptionTopic :: Text,
    -- |
    nonPersistentGetMaxUnackedMessagesOnSubscriptionApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetMaxUnackedMessagesOnSubscriptionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetMaxUnackedMessagesOnSubscription :: NonPersistentGetMaxUnackedMessagesOnSubscriptionParameters -> ClientM NoContent
nonPersistentGetMaxUnackedMessagesOnSubscription NonPersistentGetMaxUnackedMessagesOnSubscriptionParameters {..} = client (Proxy :: Proxy NonPersistentGetMaxUnackedMessagesOnSubscriptionAPI) (nonPersistentGetMaxUnackedMessagesOnSubscriptionTenant) (nonPersistentGetMaxUnackedMessagesOnSubscriptionNamespace) (nonPersistentGetMaxUnackedMessagesOnSubscriptionTopic) (nonPersistentGetMaxUnackedMessagesOnSubscriptionApplied) (nonPersistentGetMaxUnackedMessagesOnSubscriptionAuthoritative)
-- ^

type NonPersistentGetMessageByIdAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "ledger" :> Capture "ledgerId" Integer :> "entry" :> Capture "entryId" Integer :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetMessageByIdParameters = NonPersistentGetMessageByIdParameters
  { -- | Specify the tenant
    nonPersistentGetMessageByIdTenant :: Text,
    -- | Specify the namespace
    nonPersistentGetMessageByIdNamespace :: Text,
    -- | Specify topic name
    nonPersistentGetMessageByIdTopic :: Text,
    -- | The ledger id
    nonPersistentGetMessageByIdLedgerId :: Integer,
    -- | The entry id
    nonPersistentGetMessageByIdEntryId :: Integer,
    -- | Is authentication required to perform this operation
    nonPersistentGetMessageByIdAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetMessageById :: NonPersistentGetMessageByIdParameters -> ClientM NoContent
nonPersistentGetMessageById NonPersistentGetMessageByIdParameters {..} = client (Proxy :: Proxy NonPersistentGetMessageByIdAPI) (nonPersistentGetMessageByIdTenant) (nonPersistentGetMessageByIdNamespace) (nonPersistentGetMessageByIdTopic) (nonPersistentGetMessageByIdLedgerId) (nonPersistentGetMessageByIdEntryId) (nonPersistentGetMessageByIdAuthoritative)
-- ^

type NonPersistentGetMessageIdByTimestampAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageid" :> Capture "timestamp" Integer :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetMessageIdByTimestampParameters = NonPersistentGetMessageIdByTimestampParameters
  { -- | Specify the tenant
    nonPersistentGetMessageIdByTimestampTenant :: Text,
    -- | Specify the namespace
    nonPersistentGetMessageIdByTimestampNamespace :: Text,
    -- | Specify topic name
    nonPersistentGetMessageIdByTimestampTopic :: Text,
    -- | Specify the timestamp
    nonPersistentGetMessageIdByTimestampTimestamp :: Integer,
    -- | Is authentication required to perform this operation
    nonPersistentGetMessageIdByTimestampAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetMessageIdByTimestamp :: NonPersistentGetMessageIdByTimestampParameters -> ClientM NoContent
nonPersistentGetMessageIdByTimestamp NonPersistentGetMessageIdByTimestampParameters {..} = client (Proxy :: Proxy NonPersistentGetMessageIdByTimestampAPI) (nonPersistentGetMessageIdByTimestampTenant) (nonPersistentGetMessageIdByTimestampNamespace) (nonPersistentGetMessageIdByTimestampTopic) (nonPersistentGetMessageIdByTimestampTimestamp) (nonPersistentGetMessageIdByTimestampAuthoritative)
-- ^

type NonPersistentGetMessageTTLAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageTTL" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetMessageTTLParameters = NonPersistentGetMessageTTLParameters
  { -- |
    nonPersistentGetMessageTTLTenant :: Text,
    -- |
    nonPersistentGetMessageTTLNamespace :: Text,
    -- |
    nonPersistentGetMessageTTLTopic :: Text,
    -- |
    nonPersistentGetMessageTTLApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetMessageTTLAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetMessageTTL :: NonPersistentGetMessageTTLParameters -> ClientM NoContent
nonPersistentGetMessageTTL NonPersistentGetMessageTTLParameters {..} = client (Proxy :: Proxy NonPersistentGetMessageTTLAPI) (nonPersistentGetMessageTTLTenant) (nonPersistentGetMessageTTLNamespace) (nonPersistentGetMessageTTLTopic) (nonPersistentGetMessageTTLApplied) (nonPersistentGetMessageTTLAuthoritative)
-- ^

type NonPersistentGetOffloadPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offloadPolicies" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetOffloadPoliciesParameters = NonPersistentGetOffloadPoliciesParameters
  { -- |
    nonPersistentGetOffloadPoliciesTenant :: Text,
    -- |
    nonPersistentGetOffloadPoliciesNamespace :: Text,
    -- |
    nonPersistentGetOffloadPoliciesTopic :: Text,
    -- |
    nonPersistentGetOffloadPoliciesApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetOffloadPoliciesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetOffloadPolicies :: NonPersistentGetOffloadPoliciesParameters -> ClientM NoContent
nonPersistentGetOffloadPolicies NonPersistentGetOffloadPoliciesParameters {..} = client (Proxy :: Proxy NonPersistentGetOffloadPoliciesAPI) (nonPersistentGetOffloadPoliciesTenant) (nonPersistentGetOffloadPoliciesNamespace) (nonPersistentGetOffloadPoliciesTopic) (nonPersistentGetOffloadPoliciesApplied) (nonPersistentGetOffloadPoliciesAuthoritative)
-- ^

type NonPersistentGetPartitionedMetadataAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "authoritative" Bool :> QueryParam "checkAllowAutoCreation" Bool :> Verb 'GET 200 '[JSON] PartitionedTopicMetadata

data NonPersistentGetPartitionedMetadataParameters = NonPersistentGetPartitionedMetadataParameters
  { -- | Specify the tenant
    nonPersistentGetPartitionedMetadataTenant :: Text,
    -- | Specify the namespace
    nonPersistentGetPartitionedMetadataNamespace :: Text,
    -- | Specify topic name
    nonPersistentGetPartitionedMetadataTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentGetPartitionedMetadataAuthoritative :: Maybe Bool,
    -- | Is check configuration required to automatically create topic
    nonPersistentGetPartitionedMetadataCheckAllowAutoCreation :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetPartitionedMetadata :: NonPersistentGetPartitionedMetadataParameters -> ClientM PartitionedTopicMetadata
nonPersistentGetPartitionedMetadata NonPersistentGetPartitionedMetadataParameters {..} = client (Proxy :: Proxy NonPersistentGetPartitionedMetadataAPI) (nonPersistentGetPartitionedMetadataTenant) (nonPersistentGetPartitionedMetadataNamespace) (nonPersistentGetPartitionedMetadataTopic) (nonPersistentGetPartitionedMetadataAuthoritative) (nonPersistentGetPartitionedMetadataCheckAllowAutoCreation)
-- ^

type NonPersistentGetPartitionedStatsAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitioned-stats" :> QueryParam "perPartition" Bool :> QueryParam "authoritative" Bool :> QueryParam "getPreciseBacklog" Bool :> QueryParam "subscriptionBacklogSize" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetPartitionedStatsParameters = NonPersistentGetPartitionedStatsParameters
  { -- | Specify the tenant
    nonPersistentGetPartitionedStatsTenant :: Text,
    -- | Specify the namespace
    nonPersistentGetPartitionedStatsNamespace :: Text,
    -- | Specify topic name
    nonPersistentGetPartitionedStatsTopic :: Text,
    -- | Get per partition stats
    nonPersistentGetPartitionedStatsPerPartition :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetPartitionedStatsAuthoritative :: Maybe Bool,
    -- | If return precise backlog or imprecise backlog
    nonPersistentGetPartitionedStatsGetPreciseBacklog :: Maybe Bool,
    -- | If return backlog size for each subscription, require locking on ledger so be careful not to use when there's heavy traffic.
    nonPersistentGetPartitionedStatsSubscriptionBacklogSize :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetPartitionedStats :: NonPersistentGetPartitionedStatsParameters -> ClientM NoContent
nonPersistentGetPartitionedStats NonPersistentGetPartitionedStatsParameters {..} = client (Proxy :: Proxy NonPersistentGetPartitionedStatsAPI) (nonPersistentGetPartitionedStatsTenant) (nonPersistentGetPartitionedStatsNamespace) (nonPersistentGetPartitionedStatsTopic) (nonPersistentGetPartitionedStatsPerPartition) (nonPersistentGetPartitionedStatsAuthoritative) (nonPersistentGetPartitionedStatsGetPreciseBacklog) (nonPersistentGetPartitionedStatsSubscriptionBacklogSize)
-- ^

type NonPersistentGetPartitionedTopicListAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> "partitioned" :> Verb 'GET 200 '[JSON] [Text]

data NonPersistentGetPartitionedTopicListParameters = NonPersistentGetPartitionedTopicListParameters
  { -- | Specify the tenant
    nonPersistentGetPartitionedTopicListTenant :: Text,
    -- | Specify the namespace
    nonPersistentGetPartitionedTopicListNamespace :: Text
  }
  deriving (Show, Eq, Generic)

nonPersistentGetPartitionedTopicList :: NonPersistentGetPartitionedTopicListParameters -> ClientM [Text]
nonPersistentGetPartitionedTopicList NonPersistentGetPartitionedTopicListParameters {..} = client (Proxy :: Proxy NonPersistentGetPartitionedTopicListAPI) (nonPersistentGetPartitionedTopicListTenant) (nonPersistentGetPartitionedTopicListNamespace)
-- ^ Retrieve the effective permissions for a topic. These permissions are defined by the permissions set at thenamespace level combined (union) with any eventual specific permission set on the topic.

type NonPersistentGetPermissionsOnTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "permissions" :> Verb 'GET 200 '[JSON] ((Map.Map String [Text]))

data NonPersistentGetPermissionsOnTopicParameters = NonPersistentGetPermissionsOnTopicParameters
  { -- | Specify the tenant
    nonPersistentGetPermissionsOnTopicTenant :: Text,
    -- | Specify the namespace
    nonPersistentGetPermissionsOnTopicNamespace :: Text,
    -- | Specify topic name
    nonPersistentGetPermissionsOnTopicTopic :: Text
  }
  deriving (Show, Eq, Generic)

nonPersistentGetPermissionsOnTopic :: NonPersistentGetPermissionsOnTopicParameters -> ClientM (Map.Map String [Text])
nonPersistentGetPermissionsOnTopic NonPersistentGetPermissionsOnTopicParameters {..} = client (Proxy :: Proxy NonPersistentGetPermissionsOnTopicAPI) (nonPersistentGetPermissionsOnTopicTenant) (nonPersistentGetPermissionsOnTopicNamespace) (nonPersistentGetPermissionsOnTopicTopic)
-- ^

type NonPersistentGetPersistenceAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "persistence" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetPersistenceParameters = NonPersistentGetPersistenceParameters
  { -- |
    nonPersistentGetPersistenceTenant :: Text,
    -- |
    nonPersistentGetPersistenceNamespace :: Text,
    -- |
    nonPersistentGetPersistenceTopic :: Text,
    -- |
    nonPersistentGetPersistenceApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetPersistenceAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetPersistence :: NonPersistentGetPersistenceParameters -> ClientM NoContent
nonPersistentGetPersistence NonPersistentGetPersistenceParameters {..} = client (Proxy :: Proxy NonPersistentGetPersistenceAPI) (nonPersistentGetPersistenceTenant) (nonPersistentGetPersistenceNamespace) (nonPersistentGetPersistenceTopic) (nonPersistentGetPersistenceApplied) (nonPersistentGetPersistenceAuthoritative)
-- ^

type NonPersistentGetPublishRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "publishRate" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetPublishRateParameters = NonPersistentGetPublishRateParameters
  { -- |
    nonPersistentGetPublishRateTenant :: Text,
    -- |
    nonPersistentGetPublishRateNamespace :: Text,
    -- |
    nonPersistentGetPublishRateTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentGetPublishRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetPublishRate :: NonPersistentGetPublishRateParameters -> ClientM NoContent
nonPersistentGetPublishRate NonPersistentGetPublishRateParameters {..} = client (Proxy :: Proxy NonPersistentGetPublishRateAPI) (nonPersistentGetPublishRateTenant) (nonPersistentGetPublishRateNamespace) (nonPersistentGetPublishRateTopic) (nonPersistentGetPublishRateAuthoritative)
-- ^

type NonPersistentGetReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "replicatorDispatchRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetReplicatorDispatchRateParameters = NonPersistentGetReplicatorDispatchRateParameters
  { -- |
    nonPersistentGetReplicatorDispatchRateTenant :: Text,
    -- |
    nonPersistentGetReplicatorDispatchRateNamespace :: Text,
    -- |
    nonPersistentGetReplicatorDispatchRateTopic :: Text,
    -- |
    nonPersistentGetReplicatorDispatchRateApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetReplicatorDispatchRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetReplicatorDispatchRate :: NonPersistentGetReplicatorDispatchRateParameters -> ClientM NoContent
nonPersistentGetReplicatorDispatchRate NonPersistentGetReplicatorDispatchRateParameters {..} = client (Proxy :: Proxy NonPersistentGetReplicatorDispatchRateAPI) (nonPersistentGetReplicatorDispatchRateTenant) (nonPersistentGetReplicatorDispatchRateNamespace) (nonPersistentGetReplicatorDispatchRateTopic) (nonPersistentGetReplicatorDispatchRateApplied) (nonPersistentGetReplicatorDispatchRateAuthoritative)
-- ^

type NonPersistentGetRetentionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "retention" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetRetentionParameters = NonPersistentGetRetentionParameters
  { -- |
    nonPersistentGetRetentionTenant :: Text,
    -- |
    nonPersistentGetRetentionNamespace :: Text,
    -- |
    nonPersistentGetRetentionTopic :: Text,
    -- |
    nonPersistentGetRetentionApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetRetentionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetRetention :: NonPersistentGetRetentionParameters -> ClientM NoContent
nonPersistentGetRetention NonPersistentGetRetentionParameters {..} = client (Proxy :: Proxy NonPersistentGetRetentionAPI) (nonPersistentGetRetentionTenant) (nonPersistentGetRetentionNamespace) (nonPersistentGetRetentionTopic) (nonPersistentGetRetentionApplied) (nonPersistentGetRetentionAuthoritative)
-- ^

type NonPersistentGetStatsAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "stats" :> QueryParam "authoritative" Bool :> QueryParam "getPreciseBacklog" Bool :> QueryParam "subscriptionBacklogSize" Bool :> Verb 'GET 200 '[JSON] NonPersistentTopicStats

data NonPersistentGetStatsParameters = NonPersistentGetStatsParameters
  { -- | Specify the tenant
    nonPersistentGetStatsTenant :: Text,
    -- | Specify the namespace
    nonPersistentGetStatsNamespace :: Text,
    -- | Specify topic name
    nonPersistentGetStatsTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentGetStatsAuthoritative :: Maybe Bool,
    -- | If return precise backlog or imprecise backlog
    nonPersistentGetStatsGetPreciseBacklog :: Maybe Bool,
    -- | If return backlog size for each subscription, require locking on ledger so be careful not to use when there's heavy traffic.
    nonPersistentGetStatsSubscriptionBacklogSize :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetStats :: NonPersistentGetStatsParameters -> ClientM NonPersistentTopicStats
nonPersistentGetStats NonPersistentGetStatsParameters {..} = client (Proxy :: Proxy NonPersistentGetStatsAPI) (nonPersistentGetStatsTenant) (nonPersistentGetStatsNamespace) (nonPersistentGetStatsTopic) (nonPersistentGetStatsAuthoritative) (nonPersistentGetStatsGetPreciseBacklog) (nonPersistentGetStatsSubscriptionBacklogSize)
-- ^

type NonPersistentGetSubscribeRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscribeRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetSubscribeRateParameters = NonPersistentGetSubscribeRateParameters
  { -- |
    nonPersistentGetSubscribeRateTenant :: Text,
    -- |
    nonPersistentGetSubscribeRateNamespace :: Text,
    -- |
    nonPersistentGetSubscribeRateTopic :: Text,
    -- |
    nonPersistentGetSubscribeRateApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetSubscribeRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetSubscribeRate :: NonPersistentGetSubscribeRateParameters -> ClientM NoContent
nonPersistentGetSubscribeRate NonPersistentGetSubscribeRateParameters {..} = client (Proxy :: Proxy NonPersistentGetSubscribeRateAPI) (nonPersistentGetSubscribeRateTenant) (nonPersistentGetSubscribeRateNamespace) (nonPersistentGetSubscribeRateTopic) (nonPersistentGetSubscribeRateApplied) (nonPersistentGetSubscribeRateAuthoritative)
-- ^

type NonPersistentGetSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionDispatchRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetSubscriptionDispatchRateParameters = NonPersistentGetSubscriptionDispatchRateParameters
  { -- |
    nonPersistentGetSubscriptionDispatchRateTenant :: Text,
    -- |
    nonPersistentGetSubscriptionDispatchRateNamespace :: Text,
    -- |
    nonPersistentGetSubscriptionDispatchRateTopic :: Text,
    -- |
    nonPersistentGetSubscriptionDispatchRateApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentGetSubscriptionDispatchRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetSubscriptionDispatchRate :: NonPersistentGetSubscriptionDispatchRateParameters -> ClientM NoContent
nonPersistentGetSubscriptionDispatchRate NonPersistentGetSubscriptionDispatchRateParameters {..} = client (Proxy :: Proxy NonPersistentGetSubscriptionDispatchRateAPI) (nonPersistentGetSubscriptionDispatchRateTenant) (nonPersistentGetSubscriptionDispatchRateNamespace) (nonPersistentGetSubscriptionDispatchRateTopic) (nonPersistentGetSubscriptionDispatchRateApplied) (nonPersistentGetSubscriptionDispatchRateAuthoritative)
-- ^

type NonPersistentGetSubscriptionTypesEnabledAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionTypesEnabled" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetSubscriptionTypesEnabledParameters = NonPersistentGetSubscriptionTypesEnabledParameters
  { -- |
    nonPersistentGetSubscriptionTypesEnabledTenant :: Text,
    -- |
    nonPersistentGetSubscriptionTypesEnabledNamespace :: Text,
    -- |
    nonPersistentGetSubscriptionTypesEnabledTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentGetSubscriptionTypesEnabledAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetSubscriptionTypesEnabled :: NonPersistentGetSubscriptionTypesEnabledParameters -> ClientM NoContent
nonPersistentGetSubscriptionTypesEnabled NonPersistentGetSubscriptionTypesEnabledParameters {..} = client (Proxy :: Proxy NonPersistentGetSubscriptionTypesEnabledAPI) (nonPersistentGetSubscriptionTypesEnabledTenant) (nonPersistentGetSubscriptionTypesEnabledNamespace) (nonPersistentGetSubscriptionTypesEnabledTopic) (nonPersistentGetSubscriptionTypesEnabledAuthoritative)
-- ^

type NonPersistentGetSubscriptionsAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptions" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentGetSubscriptionsParameters = NonPersistentGetSubscriptionsParameters
  { -- | Specify the tenant
    nonPersistentGetSubscriptionsTenant :: Text,
    -- | Specify the namespace
    nonPersistentGetSubscriptionsNamespace :: Text,
    -- | Specify topic name
    nonPersistentGetSubscriptionsTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentGetSubscriptionsAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentGetSubscriptions :: NonPersistentGetSubscriptionsParameters -> ClientM NoContent
nonPersistentGetSubscriptions NonPersistentGetSubscriptionsParameters {..} = client (Proxy :: Proxy NonPersistentGetSubscriptionsAPI) (nonPersistentGetSubscriptionsTenant) (nonPersistentGetSubscriptionsNamespace) (nonPersistentGetSubscriptionsTopic) (nonPersistentGetSubscriptionsAuthoritative)
-- ^

type NonPersistentGrantPermissionsOnTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "permissions" :> Capture "role" Text :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentGrantPermissionsOnTopicParameters = NonPersistentGrantPermissionsOnTopicParameters
  { -- | Specify the tenant
    nonPersistentGrantPermissionsOnTopicTenant :: Text,
    -- | Specify the namespace
    nonPersistentGrantPermissionsOnTopicNamespace :: Text,
    -- | Specify topic name
    nonPersistentGrantPermissionsOnTopicTopic :: Text,
    -- | Client role to which grant permissions
    nonPersistentGrantPermissionsOnTopicRole :: Text,
    -- | Actions to be granted (produce,functions,consume)
    nonPersistentGrantPermissionsOnTopicBody :: [Text]
  }
  deriving (Show, Eq, Generic)

nonPersistentGrantPermissionsOnTopic :: NonPersistentGrantPermissionsOnTopicParameters -> ClientM NoContent
nonPersistentGrantPermissionsOnTopic NonPersistentGrantPermissionsOnTopicParameters {..} = client (Proxy :: Proxy NonPersistentGrantPermissionsOnTopicAPI) (nonPersistentGrantPermissionsOnTopicTenant) (nonPersistentGrantPermissionsOnTopicNamespace) (nonPersistentGrantPermissionsOnTopicTopic) (nonPersistentGrantPermissionsOnTopicRole) nonPersistentGrantPermissionsOnTopicBody
-- ^

type NonPersistentOffloadStatusAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offload" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] OffloadProcessStatus

data NonPersistentOffloadStatusParameters = NonPersistentOffloadStatusParameters
  { -- | Specify the tenant
    nonPersistentOffloadStatusTenant :: Text,
    -- | Specify the namespace
    nonPersistentOffloadStatusNamespace :: Text,
    -- | Specify topic name
    nonPersistentOffloadStatusTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentOffloadStatusAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentOffloadStatus :: NonPersistentOffloadStatusParameters -> ClientM OffloadProcessStatus
nonPersistentOffloadStatus NonPersistentOffloadStatusParameters {..} = client (Proxy :: Proxy NonPersistentOffloadStatusAPI) (nonPersistentOffloadStatusTenant) (nonPersistentOffloadStatusNamespace) (nonPersistentOffloadStatusTopic) (nonPersistentOffloadStatusAuthoritative)
-- ^

type NonPersistentPeekNthMessageAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "position" :> Capture "messagePosition" Int :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data NonPersistentPeekNthMessageParameters = NonPersistentPeekNthMessageParameters
  { -- | Specify the tenant
    nonPersistentPeekNthMessageTenant :: Text,
    -- | Specify the namespace
    nonPersistentPeekNthMessageNamespace :: Text,
    -- | Specify topic name
    nonPersistentPeekNthMessageTopic :: Text,
    -- | Subscribed message expired
    nonPersistentPeekNthMessageSubName :: Text,
    -- | The number of messages (default 1)
    nonPersistentPeekNthMessageMessagePosition :: Int,
    -- | Is authentication required to perform this operation
    nonPersistentPeekNthMessageAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentPeekNthMessage :: NonPersistentPeekNthMessageParameters -> ClientM NoContent
nonPersistentPeekNthMessage NonPersistentPeekNthMessageParameters {..} = client (Proxy :: Proxy NonPersistentPeekNthMessageAPI) (nonPersistentPeekNthMessageTenant) (nonPersistentPeekNthMessageNamespace) (nonPersistentPeekNthMessageTopic) (nonPersistentPeekNthMessageSubName) (nonPersistentPeekNthMessageMessagePosition) (nonPersistentPeekNthMessageAuthoritative)
-- ^

type NonPersistentRemoveBacklogQuotaAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlogQuota" :> QueryParam "backlogQuotaType" Text :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemoveBacklogQuotaParameters = NonPersistentRemoveBacklogQuotaParameters
  { -- |
    nonPersistentRemoveBacklogQuotaTenant :: Text,
    -- |
    nonPersistentRemoveBacklogQuotaNamespace :: Text,
    -- |
    nonPersistentRemoveBacklogQuotaTopic :: Text,
    -- |
    nonPersistentRemoveBacklogQuotaBacklogQuotaType :: Maybe Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemoveBacklogQuotaAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemoveBacklogQuota :: NonPersistentRemoveBacklogQuotaParameters -> ClientM NoContent
nonPersistentRemoveBacklogQuota NonPersistentRemoveBacklogQuotaParameters {..} = client (Proxy :: Proxy NonPersistentRemoveBacklogQuotaAPI) (nonPersistentRemoveBacklogQuotaTenant) (nonPersistentRemoveBacklogQuotaNamespace) (nonPersistentRemoveBacklogQuotaTopic) (nonPersistentRemoveBacklogQuotaBacklogQuotaType) (nonPersistentRemoveBacklogQuotaAuthoritative)
-- ^

type NonPersistentRemoveCompactionThresholdAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compactionThreshold" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemoveCompactionThresholdParameters = NonPersistentRemoveCompactionThresholdParameters
  { -- |
    nonPersistentRemoveCompactionThresholdTenant :: Text,
    -- |
    nonPersistentRemoveCompactionThresholdNamespace :: Text,
    -- |
    nonPersistentRemoveCompactionThresholdTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemoveCompactionThresholdAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemoveCompactionThreshold :: NonPersistentRemoveCompactionThresholdParameters -> ClientM NoContent
nonPersistentRemoveCompactionThreshold NonPersistentRemoveCompactionThresholdParameters {..} = client (Proxy :: Proxy NonPersistentRemoveCompactionThresholdAPI) (nonPersistentRemoveCompactionThresholdTenant) (nonPersistentRemoveCompactionThresholdNamespace) (nonPersistentRemoveCompactionThresholdTopic) (nonPersistentRemoveCompactionThresholdAuthoritative)
-- ^

type NonPersistentRemoveDeduplicationAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationEnabled" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemoveDeduplicationParameters = NonPersistentRemoveDeduplicationParameters
  { -- |
    nonPersistentRemoveDeduplicationTenant :: Text,
    -- |
    nonPersistentRemoveDeduplicationNamespace :: Text,
    -- |
    nonPersistentRemoveDeduplicationTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemoveDeduplicationAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemoveDeduplication :: NonPersistentRemoveDeduplicationParameters -> ClientM NoContent
nonPersistentRemoveDeduplication NonPersistentRemoveDeduplicationParameters {..} = client (Proxy :: Proxy NonPersistentRemoveDeduplicationAPI) (nonPersistentRemoveDeduplicationTenant) (nonPersistentRemoveDeduplicationNamespace) (nonPersistentRemoveDeduplicationTopic) (nonPersistentRemoveDeduplicationAuthoritative)
-- ^

type NonPersistentRemoveDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "dispatchRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemoveDispatchRateParameters = NonPersistentRemoveDispatchRateParameters
  { -- |
    nonPersistentRemoveDispatchRateTenant :: Text,
    -- |
    nonPersistentRemoveDispatchRateNamespace :: Text,
    -- |
    nonPersistentRemoveDispatchRateTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemoveDispatchRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemoveDispatchRate :: NonPersistentRemoveDispatchRateParameters -> ClientM NoContent
nonPersistentRemoveDispatchRate NonPersistentRemoveDispatchRateParameters {..} = client (Proxy :: Proxy NonPersistentRemoveDispatchRateAPI) (nonPersistentRemoveDispatchRateTenant) (nonPersistentRemoveDispatchRateNamespace) (nonPersistentRemoveDispatchRateTopic) (nonPersistentRemoveDispatchRateAuthoritative)
-- ^

type NonPersistentRemoveMaxConsumersAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumers" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemoveMaxConsumersParameters = NonPersistentRemoveMaxConsumersParameters
  { -- |
    nonPersistentRemoveMaxConsumersTenant :: Text,
    -- |
    nonPersistentRemoveMaxConsumersNamespace :: Text,
    -- |
    nonPersistentRemoveMaxConsumersTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemoveMaxConsumersAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemoveMaxConsumers :: NonPersistentRemoveMaxConsumersParameters -> ClientM NoContent
nonPersistentRemoveMaxConsumers NonPersistentRemoveMaxConsumersParameters {..} = client (Proxy :: Proxy NonPersistentRemoveMaxConsumersAPI) (nonPersistentRemoveMaxConsumersTenant) (nonPersistentRemoveMaxConsumersNamespace) (nonPersistentRemoveMaxConsumersTopic) (nonPersistentRemoveMaxConsumersAuthoritative)
-- ^

type NonPersistentRemoveMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumersPerSubscription" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemoveMaxConsumersPerSubscriptionParameters = NonPersistentRemoveMaxConsumersPerSubscriptionParameters
  { -- |
    nonPersistentRemoveMaxConsumersPerSubscriptionTenant :: Text,
    -- |
    nonPersistentRemoveMaxConsumersPerSubscriptionNamespace :: Text,
    -- |
    nonPersistentRemoveMaxConsumersPerSubscriptionTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemoveMaxConsumersPerSubscriptionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemoveMaxConsumersPerSubscription :: NonPersistentRemoveMaxConsumersPerSubscriptionParameters -> ClientM NoContent
nonPersistentRemoveMaxConsumersPerSubscription NonPersistentRemoveMaxConsumersPerSubscriptionParameters {..} = client (Proxy :: Proxy NonPersistentRemoveMaxConsumersPerSubscriptionAPI) (nonPersistentRemoveMaxConsumersPerSubscriptionTenant) (nonPersistentRemoveMaxConsumersPerSubscriptionNamespace) (nonPersistentRemoveMaxConsumersPerSubscriptionTopic) (nonPersistentRemoveMaxConsumersPerSubscriptionAuthoritative)
-- ^

type NonPersistentRemoveMaxMessageSizeAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxMessageSize" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemoveMaxMessageSizeParameters = NonPersistentRemoveMaxMessageSizeParameters
  { -- |
    nonPersistentRemoveMaxMessageSizeTenant :: Text,
    -- |
    nonPersistentRemoveMaxMessageSizeNamespace :: Text,
    -- |
    nonPersistentRemoveMaxMessageSizeTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemoveMaxMessageSizeAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemoveMaxMessageSize :: NonPersistentRemoveMaxMessageSizeParameters -> ClientM NoContent
nonPersistentRemoveMaxMessageSize NonPersistentRemoveMaxMessageSizeParameters {..} = client (Proxy :: Proxy NonPersistentRemoveMaxMessageSizeAPI) (nonPersistentRemoveMaxMessageSizeTenant) (nonPersistentRemoveMaxMessageSizeNamespace) (nonPersistentRemoveMaxMessageSizeTopic) (nonPersistentRemoveMaxMessageSizeAuthoritative)
-- ^

type NonPersistentRemoveMaxProducersAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxProducers" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemoveMaxProducersParameters = NonPersistentRemoveMaxProducersParameters
  { -- |
    nonPersistentRemoveMaxProducersTenant :: Text,
    -- |
    nonPersistentRemoveMaxProducersNamespace :: Text,
    -- |
    nonPersistentRemoveMaxProducersTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemoveMaxProducersAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemoveMaxProducers :: NonPersistentRemoveMaxProducersParameters -> ClientM NoContent
nonPersistentRemoveMaxProducers NonPersistentRemoveMaxProducersParameters {..} = client (Proxy :: Proxy NonPersistentRemoveMaxProducersAPI) (nonPersistentRemoveMaxProducersTenant) (nonPersistentRemoveMaxProducersNamespace) (nonPersistentRemoveMaxProducersTopic) (nonPersistentRemoveMaxProducersAuthoritative)
-- ^

type NonPersistentRemoveMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxSubscriptionsPerTopic" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemoveMaxSubscriptionsPerTopicParameters = NonPersistentRemoveMaxSubscriptionsPerTopicParameters
  { -- |
    nonPersistentRemoveMaxSubscriptionsPerTopicTenant :: Text,
    -- |
    nonPersistentRemoveMaxSubscriptionsPerTopicNamespace :: Text,
    -- |
    nonPersistentRemoveMaxSubscriptionsPerTopicTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemoveMaxSubscriptionsPerTopicAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemoveMaxSubscriptionsPerTopic :: NonPersistentRemoveMaxSubscriptionsPerTopicParameters -> ClientM NoContent
nonPersistentRemoveMaxSubscriptionsPerTopic NonPersistentRemoveMaxSubscriptionsPerTopicParameters {..} = client (Proxy :: Proxy NonPersistentRemoveMaxSubscriptionsPerTopicAPI) (nonPersistentRemoveMaxSubscriptionsPerTopicTenant) (nonPersistentRemoveMaxSubscriptionsPerTopicNamespace) (nonPersistentRemoveMaxSubscriptionsPerTopicTopic) (nonPersistentRemoveMaxSubscriptionsPerTopicAuthoritative)
-- ^

type NonPersistentRemoveMessageTTLAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageTTL" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemoveMessageTTLParameters = NonPersistentRemoveMessageTTLParameters
  { -- |
    nonPersistentRemoveMessageTTLTenant :: Text,
    -- |
    nonPersistentRemoveMessageTTLNamespace :: Text,
    -- |
    nonPersistentRemoveMessageTTLTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemoveMessageTTLAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemoveMessageTTL :: NonPersistentRemoveMessageTTLParameters -> ClientM NoContent
nonPersistentRemoveMessageTTL NonPersistentRemoveMessageTTLParameters {..} = client (Proxy :: Proxy NonPersistentRemoveMessageTTLAPI) (nonPersistentRemoveMessageTTLTenant) (nonPersistentRemoveMessageTTLNamespace) (nonPersistentRemoveMessageTTLTopic) (nonPersistentRemoveMessageTTLAuthoritative)
-- ^

type NonPersistentRemoveOffloadPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offloadPolicies" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemoveOffloadPoliciesParameters = NonPersistentRemoveOffloadPoliciesParameters
  { -- |
    nonPersistentRemoveOffloadPoliciesTenant :: Text,
    -- |
    nonPersistentRemoveOffloadPoliciesNamespace :: Text,
    -- |
    nonPersistentRemoveOffloadPoliciesTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemoveOffloadPoliciesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemoveOffloadPolicies :: NonPersistentRemoveOffloadPoliciesParameters -> ClientM NoContent
nonPersistentRemoveOffloadPolicies NonPersistentRemoveOffloadPoliciesParameters {..} = client (Proxy :: Proxy NonPersistentRemoveOffloadPoliciesAPI) (nonPersistentRemoveOffloadPoliciesTenant) (nonPersistentRemoveOffloadPoliciesNamespace) (nonPersistentRemoveOffloadPoliciesTopic) (nonPersistentRemoveOffloadPoliciesAuthoritative)
-- ^

type NonPersistentRemovePersistenceAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "persistence" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemovePersistenceParameters = NonPersistentRemovePersistenceParameters
  { -- |
    nonPersistentRemovePersistenceTenant :: Text,
    -- |
    nonPersistentRemovePersistenceNamespace :: Text,
    -- |
    nonPersistentRemovePersistenceTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemovePersistenceAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemovePersistence :: NonPersistentRemovePersistenceParameters -> ClientM NoContent
nonPersistentRemovePersistence NonPersistentRemovePersistenceParameters {..} = client (Proxy :: Proxy NonPersistentRemovePersistenceAPI) (nonPersistentRemovePersistenceTenant) (nonPersistentRemovePersistenceNamespace) (nonPersistentRemovePersistenceTopic) (nonPersistentRemovePersistenceAuthoritative)
-- ^

type NonPersistentRemovePublishRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "publishRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemovePublishRateParameters = NonPersistentRemovePublishRateParameters
  { -- |
    nonPersistentRemovePublishRateTenant :: Text,
    -- |
    nonPersistentRemovePublishRateNamespace :: Text,
    -- |
    nonPersistentRemovePublishRateTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemovePublishRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemovePublishRate :: NonPersistentRemovePublishRateParameters -> ClientM NoContent
nonPersistentRemovePublishRate NonPersistentRemovePublishRateParameters {..} = client (Proxy :: Proxy NonPersistentRemovePublishRateAPI) (nonPersistentRemovePublishRateTenant) (nonPersistentRemovePublishRateNamespace) (nonPersistentRemovePublishRateTopic) (nonPersistentRemovePublishRateAuthoritative)
-- ^

type NonPersistentRemoveReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "replicatorDispatchRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemoveReplicatorDispatchRateParameters = NonPersistentRemoveReplicatorDispatchRateParameters
  { -- |
    nonPersistentRemoveReplicatorDispatchRateTenant :: Text,
    -- |
    nonPersistentRemoveReplicatorDispatchRateNamespace :: Text,
    -- |
    nonPersistentRemoveReplicatorDispatchRateTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemoveReplicatorDispatchRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemoveReplicatorDispatchRate :: NonPersistentRemoveReplicatorDispatchRateParameters -> ClientM NoContent
nonPersistentRemoveReplicatorDispatchRate NonPersistentRemoveReplicatorDispatchRateParameters {..} = client (Proxy :: Proxy NonPersistentRemoveReplicatorDispatchRateAPI) (nonPersistentRemoveReplicatorDispatchRateTenant) (nonPersistentRemoveReplicatorDispatchRateNamespace) (nonPersistentRemoveReplicatorDispatchRateTopic) (nonPersistentRemoveReplicatorDispatchRateAuthoritative)
-- ^

type NonPersistentRemoveRetentionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "retention" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemoveRetentionParameters = NonPersistentRemoveRetentionParameters
  { -- |
    nonPersistentRemoveRetentionTenant :: Text,
    -- |
    nonPersistentRemoveRetentionNamespace :: Text,
    -- |
    nonPersistentRemoveRetentionTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemoveRetentionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemoveRetention :: NonPersistentRemoveRetentionParameters -> ClientM NoContent
nonPersistentRemoveRetention NonPersistentRemoveRetentionParameters {..} = client (Proxy :: Proxy NonPersistentRemoveRetentionAPI) (nonPersistentRemoveRetentionTenant) (nonPersistentRemoveRetentionNamespace) (nonPersistentRemoveRetentionTopic) (nonPersistentRemoveRetentionAuthoritative)
-- ^

type NonPersistentRemoveSubscribeRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscribeRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] SubscribeRate :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemoveSubscribeRateParameters = NonPersistentRemoveSubscribeRateParameters
  { -- |
    nonPersistentRemoveSubscribeRateTenant :: Text,
    -- |
    nonPersistentRemoveSubscribeRateNamespace :: Text,
    -- |
    nonPersistentRemoveSubscribeRateTopic :: Text,
    -- |
    nonPersistentRemoveSubscribeRateAuthoritative :: Maybe Bool,
    -- | Subscribe rate for the specified topic
    nonPersistentRemoveSubscribeRateBody :: SubscribeRate
  }
  deriving (Show, Eq, Generic)

nonPersistentRemoveSubscribeRate :: NonPersistentRemoveSubscribeRateParameters -> ClientM NoContent
nonPersistentRemoveSubscribeRate NonPersistentRemoveSubscribeRateParameters {..} = client (Proxy :: Proxy NonPersistentRemoveSubscribeRateAPI) (nonPersistentRemoveSubscribeRateTenant) (nonPersistentRemoveSubscribeRateNamespace) (nonPersistentRemoveSubscribeRateTopic) (nonPersistentRemoveSubscribeRateAuthoritative) nonPersistentRemoveSubscribeRateBody
-- ^

type NonPersistentRemoveSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionDispatchRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRemoveSubscriptionDispatchRateParameters = NonPersistentRemoveSubscriptionDispatchRateParameters
  { -- |
    nonPersistentRemoveSubscriptionDispatchRateTenant :: Text,
    -- |
    nonPersistentRemoveSubscriptionDispatchRateNamespace :: Text,
    -- |
    nonPersistentRemoveSubscriptionDispatchRateTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentRemoveSubscriptionDispatchRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentRemoveSubscriptionDispatchRate :: NonPersistentRemoveSubscriptionDispatchRateParameters -> ClientM NoContent
nonPersistentRemoveSubscriptionDispatchRate NonPersistentRemoveSubscriptionDispatchRateParameters {..} = client (Proxy :: Proxy NonPersistentRemoveSubscriptionDispatchRateAPI) (nonPersistentRemoveSubscriptionDispatchRateTenant) (nonPersistentRemoveSubscriptionDispatchRateNamespace) (nonPersistentRemoveSubscriptionDispatchRateTopic) (nonPersistentRemoveSubscriptionDispatchRateAuthoritative)
-- ^ It fence cursor and disconnects all active consumers before reseting cursor.

type NonPersistentResetCursorAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "resetcursor" :> Capture "timestamp" Integer :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentResetCursorParameters = NonPersistentResetCursorParameters
  { -- | Specify the tenant
    nonPersistentResetCursorTenant :: Text,
    -- | Specify the namespace
    nonPersistentResetCursorNamespace :: Text,
    -- | Specify topic name
    nonPersistentResetCursorTopic :: Text,
    -- | Subscription to reset position on
    nonPersistentResetCursorSubName :: Text,
    -- | the timestamp to reset back
    nonPersistentResetCursorTimestamp :: Integer,
    -- | Is authentication required to perform this operation
    nonPersistentResetCursorAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentResetCursor :: NonPersistentResetCursorParameters -> ClientM NoContent
nonPersistentResetCursor NonPersistentResetCursorParameters {..} = client (Proxy :: Proxy NonPersistentResetCursorAPI) (nonPersistentResetCursorTenant) (nonPersistentResetCursorNamespace) (nonPersistentResetCursorTopic) (nonPersistentResetCursorSubName) (nonPersistentResetCursorTimestamp) (nonPersistentResetCursorAuthoritative)
-- ^ It fence cursor and disconnects all active consumers before reseting cursor.

type NonPersistentResetCursorOnPositionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "resetcursor" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] ResetCursorData :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentResetCursorOnPositionParameters = NonPersistentResetCursorOnPositionParameters
  { -- | Specify the tenant
    nonPersistentResetCursorOnPositionTenant :: Text,
    -- | Specify the namespace
    nonPersistentResetCursorOnPositionNamespace :: Text,
    -- | Specify topic name
    nonPersistentResetCursorOnPositionTopic :: Text,
    -- | Subscription to reset position on
    nonPersistentResetCursorOnPositionSubName :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentResetCursorOnPositionAuthoritative :: Maybe Bool,
    -- | messageId to reset back to (ledgerId:entryId)
    nonPersistentResetCursorOnPositionMessageId :: ResetCursorData
  }
  deriving (Show, Eq, Generic)

nonPersistentResetCursorOnPosition :: NonPersistentResetCursorOnPositionParameters -> ClientM NoContent
nonPersistentResetCursorOnPosition NonPersistentResetCursorOnPositionParameters {..} = client (Proxy :: Proxy NonPersistentResetCursorOnPositionAPI) (nonPersistentResetCursorOnPositionTenant) (nonPersistentResetCursorOnPositionNamespace) (nonPersistentResetCursorOnPositionTopic) (nonPersistentResetCursorOnPositionSubName) (nonPersistentResetCursorOnPositionAuthoritative) nonPersistentResetCursorOnPositionMessageId
-- ^ Revoke permissions to a role on a single topic. If the permission was not set at the topiclevel, but rather at the namespace level, this operation will return an error (HTTP status code 412).

type NonPersistentRevokePermissionsOnTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "permissions" :> Capture "role" Text :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentRevokePermissionsOnTopicParameters = NonPersistentRevokePermissionsOnTopicParameters
  { -- | Specify the tenant
    nonPersistentRevokePermissionsOnTopicTenant :: Text,
    -- | Specify the namespace
    nonPersistentRevokePermissionsOnTopicNamespace :: Text,
    -- | Specify topic name
    nonPersistentRevokePermissionsOnTopicTopic :: Text,
    -- | Client role to which grant permissions
    nonPersistentRevokePermissionsOnTopicRole :: Text
  }
  deriving (Show, Eq, Generic)

nonPersistentRevokePermissionsOnTopic :: NonPersistentRevokePermissionsOnTopicParameters -> ClientM NoContent
nonPersistentRevokePermissionsOnTopic NonPersistentRevokePermissionsOnTopicParameters {..} = client (Proxy :: Proxy NonPersistentRevokePermissionsOnTopicAPI) (nonPersistentRevokePermissionsOnTopicTenant) (nonPersistentRevokePermissionsOnTopicNamespace) (nonPersistentRevokePermissionsOnTopicTopic) (nonPersistentRevokePermissionsOnTopicRole)
-- ^

type NonPersistentSetBacklogQuotaAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlogQuota" :> QueryParam "authoritative" Bool :> QueryParam "backlogQuotaType" Text :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetBacklogQuotaParameters = NonPersistentSetBacklogQuotaParameters
  { -- |
    nonPersistentSetBacklogQuotaTenant :: Text,
    -- |
    nonPersistentSetBacklogQuotaNamespace :: Text,
    -- |
    nonPersistentSetBacklogQuotaTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetBacklogQuotaAuthoritative :: Maybe Bool,
    -- |
    nonPersistentSetBacklogQuotaBacklogQuotaType :: Maybe Text
  }
  deriving (Show, Eq, Generic)

nonPersistentSetBacklogQuota :: NonPersistentSetBacklogQuotaParameters -> ClientM NoContent
nonPersistentSetBacklogQuota NonPersistentSetBacklogQuotaParameters {..} = client (Proxy :: Proxy NonPersistentSetBacklogQuotaAPI) (nonPersistentSetBacklogQuotaTenant) (nonPersistentSetBacklogQuotaNamespace) (nonPersistentSetBacklogQuotaTopic) (nonPersistentSetBacklogQuotaAuthoritative) (nonPersistentSetBacklogQuotaBacklogQuotaType)
-- ^

type NonPersistentSetCompactionThresholdAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compactionThreshold" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Integer :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetCompactionThresholdParameters = NonPersistentSetCompactionThresholdParameters
  { -- |
    nonPersistentSetCompactionThresholdTenant :: Text,
    -- |
    nonPersistentSetCompactionThresholdNamespace :: Text,
    -- |
    nonPersistentSetCompactionThresholdTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetCompactionThresholdAuthoritative :: Maybe Bool,
    -- | Dispatch rate for the specified topic
    nonPersistentSetCompactionThresholdBody :: Integer
  }
  deriving (Show, Eq, Generic)

nonPersistentSetCompactionThreshold :: NonPersistentSetCompactionThresholdParameters -> ClientM NoContent
nonPersistentSetCompactionThreshold NonPersistentSetCompactionThresholdParameters {..} = client (Proxy :: Proxy NonPersistentSetCompactionThresholdAPI) (nonPersistentSetCompactionThresholdTenant) (nonPersistentSetCompactionThresholdNamespace) (nonPersistentSetCompactionThresholdTopic) (nonPersistentSetCompactionThresholdAuthoritative) nonPersistentSetCompactionThresholdBody
-- ^

type NonPersistentSetDeduplicationAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationEnabled" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetDeduplicationParameters = NonPersistentSetDeduplicationParameters
  { -- |
    nonPersistentSetDeduplicationTenant :: Text,
    -- |
    nonPersistentSetDeduplicationNamespace :: Text,
    -- |
    nonPersistentSetDeduplicationTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetDeduplicationAuthoritative :: Maybe Bool,
    -- | DeduplicationEnabled policies for the specified topic
    nonPersistentSetDeduplicationBody :: Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentSetDeduplication :: NonPersistentSetDeduplicationParameters -> ClientM NoContent
nonPersistentSetDeduplication NonPersistentSetDeduplicationParameters {..} = client (Proxy :: Proxy NonPersistentSetDeduplicationAPI) (nonPersistentSetDeduplicationTenant) (nonPersistentSetDeduplicationNamespace) (nonPersistentSetDeduplicationTopic) (nonPersistentSetDeduplicationAuthoritative) nonPersistentSetDeduplicationBody
-- ^

type NonPersistentSetDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationSnapshotInterval" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetDeduplicationSnapshotIntervalParameters = NonPersistentSetDeduplicationSnapshotIntervalParameters
  { -- |
    nonPersistentSetDeduplicationSnapshotIntervalTenant :: Text,
    -- |
    nonPersistentSetDeduplicationSnapshotIntervalNamespace :: Text,
    -- |
    nonPersistentSetDeduplicationSnapshotIntervalTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetDeduplicationSnapshotIntervalAuthoritative :: Maybe Bool,
    -- | Interval to take deduplication snapshot for the specified topic
    nonPersistentSetDeduplicationSnapshotIntervalBody :: Int
  }
  deriving (Show, Eq, Generic)

nonPersistentSetDeduplicationSnapshotInterval :: NonPersistentSetDeduplicationSnapshotIntervalParameters -> ClientM NoContent
nonPersistentSetDeduplicationSnapshotInterval NonPersistentSetDeduplicationSnapshotIntervalParameters {..} = client (Proxy :: Proxy NonPersistentSetDeduplicationSnapshotIntervalAPI) (nonPersistentSetDeduplicationSnapshotIntervalTenant) (nonPersistentSetDeduplicationSnapshotIntervalNamespace) (nonPersistentSetDeduplicationSnapshotIntervalTopic) (nonPersistentSetDeduplicationSnapshotIntervalAuthoritative) nonPersistentSetDeduplicationSnapshotIntervalBody
-- ^

type NonPersistentSetDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "delayedDelivery" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DelayedDeliveryPolicies :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetDelayedDeliveryPoliciesParameters = NonPersistentSetDelayedDeliveryPoliciesParameters
  { -- |
    nonPersistentSetDelayedDeliveryPoliciesTenant :: Text,
    -- |
    nonPersistentSetDelayedDeliveryPoliciesNamespace :: Text,
    -- |
    nonPersistentSetDelayedDeliveryPoliciesTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetDelayedDeliveryPoliciesAuthoritative :: Maybe Bool,
    -- | Delayed delivery policies for the specified topic
    nonPersistentSetDelayedDeliveryPoliciesBody :: DelayedDeliveryPolicies
  }
  deriving (Show, Eq, Generic)

nonPersistentSetDelayedDeliveryPolicies :: NonPersistentSetDelayedDeliveryPoliciesParameters -> ClientM NoContent
nonPersistentSetDelayedDeliveryPolicies NonPersistentSetDelayedDeliveryPoliciesParameters {..} = client (Proxy :: Proxy NonPersistentSetDelayedDeliveryPoliciesAPI) (nonPersistentSetDelayedDeliveryPoliciesTenant) (nonPersistentSetDelayedDeliveryPoliciesNamespace) (nonPersistentSetDelayedDeliveryPoliciesTopic) (nonPersistentSetDelayedDeliveryPoliciesAuthoritative) nonPersistentSetDelayedDeliveryPoliciesBody
-- ^

type NonPersistentSetDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "dispatchRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetDispatchRateParameters = NonPersistentSetDispatchRateParameters
  { -- |
    nonPersistentSetDispatchRateTenant :: Text,
    -- |
    nonPersistentSetDispatchRateNamespace :: Text,
    -- |
    nonPersistentSetDispatchRateTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetDispatchRateAuthoritative :: Maybe Bool,
    -- | Dispatch rate for the specified topic
    nonPersistentSetDispatchRateBody :: DispatchRateImpl
  }
  deriving (Show, Eq, Generic)

nonPersistentSetDispatchRate :: NonPersistentSetDispatchRateParameters -> ClientM NoContent
nonPersistentSetDispatchRate NonPersistentSetDispatchRateParameters {..} = client (Proxy :: Proxy NonPersistentSetDispatchRateAPI) (nonPersistentSetDispatchRateTenant) (nonPersistentSetDispatchRateNamespace) (nonPersistentSetDispatchRateTopic) (nonPersistentSetDispatchRateAuthoritative) nonPersistentSetDispatchRateBody
-- ^

type NonPersistentSetInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "inactiveTopicPolicies" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] InactiveTopicPolicies :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetInactiveTopicPoliciesParameters = NonPersistentSetInactiveTopicPoliciesParameters
  { -- |
    nonPersistentSetInactiveTopicPoliciesTenant :: Text,
    -- |
    nonPersistentSetInactiveTopicPoliciesNamespace :: Text,
    -- |
    nonPersistentSetInactiveTopicPoliciesTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetInactiveTopicPoliciesAuthoritative :: Maybe Bool,
    -- | inactive topic policies for the specified topic
    nonPersistentSetInactiveTopicPoliciesBody :: InactiveTopicPolicies
  }
  deriving (Show, Eq, Generic)

nonPersistentSetInactiveTopicPolicies :: NonPersistentSetInactiveTopicPoliciesParameters -> ClientM NoContent
nonPersistentSetInactiveTopicPolicies NonPersistentSetInactiveTopicPoliciesParameters {..} = client (Proxy :: Proxy NonPersistentSetInactiveTopicPoliciesAPI) (nonPersistentSetInactiveTopicPoliciesTenant) (nonPersistentSetInactiveTopicPoliciesNamespace) (nonPersistentSetInactiveTopicPoliciesTopic) (nonPersistentSetInactiveTopicPoliciesAuthoritative) nonPersistentSetInactiveTopicPoliciesBody
-- ^

type NonPersistentSetMaxConsumersAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumers" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetMaxConsumersParameters = NonPersistentSetMaxConsumersParameters
  { -- |
    nonPersistentSetMaxConsumersTenant :: Text,
    -- |
    nonPersistentSetMaxConsumersNamespace :: Text,
    -- |
    nonPersistentSetMaxConsumersTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetMaxConsumersAuthoritative :: Maybe Bool,
    -- | The max consumers of the topic
    nonPersistentSetMaxConsumersBody :: Int
  }
  deriving (Show, Eq, Generic)

nonPersistentSetMaxConsumers :: NonPersistentSetMaxConsumersParameters -> ClientM NoContent
nonPersistentSetMaxConsumers NonPersistentSetMaxConsumersParameters {..} = client (Proxy :: Proxy NonPersistentSetMaxConsumersAPI) (nonPersistentSetMaxConsumersTenant) (nonPersistentSetMaxConsumersNamespace) (nonPersistentSetMaxConsumersTopic) (nonPersistentSetMaxConsumersAuthoritative) nonPersistentSetMaxConsumersBody
-- ^

type NonPersistentSetMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumersPerSubscription" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetMaxConsumersPerSubscriptionParameters = NonPersistentSetMaxConsumersPerSubscriptionParameters
  { -- |
    nonPersistentSetMaxConsumersPerSubscriptionTenant :: Text,
    -- |
    nonPersistentSetMaxConsumersPerSubscriptionNamespace :: Text,
    -- |
    nonPersistentSetMaxConsumersPerSubscriptionTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetMaxConsumersPerSubscriptionAuthoritative :: Maybe Bool,
    -- | Dispatch rate for the specified topic
    nonPersistentSetMaxConsumersPerSubscriptionBody :: Int
  }
  deriving (Show, Eq, Generic)

nonPersistentSetMaxConsumersPerSubscription :: NonPersistentSetMaxConsumersPerSubscriptionParameters -> ClientM NoContent
nonPersistentSetMaxConsumersPerSubscription NonPersistentSetMaxConsumersPerSubscriptionParameters {..} = client (Proxy :: Proxy NonPersistentSetMaxConsumersPerSubscriptionAPI) (nonPersistentSetMaxConsumersPerSubscriptionTenant) (nonPersistentSetMaxConsumersPerSubscriptionNamespace) (nonPersistentSetMaxConsumersPerSubscriptionTopic) (nonPersistentSetMaxConsumersPerSubscriptionAuthoritative) nonPersistentSetMaxConsumersPerSubscriptionBody
-- ^

type NonPersistentSetMaxMessageSizeAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxMessageSize" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetMaxMessageSizeParameters = NonPersistentSetMaxMessageSizeParameters
  { -- |
    nonPersistentSetMaxMessageSizeTenant :: Text,
    -- |
    nonPersistentSetMaxMessageSizeNamespace :: Text,
    -- |
    nonPersistentSetMaxMessageSizeTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetMaxMessageSizeAuthoritative :: Maybe Bool,
    -- | The max message size of the topic
    nonPersistentSetMaxMessageSizeBody :: Int
  }
  deriving (Show, Eq, Generic)

nonPersistentSetMaxMessageSize :: NonPersistentSetMaxMessageSizeParameters -> ClientM NoContent
nonPersistentSetMaxMessageSize NonPersistentSetMaxMessageSizeParameters {..} = client (Proxy :: Proxy NonPersistentSetMaxMessageSizeAPI) (nonPersistentSetMaxMessageSizeTenant) (nonPersistentSetMaxMessageSizeNamespace) (nonPersistentSetMaxMessageSizeTopic) (nonPersistentSetMaxMessageSizeAuthoritative) nonPersistentSetMaxMessageSizeBody
-- ^

type NonPersistentSetMaxProducersAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxProducers" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetMaxProducersParameters = NonPersistentSetMaxProducersParameters
  { -- |
    nonPersistentSetMaxProducersTenant :: Text,
    -- |
    nonPersistentSetMaxProducersNamespace :: Text,
    -- |
    nonPersistentSetMaxProducersTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetMaxProducersAuthoritative :: Maybe Bool,
    -- | The max producers of the topic
    nonPersistentSetMaxProducersBody :: Int
  }
  deriving (Show, Eq, Generic)

nonPersistentSetMaxProducers :: NonPersistentSetMaxProducersParameters -> ClientM NoContent
nonPersistentSetMaxProducers NonPersistentSetMaxProducersParameters {..} = client (Proxy :: Proxy NonPersistentSetMaxProducersAPI) (nonPersistentSetMaxProducersTenant) (nonPersistentSetMaxProducersNamespace) (nonPersistentSetMaxProducersTopic) (nonPersistentSetMaxProducersAuthoritative) nonPersistentSetMaxProducersBody
-- ^

type NonPersistentSetMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxSubscriptionsPerTopic" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetMaxSubscriptionsPerTopicParameters = NonPersistentSetMaxSubscriptionsPerTopicParameters
  { -- |
    nonPersistentSetMaxSubscriptionsPerTopicTenant :: Text,
    -- |
    nonPersistentSetMaxSubscriptionsPerTopicNamespace :: Text,
    -- |
    nonPersistentSetMaxSubscriptionsPerTopicTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetMaxSubscriptionsPerTopicAuthoritative :: Maybe Bool,
    -- | The max subscriptions of the topic
    nonPersistentSetMaxSubscriptionsPerTopicBody :: Int
  }
  deriving (Show, Eq, Generic)

nonPersistentSetMaxSubscriptionsPerTopic :: NonPersistentSetMaxSubscriptionsPerTopicParameters -> ClientM NoContent
nonPersistentSetMaxSubscriptionsPerTopic NonPersistentSetMaxSubscriptionsPerTopicParameters {..} = client (Proxy :: Proxy NonPersistentSetMaxSubscriptionsPerTopicAPI) (nonPersistentSetMaxSubscriptionsPerTopicTenant) (nonPersistentSetMaxSubscriptionsPerTopicNamespace) (nonPersistentSetMaxSubscriptionsPerTopicTopic) (nonPersistentSetMaxSubscriptionsPerTopicAuthoritative) nonPersistentSetMaxSubscriptionsPerTopicBody
-- ^

type NonPersistentSetMaxUnackedMessagesOnConsumerAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnConsumer" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetMaxUnackedMessagesOnConsumerParameters = NonPersistentSetMaxUnackedMessagesOnConsumerParameters
  { -- |
    nonPersistentSetMaxUnackedMessagesOnConsumerTenant :: Text,
    -- |
    nonPersistentSetMaxUnackedMessagesOnConsumerNamespace :: Text,
    -- |
    nonPersistentSetMaxUnackedMessagesOnConsumerTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetMaxUnackedMessagesOnConsumerAuthoritative :: Maybe Bool,
    -- | Max unacked messages on consumer policies for the specified topic
    nonPersistentSetMaxUnackedMessagesOnConsumerBody :: Int
  }
  deriving (Show, Eq, Generic)

nonPersistentSetMaxUnackedMessagesOnConsumer :: NonPersistentSetMaxUnackedMessagesOnConsumerParameters -> ClientM NoContent
nonPersistentSetMaxUnackedMessagesOnConsumer NonPersistentSetMaxUnackedMessagesOnConsumerParameters {..} = client (Proxy :: Proxy NonPersistentSetMaxUnackedMessagesOnConsumerAPI) (nonPersistentSetMaxUnackedMessagesOnConsumerTenant) (nonPersistentSetMaxUnackedMessagesOnConsumerNamespace) (nonPersistentSetMaxUnackedMessagesOnConsumerTopic) (nonPersistentSetMaxUnackedMessagesOnConsumerAuthoritative) nonPersistentSetMaxUnackedMessagesOnConsumerBody
-- ^

type NonPersistentSetMaxUnackedMessagesOnSubscriptionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnSubscription" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetMaxUnackedMessagesOnSubscriptionParameters = NonPersistentSetMaxUnackedMessagesOnSubscriptionParameters
  { -- |
    nonPersistentSetMaxUnackedMessagesOnSubscriptionTenant :: Text,
    -- |
    nonPersistentSetMaxUnackedMessagesOnSubscriptionNamespace :: Text,
    -- |
    nonPersistentSetMaxUnackedMessagesOnSubscriptionTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetMaxUnackedMessagesOnSubscriptionAuthoritative :: Maybe Bool,
    -- | Max unacked messages on subscription policies for the specified topic
    nonPersistentSetMaxUnackedMessagesOnSubscriptionBody :: Int
  }
  deriving (Show, Eq, Generic)

nonPersistentSetMaxUnackedMessagesOnSubscription :: NonPersistentSetMaxUnackedMessagesOnSubscriptionParameters -> ClientM NoContent
nonPersistentSetMaxUnackedMessagesOnSubscription NonPersistentSetMaxUnackedMessagesOnSubscriptionParameters {..} = client (Proxy :: Proxy NonPersistentSetMaxUnackedMessagesOnSubscriptionAPI) (nonPersistentSetMaxUnackedMessagesOnSubscriptionTenant) (nonPersistentSetMaxUnackedMessagesOnSubscriptionNamespace) (nonPersistentSetMaxUnackedMessagesOnSubscriptionTopic) (nonPersistentSetMaxUnackedMessagesOnSubscriptionAuthoritative) nonPersistentSetMaxUnackedMessagesOnSubscriptionBody
-- ^

type NonPersistentSetMessageTTLAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageTTL" :> QueryParam "messageTTL" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetMessageTTLParameters = NonPersistentSetMessageTTLParameters
  { -- |
    nonPersistentSetMessageTTLTenant :: Text,
    -- |
    nonPersistentSetMessageTTLNamespace :: Text,
    -- |
    nonPersistentSetMessageTTLTopic :: Text,
    -- | TTL in seconds for the specified namespace
    nonPersistentSetMessageTTLMessageTTL :: Int,
    -- | Is authentication required to perform this operation
    nonPersistentSetMessageTTLAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentSetMessageTTL :: NonPersistentSetMessageTTLParameters -> ClientM NoContent
nonPersistentSetMessageTTL NonPersistentSetMessageTTLParameters {..} = client (Proxy :: Proxy NonPersistentSetMessageTTLAPI) (nonPersistentSetMessageTTLTenant) (nonPersistentSetMessageTTLNamespace) (nonPersistentSetMessageTTLTopic) (Just nonPersistentSetMessageTTLMessageTTL) (nonPersistentSetMessageTTLAuthoritative)
-- ^

type NonPersistentSetOffloadPoliciesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offloadPolicies" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] OffloadPoliciesImpl :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetOffloadPoliciesParameters = NonPersistentSetOffloadPoliciesParameters
  { -- |
    nonPersistentSetOffloadPoliciesTenant :: Text,
    -- |
    nonPersistentSetOffloadPoliciesNamespace :: Text,
    -- |
    nonPersistentSetOffloadPoliciesTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetOffloadPoliciesAuthoritative :: Maybe Bool,
    -- | Offload policies for the specified topic
    nonPersistentSetOffloadPoliciesBody :: OffloadPoliciesImpl
  }
  deriving (Show, Eq, Generic)

nonPersistentSetOffloadPolicies :: NonPersistentSetOffloadPoliciesParameters -> ClientM NoContent
nonPersistentSetOffloadPolicies NonPersistentSetOffloadPoliciesParameters {..} = client (Proxy :: Proxy NonPersistentSetOffloadPoliciesAPI) (nonPersistentSetOffloadPoliciesTenant) (nonPersistentSetOffloadPoliciesNamespace) (nonPersistentSetOffloadPoliciesTopic) (nonPersistentSetOffloadPoliciesAuthoritative) nonPersistentSetOffloadPoliciesBody
-- ^

type NonPersistentSetPersistenceAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "persistence" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] PersistencePolicies :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetPersistenceParameters = NonPersistentSetPersistenceParameters
  { -- |
    nonPersistentSetPersistenceTenant :: Text,
    -- |
    nonPersistentSetPersistenceNamespace :: Text,
    -- |
    nonPersistentSetPersistenceTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetPersistenceAuthoritative :: Maybe Bool,
    -- | Bookkeeper persistence policies for specified topic
    nonPersistentSetPersistenceBody :: PersistencePolicies
  }
  deriving (Show, Eq, Generic)

nonPersistentSetPersistence :: NonPersistentSetPersistenceParameters -> ClientM NoContent
nonPersistentSetPersistence NonPersistentSetPersistenceParameters {..} = client (Proxy :: Proxy NonPersistentSetPersistenceAPI) (nonPersistentSetPersistenceTenant) (nonPersistentSetPersistenceNamespace) (nonPersistentSetPersistenceTopic) (nonPersistentSetPersistenceAuthoritative) nonPersistentSetPersistenceBody
-- ^

type NonPersistentSetPublishRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "publishRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] PublishRate :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetPublishRateParameters = NonPersistentSetPublishRateParameters
  { -- |
    nonPersistentSetPublishRateTenant :: Text,
    -- |
    nonPersistentSetPublishRateNamespace :: Text,
    -- |
    nonPersistentSetPublishRateTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetPublishRateAuthoritative :: Maybe Bool,
    -- | Dispatch rate for the specified topic
    nonPersistentSetPublishRateBody :: PublishRate
  }
  deriving (Show, Eq, Generic)

nonPersistentSetPublishRate :: NonPersistentSetPublishRateParameters -> ClientM NoContent
nonPersistentSetPublishRate NonPersistentSetPublishRateParameters {..} = client (Proxy :: Proxy NonPersistentSetPublishRateAPI) (nonPersistentSetPublishRateTenant) (nonPersistentSetPublishRateNamespace) (nonPersistentSetPublishRateTopic) (nonPersistentSetPublishRateAuthoritative) nonPersistentSetPublishRateBody
-- ^

type NonPersistentSetReplicatedSubscriptionStatusAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "replicatedSubscriptionStatus" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetReplicatedSubscriptionStatusParameters = NonPersistentSetReplicatedSubscriptionStatusParameters
  { -- | Specify the tenant
    nonPersistentSetReplicatedSubscriptionStatusTenant :: Text,
    -- | Specify the namespace
    nonPersistentSetReplicatedSubscriptionStatusNamespace :: Text,
    -- | Specify topic name
    nonPersistentSetReplicatedSubscriptionStatusTopic :: Text,
    -- | Name of subscription
    nonPersistentSetReplicatedSubscriptionStatusSubName :: Text,
    -- | Whether to enable replicated subscription
    nonPersistentSetReplicatedSubscriptionStatusBody :: Bool,
    -- | Is authentication required to perform this operation
    nonPersistentSetReplicatedSubscriptionStatusAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentSetReplicatedSubscriptionStatus :: NonPersistentSetReplicatedSubscriptionStatusParameters -> ClientM NoContent
nonPersistentSetReplicatedSubscriptionStatus NonPersistentSetReplicatedSubscriptionStatusParameters {..} = client (Proxy :: Proxy NonPersistentSetReplicatedSubscriptionStatusAPI) (nonPersistentSetReplicatedSubscriptionStatusTenant) (nonPersistentSetReplicatedSubscriptionStatusNamespace) (nonPersistentSetReplicatedSubscriptionStatusTopic) (nonPersistentSetReplicatedSubscriptionStatusSubName) (nonPersistentSetReplicatedSubscriptionStatusAuthoritative) nonPersistentSetReplicatedSubscriptionStatusBody
-- ^

type NonPersistentSetReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "replicatorDispatchRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetReplicatorDispatchRateParameters = NonPersistentSetReplicatorDispatchRateParameters
  { -- |
    nonPersistentSetReplicatorDispatchRateTenant :: Text,
    -- |
    nonPersistentSetReplicatorDispatchRateNamespace :: Text,
    -- |
    nonPersistentSetReplicatorDispatchRateTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetReplicatorDispatchRateAuthoritative :: Maybe Bool,
    -- | Replicator dispatch rate of the topic
    nonPersistentSetReplicatorDispatchRateBody :: DispatchRateImpl
  }
  deriving (Show, Eq, Generic)

nonPersistentSetReplicatorDispatchRate :: NonPersistentSetReplicatorDispatchRateParameters -> ClientM NoContent
nonPersistentSetReplicatorDispatchRate NonPersistentSetReplicatorDispatchRateParameters {..} = client (Proxy :: Proxy NonPersistentSetReplicatorDispatchRateAPI) (nonPersistentSetReplicatorDispatchRateTenant) (nonPersistentSetReplicatorDispatchRateNamespace) (nonPersistentSetReplicatorDispatchRateTopic) (nonPersistentSetReplicatorDispatchRateAuthoritative) nonPersistentSetReplicatorDispatchRateBody
-- ^

type NonPersistentSetRetentionAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "retention" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] RetentionPolicies :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetRetentionParameters = NonPersistentSetRetentionParameters
  { -- |
    nonPersistentSetRetentionTenant :: Text,
    -- |
    nonPersistentSetRetentionNamespace :: Text,
    -- |
    nonPersistentSetRetentionTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetRetentionAuthoritative :: Maybe Bool,
    -- | Retention policies for the specified namespace
    nonPersistentSetRetentionBody :: RetentionPolicies
  }
  deriving (Show, Eq, Generic)

nonPersistentSetRetention :: NonPersistentSetRetentionParameters -> ClientM NoContent
nonPersistentSetRetention NonPersistentSetRetentionParameters {..} = client (Proxy :: Proxy NonPersistentSetRetentionAPI) (nonPersistentSetRetentionTenant) (nonPersistentSetRetentionNamespace) (nonPersistentSetRetentionTopic) (nonPersistentSetRetentionAuthoritative) nonPersistentSetRetentionBody
-- ^

type NonPersistentSetSubscribeRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscribeRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] SubscribeRate :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetSubscribeRateParameters = NonPersistentSetSubscribeRateParameters
  { -- |
    nonPersistentSetSubscribeRateTenant :: Text,
    -- |
    nonPersistentSetSubscribeRateNamespace :: Text,
    -- |
    nonPersistentSetSubscribeRateTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetSubscribeRateAuthoritative :: Maybe Bool,
    -- | Subscribe rate for the specified topic
    nonPersistentSetSubscribeRateBody :: SubscribeRate
  }
  deriving (Show, Eq, Generic)

nonPersistentSetSubscribeRate :: NonPersistentSetSubscribeRateParameters -> ClientM NoContent
nonPersistentSetSubscribeRate NonPersistentSetSubscribeRateParameters {..} = client (Proxy :: Proxy NonPersistentSetSubscribeRateAPI) (nonPersistentSetSubscribeRateTenant) (nonPersistentSetSubscribeRateNamespace) (nonPersistentSetSubscribeRateTopic) (nonPersistentSetSubscribeRateAuthoritative) nonPersistentSetSubscribeRateBody
-- ^

type NonPersistentSetSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionDispatchRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetSubscriptionDispatchRateParameters = NonPersistentSetSubscriptionDispatchRateParameters
  { -- |
    nonPersistentSetSubscriptionDispatchRateTenant :: Text,
    -- |
    nonPersistentSetSubscriptionDispatchRateNamespace :: Text,
    -- |
    nonPersistentSetSubscriptionDispatchRateTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetSubscriptionDispatchRateAuthoritative :: Maybe Bool,
    -- | Subscription message dispatch rate for the specified topic
    nonPersistentSetSubscriptionDispatchRateBody :: DispatchRateImpl
  }
  deriving (Show, Eq, Generic)

nonPersistentSetSubscriptionDispatchRate :: NonPersistentSetSubscriptionDispatchRateParameters -> ClientM NoContent
nonPersistentSetSubscriptionDispatchRate NonPersistentSetSubscriptionDispatchRateParameters {..} = client (Proxy :: Proxy NonPersistentSetSubscriptionDispatchRateAPI) (nonPersistentSetSubscriptionDispatchRateTenant) (nonPersistentSetSubscriptionDispatchRateNamespace) (nonPersistentSetSubscriptionDispatchRateTopic) (nonPersistentSetSubscriptionDispatchRateAuthoritative) nonPersistentSetSubscriptionDispatchRateBody
-- ^

type NonPersistentSetSubscriptionTypesEnabledAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionTypesEnabled" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSetSubscriptionTypesEnabledParameters = NonPersistentSetSubscriptionTypesEnabledParameters
  { -- |
    nonPersistentSetSubscriptionTypesEnabledTenant :: Text,
    -- |
    nonPersistentSetSubscriptionTypesEnabledNamespace :: Text,
    -- |
    nonPersistentSetSubscriptionTypesEnabledTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSetSubscriptionTypesEnabledAuthoritative :: Maybe Bool,
    -- | Enable sub types for the specified topic
    nonPersistentSetSubscriptionTypesEnabledBody :: [Text]
  }
  deriving (Show, Eq, Generic)

nonPersistentSetSubscriptionTypesEnabled :: NonPersistentSetSubscriptionTypesEnabledParameters -> ClientM NoContent
nonPersistentSetSubscriptionTypesEnabled NonPersistentSetSubscriptionTypesEnabledParameters {..} = client (Proxy :: Proxy NonPersistentSetSubscriptionTypesEnabledAPI) (nonPersistentSetSubscriptionTypesEnabledTenant) (nonPersistentSetSubscriptionTypesEnabledNamespace) (nonPersistentSetSubscriptionTypesEnabledTopic) (nonPersistentSetSubscriptionTypesEnabledAuthoritative) nonPersistentSetSubscriptionTypesEnabledBody
-- ^ Completely clears the backlog on the subscription.

type NonPersistentSkipAllMessagesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "skip_all" :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSkipAllMessagesParameters = NonPersistentSkipAllMessagesParameters
  { -- | Specify the tenant
    nonPersistentSkipAllMessagesTenant :: Text,
    -- | Specify the namespace
    nonPersistentSkipAllMessagesNamespace :: Text,
    -- | Specify topic name
    nonPersistentSkipAllMessagesTopic :: Text,
    -- | Name of subscription
    nonPersistentSkipAllMessagesSubName :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentSkipAllMessagesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentSkipAllMessages :: NonPersistentSkipAllMessagesParameters -> ClientM NoContent
nonPersistentSkipAllMessages NonPersistentSkipAllMessagesParameters {..} = client (Proxy :: Proxy NonPersistentSkipAllMessagesAPI) (nonPersistentSkipAllMessagesTenant) (nonPersistentSkipAllMessagesNamespace) (nonPersistentSkipAllMessagesTopic) (nonPersistentSkipAllMessagesSubName) (nonPersistentSkipAllMessagesAuthoritative)
-- ^

type NonPersistentSkipMessagesAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "skip" :> Capture "numMessages" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentSkipMessagesParameters = NonPersistentSkipMessagesParameters
  { -- | Specify the tenant
    nonPersistentSkipMessagesTenant :: Text,
    -- | Specify the namespace
    nonPersistentSkipMessagesNamespace :: Text,
    -- | Specify topic name
    nonPersistentSkipMessagesTopic :: Text,
    -- | Name of subscription
    nonPersistentSkipMessagesSubName :: Text,
    -- | The number of messages to skip
    nonPersistentSkipMessagesNumMessages :: Int,
    -- | Is authentication required to perform this operation
    nonPersistentSkipMessagesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentSkipMessages :: NonPersistentSkipMessagesParameters -> ClientM NoContent
nonPersistentSkipMessages NonPersistentSkipMessagesParameters {..} = client (Proxy :: Proxy NonPersistentSkipMessagesAPI) (nonPersistentSkipMessagesTenant) (nonPersistentSkipMessagesNamespace) (nonPersistentSkipMessagesTopic) (nonPersistentSkipMessagesSubName) (nonPersistentSkipMessagesNumMessages) (nonPersistentSkipMessagesAuthoritative)
-- ^

type NonPersistentTerminateAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "terminate" :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] Value

data NonPersistentTerminateParameters = NonPersistentTerminateParameters
  { -- | Specify the tenant
    nonPersistentTerminateTenant :: Text,
    -- | Specify the namespace
    nonPersistentTerminateNamespace :: Text,
    -- | Specify topic name
    nonPersistentTerminateTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentTerminateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentTerminate :: NonPersistentTerminateParameters -> ClientM Value
nonPersistentTerminate NonPersistentTerminateParameters {..} = client (Proxy :: Proxy NonPersistentTerminateAPI) (nonPersistentTerminateTenant) (nonPersistentTerminateNamespace) (nonPersistentTerminateTopic) (nonPersistentTerminateAuthoritative)
-- ^

type NonPersistentTerminatePartitionedTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "terminate" :> "partitions" :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentTerminatePartitionedTopicParameters = NonPersistentTerminatePartitionedTopicParameters
  { -- | Specify the tenant
    nonPersistentTerminatePartitionedTopicTenant :: Text,
    -- | Specify the namespace
    nonPersistentTerminatePartitionedTopicNamespace :: Text,
    -- | Specify topic name
    nonPersistentTerminatePartitionedTopicTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentTerminatePartitionedTopicAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentTerminatePartitionedTopic :: NonPersistentTerminatePartitionedTopicParameters -> ClientM NoContent
nonPersistentTerminatePartitionedTopic NonPersistentTerminatePartitionedTopicParameters {..} = client (Proxy :: Proxy NonPersistentTerminatePartitionedTopicAPI) (nonPersistentTerminatePartitionedTopicTenant) (nonPersistentTerminatePartitionedTopicNamespace) (nonPersistentTerminatePartitionedTopicTopic) (nonPersistentTerminatePartitionedTopicAuthoritative)
-- ^

type NonPersistentTriggerOffloadAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offload" :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

data NonPersistentTriggerOffloadParameters = NonPersistentTriggerOffloadParameters
  { -- | Specify the tenant
    nonPersistentTriggerOffloadTenant :: Text,
    -- | Specify the namespace
    nonPersistentTriggerOffloadNamespace :: Text,
    -- | Specify topic name
    nonPersistentTriggerOffloadTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentTriggerOffloadAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentTriggerOffload :: NonPersistentTriggerOffloadParameters -> ClientM NoContent
nonPersistentTriggerOffload NonPersistentTriggerOffloadParameters {..} = client (Proxy :: Proxy NonPersistentTriggerOffloadAPI) (nonPersistentTriggerOffloadTenant) (nonPersistentTriggerOffloadNamespace) (nonPersistentTriggerOffloadTopic) (nonPersistentTriggerOffloadAuthoritative)
-- ^ NonPersistentTopic does not support truncate.

type NonPersistentTruncateTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "truncate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data NonPersistentTruncateTopicParameters = NonPersistentTruncateTopicParameters
  { -- | Specify the tenant
    nonPersistentTruncateTopicTenant :: Text,
    -- | Specify the namespace
    nonPersistentTruncateTopicNamespace :: Text,
    -- | Specify topic name
    nonPersistentTruncateTopicTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentTruncateTopicAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentTruncateTopic :: NonPersistentTruncateTopicParameters -> ClientM NoContent
nonPersistentTruncateTopic NonPersistentTruncateTopicParameters {..} = client (Proxy :: Proxy NonPersistentTruncateTopicAPI) (nonPersistentTruncateTopicTenant) (nonPersistentTruncateTopicNamespace) (nonPersistentTruncateTopicTopic) (nonPersistentTruncateTopicAuthoritative)
-- ^

type NonPersistentUnloadTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "unload" :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

data NonPersistentUnloadTopicParameters = NonPersistentUnloadTopicParameters
  { -- | Specify the tenant
    nonPersistentUnloadTopicTenant :: Text,
    -- | Specify the namespace
    nonPersistentUnloadTopicNamespace :: Text,
    -- | Specify topic name
    nonPersistentUnloadTopicTopic :: Text,
    -- | Is authentication required to perform this operation
    nonPersistentUnloadTopicAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentUnloadTopic :: NonPersistentUnloadTopicParameters -> ClientM NoContent
nonPersistentUnloadTopic NonPersistentUnloadTopicParameters {..} = client (Proxy :: Proxy NonPersistentUnloadTopicAPI) (nonPersistentUnloadTopicTenant) (nonPersistentUnloadTopicNamespace) (nonPersistentUnloadTopicTopic) (nonPersistentUnloadTopicAuthoritative)
-- ^ It only increments partitions of existing non-global partitioned-topic

type NonPersistentUpdatePartitionedTopicAPI =
  "admin" :> "v2" :> "non-persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "updateLocalTopicOnly" Bool :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data NonPersistentUpdatePartitionedTopicParameters = NonPersistentUpdatePartitionedTopicParameters
  { -- | Specify the tenant
    nonPersistentUpdatePartitionedTopicTenant :: Text,
    -- | Specify the namespace
    nonPersistentUpdatePartitionedTopicNamespace :: Text,
    -- | Specify topic name
    nonPersistentUpdatePartitionedTopicTopic :: Text,
    -- | The number of partitions for the topic
    nonPersistentUpdatePartitionedTopicBody :: Int,
    -- |
    nonPersistentUpdatePartitionedTopicUpdateLocalTopicOnly :: Maybe Bool,
    -- | Is authentication required to perform this operation
    nonPersistentUpdatePartitionedTopicAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

nonPersistentUpdatePartitionedTopic :: NonPersistentUpdatePartitionedTopicParameters -> ClientM NoContent
nonPersistentUpdatePartitionedTopic NonPersistentUpdatePartitionedTopicParameters {..} = client (Proxy :: Proxy NonPersistentUpdatePartitionedTopicAPI) (nonPersistentUpdatePartitionedTopicTenant) (nonPersistentUpdatePartitionedTopicNamespace) (nonPersistentUpdatePartitionedTopicTopic) (nonPersistentUpdatePartitionedTopicUpdateLocalTopicOnly) (nonPersistentUpdatePartitionedTopicAuthoritative) nonPersistentUpdatePartitionedTopicBody
-- ^

type PersistentCompactAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compaction" :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

data PersistentCompactParameters = PersistentCompactParameters
  { -- | Specify the tenant
    persistentCompactTenant :: Text,
    -- | Specify the namespace
    persistentCompactNamespace :: Text,
    -- | Specify topic name
    persistentCompactTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentCompactAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentCompact :: PersistentCompactParameters -> ClientM NoContent
persistentCompact PersistentCompactParameters {..} = client (Proxy :: Proxy PersistentCompactAPI) (persistentCompactTenant) (persistentCompactNamespace) (persistentCompactTopic) (persistentCompactAuthoritative)
-- ^

type PersistentCompactionStatusAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compaction" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] LongRunningProcessStatus

data PersistentCompactionStatusParameters = PersistentCompactionStatusParameters
  { -- | Specify the tenant
    persistentCompactionStatusTenant :: Text,
    -- | Specify the namespace
    persistentCompactionStatusNamespace :: Text,
    -- | Specify topic name
    persistentCompactionStatusTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentCompactionStatusAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentCompactionStatus :: PersistentCompactionStatusParameters -> ClientM LongRunningProcessStatus
persistentCompactionStatus PersistentCompactionStatusParameters {..} = client (Proxy :: Proxy PersistentCompactionStatusAPI) (persistentCompactionStatusTenant) (persistentCompactionStatusNamespace) (persistentCompactionStatusTopic) (persistentCompactionStatusAuthoritative)
-- ^

type PersistentCreateMissedPartitionsAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "createMissedPartitions" :> Verb 'POST 200 '[JSON] NoContent

data PersistentCreateMissedPartitionsParameters = PersistentCreateMissedPartitionsParameters
  { -- | Specify the tenant
    persistentCreateMissedPartitionsTenant :: Text,
    -- | Specify the namespace
    persistentCreateMissedPartitionsNamespace :: Text,
    -- | Specify topic name
    persistentCreateMissedPartitionsTopic :: Text
  }
  deriving (Show, Eq, Generic)

persistentCreateMissedPartitions :: PersistentCreateMissedPartitionsParameters -> ClientM NoContent
persistentCreateMissedPartitions PersistentCreateMissedPartitionsParameters {..} = client (Proxy :: Proxy PersistentCreateMissedPartitionsAPI) (persistentCreateMissedPartitionsTenant) (persistentCreateMissedPartitionsNamespace) (persistentCreateMissedPartitionsTopic)
-- ^ This is the only REST endpoint from which non-partitioned topics could be created.

type PersistentCreateNonPartitionedTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

data PersistentCreateNonPartitionedTopicParameters = PersistentCreateNonPartitionedTopicParameters
  { -- | Specify the tenant
    persistentCreateNonPartitionedTopicTenant :: Text,
    -- | Specify the namespace
    persistentCreateNonPartitionedTopicNamespace :: Text,
    -- | Specify topic name
    persistentCreateNonPartitionedTopicTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentCreateNonPartitionedTopicAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentCreateNonPartitionedTopic :: PersistentCreateNonPartitionedTopicParameters -> ClientM NoContent
persistentCreateNonPartitionedTopic PersistentCreateNonPartitionedTopicParameters {..} = client (Proxy :: Proxy PersistentCreateNonPartitionedTopicAPI) (persistentCreateNonPartitionedTopicTenant) (persistentCreateNonPartitionedTopicNamespace) (persistentCreateNonPartitionedTopicTopic) (persistentCreateNonPartitionedTopicAuthoritative)
-- ^ It needs to be called before creating a producer on a partitioned topic.

type PersistentCreatePartitionedTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "createLocalTopicOnly" Bool :> ReqBody '[JSON] Int :> Verb 'PUT 200 '[JSON] NoContent

data PersistentCreatePartitionedTopicParameters = PersistentCreatePartitionedTopicParameters
  { -- | Specify the tenant
    persistentCreatePartitionedTopicTenant :: Text,
    -- | Specify the namespace
    persistentCreatePartitionedTopicNamespace :: Text,
    -- | Specify topic name
    persistentCreatePartitionedTopicTopic :: Text,
    -- | The number of partitions for the topic
    persistentCreatePartitionedTopicBody :: Int,
    -- |
    persistentCreatePartitionedTopicCreateLocalTopicOnly :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentCreatePartitionedTopic :: PersistentCreatePartitionedTopicParameters -> ClientM NoContent
persistentCreatePartitionedTopic PersistentCreatePartitionedTopicParameters {..} = client (Proxy :: Proxy PersistentCreatePartitionedTopicAPI) (persistentCreatePartitionedTopicTenant) (persistentCreatePartitionedTopicNamespace) (persistentCreatePartitionedTopicTopic) (persistentCreatePartitionedTopicCreateLocalTopicOnly) persistentCreatePartitionedTopicBody
-- ^ Creates a subscription on the topic at the specified message id

type PersistentCreateSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subscriptionName" Text :> QueryParam "authoritative" Bool :> QueryParam "replicated" Bool :> ReqBody '[JSON] MessageIdImpl :> Verb 'PUT 200 '[JSON] NoContent

data PersistentCreateSubscriptionParameters = PersistentCreateSubscriptionParameters
  { -- | Specify the tenant
    persistentCreateSubscriptionTenant :: Text,
    -- | Specify the namespace
    persistentCreateSubscriptionNamespace :: Text,
    -- | Specify topic name
    persistentCreateSubscriptionTopic :: Text,
    -- | Subscription to create position on
    persistentCreateSubscriptionSubscriptionName :: Text,
    -- | Is authentication required to perform this operation
    persistentCreateSubscriptionAuthoritative :: Maybe Bool,
    -- | Is replicated required to perform this operation
    persistentCreateSubscriptionReplicated :: Maybe Bool,
    -- | messageId where to create the subscription. It can be 'latest', 'earliest' or (ledgerId:entryId)
    persistentCreateSubscriptionMessageId :: MessageIdImpl
  }
  deriving (Show, Eq, Generic)

persistentCreateSubscription :: PersistentCreateSubscriptionParameters -> ClientM NoContent
persistentCreateSubscription PersistentCreateSubscriptionParameters {..} = client (Proxy :: Proxy PersistentCreateSubscriptionAPI) (persistentCreateSubscriptionTenant) (persistentCreateSubscriptionNamespace) (persistentCreateSubscriptionTopic) (persistentCreateSubscriptionSubscriptionName) (persistentCreateSubscriptionAuthoritative) (persistentCreateSubscriptionReplicated) persistentCreateSubscriptionMessageId
-- ^

type PersistentDeleteDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationSnapshotInterval" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentDeleteDeduplicationSnapshotIntervalParameters = PersistentDeleteDeduplicationSnapshotIntervalParameters
  { -- |
    persistentDeleteDeduplicationSnapshotIntervalTenant :: Text,
    -- |
    persistentDeleteDeduplicationSnapshotIntervalNamespace :: Text,
    -- |
    persistentDeleteDeduplicationSnapshotIntervalTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentDeleteDeduplicationSnapshotIntervalAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentDeleteDeduplicationSnapshotInterval :: PersistentDeleteDeduplicationSnapshotIntervalParameters -> ClientM NoContent
persistentDeleteDeduplicationSnapshotInterval PersistentDeleteDeduplicationSnapshotIntervalParameters {..} = client (Proxy :: Proxy PersistentDeleteDeduplicationSnapshotIntervalAPI) (persistentDeleteDeduplicationSnapshotIntervalTenant) (persistentDeleteDeduplicationSnapshotIntervalNamespace) (persistentDeleteDeduplicationSnapshotIntervalTopic) (persistentDeleteDeduplicationSnapshotIntervalAuthoritative)
-- ^

type PersistentDeleteDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "delayedDelivery" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentDeleteDelayedDeliveryPoliciesParameters = PersistentDeleteDelayedDeliveryPoliciesParameters
  { -- |
    persistentDeleteDelayedDeliveryPoliciesTenant :: Text,
    -- |
    persistentDeleteDelayedDeliveryPoliciesNamespace :: Text,
    -- |
    persistentDeleteDelayedDeliveryPoliciesTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentDeleteDelayedDeliveryPoliciesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentDeleteDelayedDeliveryPolicies :: PersistentDeleteDelayedDeliveryPoliciesParameters -> ClientM NoContent
persistentDeleteDelayedDeliveryPolicies PersistentDeleteDelayedDeliveryPoliciesParameters {..} = client (Proxy :: Proxy PersistentDeleteDelayedDeliveryPoliciesAPI) (persistentDeleteDelayedDeliveryPoliciesTenant) (persistentDeleteDelayedDeliveryPoliciesNamespace) (persistentDeleteDelayedDeliveryPoliciesTopic) (persistentDeleteDelayedDeliveryPoliciesAuthoritative)
-- ^

type PersistentDeleteInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "inactiveTopicPolicies" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentDeleteInactiveTopicPoliciesParameters = PersistentDeleteInactiveTopicPoliciesParameters
  { -- |
    persistentDeleteInactiveTopicPoliciesTenant :: Text,
    -- |
    persistentDeleteInactiveTopicPoliciesNamespace :: Text,
    -- |
    persistentDeleteInactiveTopicPoliciesTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentDeleteInactiveTopicPoliciesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentDeleteInactiveTopicPolicies :: PersistentDeleteInactiveTopicPoliciesParameters -> ClientM NoContent
persistentDeleteInactiveTopicPolicies PersistentDeleteInactiveTopicPoliciesParameters {..} = client (Proxy :: Proxy PersistentDeleteInactiveTopicPoliciesAPI) (persistentDeleteInactiveTopicPoliciesTenant) (persistentDeleteInactiveTopicPoliciesNamespace) (persistentDeleteInactiveTopicPoliciesTopic) (persistentDeleteInactiveTopicPoliciesAuthoritative)
-- ^

type PersistentDeleteMaxUnackedMessagesOnConsumerAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnConsumer" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentDeleteMaxUnackedMessagesOnConsumerParameters = PersistentDeleteMaxUnackedMessagesOnConsumerParameters
  { -- |
    persistentDeleteMaxUnackedMessagesOnConsumerTenant :: Text,
    -- |
    persistentDeleteMaxUnackedMessagesOnConsumerNamespace :: Text,
    -- |
    persistentDeleteMaxUnackedMessagesOnConsumerTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentDeleteMaxUnackedMessagesOnConsumerAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentDeleteMaxUnackedMessagesOnConsumer :: PersistentDeleteMaxUnackedMessagesOnConsumerParameters -> ClientM NoContent
persistentDeleteMaxUnackedMessagesOnConsumer PersistentDeleteMaxUnackedMessagesOnConsumerParameters {..} = client (Proxy :: Proxy PersistentDeleteMaxUnackedMessagesOnConsumerAPI) (persistentDeleteMaxUnackedMessagesOnConsumerTenant) (persistentDeleteMaxUnackedMessagesOnConsumerNamespace) (persistentDeleteMaxUnackedMessagesOnConsumerTopic) (persistentDeleteMaxUnackedMessagesOnConsumerAuthoritative)
-- ^

type PersistentDeleteMaxUnackedMessagesOnSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnSubscription" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentDeleteMaxUnackedMessagesOnSubscriptionParameters = PersistentDeleteMaxUnackedMessagesOnSubscriptionParameters
  { -- |
    persistentDeleteMaxUnackedMessagesOnSubscriptionTenant :: Text,
    -- |
    persistentDeleteMaxUnackedMessagesOnSubscriptionNamespace :: Text,
    -- |
    persistentDeleteMaxUnackedMessagesOnSubscriptionTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentDeleteMaxUnackedMessagesOnSubscriptionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentDeleteMaxUnackedMessagesOnSubscription :: PersistentDeleteMaxUnackedMessagesOnSubscriptionParameters -> ClientM NoContent
persistentDeleteMaxUnackedMessagesOnSubscription PersistentDeleteMaxUnackedMessagesOnSubscriptionParameters {..} = client (Proxy :: Proxy PersistentDeleteMaxUnackedMessagesOnSubscriptionAPI) (persistentDeleteMaxUnackedMessagesOnSubscriptionTenant) (persistentDeleteMaxUnackedMessagesOnSubscriptionNamespace) (persistentDeleteMaxUnackedMessagesOnSubscriptionTopic) (persistentDeleteMaxUnackedMessagesOnSubscriptionAuthoritative)
-- ^ It will also delete all the partitions of the topic if it exists.

type PersistentDeletePartitionedTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> QueryParam "deleteSchema" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentDeletePartitionedTopicParameters = PersistentDeletePartitionedTopicParameters
  { -- | Specify the tenant
    persistentDeletePartitionedTopicTenant :: Text,
    -- | Specify the namespace
    persistentDeletePartitionedTopicNamespace :: Text,
    -- | Specify topic name
    persistentDeletePartitionedTopicTopic :: Text,
    -- | Stop all producer/consumer/replicator and delete topic forcefully
    persistentDeletePartitionedTopicForce :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentDeletePartitionedTopicAuthoritative :: Maybe Bool,
    -- | Delete the topic's schema storage
    persistentDeletePartitionedTopicDeleteSchema :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentDeletePartitionedTopic :: PersistentDeletePartitionedTopicParameters -> ClientM NoContent
persistentDeletePartitionedTopic PersistentDeletePartitionedTopicParameters {..} = client (Proxy :: Proxy PersistentDeletePartitionedTopicAPI) (persistentDeletePartitionedTopicTenant) (persistentDeletePartitionedTopicNamespace) (persistentDeletePartitionedTopicTopic) (persistentDeletePartitionedTopicForce) (persistentDeletePartitionedTopicAuthoritative) (persistentDeletePartitionedTopicDeleteSchema)
-- ^ The subscription cannot be deleted if delete is not forcefully and there are any active consumers attached to it. Force delete ignores connected consumers and deletes subscription by explicitly closing them.

type PersistentDeleteSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentDeleteSubscriptionParameters = PersistentDeleteSubscriptionParameters
  { -- | Specify the tenant
    persistentDeleteSubscriptionTenant :: Text,
    -- | Specify the namespace
    persistentDeleteSubscriptionNamespace :: Text,
    -- | Specify topic name
    persistentDeleteSubscriptionTopic :: Text,
    -- | Subscription to be deleted
    persistentDeleteSubscriptionSubName :: Text,
    -- | Disconnect and close all consumers and delete subscription forcefully
    persistentDeleteSubscriptionForce :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentDeleteSubscriptionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentDeleteSubscription :: PersistentDeleteSubscriptionParameters -> ClientM NoContent
persistentDeleteSubscription PersistentDeleteSubscriptionParameters {..} = client (Proxy :: Proxy PersistentDeleteSubscriptionAPI) (persistentDeleteSubscriptionTenant) (persistentDeleteSubscriptionNamespace) (persistentDeleteSubscriptionTopic) (persistentDeleteSubscriptionSubName) (persistentDeleteSubscriptionForce) (persistentDeleteSubscriptionAuthoritative)
-- ^ The topic cannot be deleted if delete is not forcefully and there's any active subscription or producer connected to the it. Force delete ignores connected clients and deletes topic by explicitly closing them.

type PersistentDeleteTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> QueryParam "force" Bool :> QueryParam "authoritative" Bool :> QueryParam "deleteSchema" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentDeleteTopicParameters = PersistentDeleteTopicParameters
  { -- | Specify the tenant
    persistentDeleteTopicTenant :: Text,
    -- | Specify the namespace
    persistentDeleteTopicNamespace :: Text,
    -- | Specify topic name
    persistentDeleteTopicTopic :: Text,
    -- | Stop all producer/consumer/replicator and delete topic forcefully
    persistentDeleteTopicForce :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentDeleteTopicAuthoritative :: Maybe Bool,
    -- | Delete the topic's schema storage
    persistentDeleteTopicDeleteSchema :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentDeleteTopic :: PersistentDeleteTopicParameters -> ClientM NoContent
persistentDeleteTopic PersistentDeleteTopicParameters {..} = client (Proxy :: Proxy PersistentDeleteTopicAPI) (persistentDeleteTopicTenant) (persistentDeleteTopicNamespace) (persistentDeleteTopicTopic) (persistentDeleteTopicForce) (persistentDeleteTopicAuthoritative) (persistentDeleteTopicDeleteSchema)
-- ^

type PersistentExamineMessageAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "examinemessage" :> QueryParam "initialPosition" Text :> QueryParam "messagePosition" Integer :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentExamineMessageParameters = PersistentExamineMessageParameters
  { -- | Specify the tenant
    persistentExamineMessageTenant :: Text,
    -- | Specify the namespace
    persistentExamineMessageNamespace :: Text,
    -- | Specify topic name
    persistentExamineMessageTopic :: Text,
    -- | Relative start position to examine message.It can be 'latest' or 'earliest'
    persistentExamineMessageInitialPosition :: Maybe Text,
    -- | The position of messages (default 1)
    persistentExamineMessageMessagePosition :: Maybe Integer,
    -- | Is authentication required to perform this operation
    persistentExamineMessageAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentExamineMessage :: PersistentExamineMessageParameters -> ClientM NoContent
persistentExamineMessage PersistentExamineMessageParameters {..} = client (Proxy :: Proxy PersistentExamineMessageAPI) (persistentExamineMessageTenant) (persistentExamineMessageNamespace) (persistentExamineMessageTopic) (persistentExamineMessageInitialPosition) (persistentExamineMessageMessagePosition) (persistentExamineMessageAuthoritative)
-- ^

type PersistentExpireMessagesForAllSubscriptionsAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "all_subscription" :> "expireMessages" :> Capture "expireTimeInSeconds" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data PersistentExpireMessagesForAllSubscriptionsParameters = PersistentExpireMessagesForAllSubscriptionsParameters
  { -- | Specify the tenant
    persistentExpireMessagesForAllSubscriptionsTenant :: Text,
    -- | Specify the namespace
    persistentExpireMessagesForAllSubscriptionsNamespace :: Text,
    -- | Specify topic name
    persistentExpireMessagesForAllSubscriptionsTopic :: Text,
    -- | Expires beyond the specified number of seconds
    persistentExpireMessagesForAllSubscriptionsExpireTimeInSeconds :: Int,
    -- | Is authentication required to perform this operation
    persistentExpireMessagesForAllSubscriptionsAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentExpireMessagesForAllSubscriptions :: PersistentExpireMessagesForAllSubscriptionsParameters -> ClientM NoContent
persistentExpireMessagesForAllSubscriptions PersistentExpireMessagesForAllSubscriptionsParameters {..} = client (Proxy :: Proxy PersistentExpireMessagesForAllSubscriptionsAPI) (persistentExpireMessagesForAllSubscriptionsTenant) (persistentExpireMessagesForAllSubscriptionsNamespace) (persistentExpireMessagesForAllSubscriptionsTopic) (persistentExpireMessagesForAllSubscriptionsExpireTimeInSeconds) (persistentExpireMessagesForAllSubscriptionsAuthoritative)
-- ^

type PersistentExpireTopicMessagesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "expireMessages" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] ResetCursorData :> Verb 'POST 200 '[JSON] NoContent

data PersistentExpireTopicMessagesParameters = PersistentExpireTopicMessagesParameters
  { -- | Specify the tenant
    persistentExpireTopicMessagesTenant :: Text,
    -- | Specify the namespace
    persistentExpireTopicMessagesNamespace :: Text,
    -- | Specify topic name
    persistentExpireTopicMessagesTopic :: Text,
    -- | Subscription to be Expiry messages on
    persistentExpireTopicMessagesSubName :: Text,
    -- | Is authentication required to perform this operation
    persistentExpireTopicMessagesAuthoritative :: Maybe Bool,
    -- | messageId to reset back to (ledgerId:entryId)
    persistentExpireTopicMessagesMessageId :: ResetCursorData
  }
  deriving (Show, Eq, Generic)

persistentExpireTopicMessages :: PersistentExpireTopicMessagesParameters -> ClientM NoContent
persistentExpireTopicMessages PersistentExpireTopicMessagesParameters {..} = client (Proxy :: Proxy PersistentExpireTopicMessagesAPI) (persistentExpireTopicMessagesTenant) (persistentExpireTopicMessagesNamespace) (persistentExpireTopicMessagesTopic) (persistentExpireTopicMessagesSubName) (persistentExpireTopicMessagesAuthoritative) persistentExpireTopicMessagesMessageId
-- ^

type PersistentExpireTopicMessagesInSecondsAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "expireMessages" :> Capture "expireTimeInSeconds" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data PersistentExpireTopicMessagesInSecondsParameters = PersistentExpireTopicMessagesInSecondsParameters
  { -- | Specify the tenant
    persistentExpireTopicMessagesInSecondsTenant :: Text,
    -- | Specify the namespace
    persistentExpireTopicMessagesInSecondsNamespace :: Text,
    -- | Specify topic name
    persistentExpireTopicMessagesInSecondsTopic :: Text,
    -- | Subscription to be Expiry messages on
    persistentExpireTopicMessagesInSecondsSubName :: Text,
    -- | Expires beyond the specified number of seconds
    persistentExpireTopicMessagesInSecondsExpireTimeInSeconds :: Int,
    -- | Is authentication required to perform this operation
    persistentExpireTopicMessagesInSecondsAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentExpireTopicMessagesInSeconds :: PersistentExpireTopicMessagesInSecondsParameters -> ClientM NoContent
persistentExpireTopicMessagesInSeconds PersistentExpireTopicMessagesInSecondsParameters {..} = client (Proxy :: Proxy PersistentExpireTopicMessagesInSecondsAPI) (persistentExpireTopicMessagesInSecondsTenant) (persistentExpireTopicMessagesInSecondsNamespace) (persistentExpireTopicMessagesInSecondsTopic) (persistentExpireTopicMessagesInSecondsSubName) (persistentExpireTopicMessagesInSecondsExpireTimeInSeconds) (persistentExpireTopicMessagesInSecondsAuthoritative)
-- ^

type PersistentGetBacklogAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlog" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] PersistentOfflineTopicStats

data PersistentGetBacklogParameters = PersistentGetBacklogParameters
  { -- | Specify the tenant
    persistentGetBacklogTenant :: Text,
    -- | Specify the namespace
    persistentGetBacklogNamespace :: Text,
    -- | Specify topic name
    persistentGetBacklogTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentGetBacklogAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetBacklog :: PersistentGetBacklogParameters -> ClientM PersistentOfflineTopicStats
persistentGetBacklog PersistentGetBacklogParameters {..} = client (Proxy :: Proxy PersistentGetBacklogAPI) (persistentGetBacklogTenant) (persistentGetBacklogNamespace) (persistentGetBacklogTopic) (persistentGetBacklogAuthoritative)
-- ^

type PersistentGetBacklogQuotaMapAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlogQuotaMap" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetBacklogQuotaMapParameters = PersistentGetBacklogQuotaMapParameters
  { -- |
    persistentGetBacklogQuotaMapTenant :: Text,
    -- |
    persistentGetBacklogQuotaMapNamespace :: Text,
    -- |
    persistentGetBacklogQuotaMapTopic :: Text,
    -- |
    persistentGetBacklogQuotaMapApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetBacklogQuotaMapAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetBacklogQuotaMap :: PersistentGetBacklogQuotaMapParameters -> ClientM NoContent
persistentGetBacklogQuotaMap PersistentGetBacklogQuotaMapParameters {..} = client (Proxy :: Proxy PersistentGetBacklogQuotaMapAPI) (persistentGetBacklogQuotaMapTenant) (persistentGetBacklogQuotaMapNamespace) (persistentGetBacklogQuotaMapTopic) (persistentGetBacklogQuotaMapApplied) (persistentGetBacklogQuotaMapAuthoritative)
-- ^

type PersistentGetCompactionThresholdAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compactionThreshold" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetCompactionThresholdParameters = PersistentGetCompactionThresholdParameters
  { -- |
    persistentGetCompactionThresholdTenant :: Text,
    -- |
    persistentGetCompactionThresholdNamespace :: Text,
    -- |
    persistentGetCompactionThresholdTopic :: Text,
    -- |
    persistentGetCompactionThresholdApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetCompactionThresholdAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetCompactionThreshold :: PersistentGetCompactionThresholdParameters -> ClientM NoContent
persistentGetCompactionThreshold PersistentGetCompactionThresholdParameters {..} = client (Proxy :: Proxy PersistentGetCompactionThresholdAPI) (persistentGetCompactionThresholdTenant) (persistentGetCompactionThresholdNamespace) (persistentGetCompactionThresholdTopic) (persistentGetCompactionThresholdApplied) (persistentGetCompactionThresholdAuthoritative)
-- ^

type PersistentGetDeduplicationAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationEnabled" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetDeduplicationParameters = PersistentGetDeduplicationParameters
  { -- |
    persistentGetDeduplicationTenant :: Text,
    -- |
    persistentGetDeduplicationNamespace :: Text,
    -- |
    persistentGetDeduplicationTopic :: Text,
    -- |
    persistentGetDeduplicationApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetDeduplicationAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetDeduplication :: PersistentGetDeduplicationParameters -> ClientM NoContent
persistentGetDeduplication PersistentGetDeduplicationParameters {..} = client (Proxy :: Proxy PersistentGetDeduplicationAPI) (persistentGetDeduplicationTenant) (persistentGetDeduplicationNamespace) (persistentGetDeduplicationTopic) (persistentGetDeduplicationApplied) (persistentGetDeduplicationAuthoritative)
-- ^

type PersistentGetDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationSnapshotInterval" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetDeduplicationSnapshotIntervalParameters = PersistentGetDeduplicationSnapshotIntervalParameters
  { -- |
    persistentGetDeduplicationSnapshotIntervalTenant :: Text,
    -- |
    persistentGetDeduplicationSnapshotIntervalNamespace :: Text,
    -- |
    persistentGetDeduplicationSnapshotIntervalTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentGetDeduplicationSnapshotIntervalAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetDeduplicationSnapshotInterval :: PersistentGetDeduplicationSnapshotIntervalParameters -> ClientM NoContent
persistentGetDeduplicationSnapshotInterval PersistentGetDeduplicationSnapshotIntervalParameters {..} = client (Proxy :: Proxy PersistentGetDeduplicationSnapshotIntervalAPI) (persistentGetDeduplicationSnapshotIntervalTenant) (persistentGetDeduplicationSnapshotIntervalNamespace) (persistentGetDeduplicationSnapshotIntervalTopic) (persistentGetDeduplicationSnapshotIntervalAuthoritative)
-- ^

type PersistentGetDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "delayedDelivery" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetDelayedDeliveryPoliciesParameters = PersistentGetDelayedDeliveryPoliciesParameters
  { -- |
    persistentGetDelayedDeliveryPoliciesTenant :: Text,
    -- |
    persistentGetDelayedDeliveryPoliciesNamespace :: Text,
    -- |
    persistentGetDelayedDeliveryPoliciesTopic :: Text,
    -- |
    persistentGetDelayedDeliveryPoliciesApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetDelayedDeliveryPoliciesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetDelayedDeliveryPolicies :: PersistentGetDelayedDeliveryPoliciesParameters -> ClientM NoContent
persistentGetDelayedDeliveryPolicies PersistentGetDelayedDeliveryPoliciesParameters {..} = client (Proxy :: Proxy PersistentGetDelayedDeliveryPoliciesAPI) (persistentGetDelayedDeliveryPoliciesTenant) (persistentGetDelayedDeliveryPoliciesNamespace) (persistentGetDelayedDeliveryPoliciesTopic) (persistentGetDelayedDeliveryPoliciesApplied) (persistentGetDelayedDeliveryPoliciesAuthoritative)
-- ^

type PersistentGetDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "dispatchRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetDispatchRateParameters = PersistentGetDispatchRateParameters
  { -- |
    persistentGetDispatchRateTenant :: Text,
    -- |
    persistentGetDispatchRateNamespace :: Text,
    -- |
    persistentGetDispatchRateTopic :: Text,
    -- |
    persistentGetDispatchRateApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetDispatchRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetDispatchRate :: PersistentGetDispatchRateParameters -> ClientM NoContent
persistentGetDispatchRate PersistentGetDispatchRateParameters {..} = client (Proxy :: Proxy PersistentGetDispatchRateAPI) (persistentGetDispatchRateTenant) (persistentGetDispatchRateNamespace) (persistentGetDispatchRateTopic) (persistentGetDispatchRateApplied) (persistentGetDispatchRateAuthoritative)
-- ^

type PersistentGetInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "inactiveTopicPolicies" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetInactiveTopicPoliciesParameters = PersistentGetInactiveTopicPoliciesParameters
  { -- |
    persistentGetInactiveTopicPoliciesTenant :: Text,
    -- |
    persistentGetInactiveTopicPoliciesNamespace :: Text,
    -- |
    persistentGetInactiveTopicPoliciesTopic :: Text,
    -- |
    persistentGetInactiveTopicPoliciesApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetInactiveTopicPoliciesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetInactiveTopicPolicies :: PersistentGetInactiveTopicPoliciesParameters -> ClientM NoContent
persistentGetInactiveTopicPolicies PersistentGetInactiveTopicPoliciesParameters {..} = client (Proxy :: Proxy PersistentGetInactiveTopicPoliciesAPI) (persistentGetInactiveTopicPoliciesTenant) (persistentGetInactiveTopicPoliciesNamespace) (persistentGetInactiveTopicPoliciesTopic) (persistentGetInactiveTopicPoliciesApplied) (persistentGetInactiveTopicPoliciesAuthoritative)
-- ^

type PersistentGetInternalStatsAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "internalStats" :> QueryParam "authoritative" Bool :> QueryParam "metadata" Bool :> Verb 'GET 200 '[JSON] PersistentTopicInternalStats

data PersistentGetInternalStatsParameters = PersistentGetInternalStatsParameters
  { -- | Specify the tenant
    persistentGetInternalStatsTenant :: Text,
    -- | Specify the namespace
    persistentGetInternalStatsNamespace :: Text,
    -- | Specify topic name
    persistentGetInternalStatsTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentGetInternalStatsAuthoritative :: Maybe Bool,
    -- |
    persistentGetInternalStatsMetadata :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetInternalStats :: PersistentGetInternalStatsParameters -> ClientM PersistentTopicInternalStats
persistentGetInternalStats PersistentGetInternalStatsParameters {..} = client (Proxy :: Proxy PersistentGetInternalStatsAPI) (persistentGetInternalStatsTenant) (persistentGetInternalStatsNamespace) (persistentGetInternalStatsTopic) (persistentGetInternalStatsAuthoritative) (persistentGetInternalStatsMetadata)
-- ^

type PersistentGetLastMessageIdAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "lastMessageId" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetLastMessageIdParameters = PersistentGetLastMessageIdParameters
  { -- | Specify the tenant
    persistentGetLastMessageIdTenant :: Text,
    -- | Specify the namespace
    persistentGetLastMessageIdNamespace :: Text,
    -- | Specify topic name
    persistentGetLastMessageIdTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentGetLastMessageIdAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetLastMessageId :: PersistentGetLastMessageIdParameters -> ClientM NoContent
persistentGetLastMessageId PersistentGetLastMessageIdParameters {..} = client (Proxy :: Proxy PersistentGetLastMessageIdAPI) (persistentGetLastMessageIdTenant) (persistentGetLastMessageIdNamespace) (persistentGetLastMessageIdTopic) (persistentGetLastMessageIdAuthoritative)
-- ^

type PersistentGetListAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Verb 'GET 200 '[JSON] [Text]

data PersistentGetListParameters = PersistentGetListParameters
  { -- | Specify the tenant
    persistentGetListTenant :: Text,
    -- | Specify the namespace
    persistentGetListNamespace :: Text
  }
  deriving (Show, Eq, Generic)

persistentGetList :: PersistentGetListParameters -> ClientM [Text]
persistentGetList PersistentGetListParameters {..} = client (Proxy :: Proxy PersistentGetListAPI) (persistentGetListTenant) (persistentGetListNamespace)
-- ^

type PersistentGetManagedLedgerInfoAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "internal-info" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetManagedLedgerInfoParameters = PersistentGetManagedLedgerInfoParameters
  { -- | Specify the tenant
    persistentGetManagedLedgerInfoTenant :: Text,
    -- | Specify the namespace
    persistentGetManagedLedgerInfoNamespace :: Text,
    -- | Specify topic name
    persistentGetManagedLedgerInfoTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentGetManagedLedgerInfoAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetManagedLedgerInfo :: PersistentGetManagedLedgerInfoParameters -> ClientM NoContent
persistentGetManagedLedgerInfo PersistentGetManagedLedgerInfoParameters {..} = client (Proxy :: Proxy PersistentGetManagedLedgerInfoAPI) (persistentGetManagedLedgerInfoTenant) (persistentGetManagedLedgerInfoNamespace) (persistentGetManagedLedgerInfoTopic) (persistentGetManagedLedgerInfoAuthoritative)
-- ^

type PersistentGetMaxConsumersAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumers" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetMaxConsumersParameters = PersistentGetMaxConsumersParameters
  { -- |
    persistentGetMaxConsumersTenant :: Text,
    -- |
    persistentGetMaxConsumersNamespace :: Text,
    -- |
    persistentGetMaxConsumersTopic :: Text,
    -- |
    persistentGetMaxConsumersApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetMaxConsumersAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetMaxConsumers :: PersistentGetMaxConsumersParameters -> ClientM NoContent
persistentGetMaxConsumers PersistentGetMaxConsumersParameters {..} = client (Proxy :: Proxy PersistentGetMaxConsumersAPI) (persistentGetMaxConsumersTenant) (persistentGetMaxConsumersNamespace) (persistentGetMaxConsumersTopic) (persistentGetMaxConsumersApplied) (persistentGetMaxConsumersAuthoritative)
-- ^

type PersistentGetMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumersPerSubscription" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetMaxConsumersPerSubscriptionParameters = PersistentGetMaxConsumersPerSubscriptionParameters
  { -- |
    persistentGetMaxConsumersPerSubscriptionTenant :: Text,
    -- |
    persistentGetMaxConsumersPerSubscriptionNamespace :: Text,
    -- |
    persistentGetMaxConsumersPerSubscriptionTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentGetMaxConsumersPerSubscriptionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetMaxConsumersPerSubscription :: PersistentGetMaxConsumersPerSubscriptionParameters -> ClientM NoContent
persistentGetMaxConsumersPerSubscription PersistentGetMaxConsumersPerSubscriptionParameters {..} = client (Proxy :: Proxy PersistentGetMaxConsumersPerSubscriptionAPI) (persistentGetMaxConsumersPerSubscriptionTenant) (persistentGetMaxConsumersPerSubscriptionNamespace) (persistentGetMaxConsumersPerSubscriptionTopic) (persistentGetMaxConsumersPerSubscriptionAuthoritative)
-- ^

type PersistentGetMaxMessageSizeAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxMessageSize" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetMaxMessageSizeParameters = PersistentGetMaxMessageSizeParameters
  { -- |
    persistentGetMaxMessageSizeTenant :: Text,
    -- |
    persistentGetMaxMessageSizeNamespace :: Text,
    -- |
    persistentGetMaxMessageSizeTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentGetMaxMessageSizeAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetMaxMessageSize :: PersistentGetMaxMessageSizeParameters -> ClientM NoContent
persistentGetMaxMessageSize PersistentGetMaxMessageSizeParameters {..} = client (Proxy :: Proxy PersistentGetMaxMessageSizeAPI) (persistentGetMaxMessageSizeTenant) (persistentGetMaxMessageSizeNamespace) (persistentGetMaxMessageSizeTopic) (persistentGetMaxMessageSizeAuthoritative)
-- ^

type PersistentGetMaxProducersAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxProducers" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetMaxProducersParameters = PersistentGetMaxProducersParameters
  { -- |
    persistentGetMaxProducersTenant :: Text,
    -- |
    persistentGetMaxProducersNamespace :: Text,
    -- |
    persistentGetMaxProducersTopic :: Text,
    -- |
    persistentGetMaxProducersApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetMaxProducersAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetMaxProducers :: PersistentGetMaxProducersParameters -> ClientM NoContent
persistentGetMaxProducers PersistentGetMaxProducersParameters {..} = client (Proxy :: Proxy PersistentGetMaxProducersAPI) (persistentGetMaxProducersTenant) (persistentGetMaxProducersNamespace) (persistentGetMaxProducersTopic) (persistentGetMaxProducersApplied) (persistentGetMaxProducersAuthoritative)
-- ^

type PersistentGetMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxSubscriptionsPerTopic" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetMaxSubscriptionsPerTopicParameters = PersistentGetMaxSubscriptionsPerTopicParameters
  { -- |
    persistentGetMaxSubscriptionsPerTopicTenant :: Text,
    -- |
    persistentGetMaxSubscriptionsPerTopicNamespace :: Text,
    -- |
    persistentGetMaxSubscriptionsPerTopicTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentGetMaxSubscriptionsPerTopicAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetMaxSubscriptionsPerTopic :: PersistentGetMaxSubscriptionsPerTopicParameters -> ClientM NoContent
persistentGetMaxSubscriptionsPerTopic PersistentGetMaxSubscriptionsPerTopicParameters {..} = client (Proxy :: Proxy PersistentGetMaxSubscriptionsPerTopicAPI) (persistentGetMaxSubscriptionsPerTopicTenant) (persistentGetMaxSubscriptionsPerTopicNamespace) (persistentGetMaxSubscriptionsPerTopicTopic) (persistentGetMaxSubscriptionsPerTopicAuthoritative)
-- ^

type PersistentGetMaxUnackedMessagesOnConsumerAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnConsumer" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetMaxUnackedMessagesOnConsumerParameters = PersistentGetMaxUnackedMessagesOnConsumerParameters
  { -- |
    persistentGetMaxUnackedMessagesOnConsumerTenant :: Text,
    -- |
    persistentGetMaxUnackedMessagesOnConsumerNamespace :: Text,
    -- |
    persistentGetMaxUnackedMessagesOnConsumerTopic :: Text,
    -- |
    persistentGetMaxUnackedMessagesOnConsumerApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetMaxUnackedMessagesOnConsumerAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetMaxUnackedMessagesOnConsumer :: PersistentGetMaxUnackedMessagesOnConsumerParameters -> ClientM NoContent
persistentGetMaxUnackedMessagesOnConsumer PersistentGetMaxUnackedMessagesOnConsumerParameters {..} = client (Proxy :: Proxy PersistentGetMaxUnackedMessagesOnConsumerAPI) (persistentGetMaxUnackedMessagesOnConsumerTenant) (persistentGetMaxUnackedMessagesOnConsumerNamespace) (persistentGetMaxUnackedMessagesOnConsumerTopic) (persistentGetMaxUnackedMessagesOnConsumerApplied) (persistentGetMaxUnackedMessagesOnConsumerAuthoritative)
-- ^

type PersistentGetMaxUnackedMessagesOnSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnSubscription" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetMaxUnackedMessagesOnSubscriptionParameters = PersistentGetMaxUnackedMessagesOnSubscriptionParameters
  { -- |
    persistentGetMaxUnackedMessagesOnSubscriptionTenant :: Text,
    -- |
    persistentGetMaxUnackedMessagesOnSubscriptionNamespace :: Text,
    -- |
    persistentGetMaxUnackedMessagesOnSubscriptionTopic :: Text,
    -- |
    persistentGetMaxUnackedMessagesOnSubscriptionApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetMaxUnackedMessagesOnSubscriptionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetMaxUnackedMessagesOnSubscription :: PersistentGetMaxUnackedMessagesOnSubscriptionParameters -> ClientM NoContent
persistentGetMaxUnackedMessagesOnSubscription PersistentGetMaxUnackedMessagesOnSubscriptionParameters {..} = client (Proxy :: Proxy PersistentGetMaxUnackedMessagesOnSubscriptionAPI) (persistentGetMaxUnackedMessagesOnSubscriptionTenant) (persistentGetMaxUnackedMessagesOnSubscriptionNamespace) (persistentGetMaxUnackedMessagesOnSubscriptionTopic) (persistentGetMaxUnackedMessagesOnSubscriptionApplied) (persistentGetMaxUnackedMessagesOnSubscriptionAuthoritative)
-- ^

type PersistentGetMessageByIdAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "ledger" :> Capture "ledgerId" Integer :> "entry" :> Capture "entryId" Integer :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetMessageByIdParameters = PersistentGetMessageByIdParameters
  { -- | Specify the tenant
    persistentGetMessageByIdTenant :: Text,
    -- | Specify the namespace
    persistentGetMessageByIdNamespace :: Text,
    -- | Specify topic name
    persistentGetMessageByIdTopic :: Text,
    -- | The ledger id
    persistentGetMessageByIdLedgerId :: Integer,
    -- | The entry id
    persistentGetMessageByIdEntryId :: Integer,
    -- | Is authentication required to perform this operation
    persistentGetMessageByIdAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetMessageById :: PersistentGetMessageByIdParameters -> ClientM NoContent
persistentGetMessageById PersistentGetMessageByIdParameters {..} = client (Proxy :: Proxy PersistentGetMessageByIdAPI) (persistentGetMessageByIdTenant) (persistentGetMessageByIdNamespace) (persistentGetMessageByIdTopic) (persistentGetMessageByIdLedgerId) (persistentGetMessageByIdEntryId) (persistentGetMessageByIdAuthoritative)
-- ^

type PersistentGetMessageIdByTimestampAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageid" :> Capture "timestamp" Integer :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetMessageIdByTimestampParameters = PersistentGetMessageIdByTimestampParameters
  { -- | Specify the tenant
    persistentGetMessageIdByTimestampTenant :: Text,
    -- | Specify the namespace
    persistentGetMessageIdByTimestampNamespace :: Text,
    -- | Specify topic name
    persistentGetMessageIdByTimestampTopic :: Text,
    -- | Specify the timestamp
    persistentGetMessageIdByTimestampTimestamp :: Integer,
    -- | Is authentication required to perform this operation
    persistentGetMessageIdByTimestampAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetMessageIdByTimestamp :: PersistentGetMessageIdByTimestampParameters -> ClientM NoContent
persistentGetMessageIdByTimestamp PersistentGetMessageIdByTimestampParameters {..} = client (Proxy :: Proxy PersistentGetMessageIdByTimestampAPI) (persistentGetMessageIdByTimestampTenant) (persistentGetMessageIdByTimestampNamespace) (persistentGetMessageIdByTimestampTopic) (persistentGetMessageIdByTimestampTimestamp) (persistentGetMessageIdByTimestampAuthoritative)
-- ^

type PersistentGetMessageTTLAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageTTL" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetMessageTTLParameters = PersistentGetMessageTTLParameters
  { -- |
    persistentGetMessageTTLTenant :: Text,
    -- |
    persistentGetMessageTTLNamespace :: Text,
    -- |
    persistentGetMessageTTLTopic :: Text,
    -- |
    persistentGetMessageTTLApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetMessageTTLAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetMessageTTL :: PersistentGetMessageTTLParameters -> ClientM NoContent
persistentGetMessageTTL PersistentGetMessageTTLParameters {..} = client (Proxy :: Proxy PersistentGetMessageTTLAPI) (persistentGetMessageTTLTenant) (persistentGetMessageTTLNamespace) (persistentGetMessageTTLTopic) (persistentGetMessageTTLApplied) (persistentGetMessageTTLAuthoritative)
-- ^

type PersistentGetOffloadPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offloadPolicies" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetOffloadPoliciesParameters = PersistentGetOffloadPoliciesParameters
  { -- |
    persistentGetOffloadPoliciesTenant :: Text,
    -- |
    persistentGetOffloadPoliciesNamespace :: Text,
    -- |
    persistentGetOffloadPoliciesTopic :: Text,
    -- |
    persistentGetOffloadPoliciesApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetOffloadPoliciesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetOffloadPolicies :: PersistentGetOffloadPoliciesParameters -> ClientM NoContent
persistentGetOffloadPolicies PersistentGetOffloadPoliciesParameters {..} = client (Proxy :: Proxy PersistentGetOffloadPoliciesAPI) (persistentGetOffloadPoliciesTenant) (persistentGetOffloadPoliciesNamespace) (persistentGetOffloadPoliciesTopic) (persistentGetOffloadPoliciesApplied) (persistentGetOffloadPoliciesAuthoritative)
-- ^

type PersistentGetPartitionedMetadataAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "authoritative" Bool :> QueryParam "checkAllowAutoCreation" Bool :> Verb 'GET 200 '[JSON] PartitionedTopicMetadata

data PersistentGetPartitionedMetadataParameters = PersistentGetPartitionedMetadataParameters
  { -- | Specify the tenant
    persistentGetPartitionedMetadataTenant :: Text,
    -- | Specify the namespace
    persistentGetPartitionedMetadataNamespace :: Text,
    -- | Specify topic name
    persistentGetPartitionedMetadataTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentGetPartitionedMetadataAuthoritative :: Maybe Bool,
    -- | Is check configuration required to automatically create topic
    persistentGetPartitionedMetadataCheckAllowAutoCreation :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetPartitionedMetadata :: PersistentGetPartitionedMetadataParameters -> ClientM PartitionedTopicMetadata
persistentGetPartitionedMetadata PersistentGetPartitionedMetadataParameters {..} = client (Proxy :: Proxy PersistentGetPartitionedMetadataAPI) (persistentGetPartitionedMetadataTenant) (persistentGetPartitionedMetadataNamespace) (persistentGetPartitionedMetadataTopic) (persistentGetPartitionedMetadataAuthoritative) (persistentGetPartitionedMetadataCheckAllowAutoCreation)
-- ^

type PersistentGetPartitionedStatsAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitioned-stats" :> QueryParam "perPartition" Bool :> QueryParam "authoritative" Bool :> QueryParam "getPreciseBacklog" Bool :> QueryParam "subscriptionBacklogSize" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetPartitionedStatsParameters = PersistentGetPartitionedStatsParameters
  { -- | Specify the tenant
    persistentGetPartitionedStatsTenant :: Text,
    -- | Specify the namespace
    persistentGetPartitionedStatsNamespace :: Text,
    -- | Specify topic name
    persistentGetPartitionedStatsTopic :: Text,
    -- | Get per partition stats
    persistentGetPartitionedStatsPerPartition :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetPartitionedStatsAuthoritative :: Maybe Bool,
    -- | If return precise backlog or imprecise backlog
    persistentGetPartitionedStatsGetPreciseBacklog :: Maybe Bool,
    -- | If return backlog size for each subscription, require locking on ledger so be careful not to use when there's heavy traffic.
    persistentGetPartitionedStatsSubscriptionBacklogSize :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetPartitionedStats :: PersistentGetPartitionedStatsParameters -> ClientM NoContent
persistentGetPartitionedStats PersistentGetPartitionedStatsParameters {..} = client (Proxy :: Proxy PersistentGetPartitionedStatsAPI) (persistentGetPartitionedStatsTenant) (persistentGetPartitionedStatsNamespace) (persistentGetPartitionedStatsTopic) (persistentGetPartitionedStatsPerPartition) (persistentGetPartitionedStatsAuthoritative) (persistentGetPartitionedStatsGetPreciseBacklog) (persistentGetPartitionedStatsSubscriptionBacklogSize)
-- ^

type PersistentGetPartitionedTopicListAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> "partitioned" :> Verb 'GET 200 '[JSON] [Text]

data PersistentGetPartitionedTopicListParameters = PersistentGetPartitionedTopicListParameters
  { -- | Specify the tenant
    persistentGetPartitionedTopicListTenant :: Text,
    -- | Specify the namespace
    persistentGetPartitionedTopicListNamespace :: Text
  }
  deriving (Show, Eq, Generic)

persistentGetPartitionedTopicList :: PersistentGetPartitionedTopicListParameters -> ClientM [Text]
persistentGetPartitionedTopicList PersistentGetPartitionedTopicListParameters {..} = client (Proxy :: Proxy PersistentGetPartitionedTopicListAPI) (persistentGetPartitionedTopicListTenant) (persistentGetPartitionedTopicListNamespace)
-- ^ Retrieve the effective permissions for a topic. These permissions are defined by the permissions set at thenamespace level combined (union) with any eventual specific permission set on the topic.

type PersistentGetPermissionsOnTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "permissions" :> Verb 'GET 200 '[JSON] ((Map.Map String [Text]))

data PersistentGetPermissionsOnTopicParameters = PersistentGetPermissionsOnTopicParameters
  { -- | Specify the tenant
    persistentGetPermissionsOnTopicTenant :: Text,
    -- | Specify the namespace
    persistentGetPermissionsOnTopicNamespace :: Text,
    -- | Specify topic name
    persistentGetPermissionsOnTopicTopic :: Text
  }
  deriving (Show, Eq, Generic)

persistentGetPermissionsOnTopic :: PersistentGetPermissionsOnTopicParameters -> ClientM (Map.Map String [Text])
persistentGetPermissionsOnTopic PersistentGetPermissionsOnTopicParameters {..} = client (Proxy :: Proxy PersistentGetPermissionsOnTopicAPI) (persistentGetPermissionsOnTopicTenant) (persistentGetPermissionsOnTopicNamespace) (persistentGetPermissionsOnTopicTopic)
-- ^

type PersistentGetPersistenceAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "persistence" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetPersistenceParameters = PersistentGetPersistenceParameters
  { -- |
    persistentGetPersistenceTenant :: Text,
    -- |
    persistentGetPersistenceNamespace :: Text,
    -- |
    persistentGetPersistenceTopic :: Text,
    -- |
    persistentGetPersistenceApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetPersistenceAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetPersistence :: PersistentGetPersistenceParameters -> ClientM NoContent
persistentGetPersistence PersistentGetPersistenceParameters {..} = client (Proxy :: Proxy PersistentGetPersistenceAPI) (persistentGetPersistenceTenant) (persistentGetPersistenceNamespace) (persistentGetPersistenceTopic) (persistentGetPersistenceApplied) (persistentGetPersistenceAuthoritative)
-- ^

type PersistentGetPublishRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "publishRate" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetPublishRateParameters = PersistentGetPublishRateParameters
  { -- |
    persistentGetPublishRateTenant :: Text,
    -- |
    persistentGetPublishRateNamespace :: Text,
    -- |
    persistentGetPublishRateTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentGetPublishRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetPublishRate :: PersistentGetPublishRateParameters -> ClientM NoContent
persistentGetPublishRate PersistentGetPublishRateParameters {..} = client (Proxy :: Proxy PersistentGetPublishRateAPI) (persistentGetPublishRateTenant) (persistentGetPublishRateNamespace) (persistentGetPublishRateTopic) (persistentGetPublishRateAuthoritative)
-- ^

type PersistentGetReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "replicatorDispatchRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetReplicatorDispatchRateParameters = PersistentGetReplicatorDispatchRateParameters
  { -- |
    persistentGetReplicatorDispatchRateTenant :: Text,
    -- |
    persistentGetReplicatorDispatchRateNamespace :: Text,
    -- |
    persistentGetReplicatorDispatchRateTopic :: Text,
    -- |
    persistentGetReplicatorDispatchRateApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetReplicatorDispatchRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetReplicatorDispatchRate :: PersistentGetReplicatorDispatchRateParameters -> ClientM NoContent
persistentGetReplicatorDispatchRate PersistentGetReplicatorDispatchRateParameters {..} = client (Proxy :: Proxy PersistentGetReplicatorDispatchRateAPI) (persistentGetReplicatorDispatchRateTenant) (persistentGetReplicatorDispatchRateNamespace) (persistentGetReplicatorDispatchRateTopic) (persistentGetReplicatorDispatchRateApplied) (persistentGetReplicatorDispatchRateAuthoritative)
-- ^

type PersistentGetRetentionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "retention" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetRetentionParameters = PersistentGetRetentionParameters
  { -- |
    persistentGetRetentionTenant :: Text,
    -- |
    persistentGetRetentionNamespace :: Text,
    -- |
    persistentGetRetentionTopic :: Text,
    -- |
    persistentGetRetentionApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetRetentionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetRetention :: PersistentGetRetentionParameters -> ClientM NoContent
persistentGetRetention PersistentGetRetentionParameters {..} = client (Proxy :: Proxy PersistentGetRetentionAPI) (persistentGetRetentionTenant) (persistentGetRetentionNamespace) (persistentGetRetentionTopic) (persistentGetRetentionApplied) (persistentGetRetentionAuthoritative)
-- ^

type PersistentGetStatsAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "stats" :> QueryParam "authoritative" Bool :> QueryParam "getPreciseBacklog" Bool :> QueryParam "subscriptionBacklogSize" Bool :> Verb 'GET 200 '[JSON] TopicStats

data PersistentGetStatsParameters = PersistentGetStatsParameters
  { -- | Specify the tenant
    persistentGetStatsTenant :: Text,
    -- | Specify the namespace
    persistentGetStatsNamespace :: Text,
    -- | Specify topic name
    persistentGetStatsTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentGetStatsAuthoritative :: Maybe Bool,
    -- | If return precise backlog or imprecise backlog
    persistentGetStatsGetPreciseBacklog :: Maybe Bool,
    -- | If return backlog size for each subscription, require locking on ledger so be careful not to use when there's heavy traffic.
    persistentGetStatsSubscriptionBacklogSize :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetStats :: PersistentGetStatsParameters -> ClientM TopicStats
persistentGetStats PersistentGetStatsParameters {..} = client (Proxy :: Proxy PersistentGetStatsAPI) (persistentGetStatsTenant) (persistentGetStatsNamespace) (persistentGetStatsTopic) (persistentGetStatsAuthoritative) (persistentGetStatsGetPreciseBacklog) (persistentGetStatsSubscriptionBacklogSize)
-- ^

type PersistentGetSubscribeRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscribeRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetSubscribeRateParameters = PersistentGetSubscribeRateParameters
  { -- |
    persistentGetSubscribeRateTenant :: Text,
    -- |
    persistentGetSubscribeRateNamespace :: Text,
    -- |
    persistentGetSubscribeRateTopic :: Text,
    -- |
    persistentGetSubscribeRateApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetSubscribeRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetSubscribeRate :: PersistentGetSubscribeRateParameters -> ClientM NoContent
persistentGetSubscribeRate PersistentGetSubscribeRateParameters {..} = client (Proxy :: Proxy PersistentGetSubscribeRateAPI) (persistentGetSubscribeRateTenant) (persistentGetSubscribeRateNamespace) (persistentGetSubscribeRateTopic) (persistentGetSubscribeRateApplied) (persistentGetSubscribeRateAuthoritative)
-- ^

type PersistentGetSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionDispatchRate" :> QueryParam "applied" Bool :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetSubscriptionDispatchRateParameters = PersistentGetSubscriptionDispatchRateParameters
  { -- |
    persistentGetSubscriptionDispatchRateTenant :: Text,
    -- |
    persistentGetSubscriptionDispatchRateNamespace :: Text,
    -- |
    persistentGetSubscriptionDispatchRateTopic :: Text,
    -- |
    persistentGetSubscriptionDispatchRateApplied :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentGetSubscriptionDispatchRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetSubscriptionDispatchRate :: PersistentGetSubscriptionDispatchRateParameters -> ClientM NoContent
persistentGetSubscriptionDispatchRate PersistentGetSubscriptionDispatchRateParameters {..} = client (Proxy :: Proxy PersistentGetSubscriptionDispatchRateAPI) (persistentGetSubscriptionDispatchRateTenant) (persistentGetSubscriptionDispatchRateNamespace) (persistentGetSubscriptionDispatchRateTopic) (persistentGetSubscriptionDispatchRateApplied) (persistentGetSubscriptionDispatchRateAuthoritative)
-- ^

type PersistentGetSubscriptionTypesEnabledAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionTypesEnabled" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetSubscriptionTypesEnabledParameters = PersistentGetSubscriptionTypesEnabledParameters
  { -- |
    persistentGetSubscriptionTypesEnabledTenant :: Text,
    -- |
    persistentGetSubscriptionTypesEnabledNamespace :: Text,
    -- |
    persistentGetSubscriptionTypesEnabledTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentGetSubscriptionTypesEnabledAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetSubscriptionTypesEnabled :: PersistentGetSubscriptionTypesEnabledParameters -> ClientM NoContent
persistentGetSubscriptionTypesEnabled PersistentGetSubscriptionTypesEnabledParameters {..} = client (Proxy :: Proxy PersistentGetSubscriptionTypesEnabledAPI) (persistentGetSubscriptionTypesEnabledTenant) (persistentGetSubscriptionTypesEnabledNamespace) (persistentGetSubscriptionTypesEnabledTopic) (persistentGetSubscriptionTypesEnabledAuthoritative)
-- ^

type PersistentGetSubscriptionsAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptions" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentGetSubscriptionsParameters = PersistentGetSubscriptionsParameters
  { -- | Specify the tenant
    persistentGetSubscriptionsTenant :: Text,
    -- | Specify the namespace
    persistentGetSubscriptionsNamespace :: Text,
    -- | Specify topic name
    persistentGetSubscriptionsTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentGetSubscriptionsAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentGetSubscriptions :: PersistentGetSubscriptionsParameters -> ClientM NoContent
persistentGetSubscriptions PersistentGetSubscriptionsParameters {..} = client (Proxy :: Proxy PersistentGetSubscriptionsAPI) (persistentGetSubscriptionsTenant) (persistentGetSubscriptionsNamespace) (persistentGetSubscriptionsTopic) (persistentGetSubscriptionsAuthoritative)
-- ^

type PersistentGrantPermissionsOnTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "permissions" :> Capture "role" Text :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

data PersistentGrantPermissionsOnTopicParameters = PersistentGrantPermissionsOnTopicParameters
  { -- | Specify the tenant
    persistentGrantPermissionsOnTopicTenant :: Text,
    -- | Specify the namespace
    persistentGrantPermissionsOnTopicNamespace :: Text,
    -- | Specify topic name
    persistentGrantPermissionsOnTopicTopic :: Text,
    -- | Client role to which grant permissions
    persistentGrantPermissionsOnTopicRole :: Text,
    -- | Actions to be granted (produce,functions,consume)
    persistentGrantPermissionsOnTopicBody :: [Text]
  }
  deriving (Show, Eq, Generic)

persistentGrantPermissionsOnTopic :: PersistentGrantPermissionsOnTopicParameters -> ClientM NoContent
persistentGrantPermissionsOnTopic PersistentGrantPermissionsOnTopicParameters {..} = client (Proxy :: Proxy PersistentGrantPermissionsOnTopicAPI) (persistentGrantPermissionsOnTopicTenant) (persistentGrantPermissionsOnTopicNamespace) (persistentGrantPermissionsOnTopicTopic) (persistentGrantPermissionsOnTopicRole) persistentGrantPermissionsOnTopicBody
-- ^

type PersistentOffloadStatusAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offload" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] OffloadProcessStatus

data PersistentOffloadStatusParameters = PersistentOffloadStatusParameters
  { -- | Specify the tenant
    persistentOffloadStatusTenant :: Text,
    -- | Specify the namespace
    persistentOffloadStatusNamespace :: Text,
    -- | Specify topic name
    persistentOffloadStatusTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentOffloadStatusAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentOffloadStatus :: PersistentOffloadStatusParameters -> ClientM OffloadProcessStatus
persistentOffloadStatus PersistentOffloadStatusParameters {..} = client (Proxy :: Proxy PersistentOffloadStatusAPI) (persistentOffloadStatusTenant) (persistentOffloadStatusNamespace) (persistentOffloadStatusTopic) (persistentOffloadStatusAuthoritative)
-- ^

type PersistentPeekNthMessageAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "position" :> Capture "messagePosition" Int :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] NoContent

data PersistentPeekNthMessageParameters = PersistentPeekNthMessageParameters
  { -- | Specify the tenant
    persistentPeekNthMessageTenant :: Text,
    -- | Specify the namespace
    persistentPeekNthMessageNamespace :: Text,
    -- | Specify topic name
    persistentPeekNthMessageTopic :: Text,
    -- | Subscribed message expired
    persistentPeekNthMessageSubName :: Text,
    -- | The number of messages (default 1)
    persistentPeekNthMessageMessagePosition :: Int,
    -- | Is authentication required to perform this operation
    persistentPeekNthMessageAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentPeekNthMessage :: PersistentPeekNthMessageParameters -> ClientM NoContent
persistentPeekNthMessage PersistentPeekNthMessageParameters {..} = client (Proxy :: Proxy PersistentPeekNthMessageAPI) (persistentPeekNthMessageTenant) (persistentPeekNthMessageNamespace) (persistentPeekNthMessageTopic) (persistentPeekNthMessageSubName) (persistentPeekNthMessageMessagePosition) (persistentPeekNthMessageAuthoritative)
-- ^

type PersistentRemoveBacklogQuotaAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlogQuota" :> QueryParam "backlogQuotaType" Text :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemoveBacklogQuotaParameters = PersistentRemoveBacklogQuotaParameters
  { -- |
    persistentRemoveBacklogQuotaTenant :: Text,
    -- |
    persistentRemoveBacklogQuotaNamespace :: Text,
    -- |
    persistentRemoveBacklogQuotaTopic :: Text,
    -- |
    persistentRemoveBacklogQuotaBacklogQuotaType :: Maybe Text,
    -- | Is authentication required to perform this operation
    persistentRemoveBacklogQuotaAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemoveBacklogQuota :: PersistentRemoveBacklogQuotaParameters -> ClientM NoContent
persistentRemoveBacklogQuota PersistentRemoveBacklogQuotaParameters {..} = client (Proxy :: Proxy PersistentRemoveBacklogQuotaAPI) (persistentRemoveBacklogQuotaTenant) (persistentRemoveBacklogQuotaNamespace) (persistentRemoveBacklogQuotaTopic) (persistentRemoveBacklogQuotaBacklogQuotaType) (persistentRemoveBacklogQuotaAuthoritative)
-- ^

type PersistentRemoveCompactionThresholdAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compactionThreshold" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemoveCompactionThresholdParameters = PersistentRemoveCompactionThresholdParameters
  { -- |
    persistentRemoveCompactionThresholdTenant :: Text,
    -- |
    persistentRemoveCompactionThresholdNamespace :: Text,
    -- |
    persistentRemoveCompactionThresholdTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentRemoveCompactionThresholdAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemoveCompactionThreshold :: PersistentRemoveCompactionThresholdParameters -> ClientM NoContent
persistentRemoveCompactionThreshold PersistentRemoveCompactionThresholdParameters {..} = client (Proxy :: Proxy PersistentRemoveCompactionThresholdAPI) (persistentRemoveCompactionThresholdTenant) (persistentRemoveCompactionThresholdNamespace) (persistentRemoveCompactionThresholdTopic) (persistentRemoveCompactionThresholdAuthoritative)
-- ^

type PersistentRemoveDeduplicationAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationEnabled" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemoveDeduplicationParameters = PersistentRemoveDeduplicationParameters
  { -- |
    persistentRemoveDeduplicationTenant :: Text,
    -- |
    persistentRemoveDeduplicationNamespace :: Text,
    -- |
    persistentRemoveDeduplicationTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentRemoveDeduplicationAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemoveDeduplication :: PersistentRemoveDeduplicationParameters -> ClientM NoContent
persistentRemoveDeduplication PersistentRemoveDeduplicationParameters {..} = client (Proxy :: Proxy PersistentRemoveDeduplicationAPI) (persistentRemoveDeduplicationTenant) (persistentRemoveDeduplicationNamespace) (persistentRemoveDeduplicationTopic) (persistentRemoveDeduplicationAuthoritative)
-- ^

type PersistentRemoveDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "dispatchRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemoveDispatchRateParameters = PersistentRemoveDispatchRateParameters
  { -- |
    persistentRemoveDispatchRateTenant :: Text,
    -- |
    persistentRemoveDispatchRateNamespace :: Text,
    -- |
    persistentRemoveDispatchRateTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentRemoveDispatchRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemoveDispatchRate :: PersistentRemoveDispatchRateParameters -> ClientM NoContent
persistentRemoveDispatchRate PersistentRemoveDispatchRateParameters {..} = client (Proxy :: Proxy PersistentRemoveDispatchRateAPI) (persistentRemoveDispatchRateTenant) (persistentRemoveDispatchRateNamespace) (persistentRemoveDispatchRateTopic) (persistentRemoveDispatchRateAuthoritative)
-- ^

type PersistentRemoveMaxConsumersAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumers" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemoveMaxConsumersParameters = PersistentRemoveMaxConsumersParameters
  { -- |
    persistentRemoveMaxConsumersTenant :: Text,
    -- |
    persistentRemoveMaxConsumersNamespace :: Text,
    -- |
    persistentRemoveMaxConsumersTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentRemoveMaxConsumersAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemoveMaxConsumers :: PersistentRemoveMaxConsumersParameters -> ClientM NoContent
persistentRemoveMaxConsumers PersistentRemoveMaxConsumersParameters {..} = client (Proxy :: Proxy PersistentRemoveMaxConsumersAPI) (persistentRemoveMaxConsumersTenant) (persistentRemoveMaxConsumersNamespace) (persistentRemoveMaxConsumersTopic) (persistentRemoveMaxConsumersAuthoritative)
-- ^

type PersistentRemoveMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumersPerSubscription" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemoveMaxConsumersPerSubscriptionParameters = PersistentRemoveMaxConsumersPerSubscriptionParameters
  { -- |
    persistentRemoveMaxConsumersPerSubscriptionTenant :: Text,
    -- |
    persistentRemoveMaxConsumersPerSubscriptionNamespace :: Text,
    -- |
    persistentRemoveMaxConsumersPerSubscriptionTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentRemoveMaxConsumersPerSubscriptionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemoveMaxConsumersPerSubscription :: PersistentRemoveMaxConsumersPerSubscriptionParameters -> ClientM NoContent
persistentRemoveMaxConsumersPerSubscription PersistentRemoveMaxConsumersPerSubscriptionParameters {..} = client (Proxy :: Proxy PersistentRemoveMaxConsumersPerSubscriptionAPI) (persistentRemoveMaxConsumersPerSubscriptionTenant) (persistentRemoveMaxConsumersPerSubscriptionNamespace) (persistentRemoveMaxConsumersPerSubscriptionTopic) (persistentRemoveMaxConsumersPerSubscriptionAuthoritative)
-- ^

type PersistentRemoveMaxMessageSizeAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxMessageSize" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemoveMaxMessageSizeParameters = PersistentRemoveMaxMessageSizeParameters
  { -- |
    persistentRemoveMaxMessageSizeTenant :: Text,
    -- |
    persistentRemoveMaxMessageSizeNamespace :: Text,
    -- |
    persistentRemoveMaxMessageSizeTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentRemoveMaxMessageSizeAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemoveMaxMessageSize :: PersistentRemoveMaxMessageSizeParameters -> ClientM NoContent
persistentRemoveMaxMessageSize PersistentRemoveMaxMessageSizeParameters {..} = client (Proxy :: Proxy PersistentRemoveMaxMessageSizeAPI) (persistentRemoveMaxMessageSizeTenant) (persistentRemoveMaxMessageSizeNamespace) (persistentRemoveMaxMessageSizeTopic) (persistentRemoveMaxMessageSizeAuthoritative)
-- ^

type PersistentRemoveMaxProducersAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxProducers" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemoveMaxProducersParameters = PersistentRemoveMaxProducersParameters
  { -- |
    persistentRemoveMaxProducersTenant :: Text,
    -- |
    persistentRemoveMaxProducersNamespace :: Text,
    -- |
    persistentRemoveMaxProducersTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentRemoveMaxProducersAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemoveMaxProducers :: PersistentRemoveMaxProducersParameters -> ClientM NoContent
persistentRemoveMaxProducers PersistentRemoveMaxProducersParameters {..} = client (Proxy :: Proxy PersistentRemoveMaxProducersAPI) (persistentRemoveMaxProducersTenant) (persistentRemoveMaxProducersNamespace) (persistentRemoveMaxProducersTopic) (persistentRemoveMaxProducersAuthoritative)
-- ^

type PersistentRemoveMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxSubscriptionsPerTopic" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemoveMaxSubscriptionsPerTopicParameters = PersistentRemoveMaxSubscriptionsPerTopicParameters
  { -- |
    persistentRemoveMaxSubscriptionsPerTopicTenant :: Text,
    -- |
    persistentRemoveMaxSubscriptionsPerTopicNamespace :: Text,
    -- |
    persistentRemoveMaxSubscriptionsPerTopicTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentRemoveMaxSubscriptionsPerTopicAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemoveMaxSubscriptionsPerTopic :: PersistentRemoveMaxSubscriptionsPerTopicParameters -> ClientM NoContent
persistentRemoveMaxSubscriptionsPerTopic PersistentRemoveMaxSubscriptionsPerTopicParameters {..} = client (Proxy :: Proxy PersistentRemoveMaxSubscriptionsPerTopicAPI) (persistentRemoveMaxSubscriptionsPerTopicTenant) (persistentRemoveMaxSubscriptionsPerTopicNamespace) (persistentRemoveMaxSubscriptionsPerTopicTopic) (persistentRemoveMaxSubscriptionsPerTopicAuthoritative)
-- ^

type PersistentRemoveMessageTTLAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageTTL" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemoveMessageTTLParameters = PersistentRemoveMessageTTLParameters
  { -- |
    persistentRemoveMessageTTLTenant :: Text,
    -- |
    persistentRemoveMessageTTLNamespace :: Text,
    -- |
    persistentRemoveMessageTTLTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentRemoveMessageTTLAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemoveMessageTTL :: PersistentRemoveMessageTTLParameters -> ClientM NoContent
persistentRemoveMessageTTL PersistentRemoveMessageTTLParameters {..} = client (Proxy :: Proxy PersistentRemoveMessageTTLAPI) (persistentRemoveMessageTTLTenant) (persistentRemoveMessageTTLNamespace) (persistentRemoveMessageTTLTopic) (persistentRemoveMessageTTLAuthoritative)
-- ^

type PersistentRemoveOffloadPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offloadPolicies" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemoveOffloadPoliciesParameters = PersistentRemoveOffloadPoliciesParameters
  { -- |
    persistentRemoveOffloadPoliciesTenant :: Text,
    -- |
    persistentRemoveOffloadPoliciesNamespace :: Text,
    -- |
    persistentRemoveOffloadPoliciesTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentRemoveOffloadPoliciesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemoveOffloadPolicies :: PersistentRemoveOffloadPoliciesParameters -> ClientM NoContent
persistentRemoveOffloadPolicies PersistentRemoveOffloadPoliciesParameters {..} = client (Proxy :: Proxy PersistentRemoveOffloadPoliciesAPI) (persistentRemoveOffloadPoliciesTenant) (persistentRemoveOffloadPoliciesNamespace) (persistentRemoveOffloadPoliciesTopic) (persistentRemoveOffloadPoliciesAuthoritative)
-- ^

type PersistentRemovePersistenceAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "persistence" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemovePersistenceParameters = PersistentRemovePersistenceParameters
  { -- |
    persistentRemovePersistenceTenant :: Text,
    -- |
    persistentRemovePersistenceNamespace :: Text,
    -- |
    persistentRemovePersistenceTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentRemovePersistenceAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemovePersistence :: PersistentRemovePersistenceParameters -> ClientM NoContent
persistentRemovePersistence PersistentRemovePersistenceParameters {..} = client (Proxy :: Proxy PersistentRemovePersistenceAPI) (persistentRemovePersistenceTenant) (persistentRemovePersistenceNamespace) (persistentRemovePersistenceTopic) (persistentRemovePersistenceAuthoritative)
-- ^

type PersistentRemovePublishRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "publishRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemovePublishRateParameters = PersistentRemovePublishRateParameters
  { -- |
    persistentRemovePublishRateTenant :: Text,
    -- |
    persistentRemovePublishRateNamespace :: Text,
    -- |
    persistentRemovePublishRateTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentRemovePublishRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemovePublishRate :: PersistentRemovePublishRateParameters -> ClientM NoContent
persistentRemovePublishRate PersistentRemovePublishRateParameters {..} = client (Proxy :: Proxy PersistentRemovePublishRateAPI) (persistentRemovePublishRateTenant) (persistentRemovePublishRateNamespace) (persistentRemovePublishRateTopic) (persistentRemovePublishRateAuthoritative)
-- ^

type PersistentRemoveReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "replicatorDispatchRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemoveReplicatorDispatchRateParameters = PersistentRemoveReplicatorDispatchRateParameters
  { -- |
    persistentRemoveReplicatorDispatchRateTenant :: Text,
    -- |
    persistentRemoveReplicatorDispatchRateNamespace :: Text,
    -- |
    persistentRemoveReplicatorDispatchRateTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentRemoveReplicatorDispatchRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemoveReplicatorDispatchRate :: PersistentRemoveReplicatorDispatchRateParameters -> ClientM NoContent
persistentRemoveReplicatorDispatchRate PersistentRemoveReplicatorDispatchRateParameters {..} = client (Proxy :: Proxy PersistentRemoveReplicatorDispatchRateAPI) (persistentRemoveReplicatorDispatchRateTenant) (persistentRemoveReplicatorDispatchRateNamespace) (persistentRemoveReplicatorDispatchRateTopic) (persistentRemoveReplicatorDispatchRateAuthoritative)
-- ^

type PersistentRemoveRetentionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "retention" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemoveRetentionParameters = PersistentRemoveRetentionParameters
  { -- |
    persistentRemoveRetentionTenant :: Text,
    -- |
    persistentRemoveRetentionNamespace :: Text,
    -- |
    persistentRemoveRetentionTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentRemoveRetentionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemoveRetention :: PersistentRemoveRetentionParameters -> ClientM NoContent
persistentRemoveRetention PersistentRemoveRetentionParameters {..} = client (Proxy :: Proxy PersistentRemoveRetentionAPI) (persistentRemoveRetentionTenant) (persistentRemoveRetentionNamespace) (persistentRemoveRetentionTopic) (persistentRemoveRetentionAuthoritative)
-- ^

type PersistentRemoveSubscribeRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscribeRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] SubscribeRate :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemoveSubscribeRateParameters = PersistentRemoveSubscribeRateParameters
  { -- |
    persistentRemoveSubscribeRateTenant :: Text,
    -- |
    persistentRemoveSubscribeRateNamespace :: Text,
    -- |
    persistentRemoveSubscribeRateTopic :: Text,
    -- |
    persistentRemoveSubscribeRateAuthoritative :: Maybe Bool,
    -- | Subscribe rate for the specified topic
    persistentRemoveSubscribeRateBody :: SubscribeRate
  }
  deriving (Show, Eq, Generic)

persistentRemoveSubscribeRate :: PersistentRemoveSubscribeRateParameters -> ClientM NoContent
persistentRemoveSubscribeRate PersistentRemoveSubscribeRateParameters {..} = client (Proxy :: Proxy PersistentRemoveSubscribeRateAPI) (persistentRemoveSubscribeRateTenant) (persistentRemoveSubscribeRateNamespace) (persistentRemoveSubscribeRateTopic) (persistentRemoveSubscribeRateAuthoritative) persistentRemoveSubscribeRateBody
-- ^

type PersistentRemoveSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionDispatchRate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRemoveSubscriptionDispatchRateParameters = PersistentRemoveSubscriptionDispatchRateParameters
  { -- |
    persistentRemoveSubscriptionDispatchRateTenant :: Text,
    -- |
    persistentRemoveSubscriptionDispatchRateNamespace :: Text,
    -- |
    persistentRemoveSubscriptionDispatchRateTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentRemoveSubscriptionDispatchRateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentRemoveSubscriptionDispatchRate :: PersistentRemoveSubscriptionDispatchRateParameters -> ClientM NoContent
persistentRemoveSubscriptionDispatchRate PersistentRemoveSubscriptionDispatchRateParameters {..} = client (Proxy :: Proxy PersistentRemoveSubscriptionDispatchRateAPI) (persistentRemoveSubscriptionDispatchRateTenant) (persistentRemoveSubscriptionDispatchRateNamespace) (persistentRemoveSubscriptionDispatchRateTopic) (persistentRemoveSubscriptionDispatchRateAuthoritative)
-- ^ It fence cursor and disconnects all active consumers before reseting cursor.

type PersistentResetCursorAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "resetcursor" :> Capture "timestamp" Integer :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data PersistentResetCursorParameters = PersistentResetCursorParameters
  { -- | Specify the tenant
    persistentResetCursorTenant :: Text,
    -- | Specify the namespace
    persistentResetCursorNamespace :: Text,
    -- | Specify topic name
    persistentResetCursorTopic :: Text,
    -- | Subscription to reset position on
    persistentResetCursorSubName :: Text,
    -- | the timestamp to reset back
    persistentResetCursorTimestamp :: Integer,
    -- | Is authentication required to perform this operation
    persistentResetCursorAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentResetCursor :: PersistentResetCursorParameters -> ClientM NoContent
persistentResetCursor PersistentResetCursorParameters {..} = client (Proxy :: Proxy PersistentResetCursorAPI) (persistentResetCursorTenant) (persistentResetCursorNamespace) (persistentResetCursorTopic) (persistentResetCursorSubName) (persistentResetCursorTimestamp) (persistentResetCursorAuthoritative)
-- ^ It fence cursor and disconnects all active consumers before reseting cursor.

type PersistentResetCursorOnPositionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "resetcursor" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] ResetCursorData :> Verb 'POST 200 '[JSON] NoContent

data PersistentResetCursorOnPositionParameters = PersistentResetCursorOnPositionParameters
  { -- | Specify the tenant
    persistentResetCursorOnPositionTenant :: Text,
    -- | Specify the namespace
    persistentResetCursorOnPositionNamespace :: Text,
    -- | Specify topic name
    persistentResetCursorOnPositionTopic :: Text,
    -- | Subscription to reset position on
    persistentResetCursorOnPositionSubName :: Text,
    -- | Is authentication required to perform this operation
    persistentResetCursorOnPositionAuthoritative :: Maybe Bool,
    -- | messageId to reset back to (ledgerId:entryId)
    persistentResetCursorOnPositionMessageId :: ResetCursorData
  }
  deriving (Show, Eq, Generic)

persistentResetCursorOnPosition :: PersistentResetCursorOnPositionParameters -> ClientM NoContent
persistentResetCursorOnPosition PersistentResetCursorOnPositionParameters {..} = client (Proxy :: Proxy PersistentResetCursorOnPositionAPI) (persistentResetCursorOnPositionTenant) (persistentResetCursorOnPositionNamespace) (persistentResetCursorOnPositionTopic) (persistentResetCursorOnPositionSubName) (persistentResetCursorOnPositionAuthoritative) persistentResetCursorOnPositionMessageId
-- ^ Revoke permissions to a role on a single topic. If the permission was not set at the topiclevel, but rather at the namespace level, this operation will return an error (HTTP status code 412).

type PersistentRevokePermissionsOnTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "permissions" :> Capture "role" Text :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentRevokePermissionsOnTopicParameters = PersistentRevokePermissionsOnTopicParameters
  { -- | Specify the tenant
    persistentRevokePermissionsOnTopicTenant :: Text,
    -- | Specify the namespace
    persistentRevokePermissionsOnTopicNamespace :: Text,
    -- | Specify topic name
    persistentRevokePermissionsOnTopicTopic :: Text,
    -- | Client role to which grant permissions
    persistentRevokePermissionsOnTopicRole :: Text
  }
  deriving (Show, Eq, Generic)

persistentRevokePermissionsOnTopic :: PersistentRevokePermissionsOnTopicParameters -> ClientM NoContent
persistentRevokePermissionsOnTopic PersistentRevokePermissionsOnTopicParameters {..} = client (Proxy :: Proxy PersistentRevokePermissionsOnTopicAPI) (persistentRevokePermissionsOnTopicTenant) (persistentRevokePermissionsOnTopicNamespace) (persistentRevokePermissionsOnTopicTopic) (persistentRevokePermissionsOnTopicRole)
-- ^

type PersistentSetBacklogQuotaAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "backlogQuota" :> QueryParam "authoritative" Bool :> QueryParam "backlogQuotaType" Text :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetBacklogQuotaParameters = PersistentSetBacklogQuotaParameters
  { -- |
    persistentSetBacklogQuotaTenant :: Text,
    -- |
    persistentSetBacklogQuotaNamespace :: Text,
    -- |
    persistentSetBacklogQuotaTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetBacklogQuotaAuthoritative :: Maybe Bool,
    -- |
    persistentSetBacklogQuotaBacklogQuotaType :: Maybe Text
  }
  deriving (Show, Eq, Generic)

persistentSetBacklogQuota :: PersistentSetBacklogQuotaParameters -> ClientM NoContent
persistentSetBacklogQuota PersistentSetBacklogQuotaParameters {..} = client (Proxy :: Proxy PersistentSetBacklogQuotaAPI) (persistentSetBacklogQuotaTenant) (persistentSetBacklogQuotaNamespace) (persistentSetBacklogQuotaTopic) (persistentSetBacklogQuotaAuthoritative) (persistentSetBacklogQuotaBacklogQuotaType)
-- ^

type PersistentSetCompactionThresholdAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compactionThreshold" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Integer :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetCompactionThresholdParameters = PersistentSetCompactionThresholdParameters
  { -- |
    persistentSetCompactionThresholdTenant :: Text,
    -- |
    persistentSetCompactionThresholdNamespace :: Text,
    -- |
    persistentSetCompactionThresholdTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetCompactionThresholdAuthoritative :: Maybe Bool,
    -- | Dispatch rate for the specified topic
    persistentSetCompactionThresholdBody :: Integer
  }
  deriving (Show, Eq, Generic)

persistentSetCompactionThreshold :: PersistentSetCompactionThresholdParameters -> ClientM NoContent
persistentSetCompactionThreshold PersistentSetCompactionThresholdParameters {..} = client (Proxy :: Proxy PersistentSetCompactionThresholdAPI) (persistentSetCompactionThresholdTenant) (persistentSetCompactionThresholdNamespace) (persistentSetCompactionThresholdTopic) (persistentSetCompactionThresholdAuthoritative) persistentSetCompactionThresholdBody
-- ^

type PersistentSetDeduplicationAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationEnabled" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetDeduplicationParameters = PersistentSetDeduplicationParameters
  { -- |
    persistentSetDeduplicationTenant :: Text,
    -- |
    persistentSetDeduplicationNamespace :: Text,
    -- |
    persistentSetDeduplicationTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetDeduplicationAuthoritative :: Maybe Bool,
    -- | DeduplicationEnabled policies for the specified topic
    persistentSetDeduplicationBody :: Bool
  }
  deriving (Show, Eq, Generic)

persistentSetDeduplication :: PersistentSetDeduplicationParameters -> ClientM NoContent
persistentSetDeduplication PersistentSetDeduplicationParameters {..} = client (Proxy :: Proxy PersistentSetDeduplicationAPI) (persistentSetDeduplicationTenant) (persistentSetDeduplicationNamespace) (persistentSetDeduplicationTopic) (persistentSetDeduplicationAuthoritative) persistentSetDeduplicationBody
-- ^

type PersistentSetDeduplicationSnapshotIntervalAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "deduplicationSnapshotInterval" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetDeduplicationSnapshotIntervalParameters = PersistentSetDeduplicationSnapshotIntervalParameters
  { -- |
    persistentSetDeduplicationSnapshotIntervalTenant :: Text,
    -- |
    persistentSetDeduplicationSnapshotIntervalNamespace :: Text,
    -- |
    persistentSetDeduplicationSnapshotIntervalTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetDeduplicationSnapshotIntervalAuthoritative :: Maybe Bool,
    -- | Interval to take deduplication snapshot for the specified topic
    persistentSetDeduplicationSnapshotIntervalBody :: Int
  }
  deriving (Show, Eq, Generic)

persistentSetDeduplicationSnapshotInterval :: PersistentSetDeduplicationSnapshotIntervalParameters -> ClientM NoContent
persistentSetDeduplicationSnapshotInterval PersistentSetDeduplicationSnapshotIntervalParameters {..} = client (Proxy :: Proxy PersistentSetDeduplicationSnapshotIntervalAPI) (persistentSetDeduplicationSnapshotIntervalTenant) (persistentSetDeduplicationSnapshotIntervalNamespace) (persistentSetDeduplicationSnapshotIntervalTopic) (persistentSetDeduplicationSnapshotIntervalAuthoritative) persistentSetDeduplicationSnapshotIntervalBody
-- ^

type PersistentSetDelayedDeliveryPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "delayedDelivery" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DelayedDeliveryPolicies :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetDelayedDeliveryPoliciesParameters = PersistentSetDelayedDeliveryPoliciesParameters
  { -- |
    persistentSetDelayedDeliveryPoliciesTenant :: Text,
    -- |
    persistentSetDelayedDeliveryPoliciesNamespace :: Text,
    -- |
    persistentSetDelayedDeliveryPoliciesTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetDelayedDeliveryPoliciesAuthoritative :: Maybe Bool,
    -- | Delayed delivery policies for the specified topic
    persistentSetDelayedDeliveryPoliciesBody :: DelayedDeliveryPolicies
  }
  deriving (Show, Eq, Generic)

persistentSetDelayedDeliveryPolicies :: PersistentSetDelayedDeliveryPoliciesParameters -> ClientM NoContent
persistentSetDelayedDeliveryPolicies PersistentSetDelayedDeliveryPoliciesParameters {..} = client (Proxy :: Proxy PersistentSetDelayedDeliveryPoliciesAPI) (persistentSetDelayedDeliveryPoliciesTenant) (persistentSetDelayedDeliveryPoliciesNamespace) (persistentSetDelayedDeliveryPoliciesTopic) (persistentSetDelayedDeliveryPoliciesAuthoritative) persistentSetDelayedDeliveryPoliciesBody
-- ^

type PersistentSetDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "dispatchRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetDispatchRateParameters = PersistentSetDispatchRateParameters
  { -- |
    persistentSetDispatchRateTenant :: Text,
    -- |
    persistentSetDispatchRateNamespace :: Text,
    -- |
    persistentSetDispatchRateTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetDispatchRateAuthoritative :: Maybe Bool,
    -- | Dispatch rate for the specified topic
    persistentSetDispatchRateBody :: DispatchRateImpl
  }
  deriving (Show, Eq, Generic)

persistentSetDispatchRate :: PersistentSetDispatchRateParameters -> ClientM NoContent
persistentSetDispatchRate PersistentSetDispatchRateParameters {..} = client (Proxy :: Proxy PersistentSetDispatchRateAPI) (persistentSetDispatchRateTenant) (persistentSetDispatchRateNamespace) (persistentSetDispatchRateTopic) (persistentSetDispatchRateAuthoritative) persistentSetDispatchRateBody
-- ^

type PersistentSetInactiveTopicPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "inactiveTopicPolicies" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] InactiveTopicPolicies :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetInactiveTopicPoliciesParameters = PersistentSetInactiveTopicPoliciesParameters
  { -- |
    persistentSetInactiveTopicPoliciesTenant :: Text,
    -- |
    persistentSetInactiveTopicPoliciesNamespace :: Text,
    -- |
    persistentSetInactiveTopicPoliciesTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetInactiveTopicPoliciesAuthoritative :: Maybe Bool,
    -- | inactive topic policies for the specified topic
    persistentSetInactiveTopicPoliciesBody :: InactiveTopicPolicies
  }
  deriving (Show, Eq, Generic)

persistentSetInactiveTopicPolicies :: PersistentSetInactiveTopicPoliciesParameters -> ClientM NoContent
persistentSetInactiveTopicPolicies PersistentSetInactiveTopicPoliciesParameters {..} = client (Proxy :: Proxy PersistentSetInactiveTopicPoliciesAPI) (persistentSetInactiveTopicPoliciesTenant) (persistentSetInactiveTopicPoliciesNamespace) (persistentSetInactiveTopicPoliciesTopic) (persistentSetInactiveTopicPoliciesAuthoritative) persistentSetInactiveTopicPoliciesBody
-- ^

type PersistentSetMaxConsumersAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumers" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetMaxConsumersParameters = PersistentSetMaxConsumersParameters
  { -- |
    persistentSetMaxConsumersTenant :: Text,
    -- |
    persistentSetMaxConsumersNamespace :: Text,
    -- |
    persistentSetMaxConsumersTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetMaxConsumersAuthoritative :: Maybe Bool,
    -- | The max consumers of the topic
    persistentSetMaxConsumersBody :: Int
  }
  deriving (Show, Eq, Generic)

persistentSetMaxConsumers :: PersistentSetMaxConsumersParameters -> ClientM NoContent
persistentSetMaxConsumers PersistentSetMaxConsumersParameters {..} = client (Proxy :: Proxy PersistentSetMaxConsumersAPI) (persistentSetMaxConsumersTenant) (persistentSetMaxConsumersNamespace) (persistentSetMaxConsumersTopic) (persistentSetMaxConsumersAuthoritative) persistentSetMaxConsumersBody
-- ^

type PersistentSetMaxConsumersPerSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxConsumersPerSubscription" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetMaxConsumersPerSubscriptionParameters = PersistentSetMaxConsumersPerSubscriptionParameters
  { -- |
    persistentSetMaxConsumersPerSubscriptionTenant :: Text,
    -- |
    persistentSetMaxConsumersPerSubscriptionNamespace :: Text,
    -- |
    persistentSetMaxConsumersPerSubscriptionTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetMaxConsumersPerSubscriptionAuthoritative :: Maybe Bool,
    -- | Dispatch rate for the specified topic
    persistentSetMaxConsumersPerSubscriptionBody :: Int
  }
  deriving (Show, Eq, Generic)

persistentSetMaxConsumersPerSubscription :: PersistentSetMaxConsumersPerSubscriptionParameters -> ClientM NoContent
persistentSetMaxConsumersPerSubscription PersistentSetMaxConsumersPerSubscriptionParameters {..} = client (Proxy :: Proxy PersistentSetMaxConsumersPerSubscriptionAPI) (persistentSetMaxConsumersPerSubscriptionTenant) (persistentSetMaxConsumersPerSubscriptionNamespace) (persistentSetMaxConsumersPerSubscriptionTopic) (persistentSetMaxConsumersPerSubscriptionAuthoritative) persistentSetMaxConsumersPerSubscriptionBody
-- ^

type PersistentSetMaxMessageSizeAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxMessageSize" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetMaxMessageSizeParameters = PersistentSetMaxMessageSizeParameters
  { -- |
    persistentSetMaxMessageSizeTenant :: Text,
    -- |
    persistentSetMaxMessageSizeNamespace :: Text,
    -- |
    persistentSetMaxMessageSizeTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetMaxMessageSizeAuthoritative :: Maybe Bool,
    -- | The max message size of the topic
    persistentSetMaxMessageSizeBody :: Int
  }
  deriving (Show, Eq, Generic)

persistentSetMaxMessageSize :: PersistentSetMaxMessageSizeParameters -> ClientM NoContent
persistentSetMaxMessageSize PersistentSetMaxMessageSizeParameters {..} = client (Proxy :: Proxy PersistentSetMaxMessageSizeAPI) (persistentSetMaxMessageSizeTenant) (persistentSetMaxMessageSizeNamespace) (persistentSetMaxMessageSizeTopic) (persistentSetMaxMessageSizeAuthoritative) persistentSetMaxMessageSizeBody
-- ^

type PersistentSetMaxProducersAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxProducers" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetMaxProducersParameters = PersistentSetMaxProducersParameters
  { -- |
    persistentSetMaxProducersTenant :: Text,
    -- |
    persistentSetMaxProducersNamespace :: Text,
    -- |
    persistentSetMaxProducersTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetMaxProducersAuthoritative :: Maybe Bool,
    -- | The max producers of the topic
    persistentSetMaxProducersBody :: Int
  }
  deriving (Show, Eq, Generic)

persistentSetMaxProducers :: PersistentSetMaxProducersParameters -> ClientM NoContent
persistentSetMaxProducers PersistentSetMaxProducersParameters {..} = client (Proxy :: Proxy PersistentSetMaxProducersAPI) (persistentSetMaxProducersTenant) (persistentSetMaxProducersNamespace) (persistentSetMaxProducersTopic) (persistentSetMaxProducersAuthoritative) persistentSetMaxProducersBody
-- ^

type PersistentSetMaxSubscriptionsPerTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxSubscriptionsPerTopic" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetMaxSubscriptionsPerTopicParameters = PersistentSetMaxSubscriptionsPerTopicParameters
  { -- |
    persistentSetMaxSubscriptionsPerTopicTenant :: Text,
    -- |
    persistentSetMaxSubscriptionsPerTopicNamespace :: Text,
    -- |
    persistentSetMaxSubscriptionsPerTopicTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetMaxSubscriptionsPerTopicAuthoritative :: Maybe Bool,
    -- | The max subscriptions of the topic
    persistentSetMaxSubscriptionsPerTopicBody :: Int
  }
  deriving (Show, Eq, Generic)

persistentSetMaxSubscriptionsPerTopic :: PersistentSetMaxSubscriptionsPerTopicParameters -> ClientM NoContent
persistentSetMaxSubscriptionsPerTopic PersistentSetMaxSubscriptionsPerTopicParameters {..} = client (Proxy :: Proxy PersistentSetMaxSubscriptionsPerTopicAPI) (persistentSetMaxSubscriptionsPerTopicTenant) (persistentSetMaxSubscriptionsPerTopicNamespace) (persistentSetMaxSubscriptionsPerTopicTopic) (persistentSetMaxSubscriptionsPerTopicAuthoritative) persistentSetMaxSubscriptionsPerTopicBody
-- ^

type PersistentSetMaxUnackedMessagesOnConsumerAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnConsumer" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetMaxUnackedMessagesOnConsumerParameters = PersistentSetMaxUnackedMessagesOnConsumerParameters
  { -- |
    persistentSetMaxUnackedMessagesOnConsumerTenant :: Text,
    -- |
    persistentSetMaxUnackedMessagesOnConsumerNamespace :: Text,
    -- |
    persistentSetMaxUnackedMessagesOnConsumerTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetMaxUnackedMessagesOnConsumerAuthoritative :: Maybe Bool,
    -- | Max unacked messages on consumer policies for the specified topic
    persistentSetMaxUnackedMessagesOnConsumerBody :: Int
  }
  deriving (Show, Eq, Generic)

persistentSetMaxUnackedMessagesOnConsumer :: PersistentSetMaxUnackedMessagesOnConsumerParameters -> ClientM NoContent
persistentSetMaxUnackedMessagesOnConsumer PersistentSetMaxUnackedMessagesOnConsumerParameters {..} = client (Proxy :: Proxy PersistentSetMaxUnackedMessagesOnConsumerAPI) (persistentSetMaxUnackedMessagesOnConsumerTenant) (persistentSetMaxUnackedMessagesOnConsumerNamespace) (persistentSetMaxUnackedMessagesOnConsumerTopic) (persistentSetMaxUnackedMessagesOnConsumerAuthoritative) persistentSetMaxUnackedMessagesOnConsumerBody
-- ^

type PersistentSetMaxUnackedMessagesOnSubscriptionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "maxUnackedMessagesOnSubscription" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetMaxUnackedMessagesOnSubscriptionParameters = PersistentSetMaxUnackedMessagesOnSubscriptionParameters
  { -- |
    persistentSetMaxUnackedMessagesOnSubscriptionTenant :: Text,
    -- |
    persistentSetMaxUnackedMessagesOnSubscriptionNamespace :: Text,
    -- |
    persistentSetMaxUnackedMessagesOnSubscriptionTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetMaxUnackedMessagesOnSubscriptionAuthoritative :: Maybe Bool,
    -- | Max unacked messages on subscription policies for the specified topic
    persistentSetMaxUnackedMessagesOnSubscriptionBody :: Int
  }
  deriving (Show, Eq, Generic)

persistentSetMaxUnackedMessagesOnSubscription :: PersistentSetMaxUnackedMessagesOnSubscriptionParameters -> ClientM NoContent
persistentSetMaxUnackedMessagesOnSubscription PersistentSetMaxUnackedMessagesOnSubscriptionParameters {..} = client (Proxy :: Proxy PersistentSetMaxUnackedMessagesOnSubscriptionAPI) (persistentSetMaxUnackedMessagesOnSubscriptionTenant) (persistentSetMaxUnackedMessagesOnSubscriptionNamespace) (persistentSetMaxUnackedMessagesOnSubscriptionTopic) (persistentSetMaxUnackedMessagesOnSubscriptionAuthoritative) persistentSetMaxUnackedMessagesOnSubscriptionBody
-- ^

type PersistentSetMessageTTLAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "messageTTL" :> QueryParam "messageTTL" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetMessageTTLParameters = PersistentSetMessageTTLParameters
  { -- |
    persistentSetMessageTTLTenant :: Text,
    -- |
    persistentSetMessageTTLNamespace :: Text,
    -- |
    persistentSetMessageTTLTopic :: Text,
    -- | TTL in seconds for the specified namespace
    persistentSetMessageTTLMessageTTL :: Int,
    -- | Is authentication required to perform this operation
    persistentSetMessageTTLAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentSetMessageTTL :: PersistentSetMessageTTLParameters -> ClientM NoContent
persistentSetMessageTTL PersistentSetMessageTTLParameters {..} = client (Proxy :: Proxy PersistentSetMessageTTLAPI) (persistentSetMessageTTLTenant) (persistentSetMessageTTLNamespace) (persistentSetMessageTTLTopic) (Just persistentSetMessageTTLMessageTTL) (persistentSetMessageTTLAuthoritative)
-- ^

type PersistentSetOffloadPoliciesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offloadPolicies" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] OffloadPoliciesImpl :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetOffloadPoliciesParameters = PersistentSetOffloadPoliciesParameters
  { -- |
    persistentSetOffloadPoliciesTenant :: Text,
    -- |
    persistentSetOffloadPoliciesNamespace :: Text,
    -- |
    persistentSetOffloadPoliciesTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetOffloadPoliciesAuthoritative :: Maybe Bool,
    -- | Offload policies for the specified topic
    persistentSetOffloadPoliciesBody :: OffloadPoliciesImpl
  }
  deriving (Show, Eq, Generic)

persistentSetOffloadPolicies :: PersistentSetOffloadPoliciesParameters -> ClientM NoContent
persistentSetOffloadPolicies PersistentSetOffloadPoliciesParameters {..} = client (Proxy :: Proxy PersistentSetOffloadPoliciesAPI) (persistentSetOffloadPoliciesTenant) (persistentSetOffloadPoliciesNamespace) (persistentSetOffloadPoliciesTopic) (persistentSetOffloadPoliciesAuthoritative) persistentSetOffloadPoliciesBody
-- ^

type PersistentSetPersistenceAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "persistence" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] PersistencePolicies :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetPersistenceParameters = PersistentSetPersistenceParameters
  { -- |
    persistentSetPersistenceTenant :: Text,
    -- |
    persistentSetPersistenceNamespace :: Text,
    -- |
    persistentSetPersistenceTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetPersistenceAuthoritative :: Maybe Bool,
    -- | Bookkeeper persistence policies for specified topic
    persistentSetPersistenceBody :: PersistencePolicies
  }
  deriving (Show, Eq, Generic)

persistentSetPersistence :: PersistentSetPersistenceParameters -> ClientM NoContent
persistentSetPersistence PersistentSetPersistenceParameters {..} = client (Proxy :: Proxy PersistentSetPersistenceAPI) (persistentSetPersistenceTenant) (persistentSetPersistenceNamespace) (persistentSetPersistenceTopic) (persistentSetPersistenceAuthoritative) persistentSetPersistenceBody
-- ^

type PersistentSetPublishRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "publishRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] PublishRate :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetPublishRateParameters = PersistentSetPublishRateParameters
  { -- |
    persistentSetPublishRateTenant :: Text,
    -- |
    persistentSetPublishRateNamespace :: Text,
    -- |
    persistentSetPublishRateTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetPublishRateAuthoritative :: Maybe Bool,
    -- | Dispatch rate for the specified topic
    persistentSetPublishRateBody :: PublishRate
  }
  deriving (Show, Eq, Generic)

persistentSetPublishRate :: PersistentSetPublishRateParameters -> ClientM NoContent
persistentSetPublishRate PersistentSetPublishRateParameters {..} = client (Proxy :: Proxy PersistentSetPublishRateAPI) (persistentSetPublishRateTenant) (persistentSetPublishRateNamespace) (persistentSetPublishRateTopic) (persistentSetPublishRateAuthoritative) persistentSetPublishRateBody
-- ^

type PersistentSetReplicatedSubscriptionStatusAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "replicatedSubscriptionStatus" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Bool :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetReplicatedSubscriptionStatusParameters = PersistentSetReplicatedSubscriptionStatusParameters
  { -- | Specify the tenant
    persistentSetReplicatedSubscriptionStatusTenant :: Text,
    -- | Specify the namespace
    persistentSetReplicatedSubscriptionStatusNamespace :: Text,
    -- | Specify topic name
    persistentSetReplicatedSubscriptionStatusTopic :: Text,
    -- | Name of subscription
    persistentSetReplicatedSubscriptionStatusSubName :: Text,
    -- | Whether to enable replicated subscription
    persistentSetReplicatedSubscriptionStatusBody :: Bool,
    -- | Is authentication required to perform this operation
    persistentSetReplicatedSubscriptionStatusAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentSetReplicatedSubscriptionStatus :: PersistentSetReplicatedSubscriptionStatusParameters -> ClientM NoContent
persistentSetReplicatedSubscriptionStatus PersistentSetReplicatedSubscriptionStatusParameters {..} = client (Proxy :: Proxy PersistentSetReplicatedSubscriptionStatusAPI) (persistentSetReplicatedSubscriptionStatusTenant) (persistentSetReplicatedSubscriptionStatusNamespace) (persistentSetReplicatedSubscriptionStatusTopic) (persistentSetReplicatedSubscriptionStatusSubName) (persistentSetReplicatedSubscriptionStatusAuthoritative) persistentSetReplicatedSubscriptionStatusBody
-- ^

type PersistentSetReplicatorDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "replicatorDispatchRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetReplicatorDispatchRateParameters = PersistentSetReplicatorDispatchRateParameters
  { -- |
    persistentSetReplicatorDispatchRateTenant :: Text,
    -- |
    persistentSetReplicatorDispatchRateNamespace :: Text,
    -- |
    persistentSetReplicatorDispatchRateTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetReplicatorDispatchRateAuthoritative :: Maybe Bool,
    -- | Replicator dispatch rate of the topic
    persistentSetReplicatorDispatchRateBody :: DispatchRateImpl
  }
  deriving (Show, Eq, Generic)

persistentSetReplicatorDispatchRate :: PersistentSetReplicatorDispatchRateParameters -> ClientM NoContent
persistentSetReplicatorDispatchRate PersistentSetReplicatorDispatchRateParameters {..} = client (Proxy :: Proxy PersistentSetReplicatorDispatchRateAPI) (persistentSetReplicatorDispatchRateTenant) (persistentSetReplicatorDispatchRateNamespace) (persistentSetReplicatorDispatchRateTopic) (persistentSetReplicatorDispatchRateAuthoritative) persistentSetReplicatorDispatchRateBody
-- ^

type PersistentSetRetentionAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "retention" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] RetentionPolicies :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetRetentionParameters = PersistentSetRetentionParameters
  { -- |
    persistentSetRetentionTenant :: Text,
    -- |
    persistentSetRetentionNamespace :: Text,
    -- |
    persistentSetRetentionTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetRetentionAuthoritative :: Maybe Bool,
    -- | Retention policies for the specified namespace
    persistentSetRetentionBody :: RetentionPolicies
  }
  deriving (Show, Eq, Generic)

persistentSetRetention :: PersistentSetRetentionParameters -> ClientM NoContent
persistentSetRetention PersistentSetRetentionParameters {..} = client (Proxy :: Proxy PersistentSetRetentionAPI) (persistentSetRetentionTenant) (persistentSetRetentionNamespace) (persistentSetRetentionTopic) (persistentSetRetentionAuthoritative) persistentSetRetentionBody
-- ^

type PersistentSetSubscribeRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscribeRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] SubscribeRate :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetSubscribeRateParameters = PersistentSetSubscribeRateParameters
  { -- |
    persistentSetSubscribeRateTenant :: Text,
    -- |
    persistentSetSubscribeRateNamespace :: Text,
    -- |
    persistentSetSubscribeRateTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetSubscribeRateAuthoritative :: Maybe Bool,
    -- | Subscribe rate for the specified topic
    persistentSetSubscribeRateBody :: SubscribeRate
  }
  deriving (Show, Eq, Generic)

persistentSetSubscribeRate :: PersistentSetSubscribeRateParameters -> ClientM NoContent
persistentSetSubscribeRate PersistentSetSubscribeRateParameters {..} = client (Proxy :: Proxy PersistentSetSubscribeRateAPI) (persistentSetSubscribeRateTenant) (persistentSetSubscribeRateNamespace) (persistentSetSubscribeRateTopic) (persistentSetSubscribeRateAuthoritative) persistentSetSubscribeRateBody
-- ^

type PersistentSetSubscriptionDispatchRateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionDispatchRate" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] DispatchRateImpl :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetSubscriptionDispatchRateParameters = PersistentSetSubscriptionDispatchRateParameters
  { -- |
    persistentSetSubscriptionDispatchRateTenant :: Text,
    -- |
    persistentSetSubscriptionDispatchRateNamespace :: Text,
    -- |
    persistentSetSubscriptionDispatchRateTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetSubscriptionDispatchRateAuthoritative :: Maybe Bool,
    -- | Subscription message dispatch rate for the specified topic
    persistentSetSubscriptionDispatchRateBody :: DispatchRateImpl
  }
  deriving (Show, Eq, Generic)

persistentSetSubscriptionDispatchRate :: PersistentSetSubscriptionDispatchRateParameters -> ClientM NoContent
persistentSetSubscriptionDispatchRate PersistentSetSubscriptionDispatchRateParameters {..} = client (Proxy :: Proxy PersistentSetSubscriptionDispatchRateAPI) (persistentSetSubscriptionDispatchRateTenant) (persistentSetSubscriptionDispatchRateNamespace) (persistentSetSubscriptionDispatchRateTopic) (persistentSetSubscriptionDispatchRateAuthoritative) persistentSetSubscriptionDispatchRateBody
-- ^

type PersistentSetSubscriptionTypesEnabledAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscriptionTypesEnabled" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] [Text] :> Verb 'POST 200 '[JSON] NoContent

data PersistentSetSubscriptionTypesEnabledParameters = PersistentSetSubscriptionTypesEnabledParameters
  { -- |
    persistentSetSubscriptionTypesEnabledTenant :: Text,
    -- |
    persistentSetSubscriptionTypesEnabledNamespace :: Text,
    -- |
    persistentSetSubscriptionTypesEnabledTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentSetSubscriptionTypesEnabledAuthoritative :: Maybe Bool,
    -- | Enable sub types for the specified topic
    persistentSetSubscriptionTypesEnabledBody :: [Text]
  }
  deriving (Show, Eq, Generic)

persistentSetSubscriptionTypesEnabled :: PersistentSetSubscriptionTypesEnabledParameters -> ClientM NoContent
persistentSetSubscriptionTypesEnabled PersistentSetSubscriptionTypesEnabledParameters {..} = client (Proxy :: Proxy PersistentSetSubscriptionTypesEnabledAPI) (persistentSetSubscriptionTypesEnabledTenant) (persistentSetSubscriptionTypesEnabledNamespace) (persistentSetSubscriptionTypesEnabledTopic) (persistentSetSubscriptionTypesEnabledAuthoritative) persistentSetSubscriptionTypesEnabledBody
-- ^ Completely clears the backlog on the subscription.

type PersistentSkipAllMessagesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "skip_all" :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data PersistentSkipAllMessagesParameters = PersistentSkipAllMessagesParameters
  { -- | Specify the tenant
    persistentSkipAllMessagesTenant :: Text,
    -- | Specify the namespace
    persistentSkipAllMessagesNamespace :: Text,
    -- | Specify topic name
    persistentSkipAllMessagesTopic :: Text,
    -- | Name of subscription
    persistentSkipAllMessagesSubName :: Text,
    -- | Is authentication required to perform this operation
    persistentSkipAllMessagesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentSkipAllMessages :: PersistentSkipAllMessagesParameters -> ClientM NoContent
persistentSkipAllMessages PersistentSkipAllMessagesParameters {..} = client (Proxy :: Proxy PersistentSkipAllMessagesAPI) (persistentSkipAllMessagesTenant) (persistentSkipAllMessagesNamespace) (persistentSkipAllMessagesTopic) (persistentSkipAllMessagesSubName) (persistentSkipAllMessagesAuthoritative)
-- ^

type PersistentSkipMessagesAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "subscription" :> Capture "subName" Text :> "skip" :> Capture "numMessages" Int :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data PersistentSkipMessagesParameters = PersistentSkipMessagesParameters
  { -- | Specify the tenant
    persistentSkipMessagesTenant :: Text,
    -- | Specify the namespace
    persistentSkipMessagesNamespace :: Text,
    -- | Specify topic name
    persistentSkipMessagesTopic :: Text,
    -- | Name of subscription
    persistentSkipMessagesSubName :: Text,
    -- | The number of messages to skip
    persistentSkipMessagesNumMessages :: Int,
    -- | Is authentication required to perform this operation
    persistentSkipMessagesAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentSkipMessages :: PersistentSkipMessagesParameters -> ClientM NoContent
persistentSkipMessages PersistentSkipMessagesParameters {..} = client (Proxy :: Proxy PersistentSkipMessagesAPI) (persistentSkipMessagesTenant) (persistentSkipMessagesNamespace) (persistentSkipMessagesTopic) (persistentSkipMessagesSubName) (persistentSkipMessagesNumMessages) (persistentSkipMessagesAuthoritative)
-- ^

type PersistentTerminateAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "terminate" :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] Value

data PersistentTerminateParameters = PersistentTerminateParameters
  { -- | Specify the tenant
    persistentTerminateTenant :: Text,
    -- | Specify the namespace
    persistentTerminateNamespace :: Text,
    -- | Specify topic name
    persistentTerminateTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentTerminateAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentTerminate :: PersistentTerminateParameters -> ClientM Value
persistentTerminate PersistentTerminateParameters {..} = client (Proxy :: Proxy PersistentTerminateAPI) (persistentTerminateTenant) (persistentTerminateNamespace) (persistentTerminateTopic) (persistentTerminateAuthoritative)
-- ^

type PersistentTerminatePartitionedTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "terminate" :> "partitions" :> QueryParam "authoritative" Bool :> Verb 'POST 200 '[JSON] NoContent

data PersistentTerminatePartitionedTopicParameters = PersistentTerminatePartitionedTopicParameters
  { -- | Specify the tenant
    persistentTerminatePartitionedTopicTenant :: Text,
    -- | Specify the namespace
    persistentTerminatePartitionedTopicNamespace :: Text,
    -- | Specify topic name
    persistentTerminatePartitionedTopicTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentTerminatePartitionedTopicAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentTerminatePartitionedTopic :: PersistentTerminatePartitionedTopicParameters -> ClientM NoContent
persistentTerminatePartitionedTopic PersistentTerminatePartitionedTopicParameters {..} = client (Proxy :: Proxy PersistentTerminatePartitionedTopicAPI) (persistentTerminatePartitionedTopicTenant) (persistentTerminatePartitionedTopicNamespace) (persistentTerminatePartitionedTopicTopic) (persistentTerminatePartitionedTopicAuthoritative)
-- ^

type PersistentTriggerOffloadAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "offload" :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

data PersistentTriggerOffloadParameters = PersistentTriggerOffloadParameters
  { -- | Specify the tenant
    persistentTriggerOffloadTenant :: Text,
    -- | Specify the namespace
    persistentTriggerOffloadNamespace :: Text,
    -- | Specify topic name
    persistentTriggerOffloadTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentTriggerOffloadAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentTriggerOffload :: PersistentTriggerOffloadParameters -> ClientM NoContent
persistentTriggerOffload PersistentTriggerOffloadParameters {..} = client (Proxy :: Proxy PersistentTriggerOffloadAPI) (persistentTriggerOffloadTenant) (persistentTriggerOffloadNamespace) (persistentTriggerOffloadTopic) (persistentTriggerOffloadAuthoritative)
-- ^ The truncate operation will move all cursors to the end of the topic and delete all inactive ledgers.

type PersistentTruncateTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "truncate" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data PersistentTruncateTopicParameters = PersistentTruncateTopicParameters
  { -- | Specify the tenant
    persistentTruncateTopicTenant :: Text,
    -- | Specify the namespace
    persistentTruncateTopicNamespace :: Text,
    -- | Specify topic name
    persistentTruncateTopicTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentTruncateTopicAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentTruncateTopic :: PersistentTruncateTopicParameters -> ClientM NoContent
persistentTruncateTopic PersistentTruncateTopicParameters {..} = client (Proxy :: Proxy PersistentTruncateTopicAPI) (persistentTruncateTopicTenant) (persistentTruncateTopicNamespace) (persistentTruncateTopicTopic) (persistentTruncateTopicAuthoritative)
-- ^

type PersistentUnloadTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "unload" :> QueryParam "authoritative" Bool :> Verb 'PUT 200 '[JSON] NoContent

data PersistentUnloadTopicParameters = PersistentUnloadTopicParameters
  { -- | Specify the tenant
    persistentUnloadTopicTenant :: Text,
    -- | Specify the namespace
    persistentUnloadTopicNamespace :: Text,
    -- | Specify topic name
    persistentUnloadTopicTopic :: Text,
    -- | Is authentication required to perform this operation
    persistentUnloadTopicAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentUnloadTopic :: PersistentUnloadTopicParameters -> ClientM NoContent
persistentUnloadTopic PersistentUnloadTopicParameters {..} = client (Proxy :: Proxy PersistentUnloadTopicAPI) (persistentUnloadTopicTenant) (persistentUnloadTopicNamespace) (persistentUnloadTopicTopic) (persistentUnloadTopicAuthoritative)
-- ^ It only increments partitions of existing non-global partitioned-topic

type PersistentUpdatePartitionedTopicAPI =
  "admin" :> "v2" :> "persistent" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "partitions" :> QueryParam "updateLocalTopicOnly" Bool :> QueryParam "authoritative" Bool :> ReqBody '[JSON] Int :> Verb 'POST 200 '[JSON] NoContent

data PersistentUpdatePartitionedTopicParameters = PersistentUpdatePartitionedTopicParameters
  { -- | Specify the tenant
    persistentUpdatePartitionedTopicTenant :: Text,
    -- | Specify the namespace
    persistentUpdatePartitionedTopicNamespace :: Text,
    -- | Specify topic name
    persistentUpdatePartitionedTopicTopic :: Text,
    -- | The number of partitions for the topic
    persistentUpdatePartitionedTopicBody :: Int,
    -- |
    persistentUpdatePartitionedTopicUpdateLocalTopicOnly :: Maybe Bool,
    -- | Is authentication required to perform this operation
    persistentUpdatePartitionedTopicAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

persistentUpdatePartitionedTopic :: PersistentUpdatePartitionedTopicParameters -> ClientM NoContent
persistentUpdatePartitionedTopic PersistentUpdatePartitionedTopicParameters {..} = client (Proxy :: Proxy PersistentUpdatePartitionedTopicAPI) (persistentUpdatePartitionedTopicTenant) (persistentUpdatePartitionedTopicNamespace) (persistentUpdatePartitionedTopicTopic) (persistentUpdatePartitionedTopicUpdateLocalTopicOnly) (persistentUpdatePartitionedTopicAuthoritative) persistentUpdatePartitionedTopicBody
-- ^

type ResourceQuotasGetDefaultResourceQuotaAPI =
  "admin" :> "v2" :> "resource-quotas" :> Verb 'GET 200 '[JSON] [Text]

resourceQuotasGetDefaultResourceQuota :: ClientM [Text]
resourceQuotasGetDefaultResourceQuota = client (Proxy :: Proxy ResourceQuotasGetDefaultResourceQuotaAPI)
-- ^

type ResourceQuotasGetNamespaceBundleResourceQuotaAPI =
  "admin" :> "v2" :> "resource-quotas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> Verb 'GET 200 '[JSON] ResourceQuota

data ResourceQuotasGetNamespaceBundleResourceQuotaParameters = ResourceQuotasGetNamespaceBundleResourceQuotaParameters
  { -- | Tenant name
    resourceQuotasGetNamespaceBundleResourceQuotaTenant :: Text,
    -- | Namespace name within the specified tenant
    resourceQuotasGetNamespaceBundleResourceQuotaNamespace :: Text,
    -- | Namespace bundle range
    resourceQuotasGetNamespaceBundleResourceQuotaBundle :: Text
  }
  deriving (Show, Eq, Generic)

resourceQuotasGetNamespaceBundleResourceQuota :: ResourceQuotasGetNamespaceBundleResourceQuotaParameters -> ClientM ResourceQuota
resourceQuotasGetNamespaceBundleResourceQuota ResourceQuotasGetNamespaceBundleResourceQuotaParameters {..} = client (Proxy :: Proxy ResourceQuotasGetNamespaceBundleResourceQuotaAPI) (resourceQuotasGetNamespaceBundleResourceQuotaTenant) (resourceQuotasGetNamespaceBundleResourceQuotaNamespace) (resourceQuotasGetNamespaceBundleResourceQuotaBundle)
-- ^

type ResourceQuotasRemoveNamespaceBundleResourceQuotaAPI =
  "admin" :> "v2" :> "resource-quotas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> Verb 'DELETE 200 '[JSON] NoContent

data ResourceQuotasRemoveNamespaceBundleResourceQuotaParameters = ResourceQuotasRemoveNamespaceBundleResourceQuotaParameters
  { -- | Tenant name
    resourceQuotasRemoveNamespaceBundleResourceQuotaTenant :: Text,
    -- | Namespace name within the specified tenant
    resourceQuotasRemoveNamespaceBundleResourceQuotaNamespace :: Text,
    -- | Namespace bundle range
    resourceQuotasRemoveNamespaceBundleResourceQuotaBundle :: Text
  }
  deriving (Show, Eq, Generic)

resourceQuotasRemoveNamespaceBundleResourceQuota :: ResourceQuotasRemoveNamespaceBundleResourceQuotaParameters -> ClientM NoContent
resourceQuotasRemoveNamespaceBundleResourceQuota ResourceQuotasRemoveNamespaceBundleResourceQuotaParameters {..} = client (Proxy :: Proxy ResourceQuotasRemoveNamespaceBundleResourceQuotaAPI) (resourceQuotasRemoveNamespaceBundleResourceQuotaTenant) (resourceQuotasRemoveNamespaceBundleResourceQuotaNamespace) (resourceQuotasRemoveNamespaceBundleResourceQuotaBundle)
-- ^

type ResourceQuotasSetDefaultResourceQuotaAPI =
  "admin" :> "v2" :> "resource-quotas" :> ReqBody '[JSON] ResourceQuota :> Verb 'POST 200 '[JSON] [Text]

data ResourceQuotasSetDefaultResourceQuotaParameters = ResourceQuotasSetDefaultResourceQuotaParameters
  { -- | Default resource quota
    resourceQuotasSetDefaultResourceQuotaBody :: ResourceQuota
  }
  deriving (Show, Eq, Generic)

resourceQuotasSetDefaultResourceQuota :: ResourceQuotasSetDefaultResourceQuotaParameters -> ClientM [Text]
resourceQuotasSetDefaultResourceQuota ResourceQuotasSetDefaultResourceQuotaParameters {..} = client (Proxy :: Proxy ResourceQuotasSetDefaultResourceQuotaAPI) resourceQuotasSetDefaultResourceQuotaBody
-- ^

type ResourceQuotasSetNamespaceBundleResourceQuotaAPI =
  "admin" :> "v2" :> "resource-quotas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "bundle" Text :> ReqBody '[JSON] ResourceQuota :> Verb 'POST 200 '[JSON] NoContent

data ResourceQuotasSetNamespaceBundleResourceQuotaParameters = ResourceQuotasSetNamespaceBundleResourceQuotaParameters
  { -- | Tenant name
    resourceQuotasSetNamespaceBundleResourceQuotaTenant :: Text,
    -- | Namespace name within the specified tenant
    resourceQuotasSetNamespaceBundleResourceQuotaNamespace :: Text,
    -- | Namespace bundle range
    resourceQuotasSetNamespaceBundleResourceQuotaBundle :: Text,
    -- | Resource quota for the specified namespace
    resourceQuotasSetNamespaceBundleResourceQuotaBody :: ResourceQuota
  }
  deriving (Show, Eq, Generic)

resourceQuotasSetNamespaceBundleResourceQuota :: ResourceQuotasSetNamespaceBundleResourceQuotaParameters -> ClientM NoContent
resourceQuotasSetNamespaceBundleResourceQuota ResourceQuotasSetNamespaceBundleResourceQuotaParameters {..} = client (Proxy :: Proxy ResourceQuotasSetNamespaceBundleResourceQuotaAPI) (resourceQuotasSetNamespaceBundleResourceQuotaTenant) (resourceQuotasSetNamespaceBundleResourceQuotaNamespace) (resourceQuotasSetNamespaceBundleResourceQuotaBundle) resourceQuotasSetNamespaceBundleResourceQuotaBody
-- ^

type ResourcegroupsCreateOrUpdateResourceGroupAPI =
  "admin" :> "v2" :> "resourcegroups" :> Capture "resourcegroup" Text :> ReqBody '[JSON] ResourceGroup :> Verb 'PUT 200 '[JSON] NoContent

data ResourcegroupsCreateOrUpdateResourceGroupParameters = ResourcegroupsCreateOrUpdateResourceGroupParameters
  { -- |
    resourcegroupsCreateOrUpdateResourceGroupResourcegroup :: Text,
    -- | Rate limiters for the resourcegroup
    resourcegroupsCreateOrUpdateResourceGroupBody :: ResourceGroup
  }
  deriving (Show, Eq, Generic)

resourcegroupsCreateOrUpdateResourceGroup :: ResourcegroupsCreateOrUpdateResourceGroupParameters -> ClientM NoContent
resourcegroupsCreateOrUpdateResourceGroup ResourcegroupsCreateOrUpdateResourceGroupParameters {..} = client (Proxy :: Proxy ResourcegroupsCreateOrUpdateResourceGroupAPI) (resourcegroupsCreateOrUpdateResourceGroupResourcegroup) resourcegroupsCreateOrUpdateResourceGroupBody
-- ^

type ResourcegroupsDeleteResourceGroupAPI =
  "admin" :> "v2" :> "resourcegroups" :> Capture "resourcegroup" Text :> Verb 'DELETE 200 '[JSON] NoContent

data ResourcegroupsDeleteResourceGroupParameters = ResourcegroupsDeleteResourceGroupParameters
  { -- |
    resourcegroupsDeleteResourceGroupResourcegroup :: Text
  }
  deriving (Show, Eq, Generic)

resourcegroupsDeleteResourceGroup :: ResourcegroupsDeleteResourceGroupParameters -> ClientM NoContent
resourcegroupsDeleteResourceGroup ResourcegroupsDeleteResourceGroupParameters {..} = client (Proxy :: Proxy ResourcegroupsDeleteResourceGroupAPI) (resourcegroupsDeleteResourceGroupResourcegroup)
-- ^

type ResourcegroupsGetResourceGroupAPI =
  "admin" :> "v2" :> "resourcegroups" :> Capture "resourcegroup" Text :> Verb 'GET 200 '[JSON] ResourceGroup

data ResourcegroupsGetResourceGroupParameters = ResourcegroupsGetResourceGroupParameters
  { -- |
    resourcegroupsGetResourceGroupResourcegroup :: Text
  }
  deriving (Show, Eq, Generic)

resourcegroupsGetResourceGroup :: ResourcegroupsGetResourceGroupParameters -> ClientM ResourceGroup
resourcegroupsGetResourceGroup ResourcegroupsGetResourceGroupParameters {..} = client (Proxy :: Proxy ResourcegroupsGetResourceGroupAPI) (resourcegroupsGetResourceGroupResourcegroup)
-- ^

type ResourcegroupsGetResourceGroupsAPI =
  "admin" :> "v2" :> "resourcegroups" :> Verb 'GET 200 '[JSON] [Text]

resourcegroupsGetResourceGroups :: ClientM [Text]
resourcegroupsGetResourceGroups = client (Proxy :: Proxy ResourcegroupsGetResourceGroupsAPI)
-- ^

type SchemasDeleteSchemaAPI =
  "admin" :> "v2" :> "schemas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "schema" :> QueryParam "authoritative" Bool :> Verb 'DELETE 200 '[JSON] DeleteSchemaResponse

data SchemasDeleteSchemaParameters = SchemasDeleteSchemaParameters
  { -- |
    schemasDeleteSchemaTenant :: Text,
    -- |
    schemasDeleteSchemaNamespace :: Text,
    -- |
    schemasDeleteSchemaTopic :: Text,
    -- |
    schemasDeleteSchemaAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

schemasDeleteSchema :: SchemasDeleteSchemaParameters -> ClientM DeleteSchemaResponse
schemasDeleteSchema SchemasDeleteSchemaParameters {..} = client (Proxy :: Proxy SchemasDeleteSchemaAPI) (schemasDeleteSchemaTenant) (schemasDeleteSchemaNamespace) (schemasDeleteSchemaTopic) (schemasDeleteSchemaAuthoritative)
-- ^

type SchemasGetAllSchemasAPI =
  "admin" :> "v2" :> "schemas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "schemas" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] GetAllVersionsSchemaResponse

data SchemasGetAllSchemasParameters = SchemasGetAllSchemasParameters
  { -- |
    schemasGetAllSchemasTenant :: Text,
    -- |
    schemasGetAllSchemasNamespace :: Text,
    -- |
    schemasGetAllSchemasTopic :: Text,
    -- |
    schemasGetAllSchemasAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

schemasGetAllSchemas :: SchemasGetAllSchemasParameters -> ClientM GetAllVersionsSchemaResponse
schemasGetAllSchemas SchemasGetAllSchemasParameters {..} = client (Proxy :: Proxy SchemasGetAllSchemasAPI) (schemasGetAllSchemasTenant) (schemasGetAllSchemasNamespace) (schemasGetAllSchemasTopic) (schemasGetAllSchemasAuthoritative)
-- ^

type SchemasGetSchemaAPI =
  "admin" :> "v2" :> "schemas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "schema" :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] GetSchemaResponse

data SchemasGetSchemaParameters = SchemasGetSchemaParameters
  { -- |
    schemasGetSchemaTenant :: Text,
    -- |
    schemasGetSchemaNamespace :: Text,
    -- |
    schemasGetSchemaTopic :: Text,
    -- |
    schemasGetSchemaAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

schemasGetSchema :: SchemasGetSchemaParameters -> ClientM GetSchemaResponse
schemasGetSchema SchemasGetSchemaParameters {..} = client (Proxy :: Proxy SchemasGetSchemaAPI) (schemasGetSchemaTenant) (schemasGetSchemaNamespace) (schemasGetSchemaTopic) (schemasGetSchemaAuthoritative)
-- ^

type SchemasGetSchemaVersionAPI =
  "admin" :> "v2" :> "schemas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "schema" :> Capture "version" Text :> QueryParam "authoritative" Bool :> Verb 'GET 200 '[JSON] GetSchemaResponse

data SchemasGetSchemaVersionParameters = SchemasGetSchemaVersionParameters
  { -- |
    schemasGetSchemaVersionTenant :: Text,
    -- |
    schemasGetSchemaVersionNamespace :: Text,
    -- |
    schemasGetSchemaVersionTopic :: Text,
    -- |
    schemasGetSchemaVersionVersion :: Text,
    -- |
    schemasGetSchemaVersionAuthoritative :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

schemasGetSchemaVersion :: SchemasGetSchemaVersionParameters -> ClientM GetSchemaResponse
schemasGetSchemaVersion SchemasGetSchemaVersionParameters {..} = client (Proxy :: Proxy SchemasGetSchemaVersionAPI) (schemasGetSchemaVersionTenant) (schemasGetSchemaVersionNamespace) (schemasGetSchemaVersionTopic) (schemasGetSchemaVersionVersion) (schemasGetSchemaVersionAuthoritative)
-- ^

type SchemasGetVersionBySchemaAPI =
  "admin" :> "v2" :> "schemas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "version" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] PostSchemaPayload :> Verb 'POST 200 '[JSON] LongSchemaVersion

data SchemasGetVersionBySchemaParameters = SchemasGetVersionBySchemaParameters
  { -- |
    schemasGetVersionBySchemaTenant :: Text,
    -- |
    schemasGetVersionBySchemaNamespace :: Text,
    -- |
    schemasGetVersionBySchemaTopic :: Text,
    -- |
    schemasGetVersionBySchemaAuthoritative :: Maybe Bool,
    -- | A JSON value presenting a schema playload. An example of the expected schema can be found down here.
    schemasGetVersionBySchemaBody :: PostSchemaPayload
  }
  deriving (Show, Eq, Generic)

schemasGetVersionBySchema :: SchemasGetVersionBySchemaParameters -> ClientM LongSchemaVersion
schemasGetVersionBySchema SchemasGetVersionBySchemaParameters {..} = client (Proxy :: Proxy SchemasGetVersionBySchemaAPI) (schemasGetVersionBySchemaTenant) (schemasGetVersionBySchemaNamespace) (schemasGetVersionBySchemaTopic) (schemasGetVersionBySchemaAuthoritative) schemasGetVersionBySchemaBody
-- ^

type SchemasPostSchemaAPI =
  "admin" :> "v2" :> "schemas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "schema" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] PostSchemaPayload :> Verb 'POST 200 '[JSON] PostSchemaResponse

data SchemasPostSchemaParameters = SchemasPostSchemaParameters
  { -- |
    schemasPostSchemaTenant :: Text,
    -- |
    schemasPostSchemaNamespace :: Text,
    -- |
    schemasPostSchemaTopic :: Text,
    -- |
    schemasPostSchemaAuthoritative :: Maybe Bool,
    -- | A JSON value presenting a schema playload. An example of the expected schema can be found down here.
    schemasPostSchemaBody :: PostSchemaPayload
  }
  deriving (Show, Eq, Generic)

schemasPostSchema :: SchemasPostSchemaParameters -> ClientM PostSchemaResponse
schemasPostSchema SchemasPostSchemaParameters {..} = client (Proxy :: Proxy SchemasPostSchemaAPI) (schemasPostSchemaTenant) (schemasPostSchemaNamespace) (schemasPostSchemaTopic) (schemasPostSchemaAuthoritative) schemasPostSchemaBody
-- ^

type SchemasTestCompatibilityAPI =
  "admin" :> "v2" :> "schemas" :> Capture "tenant" Text :> Capture "namespace" Text :> Capture "topic" Text :> "compatibility" :> QueryParam "authoritative" Bool :> ReqBody '[JSON] PostSchemaPayload :> Verb 'POST 200 '[JSON] IsCompatibilityResponse

data SchemasTestCompatibilityParameters = SchemasTestCompatibilityParameters
  { -- |
    schemasTestCompatibilityTenant :: Text,
    -- |
    schemasTestCompatibilityNamespace :: Text,
    -- |
    schemasTestCompatibilityTopic :: Text,
    -- |
    schemasTestCompatibilityAuthoritative :: Maybe Bool,
    -- | A JSON value presenting a schema playload. An example of the expected schema can be found down here.
    schemasTestCompatibilityBody :: PostSchemaPayload
  }
  deriving (Show, Eq, Generic)

schemasTestCompatibility :: SchemasTestCompatibilityParameters -> ClientM IsCompatibilityResponse
schemasTestCompatibility SchemasTestCompatibilityParameters {..} = client (Proxy :: Proxy SchemasTestCompatibilityAPI) (schemasTestCompatibilityTenant) (schemasTestCompatibilityNamespace) (schemasTestCompatibilityTopic) (schemasTestCompatibilityAuthoritative) schemasTestCompatibilityBody
-- ^

type GetTenantsAPI =
  "admin" :> "v2" :> "tenants" :> Verb 'GET 200 '[JSON] [Text]

getTenants :: ClientM [Text]
getTenants = client (Proxy :: Proxy GetTenantsAPI)
-- ^ This operation requires Pulsar super-user privileges.

type TenantsCreateTenantAPI =
  "admin" :> "v2" :> "tenants" :> Capture "tenant" Text :> ReqBody '[JSON] TenantInfo :> Verb 'PUT 200 '[JSON] NoContent

data TenantsCreateTenantParameters = TenantsCreateTenantParameters
  { -- | The tenant name
    tenantsCreateTenantTenant :: Text,
    -- | TenantInfo
    tenantsCreateTenantBody :: TenantInfo
  }
  deriving (Show, Eq, Generic)

tenantsCreateTenant :: TenantsCreateTenantParameters -> ClientM NoContent
tenantsCreateTenant TenantsCreateTenantParameters {..} = client (Proxy :: Proxy TenantsCreateTenantAPI) (tenantsCreateTenantTenant) tenantsCreateTenantBody
-- ^

type TenantsDeleteTenantAPI =
  "admin" :> "v2" :> "tenants" :> Capture "tenant" Text :> QueryParam "force" Bool :> Verb 'DELETE 200 '[JSON] NoContent

data TenantsDeleteTenantParameters = TenantsDeleteTenantParameters
  { -- | The tenant name
    tenantsDeleteTenantTenant :: Text,
    -- |
    tenantsDeleteTenantForce :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

tenantsDeleteTenant :: TenantsDeleteTenantParameters -> ClientM NoContent
tenantsDeleteTenant TenantsDeleteTenantParameters {..} = client (Proxy :: Proxy TenantsDeleteTenantAPI) (tenantsDeleteTenantTenant) (tenantsDeleteTenantForce)
-- ^

type TenantsGetTenantAdminAPI =
  "admin" :> "v2" :> "tenants" :> Capture "tenant" Text :> Verb 'GET 200 '[JSON] NoContent

data TenantsGetTenantAdminParameters = TenantsGetTenantAdminParameters
  { -- | The tenant name
    tenantsGetTenantAdminTenant :: Text
  }
  deriving (Show, Eq, Generic)

tenantsGetTenantAdmin :: TenantsGetTenantAdminParameters -> ClientM NoContent
tenantsGetTenantAdmin TenantsGetTenantAdminParameters {..} = client (Proxy :: Proxy TenantsGetTenantAdminAPI) (tenantsGetTenantAdminTenant)
-- ^ This operation requires Pulsar super-user privileges.

type TenantsUpdateTenantAPI =
  "admin" :> "v2" :> "tenants" :> Capture "tenant" Text :> ReqBody '[JSON] TenantInfo :> Verb 'POST 200 '[JSON] NoContent

data TenantsUpdateTenantParameters = TenantsUpdateTenantParameters
  { -- | The tenant name
    tenantsUpdateTenantTenant :: Text,
    -- | TenantInfo
    tenantsUpdateTenantBody :: TenantInfo
  }
  deriving (Show, Eq, Generic)

tenantsUpdateTenant :: TenantsUpdateTenantParameters -> ClientM NoContent
tenantsUpdateTenant TenantsUpdateTenantParameters {..} = client (Proxy :: Proxy TenantsUpdateTenantAPI) (tenantsUpdateTenantTenant) tenantsUpdateTenantBody
