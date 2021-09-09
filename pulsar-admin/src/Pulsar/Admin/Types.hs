{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Pulsar.Admin.Types
  ( AllocatorStats (..),
    ArrayBuilders (..),
    AuthPolicies (..),
    AuthenticationDataHttps (..),
    AutoFailoverPolicyData (..),
    AutoSubscriptionCreationOverride (..),
    AutoTopicCreationOverride (..),
    BacklogQuota (..),
    Base64Variant (..),
    BookieAffinityGroupData (..),
    BookieInfo (..),
    BookiesClusterInfo (..),
    BrokerInfo (..),
    BrokerNamespaceIsolationData (..),
    BundlesData (..),
    CharacterEscapes (..),
    ClassLoader (..),
    ClusterData (..),
    CompactionStats (..),
    CompletableFuture (..),
    CompletableFutureClusterData (..),
    CompletableFuturePartitionedTopicMetadata (..),
    ConnectorDefinition (..),
    ConsumerStats (..),
    Currency (..),
    CursorDetails (..),
    CursorStats (..),
    DateFormat (..),
    DelayedDeliveryPolicies (..),
    DeleteSchemaResponse (..),
    DeserializationConfig (..),
    DeserializationContext (..),
    DispatchRate (..),
    DispatchRateImpl (..),
    FailureDomain (..),
    FormatSchema (..),
    FunctionInstanceStatsData (..),
    FunctionInstanceStatsDataBase (..),
    Functions (..),
    FunctionsV2 (..),
    FunctionsV2WorkerService (..),
    FunctionsWorkerService (..),
    GetAllVersionsSchemaResponse (..),
    GetSchemaResponse (..),
    InactiveTopicPolicies (..),
    InternalConfigurationData (..),
    IsCompatibilityResponse (..),
    JavaType (..),
    JsonFactory (..),
    JsonGenerator (..),
    JsonLocation (..),
    JsonParser (..),
    JsonSerializer (..),
    JsonSerializerObject (..),
    JsonStreamContext (..),
    KubernetesContainerFactory (..),
    LedgerDetails (..),
    LedgerInfo (..),
    LoadReport (..),
    Locale (..),
    LongRunningProcessStatus (..),
    LongSchemaVersion (..),
    MemoryLimit (..),
    MessageIdImpl (..),
    Metrics (..),
    Module (..),
    ModuleDescriptor (..),
    NamespaceBundleStats (..),
    NamespaceIsolationData (..),
    NamespaceOwnershipStatus (..),
    NonPersistentPublisherStats (..),
    NonPersistentReplicatorStats (..),
    NonPersistentSubscriptionStats (..),
    NonPersistentTopicStats (..),
    NumberFormat (..),
    ObjectCodec (..),
    ObjectMapper (..),
    OffloadPolicies (..),
    OffloadPoliciesImpl (..),
    OffloadProcessStatus (..),
    Package (..),
    PartitionedTopicMetadata (..),
    PendingBookieOpsStats (..),
    PersistencePolicies (..),
    PersistentOfflineTopicStats (..),
    PersistentTopicInternalStats (..),
    Policies (..),
    PoolArenaStats (..),
    PoolChunkListStats (..),
    PoolChunkStats (..),
    PoolSubpageStats (..),
    PostSchemaPayload (..),
    PostSchemaResponse (..),
    Principal (..),
    ProcessContainerFactory (..),
    PropertyName (..),
    PublicKey (..),
    PublishRate (..),
    PublisherStats (..),
    RawBookieInfo (..),
    ReplicatorStats (..),
    ResetCursorData (..),
    ResourceDescription (..),
    ResourceGroup (..),
    ResourceQuota (..),
    ResourceUnit (..),
    ResourceUsage (..),
    Resources (..),
    RetentionPolicies (..),
    SerializationConfig (..),
    SerializerProvider (..),
    Sinks (..),
    SinksWorkerService (..),
    Sources (..),
    SourcesWorkerService (..),
    SubscribeRate (..),
    SubscriptionStats (..),
    SystemResourceUsage (..),
    TenantInfo (..),
    ThreadContainerFactory (..),
    TimeZone (..),
    TopicStats (..),
    TypeBindings (..),
    TypeFactory (..),
    Value_ (..),
    WorkerConfig (..),
    WorkerFunctionInstanceStats (..),
    WorkerInfo (..),
    WorkerService (..),
    X500Principal (..),
    X509Certificate (..),
  )
where

import Data.Aeson (FromJSON (..), ToJSON (..), Value, genericParseJSON, genericToJSON)
import Data.Aeson.Types (Options (..), defaultOptions)
import qualified Data.Char as Char
import Data.Function ((&))
import Data.List (stripPrefix)
import qualified Data.Map as Map
import Data.Maybe (fromMaybe)
import Data.Text (Text)
import qualified Data.Text as T
import Data.Time hiding (TimeZone)
import GHC.Generics (Generic)

-- |
data AllocatorStats = AllocatorStats
  { -- |
    allocatorStatsNumDirectArenas :: Maybe Int,
    -- |
    allocatorStatsNumHeapArenas :: Maybe Int,
    -- |
    allocatorStatsNumThreadLocalCaches :: Maybe Int,
    -- |
    allocatorStatsNormalCacheSize :: Maybe Int,
    -- |
    allocatorStatsSmallCacheSize :: Maybe Int,
    -- |
    allocatorStatsTinyCacheSize :: Maybe Int,
    -- |
    allocatorStatsDirectArenas :: Maybe [PoolArenaStats],
    -- |
    allocatorStatsHeapArenas :: Maybe [PoolArenaStats]
  }
  deriving (Show, Eq, Generic)

instance FromJSON AllocatorStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "allocatorStats")

instance ToJSON AllocatorStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "allocatorStats")

-- |
data ArrayBuilders = ArrayBuilders
  { -- |
    arrayBuildersBooleanBuilder :: Maybe Value,
    -- |
    arrayBuildersByteBuilder :: Maybe Value,
    -- |
    arrayBuildersShortBuilder :: Maybe Value,
    -- |
    arrayBuildersIntBuilder :: Maybe Value,
    -- |
    arrayBuildersLongBuilder :: Maybe Value,
    -- |
    arrayBuildersFloatBuilder :: Maybe Value,
    -- |
    arrayBuildersDoubleBuilder :: Maybe Value
  }
  deriving (Show, Eq, Generic)

instance FromJSON ArrayBuilders where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "arrayBuilders")

instance ToJSON ArrayBuilders where
  toJSON = genericToJSON (removeFieldLabelPrefix False "arrayBuilders")

-- |
data AuthPolicies = AuthPolicies
  { -- |
    authPoliciesSubscriptionAuthentication :: Maybe (Map.Map String [Text]),
    -- |
    authPoliciesNamespaceAuthentication :: Maybe (Map.Map String [Text]),
    -- |
    authPoliciesTopicAuthentication :: Maybe (Map.Map String (Map.Map String [Text]))
  }
  deriving (Show, Eq, Generic)

instance FromJSON AuthPolicies where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "authPolicies")

instance ToJSON AuthPolicies where
  toJSON = genericToJSON (removeFieldLabelPrefix False "authPolicies")

-- |
data AuthenticationDataHttps = AuthenticationDataHttps
  { -- |
    authenticationDataHttpsSubscription :: Maybe Text,
    -- |
    authenticationDataHttpsTlsCertificates :: Maybe [X509Certificate],
    -- |
    authenticationDataHttpsHttpAuthType :: Maybe Text,
    -- |
    authenticationDataHttpsPeerAddress :: Maybe Value,
    -- |
    authenticationDataHttpsCommandData :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON AuthenticationDataHttps where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "authenticationDataHttps")

instance ToJSON AuthenticationDataHttps where
  toJSON = genericToJSON (removeFieldLabelPrefix False "authenticationDataHttps")

-- |
data AutoFailoverPolicyData = AutoFailoverPolicyData
  { -- |
    autoFailoverPolicyDataPolicyType :: Maybe Text,
    -- |
    autoFailoverPolicyDataParameters :: Maybe (Map.Map String Text)
  }
  deriving (Show, Eq, Generic)

instance FromJSON AutoFailoverPolicyData where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "autoFailoverPolicyData")

instance ToJSON AutoFailoverPolicyData where
  toJSON = genericToJSON (removeFieldLabelPrefix False "autoFailoverPolicyData")

-- |
data AutoSubscriptionCreationOverride = AutoSubscriptionCreationOverride
  { -- |
    autoSubscriptionCreationOverrideAllowAutoSubscriptionCreation :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON AutoSubscriptionCreationOverride where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "autoSubscriptionCreationOverride")

instance ToJSON AutoSubscriptionCreationOverride where
  toJSON = genericToJSON (removeFieldLabelPrefix False "autoSubscriptionCreationOverride")

-- |
data AutoTopicCreationOverride = AutoTopicCreationOverride
  { -- |
    autoTopicCreationOverrideTopicType :: Maybe Text,
    -- |
    autoTopicCreationOverrideDefaultNumPartitions :: Maybe Int,
    -- |
    autoTopicCreationOverrideAllowAutoTopicCreation :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON AutoTopicCreationOverride where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "autoTopicCreationOverride")

instance ToJSON AutoTopicCreationOverride where
  toJSON = genericToJSON (removeFieldLabelPrefix False "autoTopicCreationOverride")

-- |
data BacklogQuota = BacklogQuota
  { -- |
    backlogQuotaPolicy :: Maybe Text,
    -- |
    backlogQuotaLimitSize :: Maybe Integer,
    -- |
    backlogQuotaLimitTime :: Maybe Int
  }
  deriving (Show, Eq, Generic)

instance FromJSON BacklogQuota where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "backlogQuota")

instance ToJSON BacklogQuota where
  toJSON = genericToJSON (removeFieldLabelPrefix False "backlogQuota")

-- |
data Base64Variant = Base64Variant
  { -- |
    base64VariantPaddingChar :: Maybe Text,
    -- |
    base64VariantPaddingByte :: Maybe Text,
    -- |
    base64VariantMaxLineLength :: Maybe Int,
    -- |
    base64VariantName :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON Base64Variant where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "base64Variant")

instance ToJSON Base64Variant where
  toJSON = genericToJSON (removeFieldLabelPrefix False "base64Variant")

-- |
data BookieAffinityGroupData = BookieAffinityGroupData
  { -- |
    bookieAffinityGroupDataBookkeeperAffinityGroupPrimary :: Maybe Text,
    -- |
    bookieAffinityGroupDataBookkeeperAffinityGroupSecondary :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON BookieAffinityGroupData where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "bookieAffinityGroupData")

instance ToJSON BookieAffinityGroupData where
  toJSON = genericToJSON (removeFieldLabelPrefix False "bookieAffinityGroupData")

-- |
data BookieInfo = BookieInfo
  { -- |
    bookieInfoRack :: Maybe Text,
    -- |
    bookieInfoHostname :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON BookieInfo where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "bookieInfo")

instance ToJSON BookieInfo where
  toJSON = genericToJSON (removeFieldLabelPrefix False "bookieInfo")

-- |
data BookiesClusterInfo = BookiesClusterInfo
  { -- |
    bookiesClusterInfoBookies :: Maybe [RawBookieInfo]
  }
  deriving (Show, Eq, Generic)

instance FromJSON BookiesClusterInfo where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "bookiesClusterInfo")

instance ToJSON BookiesClusterInfo where
  toJSON = genericToJSON (removeFieldLabelPrefix False "bookiesClusterInfo")

-- |
data BrokerInfo = BrokerInfo
  { -- |
    brokerInfoServiceUrl :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON BrokerInfo where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "brokerInfo")

instance ToJSON BrokerInfo where
  toJSON = genericToJSON (removeFieldLabelPrefix False "brokerInfo")

-- | The namespace isolation data for a given broker
data BrokerNamespaceIsolationData = BrokerNamespaceIsolationData
  { -- | The broker name
    brokerNamespaceIsolationDataBrokerName :: Maybe Text,
    -- | Policy name
    brokerNamespaceIsolationDataPolicyName :: Maybe Text,
    -- | The namespace-isolation policies attached to this broker
    brokerNamespaceIsolationDataNamespaceRegex :: Maybe [Text],
    -- |
    brokerNamespaceIsolationDataPrimary :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON BrokerNamespaceIsolationData where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "brokerNamespaceIsolationData")

instance ToJSON BrokerNamespaceIsolationData where
  toJSON = genericToJSON (removeFieldLabelPrefix False "brokerNamespaceIsolationData")

-- |
data BundlesData = BundlesData
  { -- |
    bundlesDataBoundaries :: Maybe [Text],
    -- |
    bundlesDataNumBundles :: Maybe Int
  }
  deriving (Show, Eq, Generic)

instance FromJSON BundlesData where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "bundlesData")

instance ToJSON BundlesData where
  toJSON = genericToJSON (removeFieldLabelPrefix False "bundlesData")

-- |
data CharacterEscapes = CharacterEscapes
  { -- |
    characterEscapesEscapeCodesForAscii :: Maybe [Int]
  }
  deriving (Show, Eq, Generic)

instance FromJSON CharacterEscapes where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "characterEscapes")

instance ToJSON CharacterEscapes where
  toJSON = genericToJSON (removeFieldLabelPrefix False "characterEscapes")

-- |
data ClassLoader = ClassLoader
  { -- |
    classLoaderParent :: Maybe ClassLoader,
    -- |
    classLoaderName :: Maybe Text,
    -- |
    classLoaderUnnamedModule :: Maybe Module,
    -- |
    classLoaderRegisteredAsParallelCapable :: Maybe Bool,
    -- |
    classLoaderDefinedPackages :: Maybe [Package]
  }
  deriving (Show, Eq, Generic)

instance FromJSON ClassLoader where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "classLoader")

instance ToJSON ClassLoader where
  toJSON = genericToJSON (removeFieldLabelPrefix False "classLoader")

-- | The configuration data for a cluster
data ClusterData = ClusterData
  { -- | The HTTP rest service URL (for admin operations)
    clusterDataServiceUrl :: Maybe Text,
    -- | The HTTPS rest service URL (for admin operations)
    clusterDataServiceUrlTls :: Maybe Text,
    -- | The broker service url (for produce and consume operations)
    clusterDataBrokerServiceUrl :: Maybe Text,
    -- | The secured broker service url (for produce and consume operations)
    clusterDataBrokerServiceUrlTls :: Maybe Text,
    -- | Proxy-service url when client would like to connect to broker via proxy.
    clusterDataProxyServiceUrl :: Maybe Text,
    -- | Authentication plugin when client would like to connect to cluster.
    clusterDataAuthenticationPlugin :: Maybe Text,
    -- | Authentication parameters when client would like to connect to cluster.
    clusterDataAuthenticationParameters :: Maybe Text,
    -- | protocol to decide type of proxy routing eg: SNI-routing
    clusterDataProxyProtocol :: Maybe Text,
    -- | A set of peer cluster names
    clusterDataPeerClusterNames :: Maybe [Text],
    -- | Enable TLS when talking with other brokers in the same cluster (admin operation) or different clusters (replication)
    clusterDataBrokerClientTlsEnabled :: Maybe Bool,
    -- | Allow TLS connections to servers whose certificate cannot be be verified to have been signed by a trusted certificate authority.
    clusterDataTlsAllowInsecureConnection :: Maybe Bool,
    -- | Whether internal client use KeyStore type to authenticate with other Pulsar brokers
    clusterDataBrokerClientTlsEnabledWithKeyStore :: Maybe Bool,
    -- | TLS TrustStore type configuration for internal client: JKS, PKCS12 used by the internal client to authenticate with Pulsar brokers
    clusterDataBrokerClientTlsTrustStoreType :: Maybe Text,
    -- | TLS TrustStore path for internal client used by the internal client to authenticate with Pulsar brokers
    clusterDataBrokerClientTlsTrustStore :: Maybe Text,
    -- | TLS TrustStore password for internal client used by the internal client to authenticate with Pulsar brokers
    clusterDataBrokerClientTlsTrustStorePassword :: Maybe Text,
    -- | Path for the trusted TLS certificate file for outgoing connection to a server (broker)
    clusterDataBrokerClientTrustCertsFilePath :: Maybe Text,
    -- | listenerName when client would like to connect to cluster
    clusterDataListenerName :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON ClusterData where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "clusterData")

instance ToJSON ClusterData where
  toJSON = genericToJSON (removeFieldLabelPrefix False "clusterData")

-- |
data CompactionStats = CompactionStats
  { -- |
    compactionStatsLastCompactionDurationTimeInMills :: Maybe Integer,
    -- |
    compactionStatsLastCompactionRemovedEventCount :: Maybe Integer,
    -- |
    compactionStatsLastCompactionSucceedTimestamp :: Maybe Integer,
    -- |
    compactionStatsLastCompactionFailedTimestamp :: Maybe Integer
  }
  deriving (Show, Eq, Generic)

instance FromJSON CompactionStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "compactionStats")

instance ToJSON CompactionStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "compactionStats")

-- |
data CompletableFuture = CompletableFuture
  { -- |
    completableFutureCancelled :: Maybe Bool,
    -- |
    completableFutureNumberOfDependents :: Maybe Int,
    -- |
    completableFutureDone :: Maybe Bool,
    -- |
    completableFutureCompletedExceptionally :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON CompletableFuture where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "completableFuture")

instance ToJSON CompletableFuture where
  toJSON = genericToJSON (removeFieldLabelPrefix False "completableFuture")

-- |
data CompletableFutureClusterData = CompletableFutureClusterData
  { -- |
    completableFutureClusterDataCancelled :: Maybe Bool,
    -- |
    completableFutureClusterDataNumberOfDependents :: Maybe Int,
    -- |
    completableFutureClusterDataDone :: Maybe Bool,
    -- |
    completableFutureClusterDataCompletedExceptionally :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON CompletableFutureClusterData where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "completableFutureClusterData")

instance ToJSON CompletableFutureClusterData where
  toJSON = genericToJSON (removeFieldLabelPrefix False "completableFutureClusterData")

-- |
data CompletableFuturePartitionedTopicMetadata = CompletableFuturePartitionedTopicMetadata
  { -- |
    completableFuturePartitionedTopicMetadataCancelled :: Maybe Bool,
    -- |
    completableFuturePartitionedTopicMetadataNumberOfDependents :: Maybe Int,
    -- |
    completableFuturePartitionedTopicMetadataDone :: Maybe Bool,
    -- |
    completableFuturePartitionedTopicMetadataCompletedExceptionally :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON CompletableFuturePartitionedTopicMetadata where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "completableFuturePartitionedTopicMetadata")

instance ToJSON CompletableFuturePartitionedTopicMetadata where
  toJSON = genericToJSON (removeFieldLabelPrefix False "completableFuturePartitionedTopicMetadata")

-- |
data ConnectorDefinition = ConnectorDefinition
  { -- |
    connectorDefinitionName :: Maybe Text,
    -- |
    connectorDefinitionDescription :: Maybe Text,
    -- |
    connectorDefinitionSourceClass :: Maybe Text,
    -- |
    connectorDefinitionSinkClass :: Maybe Text,
    -- |
    connectorDefinitionSourceConfigClass :: Maybe Text,
    -- |
    connectorDefinitionSinkConfigClass :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON ConnectorDefinition where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "connectorDefinition")

instance ToJSON ConnectorDefinition where
  toJSON = genericToJSON (removeFieldLabelPrefix False "connectorDefinition")

-- |
data ConsumerStats = ConsumerStats
  { -- |
    consumerStatsMsgRateOut :: Maybe Double,
    -- |
    consumerStatsBytesOutCounter :: Maybe Integer,
    -- |
    consumerStatsMsgOutCounter :: Maybe Integer,
    -- |
    consumerStatsMetadata :: Maybe (Map.Map String Text),
    -- |
    consumerStatsChunkedMessageRate :: Maybe Double,
    -- |
    consumerStatsConnectedSince :: Maybe Text,
    -- |
    consumerStatsClientVersion :: Maybe Text,
    -- |
    consumerStatsConsumerName :: Maybe Text,
    -- |
    consumerStatsAvailablePermits :: Maybe Int,
    -- |
    consumerStatsMsgRateRedeliver :: Maybe Double,
    -- |
    consumerStatsUnackedMessages :: Maybe Int,
    -- |
    consumerStatsLastConsumedTimestamp :: Maybe Integer,
    -- |
    consumerStatsLastAckedTimestamp :: Maybe Integer,
    -- |
    consumerStatsAvgMessagesPerEntry :: Maybe Int,
    -- |
    consumerStatsBlockedConsumerOnUnackedMsgs :: Maybe Bool,
    -- |
    consumerStatsReadPositionWhenJoining :: Maybe Text,
    -- |
    consumerStatsKeyHashRanges :: Maybe [Text],
    -- |
    consumerStatsMsgThroughputOut :: Maybe Double,
    -- |
    consumerStatsAddress :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON ConsumerStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "consumerStats")

instance ToJSON ConsumerStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "consumerStats")

-- |
data Currency = Currency
  { -- |
    currencyCurrencyCode :: Maybe Text,
    -- |
    currencyDefaultFractionDigits :: Maybe Int,
    -- |
    currencyNumericCode :: Maybe Int,
    -- |
    currencyDisplayName :: Maybe Text,
    -- |
    currencySymbol :: Maybe Text,
    -- |
    currencyNumericCodeAsString :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON Currency where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "currency")

instance ToJSON Currency where
  toJSON = genericToJSON (removeFieldLabelPrefix False "currency")

-- |
data CursorDetails = CursorDetails
  { -- |
    cursorDetailsCursorBacklog :: Maybe Integer,
    -- |
    cursorDetailsCursorLedgerId :: Maybe Integer
  }
  deriving (Show, Eq, Generic)

instance FromJSON CursorDetails where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "cursorDetails")

instance ToJSON CursorDetails where
  toJSON = genericToJSON (removeFieldLabelPrefix False "cursorDetails")

-- |
data CursorStats = CursorStats
  { -- |
    cursorStatsMarkDeletePosition :: Maybe Text,
    -- |
    cursorStatsReadPosition :: Maybe Text,
    -- |
    cursorStatsWaitingReadOp :: Maybe Bool,
    -- |
    cursorStatsPendingReadOps :: Maybe Int,
    -- |
    cursorStatsMessagesConsumedCounter :: Maybe Integer,
    -- |
    cursorStatsCursorLedger :: Maybe Integer,
    -- |
    cursorStatsCursorLedgerLastEntry :: Maybe Integer,
    -- |
    cursorStatsIndividuallyDeletedMessages :: Maybe Text,
    -- |
    cursorStatsLastLedgerSwitchTimestamp :: Maybe Text,
    -- |
    cursorStatsState :: Maybe Text,
    -- |
    cursorStatsNumberOfEntriesSinceFirstNotAckedMessage :: Maybe Integer,
    -- |
    cursorStatsTotalNonContiguousDeletedMessagesRange :: Maybe Int,
    -- |
    cursorStatsSubscriptionHavePendingRead :: Maybe Bool,
    -- |
    cursorStatsSubscriptionHavePendingReplayRead :: Maybe Bool,
    -- |
    cursorStatsProperties :: Maybe (Map.Map String Integer)
  }
  deriving (Show, Eq, Generic)

instance FromJSON CursorStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "cursorStats")

instance ToJSON CursorStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "cursorStats")

-- |
data DateFormat = DateFormat
  { -- |
    dateFormatCalendar :: Maybe UTCTime,
    -- |
    dateFormatNumberFormat :: Maybe NumberFormat,
    -- |
    dateFormatLenient :: Maybe Bool,
    -- |
    dateFormatTimeZone :: Maybe TimeZone
  }
  deriving (Show, Eq, Generic)

instance FromJSON DateFormat where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "dateFormat")

instance ToJSON DateFormat where
  toJSON = genericToJSON (removeFieldLabelPrefix False "dateFormat")

-- |
data DelayedDeliveryPolicies = DelayedDeliveryPolicies
  { -- |
    delayedDeliveryPoliciesTickTime :: Maybe Integer,
    -- |
    delayedDeliveryPoliciesActive :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON DelayedDeliveryPolicies where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "delayedDeliveryPolicies")

instance ToJSON DelayedDeliveryPolicies where
  toJSON = genericToJSON (removeFieldLabelPrefix False "delayedDeliveryPolicies")

-- |
data DeleteSchemaResponse = DeleteSchemaResponse
  { -- |
    deleteSchemaResponseVersion :: Maybe Integer
  }
  deriving (Show, Eq, Generic)

instance FromJSON DeleteSchemaResponse where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "deleteSchemaResponse")

instance ToJSON DeleteSchemaResponse where
  toJSON = genericToJSON (removeFieldLabelPrefix False "deleteSchemaResponse")

-- |
data DeserializationConfig = DeserializationConfig
  { -- |
    deserializationConfigDefaultPropertyInclusion :: Maybe Value,
    -- |
    deserializationConfigDeserializationFeatures :: Maybe Int,
    -- |
    deserializationConfigProblemHandlers :: Maybe Value,
    -- |
    deserializationConfigNodeFactory :: Maybe Value,
    -- |
    deserializationConfigAnnotationIntrospector :: Maybe Value,
    -- |
    deserializationConfigRootName :: Maybe Text,
    -- |
    deserializationConfigFullRootName :: Maybe PropertyName,
    -- |
    deserializationConfigSubtypeResolver :: Maybe Value,
    -- |
    deserializationConfigDefaultVisibilityChecker :: Maybe Value,
    -- |
    deserializationConfigAttributes :: Maybe Value,
    -- |
    deserializationConfigLocale :: Maybe Locale,
    -- |
    deserializationConfigTimeZone :: Maybe TimeZone,
    -- |
    deserializationConfigTypeFactory :: Maybe TypeFactory,
    -- |
    deserializationConfigAnnotationProcessingEnabled :: Maybe Bool,
    -- |
    deserializationConfigBase64Variant :: Maybe Base64Variant,
    -- |
    deserializationConfigHandlerInstantiator :: Maybe Value,
    -- |
    deserializationConfigPropertyNamingStrategy :: Maybe Value,
    -- |
    deserializationConfigDateFormat :: Maybe DateFormat,
    -- |
    deserializationConfigClassIntrospector :: Maybe Value
  }
  deriving (Show, Eq, Generic)

instance FromJSON DeserializationConfig where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "deserializationConfig")

instance ToJSON DeserializationConfig where
  toJSON = genericToJSON (removeFieldLabelPrefix False "deserializationConfig")

-- |
data DeserializationContext = DeserializationContext
  { -- |
    deserializationContextLocale :: Maybe Locale,
    -- |
    deserializationContextTimeZone :: Maybe TimeZone,
    -- |
    deserializationContextConfig :: Maybe DeserializationConfig,
    -- |
    deserializationContextParser :: Maybe JsonParser,
    -- |
    deserializationContextTypeFactory :: Maybe TypeFactory,
    -- |
    deserializationContextDeserializationFeatures :: Maybe Int,
    -- |
    deserializationContextBase64Variant :: Maybe Base64Variant,
    -- |
    deserializationContextArrayBuilders :: Maybe ArrayBuilders,
    -- |
    deserializationContextNodeFactory :: Maybe Value,
    -- |
    deserializationContextAnnotationIntrospector :: Maybe Value,
    -- |
    deserializationContextContextualType :: Maybe JavaType,
    -- |
    deserializationContextFactory :: Maybe Value
  }
  deriving (Show, Eq, Generic)

instance FromJSON DeserializationContext where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "deserializationContext")

instance ToJSON DeserializationContext where
  toJSON = genericToJSON (removeFieldLabelPrefix False "deserializationContext")

-- |
data DispatchRate = DispatchRate
  { -- |
    dispatchRateDispatchThrottlingRateInMsg :: Maybe Int,
    -- |
    dispatchRateDispatchThrottlingRateInByte :: Maybe Integer,
    -- |
    dispatchRateRelativeToPublishRate :: Maybe Bool,
    -- |
    dispatchRateRatePeriodInSecond :: Maybe Int
  }
  deriving (Show, Eq, Generic)

instance FromJSON DispatchRate where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "dispatchRate")

instance ToJSON DispatchRate where
  toJSON = genericToJSON (removeFieldLabelPrefix False "dispatchRate")

-- |
data DispatchRateImpl = DispatchRateImpl
  { -- |
    dispatchRateImplDispatchThrottlingRateInMsg :: Maybe Int,
    -- |
    dispatchRateImplDispatchThrottlingRateInByte :: Maybe Integer,
    -- |
    dispatchRateImplRelativeToPublishRate :: Maybe Bool,
    -- |
    dispatchRateImplRatePeriodInSecond :: Maybe Int
  }
  deriving (Show, Eq, Generic)

instance FromJSON DispatchRateImpl where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "dispatchRateImpl")

instance ToJSON DispatchRateImpl where
  toJSON = genericToJSON (removeFieldLabelPrefix False "dispatchRateImpl")

-- | The data of a failure domain configuration in a cluster
data FailureDomain = FailureDomain
  { -- | The collection of brokers in the same failure domain
    failureDomainBrokers :: Maybe [Text]
  }
  deriving (Show, Eq, Generic)

instance FromJSON FailureDomain where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "failureDomain")

instance ToJSON FailureDomain where
  toJSON = genericToJSON (removeFieldLabelPrefix False "failureDomain")

-- |
data FormatSchema = FormatSchema
  { -- |
    formatSchemaSchemaType :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON FormatSchema where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "formatSchema")

instance ToJSON FormatSchema where
  toJSON = genericToJSON (removeFieldLabelPrefix False "formatSchema")

-- |
data FunctionInstanceStatsData = FunctionInstanceStatsData
  { -- |
    functionInstanceStatsDataOneMin :: Maybe FunctionInstanceStatsDataBase,
    -- |
    functionInstanceStatsDataLastInvocation :: Maybe Integer,
    -- |
    functionInstanceStatsDataUserMetrics :: Maybe (Map.Map String Double),
    -- |
    functionInstanceStatsDataReceivedTotal :: Maybe Integer,
    -- |
    functionInstanceStatsDataProcessedSuccessfullyTotal :: Maybe Integer,
    -- |
    functionInstanceStatsDataSystemExceptionsTotal :: Maybe Integer,
    -- |
    functionInstanceStatsDataUserExceptionsTotal :: Maybe Integer,
    -- |
    functionInstanceStatsDataAvgProcessLatency :: Maybe Double
  }
  deriving (Show, Eq, Generic)

instance FromJSON FunctionInstanceStatsData where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "functionInstanceStatsData")

instance ToJSON FunctionInstanceStatsData where
  toJSON = genericToJSON (removeFieldLabelPrefix False "functionInstanceStatsData")

-- |
data FunctionInstanceStatsDataBase = FunctionInstanceStatsDataBase
  { -- |
    functionInstanceStatsDataBaseReceivedTotal :: Maybe Integer,
    -- |
    functionInstanceStatsDataBaseProcessedSuccessfullyTotal :: Maybe Integer,
    -- |
    functionInstanceStatsDataBaseSystemExceptionsTotal :: Maybe Integer,
    -- |
    functionInstanceStatsDataBaseUserExceptionsTotal :: Maybe Integer,
    -- |
    functionInstanceStatsDataBaseAvgProcessLatency :: Maybe Double
  }
  deriving (Show, Eq, Generic)

instance FromJSON FunctionInstanceStatsDataBase where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "functionInstanceStatsDataBase")

instance ToJSON FunctionInstanceStatsDataBase where
  toJSON = genericToJSON (removeFieldLabelPrefix False "functionInstanceStatsDataBase")

-- |
data Functions = Functions
  { -- |
    functionsListOfConnectors :: Maybe [ConnectorDefinition]
  }
  deriving (Show, Eq, Generic)

instance FromJSON Functions where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "functions")

instance ToJSON Functions where
  toJSON = genericToJSON (removeFieldLabelPrefix False "functions")

-- |
data FunctionsV2 = FunctionsV2
  { -- |
    functionsV2ListOfConnectors :: Maybe [ConnectorDefinition]
  }
  deriving (Show, Eq, Generic)

instance FromJSON FunctionsV2 where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "functionsV2")

instance ToJSON FunctionsV2 where
  toJSON = genericToJSON (removeFieldLabelPrefix False "functionsV2")

-- |
data FunctionsV2WorkerService = FunctionsV2WorkerService
  { -- |
    functionsV2WorkerServiceListOfConnectors :: Maybe [ConnectorDefinition]
  }
  deriving (Show, Eq, Generic)

instance FromJSON FunctionsV2WorkerService where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "functionsV2WorkerService")

instance ToJSON FunctionsV2WorkerService where
  toJSON = genericToJSON (removeFieldLabelPrefix False "functionsV2WorkerService")

-- |
data FunctionsWorkerService = FunctionsWorkerService
  { -- |
    functionsWorkerServiceListOfConnectors :: Maybe [ConnectorDefinition]
  }
  deriving (Show, Eq, Generic)

instance FromJSON FunctionsWorkerService where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "functionsWorkerService")

instance ToJSON FunctionsWorkerService where
  toJSON = genericToJSON (removeFieldLabelPrefix False "functionsWorkerService")

-- |
data GetAllVersionsSchemaResponse = GetAllVersionsSchemaResponse
  { -- |
    getAllVersionsSchemaResponseGetSchemaResponses :: Maybe [GetSchemaResponse]
  }
  deriving (Show, Eq, Generic)

instance FromJSON GetAllVersionsSchemaResponse where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "getAllVersionsSchemaResponse")

instance ToJSON GetAllVersionsSchemaResponse where
  toJSON = genericToJSON (removeFieldLabelPrefix False "getAllVersionsSchemaResponse")

-- |
data GetSchemaResponse = GetSchemaResponse
  { -- |
    getSchemaResponseVersion :: Maybe Integer,
    -- |
    getSchemaResponseType :: Maybe Text,
    -- |
    getSchemaResponseTimestamp :: Maybe Integer,
    -- |
    getSchemaResponseData :: Maybe Text,
    -- |
    getSchemaResponseProperties :: Maybe (Map.Map String Text)
  }
  deriving (Show, Eq, Generic)

instance FromJSON GetSchemaResponse where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "getSchemaResponse")

instance ToJSON GetSchemaResponse where
  toJSON = genericToJSON (removeFieldLabelPrefix False "getSchemaResponse")

-- |
data InactiveTopicPolicies = InactiveTopicPolicies
  { -- |
    inactiveTopicPoliciesInactiveTopicDeleteMode :: Maybe Text,
    -- |
    inactiveTopicPoliciesMaxInactiveDurationSeconds :: Maybe Int,
    -- |
    inactiveTopicPoliciesDeleteWhileInactive :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON InactiveTopicPolicies where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "inactiveTopicPolicies")

instance ToJSON InactiveTopicPolicies where
  toJSON = genericToJSON (removeFieldLabelPrefix False "inactiveTopicPolicies")

-- |
data InternalConfigurationData = InternalConfigurationData
  { -- |
    internalConfigurationDataZookeeperServers :: Maybe Text,
    -- |
    internalConfigurationDataConfigurationStoreServers :: Maybe Text,
    -- |
    internalConfigurationDataLedgersRootPath :: Maybe Text,
    -- |
    internalConfigurationDataBookkeeperMetadataServiceUri :: Maybe Text,
    -- |
    internalConfigurationDataStateStorageServiceUrl :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON InternalConfigurationData where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "internalConfigurationData")

instance ToJSON InternalConfigurationData where
  toJSON = genericToJSON (removeFieldLabelPrefix False "internalConfigurationData")

-- |
data IsCompatibilityResponse = IsCompatibilityResponse
  { -- |
    isCompatibilityResponseSchemaCompatibilityStrategy :: Maybe Text,
    -- |
    isCompatibilityResponseCompatibility :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON IsCompatibilityResponse where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "isCompatibilityResponse")

instance ToJSON IsCompatibilityResponse where
  toJSON = genericToJSON (removeFieldLabelPrefix False "isCompatibilityResponse")

-- |
data JavaType = JavaType
  { -- |
    javaTypeContentType :: Maybe JavaType,
    -- |
    javaTypeBindings :: Maybe TypeBindings,
    -- |
    javaTypeConcrete :: Maybe Bool,
    -- |
    javaTypeKeyType :: Maybe JavaType,
    -- |
    javaTypeArrayType :: Maybe Bool,
    -- |
    javaTypeThrowable :: Maybe Bool,
    -- |
    javaTypeJavaLangObject :: Maybe Bool,
    -- |
    javaTypeEnumType :: Maybe Bool,
    -- |
    javaTypeContainerType :: Maybe Bool,
    -- |
    javaTypeValueHandler :: Maybe Value,
    -- |
    javaTypeTypeHandler :: Maybe Value,
    -- |
    javaTypeCollectionLikeType :: Maybe Bool,
    -- |
    javaTypeReferencedType :: Maybe JavaType,
    -- |
    javaTypeSuperClass :: Maybe JavaType,
    -- |
    javaTypeContentValueHandler :: Maybe Value,
    -- |
    javaTypeContentTypeHandler :: Maybe Value,
    -- |
    javaTypeErasedSignature :: Maybe Text,
    -- |
    javaTypeMapLikeType :: Maybe Bool,
    -- |
    javaTypeInterface :: Maybe Bool,
    -- |
    javaTypePrimitive :: Maybe Bool,
    -- |
    javaTypeInterfaces :: Maybe [JavaType],
    -- |
    javaTypeGenericSignature :: Maybe Text,
    -- |
    javaTypeFinal :: Maybe Bool,
    -- |
    javaTypeAbstract :: Maybe Bool,
    -- |
    javaTypeTypeName :: Maybe Text,
    -- |
    javaTypeReferenceType :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON JavaType where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "javaType")

instance ToJSON JavaType where
  toJSON = genericToJSON (removeFieldLabelPrefix False "javaType")

-- |
data JsonFactory = JsonFactory
  { -- |
    jsonFactoryCodec :: Maybe ObjectCodec,
    -- |
    jsonFactoryFormatName :: Maybe Text,
    -- |
    jsonFactoryInputDecorator :: Maybe Value,
    -- |
    jsonFactoryOutputDecorator :: Maybe Value,
    -- |
    jsonFactoryRootValueSeparator :: Maybe Text,
    -- |
    jsonFactoryCharacterEscapes :: Maybe CharacterEscapes
  }
  deriving (Show, Eq, Generic)

instance FromJSON JsonFactory where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "jsonFactory")

instance ToJSON JsonFactory where
  toJSON = genericToJSON (removeFieldLabelPrefix False "jsonFactory")

-- |
data JsonGenerator = JsonGenerator
  { -- |
    jsonGeneratorClosed :: Maybe Bool,
    -- |
    jsonGeneratorSchema :: Maybe FormatSchema,
    -- |
    jsonGeneratorCodec :: Maybe ObjectCodec,
    -- |
    jsonGeneratorPrettyPrinter :: Maybe Value,
    -- |
    jsonGeneratorFeatureMask :: Maybe Int,
    -- |
    jsonGeneratorFormatFeatures :: Maybe Int,
    -- |
    jsonGeneratorCurrentValue :: Maybe Value,
    -- |
    jsonGeneratorHighestEscapedChar :: Maybe Int,
    -- |
    jsonGeneratorCharacterEscapes :: Maybe CharacterEscapes,
    -- |
    jsonGeneratorOutputTarget :: Maybe Value,
    -- |
    jsonGeneratorOutputBuffered :: Maybe Int,
    -- |
    jsonGeneratorOutputContext :: Maybe JsonStreamContext
  }
  deriving (Show, Eq, Generic)

instance FromJSON JsonGenerator where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "jsonGenerator")

instance ToJSON JsonGenerator where
  toJSON = genericToJSON (removeFieldLabelPrefix False "jsonGenerator")

-- |
data JsonLocation = JsonLocation
  { -- |
    jsonLocationByteOffset :: Maybe Integer,
    -- |
    jsonLocationSourceRef :: Maybe Value,
    -- |
    jsonLocationLineNr :: Maybe Int,
    -- |
    jsonLocationColumnNr :: Maybe Int,
    -- |
    jsonLocationCharOffset :: Maybe Integer
  }
  deriving (Show, Eq, Generic)

instance FromJSON JsonLocation where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "jsonLocation")

instance ToJSON JsonLocation where
  toJSON = genericToJSON (removeFieldLabelPrefix False "jsonLocation")

-- |
data JsonParser = JsonParser
  { -- |
    jsonParserTextLength :: Maybe Int,
    -- |
    jsonParserTextCharacters :: Maybe [Text],
    -- |
    jsonParserText :: Maybe Text,
    -- |
    jsonParserBooleanValue :: Maybe Bool,
    -- |
    jsonParserByteValue :: Maybe Text,
    -- |
    jsonParserDoubleValue :: Maybe Double,
    -- |
    jsonParserFloatValue :: Maybe Float,
    -- |
    jsonParserLongValue :: Maybe Integer,
    -- |
    jsonParserShortValue :: Maybe Int,
    -- |
    jsonParserClosed :: Maybe Bool,
    -- |
    jsonParserIntValue :: Maybe Int,
    -- |
    jsonParserTypeId :: Maybe Value,
    -- |
    jsonParserSchema :: Maybe FormatSchema,
    -- |
    jsonParserTokenLocation :: Maybe JsonLocation,
    -- |
    jsonParserCodec :: Maybe ObjectCodec,
    -- |
    jsonParserCurrentToken :: Maybe Text,
    -- |
    jsonParserCurrentName :: Maybe Text,
    -- |
    jsonParserFeatureMask :: Maybe Int,
    -- |
    jsonParserFormatFeatures :: Maybe Int,
    -- |
    jsonParserCurrentTokenId :: Maybe Int,
    -- |
    jsonParserParsingContext :: Maybe JsonStreamContext,
    -- |
    jsonParserCurrentLocation :: Maybe JsonLocation,
    -- |
    jsonParserExpectedStartArrayToken :: Maybe Bool,
    -- |
    jsonParserExpectedStartObjectToken :: Maybe Bool,
    -- |
    jsonParserLastClearedToken :: Maybe Text,
    -- |
    jsonParserTextOffset :: Maybe Int,
    -- |
    jsonParserNumberValue :: Maybe Value,
    -- |
    jsonParserNumberType :: Maybe Text,
    -- |
    jsonParserBigIntegerValue :: Maybe Int,
    -- |
    jsonParserDecimalValue :: Maybe Double,
    -- |
    jsonParserEmbeddedObject :: Maybe Value,
    -- |
    jsonParserBinaryValue :: Maybe [Text],
    -- |
    jsonParserValueAsInt :: Maybe Int,
    -- |
    jsonParserValueAsLong :: Maybe Integer,
    -- |
    jsonParserValueAsDouble :: Maybe Double,
    -- |
    jsonParserValueAsBoolean :: Maybe Bool,
    -- |
    jsonParserValueAsString :: Maybe Text,
    -- |
    jsonParserObjectId :: Maybe Value,
    -- |
    jsonParserInputSource :: Maybe Value,
    -- |
    jsonParserCurrentValue :: Maybe Value
  }
  deriving (Show, Eq, Generic)

instance FromJSON JsonParser where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "jsonParser")

instance ToJSON JsonParser where
  toJSON = genericToJSON (removeFieldLabelPrefix False "jsonParser")

-- |
data JsonSerializer = JsonSerializer
  { -- |
    jsonSerializerUnwrappingSerializer :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON JsonSerializer where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "jsonSerializer")

instance ToJSON JsonSerializer where
  toJSON = genericToJSON (removeFieldLabelPrefix False "jsonSerializer")

-- |
data JsonSerializerObject = JsonSerializerObject
  { -- |
    jsonSerializerObjectUnwrappingSerializer :: Maybe Bool,
    -- |
    jsonSerializerObjectDelegatee :: Maybe JsonSerializerObject
  }
  deriving (Show, Eq, Generic)

instance FromJSON JsonSerializerObject where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "jsonSerializerObject")

instance ToJSON JsonSerializerObject where
  toJSON = genericToJSON (removeFieldLabelPrefix False "jsonSerializerObject")

-- |
data JsonStreamContext = JsonStreamContext
  { -- |
    jsonStreamContextCurrentName :: Maybe Text,
    -- |
    jsonStreamContextCurrentValue :: Maybe Value,
    -- |
    jsonStreamContextEntryCount :: Maybe Int,
    -- |
    jsonStreamContextTypeDesc :: Maybe Text,
    -- |
    jsonStreamContextCurrentIndex :: Maybe Int,
    -- |
    jsonStreamContextParent :: Maybe JsonStreamContext
  }
  deriving (Show, Eq, Generic)

instance FromJSON JsonStreamContext where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "jsonStreamContext")

instance ToJSON JsonStreamContext where
  toJSON = genericToJSON (removeFieldLabelPrefix False "jsonStreamContext")

-- |
data KubernetesContainerFactory = KubernetesContainerFactory
  { -- |
    kubernetesContainerFactoryK8Uri :: Maybe Text,
    -- |
    kubernetesContainerFactoryJobNamespace :: Maybe Text,
    -- |
    kubernetesContainerFactoryJobName :: Maybe Text,
    -- |
    kubernetesContainerFactoryPulsarDockerImageName :: Maybe Text,
    -- |
    kubernetesContainerFactoryFunctionDockerImages :: Maybe (Map.Map String Text),
    -- |
    kubernetesContainerFactoryImagePullPolicy :: Maybe Text,
    -- |
    kubernetesContainerFactoryPulsarRootDir :: Maybe Text,
    -- |
    kubernetesContainerFactoryConfigAdminCLI :: Maybe Text,
    -- |
    kubernetesContainerFactorySubmittingInsidePod :: Maybe Bool,
    -- |
    kubernetesContainerFactoryPulsarServiceUrl :: Maybe Text,
    -- |
    kubernetesContainerFactoryPulsarAdminUrl :: Maybe Text,
    -- |
    kubernetesContainerFactoryInstallUserCodeDependencies :: Maybe Bool,
    -- |
    kubernetesContainerFactoryPythonDependencyRepository :: Maybe Text,
    -- |
    kubernetesContainerFactoryPythonExtraDependencyRepository :: Maybe Text,
    -- |
    kubernetesContainerFactoryExtraFunctionDependenciesDir :: Maybe Text,
    -- |
    kubernetesContainerFactoryCustomLabels :: Maybe (Map.Map String Text),
    -- |
    kubernetesContainerFactoryExpectedMetricsCollectionInterval :: Maybe Int,
    -- |
    kubernetesContainerFactoryChangeConfigMap :: Maybe Text,
    -- |
    kubernetesContainerFactoryChangeConfigMapNamespace :: Maybe Text,
    -- |
    kubernetesContainerFactoryPercentMemoryPadding :: Maybe Int,
    -- |
    kubernetesContainerFactoryCpuOverCommitRatio :: Maybe Double,
    -- |
    kubernetesContainerFactoryMemoryOverCommitRatio :: Maybe Double,
    -- |
    kubernetesContainerFactoryGrpcPort :: Maybe Int,
    -- |
    kubernetesContainerFactoryMetricsPort :: Maybe Int,
    -- |
    kubernetesContainerFactoryNarExtractionDirectory :: Maybe Text,
    -- |
    kubernetesContainerFactoryFunctionInstanceClassPath :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON KubernetesContainerFactory where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "kubernetesContainerFactory")

instance ToJSON KubernetesContainerFactory where
  toJSON = genericToJSON (removeFieldLabelPrefix False "kubernetesContainerFactory")

-- |
data LedgerDetails = LedgerDetails
  { -- |
    ledgerDetailsEntries :: Maybe Integer,
    -- |
    ledgerDetailsTimestamp :: Maybe Integer,
    -- |
    ledgerDetailsSize :: Maybe Integer,
    -- |
    ledgerDetailsLedgerId :: Maybe Integer
  }
  deriving (Show, Eq, Generic)

instance FromJSON LedgerDetails where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "ledgerDetails")

instance ToJSON LedgerDetails where
  toJSON = genericToJSON (removeFieldLabelPrefix False "ledgerDetails")

-- |
data LedgerInfo = LedgerInfo
  { -- |
    ledgerInfoLedgerId :: Maybe Integer,
    -- |
    ledgerInfoEntries :: Maybe Integer,
    -- |
    ledgerInfoSize :: Maybe Integer,
    -- |
    ledgerInfoOffloaded :: Maybe Bool,
    -- |
    ledgerInfoMetadata :: Maybe Text,
    -- |
    ledgerInfoUnderReplicated :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON LedgerInfo where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "ledgerInfo")

instance ToJSON LedgerInfo where
  toJSON = genericToJSON (removeFieldLabelPrefix False "ledgerInfo")

-- |
data LoadReport = LoadReport
  { -- |
    loadReportName :: Maybe Text,
    -- |
    loadReportBrokerVersionString :: Maybe Text,
    -- |
    loadReportWebServiceUrl :: Maybe Text,
    -- |
    loadReportWebServiceUrlTls :: Maybe Text,
    -- |
    loadReportPulsarServiceUrl :: Maybe Text,
    -- |
    loadReportPulsarServiceUrlTls :: Maybe Text,
    -- |
    loadReportPersistentTopicsEnabled :: Maybe Bool,
    -- |
    loadReportNonPersistentTopicsEnabled :: Maybe Bool,
    -- |
    loadReportTimestamp :: Maybe Integer,
    -- |
    loadReportMsgRateIn :: Maybe Double,
    -- |
    loadReportMsgRateOut :: Maybe Double,
    -- |
    loadReportNumTopics :: Maybe Int,
    -- |
    loadReportNumConsumers :: Maybe Int,
    -- |
    loadReportNumProducers :: Maybe Int,
    -- |
    loadReportNumBundles :: Maybe Int,
    -- |
    loadReportProtocols :: Maybe (Map.Map String Text),
    -- |
    loadReportSystemResourceUsage :: Maybe SystemResourceUsage,
    -- |
    loadReportBundleStats :: Maybe (Map.Map String NamespaceBundleStats),
    -- |
    loadReportBundleGains :: Maybe [Text],
    -- |
    loadReportBundleLosses :: Maybe [Text],
    -- |
    loadReportAllocatedCPU :: Maybe Double,
    -- |
    loadReportAllocatedMemory :: Maybe Double,
    -- |
    loadReportAllocatedBandwidthIn :: Maybe Double,
    -- |
    loadReportAllocatedBandwidthOut :: Maybe Double,
    -- |
    loadReportAllocatedMsgRateIn :: Maybe Double,
    -- |
    loadReportAllocatedMsgRateOut :: Maybe Double,
    -- |
    loadReportPreAllocatedCPU :: Maybe Double,
    -- |
    loadReportPreAllocatedMemory :: Maybe Double,
    -- |
    loadReportPreAllocatedBandwidthIn :: Maybe Double,
    -- |
    loadReportPreAllocatedBandwidthOut :: Maybe Double,
    -- |
    loadReportPreAllocatedMsgRateIn :: Maybe Double,
    -- |
    loadReportPreAllocatedMsgRateOut :: Maybe Double,
    -- |
    loadReportBandwidthIn :: Maybe ResourceUsage,
    -- |
    loadReportBandwidthOut :: Maybe ResourceUsage,
    -- |
    loadReportMemory :: Maybe ResourceUsage,
    -- |
    loadReportMsgThroughputIn :: Maybe Double,
    -- |
    loadReportLoadReportType :: Maybe Text,
    -- |
    loadReportUnderLoaded :: Maybe Bool,
    -- |
    loadReportOverLoaded :: Maybe Bool,
    -- |
    loadReportCpu :: Maybe ResourceUsage,
    -- |
    loadReportDirectMemory :: Maybe ResourceUsage,
    -- |
    loadReportLastUpdate :: Maybe Integer,
    -- |
    loadReportMsgThroughputOut :: Maybe Double
  }
  deriving (Show, Eq, Generic)

instance FromJSON LoadReport where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "loadReport")

instance ToJSON LoadReport where
  toJSON = genericToJSON (removeFieldLabelPrefix False "loadReport")

-- |
data Locale = Locale
  { -- |
    localeDisplayName :: Maybe Text,
    -- |
    localeScript :: Maybe Text,
    -- |
    localeCountry :: Maybe Text,
    -- |
    localeVariant :: Maybe Text,
    -- |
    localeExtensionKeys :: Maybe [Text],
    -- |
    localeUnicodeLocaleAttributes :: Maybe [Text],
    -- |
    localeUnicodeLocaleKeys :: Maybe [Text],
    -- |
    localeIso3Language :: Maybe Text,
    -- |
    localeIso3Country :: Maybe Text,
    -- |
    localeDisplayLanguage :: Maybe Text,
    -- |
    localeDisplayScript :: Maybe Text,
    -- |
    localeDisplayCountry :: Maybe Text,
    -- |
    localeDisplayVariant :: Maybe Text,
    -- |
    localeLanguage :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON Locale where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "locale")

instance ToJSON Locale where
  toJSON = genericToJSON (removeFieldLabelPrefix False "locale")

-- |
data LongRunningProcessStatus = LongRunningProcessStatus
  { -- |
    longRunningProcessStatusStatus :: Maybe Text,
    -- |
    longRunningProcessStatusLastError :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON LongRunningProcessStatus where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "longRunningProcessStatus")

instance ToJSON LongRunningProcessStatus where
  toJSON = genericToJSON (removeFieldLabelPrefix False "longRunningProcessStatus")

-- |
data LongSchemaVersion = LongSchemaVersion
  { -- |
    longSchemaVersionVersion :: Maybe Integer
  }
  deriving (Show, Eq, Generic)

instance FromJSON LongSchemaVersion where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "longSchemaVersion")

instance ToJSON LongSchemaVersion where
  toJSON = genericToJSON (removeFieldLabelPrefix False "longSchemaVersion")

-- |
data MemoryLimit = MemoryLimit
  { -- |
    memoryLimitAbsoluteValue :: Maybe Integer,
    -- |
    memoryLimitPercentOfMaxDirectMemory :: Maybe Double
  }
  deriving (Show, Eq, Generic)

instance FromJSON MemoryLimit where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "memoryLimit")

instance ToJSON MemoryLimit where
  toJSON = genericToJSON (removeFieldLabelPrefix False "memoryLimit")

-- |
data MessageIdImpl = MessageIdImpl
  { -- |
    messageIdImplLedgerId :: Maybe Integer,
    -- |
    messageIdImplEntryId :: Maybe Integer,
    -- |
    messageIdImplPartitionIndex :: Maybe Int
  }
  deriving (Show, Eq, Generic)

instance FromJSON MessageIdImpl where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "messageIdImpl")

instance ToJSON MessageIdImpl where
  toJSON = genericToJSON (removeFieldLabelPrefix False "messageIdImpl")

-- |
data Metrics = Metrics
  { -- |
    metricsMetrics :: Maybe (Map.Map String Value),
    -- |
    metricsDimensions :: Maybe (Map.Map String Text)
  }
  deriving (Show, Eq, Generic)

instance FromJSON Metrics where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "metrics")

instance ToJSON Metrics where
  toJSON = genericToJSON (removeFieldLabelPrefix False "metrics")

-- |
data Module = Module
  { -- |
    moduleLayer :: Maybe Value,
    -- |
    moduleName :: Maybe Text,
    -- |
    moduleDescriptor :: Maybe ModuleDescriptor,
    -- |
    moduleClassLoader :: Maybe ClassLoader,
    -- |
    moduleAnnotations :: Maybe [Value],
    -- |
    moduleDeclaredAnnotations :: Maybe [Value],
    -- |
    moduleNamed :: Maybe Bool,
    -- |
    modulePackages :: Maybe [Text]
  }
  deriving (Show, Eq, Generic)

instance FromJSON Module where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "module")

instance ToJSON Module where
  toJSON = genericToJSON (removeFieldLabelPrefix False "module")

-- |
data ModuleDescriptor = ModuleDescriptor
  { -- |
    moduleDescriptorOpen :: Maybe Bool,
    -- |
    moduleDescriptorAutomatic :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON ModuleDescriptor where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "moduleDescriptor")

instance ToJSON ModuleDescriptor where
  toJSON = genericToJSON (removeFieldLabelPrefix False "moduleDescriptor")

-- |
data NamespaceBundleStats = NamespaceBundleStats
  { -- |
    namespaceBundleStatsMsgRateIn :: Maybe Double,
    -- |
    namespaceBundleStatsMsgThroughputIn :: Maybe Double,
    -- |
    namespaceBundleStatsMsgRateOut :: Maybe Double,
    -- |
    namespaceBundleStatsMsgThroughputOut :: Maybe Double,
    -- |
    namespaceBundleStatsConsumerCount :: Maybe Int,
    -- |
    namespaceBundleStatsProducerCount :: Maybe Int,
    -- |
    namespaceBundleStatsTopics :: Maybe Integer,
    -- |
    namespaceBundleStatsCacheSize :: Maybe Integer
  }
  deriving (Show, Eq, Generic)

instance FromJSON NamespaceBundleStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "namespaceBundleStats")

instance ToJSON NamespaceBundleStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "namespaceBundleStats")

-- | The data of namespace isolation configuration
data NamespaceIsolationData = NamespaceIsolationData
  { -- | The list of namespaces to apply this namespace isolation data
    namespaceIsolationDataNamespaces :: Maybe [Text],
    -- | The list of secondary brokers for serving the list of namespaces in this isolation policy
    namespaceIsolationDataPrimary :: Maybe [Text],
    -- |
    namespaceIsolationDataAutoUnderscorefailoverUnderscorepolicy :: Maybe AutoFailoverPolicyData
  }
  deriving (Show, Eq, Generic)

instance FromJSON NamespaceIsolationData where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "namespaceIsolationData")

instance ToJSON NamespaceIsolationData where
  toJSON = genericToJSON (removeFieldLabelPrefix False "namespaceIsolationData")

-- |
data NamespaceOwnershipStatus = NamespaceOwnershipStatus
  { -- |
    namespaceOwnershipStatusBrokerUnderscoreassignment :: Maybe Text,
    -- |
    namespaceOwnershipStatusIsUnderscorecontrolled :: Maybe Bool,
    -- |
    namespaceOwnershipStatusIsUnderscoreactive :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON NamespaceOwnershipStatus where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "namespaceOwnershipStatus")

instance ToJSON NamespaceOwnershipStatus where
  toJSON = genericToJSON (removeFieldLabelPrefix False "namespaceOwnershipStatus")

-- |
data NonPersistentPublisherStats = NonPersistentPublisherStats
  { -- |
    nonPersistentPublisherStatsMsgDropRate :: Maybe Double,
    -- |
    nonPersistentPublisherStatsMsgRateIn :: Maybe Double,
    -- |
    nonPersistentPublisherStatsMsgThroughputIn :: Maybe Double,
    -- |
    nonPersistentPublisherStatsAverageMsgSize :: Maybe Double,
    -- |
    nonPersistentPublisherStatsMetadata :: Maybe (Map.Map String Text),
    -- |
    nonPersistentPublisherStatsAccessMode :: Maybe Text,
    -- |
    nonPersistentPublisherStatsChunkedMessageRate :: Maybe Double,
    -- |
    nonPersistentPublisherStatsProducerId :: Maybe Integer,
    -- |
    nonPersistentPublisherStatsConnectedSince :: Maybe Text,
    -- |
    nonPersistentPublisherStatsClientVersion :: Maybe Text,
    -- |
    nonPersistentPublisherStatsProducerName :: Maybe Text,
    -- |
    nonPersistentPublisherStatsAddress :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON NonPersistentPublisherStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "nonPersistentPublisherStats")

instance ToJSON NonPersistentPublisherStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "nonPersistentPublisherStats")

-- |
data NonPersistentReplicatorStats = NonPersistentReplicatorStats
  { -- |
    nonPersistentReplicatorStatsMsgDropRate :: Maybe Double,
    -- |
    nonPersistentReplicatorStatsMsgRateIn :: Maybe Double,
    -- |
    nonPersistentReplicatorStatsMsgRateOut :: Maybe Double,
    -- |
    nonPersistentReplicatorStatsMsgThroughputIn :: Maybe Double,
    -- |
    nonPersistentReplicatorStatsConnected :: Maybe Bool,
    -- |
    nonPersistentReplicatorStatsMsgRateExpired :: Maybe Double,
    -- |
    nonPersistentReplicatorStatsReplicationBacklog :: Maybe Integer,
    -- |
    nonPersistentReplicatorStatsReplicationDelayInSeconds :: Maybe Integer,
    -- |
    nonPersistentReplicatorStatsInboundConnection :: Maybe Text,
    -- |
    nonPersistentReplicatorStatsInboundConnectedSince :: Maybe Text,
    -- |
    nonPersistentReplicatorStatsOutboundConnection :: Maybe Text,
    -- |
    nonPersistentReplicatorStatsOutboundConnectedSince :: Maybe Text,
    -- |
    nonPersistentReplicatorStatsMsgThroughputOut :: Maybe Double
  }
  deriving (Show, Eq, Generic)

instance FromJSON NonPersistentReplicatorStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "nonPersistentReplicatorStats")

instance ToJSON NonPersistentReplicatorStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "nonPersistentReplicatorStats")

-- |
data NonPersistentSubscriptionStats = NonPersistentSubscriptionStats
  { -- |
    nonPersistentSubscriptionStatsMsgDropRate :: Maybe Double,
    -- |
    nonPersistentSubscriptionStatsConsumers :: Maybe [ConsumerStats],
    -- |
    nonPersistentSubscriptionStatsMsgRateOut :: Maybe Double,
    -- |
    nonPersistentSubscriptionStatsReplicated :: Maybe Bool,
    -- |
    nonPersistentSubscriptionStatsBytesOutCounter :: Maybe Integer,
    -- |
    nonPersistentSubscriptionStatsNonContiguousDeletedMessagesRangesSerializedSize :: Maybe Int,
    -- |
    nonPersistentSubscriptionStatsMsgOutCounter :: Maybe Integer,
    -- |
    nonPersistentSubscriptionStatsBacklogSize :: Maybe Integer,
    -- |
    nonPersistentSubscriptionStatsNonContiguousDeletedMessagesRanges :: Maybe Int,
    -- |
    nonPersistentSubscriptionStatsChunkedMessageRate :: Maybe Int,
    -- |
    nonPersistentSubscriptionStatsMsgRateExpired :: Maybe Double,
    -- |
    nonPersistentSubscriptionStatsMsgBacklog :: Maybe Integer,
    -- |
    nonPersistentSubscriptionStatsMsgRateRedeliver :: Maybe Double,
    -- |
    nonPersistentSubscriptionStatsMsgBacklogNoDelayed :: Maybe Integer,
    -- |
    nonPersistentSubscriptionStatsBlockedSubscriptionOnUnackedMsgs :: Maybe Bool,
    -- |
    nonPersistentSubscriptionStatsMsgDelayed :: Maybe Integer,
    -- |
    nonPersistentSubscriptionStatsUnackedMessages :: Maybe Integer,
    -- |
    nonPersistentSubscriptionStatsActiveConsumerName :: Maybe Text,
    -- |
    nonPersistentSubscriptionStatsTotalMsgExpired :: Maybe Integer,
    -- |
    nonPersistentSubscriptionStatsLastExpireTimestamp :: Maybe Integer,
    -- |
    nonPersistentSubscriptionStatsLastConsumedFlowTimestamp :: Maybe Integer,
    -- |
    nonPersistentSubscriptionStatsLastConsumedTimestamp :: Maybe Integer,
    -- |
    nonPersistentSubscriptionStatsLastAckedTimestamp :: Maybe Integer,
    -- |
    nonPersistentSubscriptionStatsLastMarkDeleteAdvancedTimestamp :: Maybe Integer,
    -- |
    nonPersistentSubscriptionStatsConsumersAfterMarkDeletePosition :: Maybe (Map.Map String Text),
    -- |
    nonPersistentSubscriptionStatsDurable :: Maybe Bool,
    -- |
    nonPersistentSubscriptionStatsMsgThroughputOut :: Maybe Double,
    -- |
    nonPersistentSubscriptionStatsType :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON NonPersistentSubscriptionStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "nonPersistentSubscriptionStats")

instance ToJSON NonPersistentSubscriptionStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "nonPersistentSubscriptionStats")

-- |
data NonPersistentTopicStats = NonPersistentTopicStats
  { -- |
    nonPersistentTopicStatsPublishers :: Maybe [NonPersistentPublisherStats],
    -- |
    nonPersistentTopicStatsReplication :: Maybe (Map.Map String NonPersistentReplicatorStats),
    -- |
    nonPersistentTopicStatsMsgDropRate :: Maybe Double,
    -- |
    nonPersistentTopicStatsSubscriptions :: Maybe (Map.Map String NonPersistentSubscriptionStats),
    -- |
    nonPersistentTopicStatsOffloadedStorageSize :: Maybe Integer,
    -- |
    nonPersistentTopicStatsMsgRateIn :: Maybe Double,
    -- |
    nonPersistentTopicStatsMsgRateOut :: Maybe Double,
    -- |
    nonPersistentTopicStatsMsgThroughputIn :: Maybe Double,
    -- |
    nonPersistentTopicStatsBytesInCounter :: Maybe Integer,
    -- |
    nonPersistentTopicStatsMsgInCounter :: Maybe Integer,
    -- |
    nonPersistentTopicStatsBytesOutCounter :: Maybe Integer,
    -- |
    nonPersistentTopicStatsNonContiguousDeletedMessagesRangesSerializedSize :: Maybe Int,
    -- |
    nonPersistentTopicStatsMsgOutCounter :: Maybe Integer,
    -- |
    nonPersistentTopicStatsAverageMsgSize :: Maybe Double,
    -- |
    nonPersistentTopicStatsStorageSize :: Maybe Integer,
    -- |
    nonPersistentTopicStatsBacklogSize :: Maybe Integer,
    -- |
    nonPersistentTopicStatsDeduplicationStatus :: Maybe Text,
    -- |
    nonPersistentTopicStatsTopicEpoch :: Maybe Integer,
    -- |
    nonPersistentTopicStatsNonContiguousDeletedMessagesRanges :: Maybe Int,
    -- |
    nonPersistentTopicStatsCompaction :: Maybe CompactionStats,
    -- |
    nonPersistentTopicStatsWaitingPublishers :: Maybe Int,
    -- |
    nonPersistentTopicStatsMsgChunkPublished :: Maybe Bool,
    -- |
    nonPersistentTopicStatsMsgThroughputOut :: Maybe Double
  }
  deriving (Show, Eq, Generic)

instance FromJSON NonPersistentTopicStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "nonPersistentTopicStats")

instance ToJSON NonPersistentTopicStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "nonPersistentTopicStats")

-- |
data NumberFormat = NumberFormat
  { -- |
    numberFormatGroupingUsed :: Maybe Bool,
    -- |
    numberFormatParseIntegerOnly :: Maybe Bool,
    -- |
    numberFormatMaximumIntegerDigits :: Maybe Int,
    -- |
    numberFormatMinimumIntegerDigits :: Maybe Int,
    -- |
    numberFormatMaximumFractionDigits :: Maybe Int,
    -- |
    numberFormatMinimumFractionDigits :: Maybe Int,
    -- |
    numberFormatCurrency :: Maybe Currency,
    -- |
    numberFormatRoundingMode :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON NumberFormat where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "numberFormat")

instance ToJSON NumberFormat where
  toJSON = genericToJSON (removeFieldLabelPrefix False "numberFormat")

-- |
data ObjectCodec = ObjectCodec
  { -- |
    objectCodecJsonFactory :: Maybe JsonFactory,
    -- |
    objectCodecFactory :: Maybe JsonFactory
  }
  deriving (Show, Eq, Generic)

instance FromJSON ObjectCodec where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "objectCodec")

instance ToJSON ObjectCodec where
  toJSON = genericToJSON (removeFieldLabelPrefix False "objectCodec")

-- |
data ObjectMapper = ObjectMapper
  { -- |
    objectMapperTypeFactory :: Maybe TypeFactory,
    -- |
    objectMapperSerializationConfig :: Maybe SerializationConfig,
    -- |
    objectMapperDeserializationConfig :: Maybe DeserializationConfig,
    -- |
    objectMapperDeserializationContext :: Maybe DeserializationContext,
    -- |
    objectMapperSerializerFactory :: Maybe Value,
    -- |
    objectMapperSerializerProvider :: Maybe SerializerProvider,
    -- |
    objectMapperSerializerProviderInstance :: Maybe SerializerProvider,
    -- |
    objectMapperVisibilityChecker :: Maybe Value,
    -- |
    objectMapperSubtypeResolver :: Maybe Value,
    -- |
    objectMapperPropertyNamingStrategy :: Maybe Value,
    -- |
    objectMapperNodeFactory :: Maybe Value,
    -- |
    objectMapperJsonFactory :: Maybe JsonFactory,
    -- |
    objectMapperDateFormat :: Maybe DateFormat,
    -- |
    objectMapperInjectableValues :: Maybe Value,
    -- |
    objectMapperFactory :: Maybe JsonFactory
  }
  deriving (Show, Eq, Generic)

instance FromJSON ObjectMapper where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "objectMapper")

instance ToJSON ObjectMapper where
  toJSON = genericToJSON (removeFieldLabelPrefix False "objectMapper")

-- |
data OffloadPolicies = OffloadPolicies
  { -- |
    offloadPoliciesFileSystemURI :: Maybe Text,
    -- |
    offloadPoliciesS3ManagedLedgerOffloadBucket :: Maybe Text,
    -- |
    offloadPoliciesS3ManagedLedgerOffloadServiceEndpoint :: Maybe Text,
    -- |
    offloadPoliciesS3ManagedLedgerOffloadMaxBlockSizeInBytes :: Maybe Int,
    -- |
    offloadPoliciesS3ManagedLedgerOffloadReadBufferSizeInBytes :: Maybe Int,
    -- |
    offloadPoliciesS3ManagedLedgerOffloadCredentialId :: Maybe Text,
    -- |
    offloadPoliciesS3ManagedLedgerOffloadCredentialSecret :: Maybe Text,
    -- |
    offloadPoliciesS3ManagedLedgerOffloadRole :: Maybe Text,
    -- |
    offloadPoliciesS3ManagedLedgerOffloadRoleSessionName :: Maybe Text,
    -- |
    offloadPoliciesGcsManagedLedgerOffloadRegion :: Maybe Text,
    -- |
    offloadPoliciesGcsManagedLedgerOffloadBucket :: Maybe Text,
    -- |
    offloadPoliciesGcsManagedLedgerOffloadMaxBlockSizeInBytes :: Maybe Int,
    -- |
    offloadPoliciesGcsManagedLedgerOffloadReadBufferSizeInBytes :: Maybe Int,
    -- |
    offloadPoliciesGcsManagedLedgerOffloadServiceAccountKeyFile :: Maybe Text,
    -- |
    offloadPoliciesFileSystemProfilePath :: Maybe Text,
    -- |
    offloadPoliciesManagedLedgerOffloadBucket :: Maybe Text,
    -- |
    offloadPoliciesManagedLedgerOffloadRegion :: Maybe Text,
    -- |
    offloadPoliciesManagedLedgerOffloadServiceEndpoint :: Maybe Text,
    -- |
    offloadPoliciesManagedLedgerOffloadMaxBlockSizeInBytes :: Maybe Int,
    -- |
    offloadPoliciesManagedLedgerOffloadReadBufferSizeInBytes :: Maybe Int,
    -- |
    offloadPoliciesManagedLedgerOffloadedReadPriority :: Maybe Text,
    -- |
    offloadPoliciesS3ManagedLedgerOffloadRegion :: Maybe Text,
    -- |
    offloadPoliciesManagedLedgerOffloadThresholdInBytes :: Maybe Integer,
    -- |
    offloadPoliciesManagedLedgerOffloadDeletionLagInMillis :: Maybe Integer,
    -- |
    offloadPoliciesManagedLedgerOffloadDriver :: Maybe Text,
    -- |
    offloadPoliciesOffloadersDirectory :: Maybe Text,
    -- |
    offloadPoliciesManagedLedgerOffloadMaxThreads :: Maybe Int,
    -- |
    offloadPoliciesManagedLedgerOffloadPrefetchRounds :: Maybe Int
  }
  deriving (Show, Eq, Generic)

instance FromJSON OffloadPolicies where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "offloadPolicies")

instance ToJSON OffloadPolicies where
  toJSON = genericToJSON (removeFieldLabelPrefix False "offloadPolicies")

-- |
data OffloadPoliciesImpl = OffloadPoliciesImpl
  { -- |
    offloadPoliciesImplOffloadersDirectory :: Maybe Text,
    -- |
    offloadPoliciesImplManagedLedgerOffloadDriver :: Maybe Text,
    -- |
    offloadPoliciesImplManagedLedgerOffloadMaxThreads :: Maybe Int,
    -- |
    offloadPoliciesImplManagedLedgerOffloadPrefetchRounds :: Maybe Int,
    -- |
    offloadPoliciesImplManagedLedgerOffloadThresholdInBytes :: Maybe Integer,
    -- |
    offloadPoliciesImplManagedLedgerOffloadDeletionLagInMillis :: Maybe Integer,
    -- |
    offloadPoliciesImplManagedLedgerOffloadedReadPriority :: Maybe Text,
    -- |
    offloadPoliciesImplS3ManagedLedgerOffloadRegion :: Maybe Text,
    -- |
    offloadPoliciesImplS3ManagedLedgerOffloadBucket :: Maybe Text,
    -- |
    offloadPoliciesImplS3ManagedLedgerOffloadServiceEndpoint :: Maybe Text,
    -- |
    offloadPoliciesImplS3ManagedLedgerOffloadMaxBlockSizeInBytes :: Maybe Int,
    -- |
    offloadPoliciesImplS3ManagedLedgerOffloadReadBufferSizeInBytes :: Maybe Int,
    -- |
    offloadPoliciesImplS3ManagedLedgerOffloadCredentialId :: Maybe Text,
    -- |
    offloadPoliciesImplS3ManagedLedgerOffloadCredentialSecret :: Maybe Text,
    -- |
    offloadPoliciesImplS3ManagedLedgerOffloadRole :: Maybe Text,
    -- |
    offloadPoliciesImplS3ManagedLedgerOffloadRoleSessionName :: Maybe Text,
    -- |
    offloadPoliciesImplGcsManagedLedgerOffloadRegion :: Maybe Text,
    -- |
    offloadPoliciesImplGcsManagedLedgerOffloadBucket :: Maybe Text,
    -- |
    offloadPoliciesImplGcsManagedLedgerOffloadMaxBlockSizeInBytes :: Maybe Int,
    -- |
    offloadPoliciesImplGcsManagedLedgerOffloadReadBufferSizeInBytes :: Maybe Int,
    -- |
    offloadPoliciesImplGcsManagedLedgerOffloadServiceAccountKeyFile :: Maybe Text,
    -- |
    offloadPoliciesImplFileSystemProfilePath :: Maybe Text,
    -- |
    offloadPoliciesImplFileSystemURI :: Maybe Text,
    -- |
    offloadPoliciesImplManagedLedgerOffloadBucket :: Maybe Text,
    -- |
    offloadPoliciesImplManagedLedgerOffloadRegion :: Maybe Text,
    -- |
    offloadPoliciesImplManagedLedgerOffloadServiceEndpoint :: Maybe Text,
    -- |
    offloadPoliciesImplManagedLedgerOffloadMaxBlockSizeInBytes :: Maybe Int,
    -- |
    offloadPoliciesImplManagedLedgerOffloadReadBufferSizeInBytes :: Maybe Int,
    -- |
    offloadPoliciesImplS3Driver :: Maybe Bool,
    -- |
    offloadPoliciesImplGcsDriver :: Maybe Bool,
    -- |
    offloadPoliciesImplFileSystemDriver :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON OffloadPoliciesImpl where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "offloadPoliciesImpl")

instance ToJSON OffloadPoliciesImpl where
  toJSON = genericToJSON (removeFieldLabelPrefix False "offloadPoliciesImpl")

-- |
data OffloadProcessStatus = OffloadProcessStatus
  { -- |
    offloadProcessStatusStatus :: Maybe Text,
    -- |
    offloadProcessStatusLastError :: Maybe Text,
    -- |
    offloadProcessStatusFirstUnoffloadedMessage :: Maybe Value
  }
  deriving (Show, Eq, Generic)

instance FromJSON OffloadProcessStatus where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "offloadProcessStatus")

instance ToJSON OffloadProcessStatus where
  toJSON = genericToJSON (removeFieldLabelPrefix False "offloadProcessStatus")

-- |
data Package = Package
  { -- |
    packageName :: Maybe Text,
    -- |
    packageSpecificationTitle :: Maybe Text,
    -- |
    packageSpecificationVersion :: Maybe Text,
    -- |
    packageSpecificationVendor :: Maybe Text,
    -- |
    packageImplementationTitle :: Maybe Text,
    -- |
    packageImplementationVersion :: Maybe Text,
    -- |
    packageImplementationVendor :: Maybe Text,
    -- |
    packageAnnotations :: Maybe [Value],
    -- |
    packageDeclaredAnnotations :: Maybe [Value],
    -- |
    packageSealed :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON Package where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "package")

instance ToJSON Package where
  toJSON = genericToJSON (removeFieldLabelPrefix False "package")

-- |
data PartitionedTopicMetadata = PartitionedTopicMetadata
  { -- |
    partitionedTopicMetadataPartitions :: Maybe Int
  }
  deriving (Show, Eq, Generic)

instance FromJSON PartitionedTopicMetadata where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "partitionedTopicMetadata")

instance ToJSON PartitionedTopicMetadata where
  toJSON = genericToJSON (removeFieldLabelPrefix False "partitionedTopicMetadata")

-- |
data PendingBookieOpsStats = PendingBookieOpsStats
  { -- |
    pendingBookieOpsStatsDataLedgerOpenOp :: Maybe Integer,
    -- |
    pendingBookieOpsStatsDataLedgerCloseOp :: Maybe Integer,
    -- |
    pendingBookieOpsStatsDataLedgerCreateOp :: Maybe Integer,
    -- |
    pendingBookieOpsStatsDataLedgerDeleteOp :: Maybe Integer,
    -- |
    pendingBookieOpsStatsCursorLedgerOpenOp :: Maybe Integer,
    -- |
    pendingBookieOpsStatsCursorLedgerCloseOp :: Maybe Integer,
    -- |
    pendingBookieOpsStatsCursorLedgerCreateOp :: Maybe Integer,
    -- |
    pendingBookieOpsStatsCursorLedgerDeleteOp :: Maybe Integer
  }
  deriving (Show, Eq, Generic)

instance FromJSON PendingBookieOpsStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "pendingBookieOpsStats")

instance ToJSON PendingBookieOpsStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "pendingBookieOpsStats")

-- |
data PersistencePolicies = PersistencePolicies
  { -- |
    persistencePoliciesBookkeeperEnsemble :: Maybe Int,
    -- |
    persistencePoliciesBookkeeperWriteQuorum :: Maybe Int,
    -- |
    persistencePoliciesBookkeeperAckQuorum :: Maybe Int,
    -- |
    persistencePoliciesManagedLedgerMaxMarkDeleteRate :: Maybe Double
  }
  deriving (Show, Eq, Generic)

instance FromJSON PersistencePolicies where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "persistencePolicies")

instance ToJSON PersistencePolicies where
  toJSON = genericToJSON (removeFieldLabelPrefix False "persistencePolicies")

-- |
data PersistentOfflineTopicStats = PersistentOfflineTopicStats
  { -- |
    persistentOfflineTopicStatsStorageSize :: Maybe Integer,
    -- |
    persistentOfflineTopicStatsTotalMessages :: Maybe Integer,
    -- |
    persistentOfflineTopicStatsMessageBacklog :: Maybe Integer,
    -- |
    persistentOfflineTopicStatsBrokerName :: Maybe Text,
    -- |
    persistentOfflineTopicStatsTopicName :: Maybe Text,
    -- |
    persistentOfflineTopicStatsDataLedgerDetails :: Maybe [LedgerDetails],
    -- |
    persistentOfflineTopicStatsCursorDetails :: Maybe (Map.Map String CursorDetails),
    -- |
    persistentOfflineTopicStatsStatGeneratedAt :: Maybe UTCTime
  }
  deriving (Show, Eq, Generic)

instance FromJSON PersistentOfflineTopicStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "persistentOfflineTopicStats")

instance ToJSON PersistentOfflineTopicStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "persistentOfflineTopicStats")

-- |
data PersistentTopicInternalStats = PersistentTopicInternalStats
  { -- |
    persistentTopicInternalStatsEntriesAddedCounter :: Maybe Integer,
    -- |
    persistentTopicInternalStatsNumberOfEntries :: Maybe Integer,
    -- |
    persistentTopicInternalStatsTotalSize :: Maybe Integer,
    -- |
    persistentTopicInternalStatsCurrentLedgerEntries :: Maybe Integer,
    -- |
    persistentTopicInternalStatsCurrentLedgerSize :: Maybe Integer,
    -- |
    persistentTopicInternalStatsLastLedgerCreatedTimestamp :: Maybe Text,
    -- |
    persistentTopicInternalStatsLastLedgerCreationFailureTimestamp :: Maybe Text,
    -- |
    persistentTopicInternalStatsWaitingCursorsCount :: Maybe Int,
    -- |
    persistentTopicInternalStatsPendingAddEntriesCount :: Maybe Int,
    -- |
    persistentTopicInternalStatsLastConfirmedEntry :: Maybe Text,
    -- |
    persistentTopicInternalStatsState :: Maybe Text,
    -- |
    persistentTopicInternalStatsLedgers :: Maybe [LedgerInfo],
    -- |
    persistentTopicInternalStatsCursors :: Maybe (Map.Map String CursorStats),
    -- |
    persistentTopicInternalStatsSchemaLedgers :: Maybe [LedgerInfo],
    -- |
    persistentTopicInternalStatsCompactedLedger :: Maybe LedgerInfo
  }
  deriving (Show, Eq, Generic)

instance FromJSON PersistentTopicInternalStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "persistentTopicInternalStats")

instance ToJSON PersistentTopicInternalStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "persistentTopicInternalStats")

-- |
data Policies = Policies
  { -- |
    policiesAuthUnderscorepolicies :: Maybe AuthPolicies,
    -- |
    policiesReplicationUnderscoreclusters :: Maybe [Text],
    -- |
    policiesBundles :: Maybe BundlesData,
    -- |
    policiesBacklogUnderscorequotaUnderscoremap :: Maybe (Map.Map String BacklogQuota),
    -- |
    policiesClusterDispatchRate :: Maybe (Map.Map String DispatchRateImpl),
    -- |
    policiesTopicDispatchRate :: Maybe (Map.Map String DispatchRateImpl),
    -- |
    policiesSubscriptionDispatchRate :: Maybe (Map.Map String DispatchRateImpl),
    -- |
    policiesReplicatorDispatchRate :: Maybe (Map.Map String DispatchRateImpl),
    -- |
    policiesClusterSubscribeRate :: Maybe (Map.Map String SubscribeRate),
    -- |
    policiesPersistence :: Maybe PersistencePolicies,
    -- |
    policiesDeduplicationEnabled :: Maybe Bool,
    -- |
    policiesAutoTopicCreationOverride :: Maybe AutoTopicCreationOverride,
    -- |
    policiesAutoSubscriptionCreationOverride :: Maybe AutoSubscriptionCreationOverride,
    -- |
    policiesPublishMaxMessageRate :: Maybe (Map.Map String PublishRate),
    -- |
    policiesLatencyUnderscorestatsUnderscoresampleUnderscorerate :: Maybe (Map.Map String Int),
    -- |
    policiesMessageUnderscorettlUnderscoreinUnderscoreseconds :: Maybe Int,
    -- |
    policiesSubscriptionUnderscoreexpirationUnderscoretimeUnderscoreminutes :: Maybe Int,
    -- |
    policiesRetentionUnderscorepolicies :: Maybe RetentionPolicies,
    -- |
    policiesDeleted :: Maybe Bool,
    -- |
    policiesEncryptionUnderscorerequired :: Maybe Bool,
    -- |
    policiesDelayedUnderscoredeliveryUnderscorepolicies :: Maybe DelayedDeliveryPolicies,
    -- |
    policiesInactiveUnderscoretopicUnderscorepolicies :: Maybe InactiveTopicPolicies,
    -- |
    policiesSubscriptionUnderscoreauthUnderscoremode :: Maybe Text,
    -- |
    policiesMaxUnderscoreproducersUnderscoreperUnderscoretopic :: Maybe Int,
    -- |
    policiesMaxUnderscoreconsumersUnderscoreperUnderscoretopic :: Maybe Int,
    -- |
    policiesMaxUnderscoreconsumersUnderscoreperUnderscoresubscription :: Maybe Int,
    -- |
    policiesMaxUnderscoreunackedUnderscoremessagesUnderscoreperUnderscoreconsumer :: Maybe Int,
    -- |
    policiesMaxUnderscoreunackedUnderscoremessagesUnderscoreperUnderscoresubscription :: Maybe Int,
    -- |
    policiesMaxUnderscoresubscriptionsUnderscoreperUnderscoretopic :: Maybe Int,
    -- |
    policiesCompactionUnderscorethreshold :: Maybe Integer,
    -- |
    policiesOffloadUnderscorethreshold :: Maybe Integer,
    -- |
    policiesOffloadUnderscoredeletionUnderscorelagUnderscorems :: Maybe Integer,
    -- |
    policiesMaxUnderscoretopicsUnderscoreperUnderscorenamespace :: Maybe Int,
    -- |
    policiesSchemaUnderscoreautoUnderscoreupdateUnderscorecompatibilityUnderscorestrategy :: Maybe Text,
    -- |
    policiesSchemaUnderscorecompatibilityUnderscorestrategy :: Maybe Text,
    -- |
    policiesIsUnderscoreallowUnderscoreautoUnderscoreupdateUnderscoreschema :: Maybe Bool,
    -- |
    policiesSchemaUnderscorevalidationUnderscoreenforced :: Maybe Bool,
    -- |
    policiesOffloadUnderscorepolicies :: Maybe OffloadPolicies,
    -- |
    policiesDeduplicationSnapshotIntervalSeconds :: Maybe Int,
    -- |
    policiesSubscriptionUnderscoretypesUnderscoreenabled :: Maybe [Text],
    -- |
    policiesProperties :: Maybe (Map.Map String Text),
    -- |
    policiesResourceUnderscoregroupUnderscorename :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON Policies where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "policies")

instance ToJSON Policies where
  toJSON = genericToJSON (removeFieldLabelPrefix False "policies")

-- |
data PoolArenaStats = PoolArenaStats
  { -- |
    poolArenaStatsNumTinySubpages :: Maybe Int,
    -- |
    poolArenaStatsNumSmallSubpages :: Maybe Int,
    -- |
    poolArenaStatsNumChunkLists :: Maybe Int,
    -- |
    poolArenaStatsTinySubpages :: Maybe [PoolSubpageStats],
    -- |
    poolArenaStatsSmallSubpages :: Maybe [PoolSubpageStats],
    -- |
    poolArenaStatsChunkLists :: Maybe [PoolChunkListStats],
    -- |
    poolArenaStatsNumAllocations :: Maybe Integer,
    -- |
    poolArenaStatsNumTinyAllocations :: Maybe Integer,
    -- |
    poolArenaStatsNumSmallAllocations :: Maybe Integer,
    -- |
    poolArenaStatsNumNormalAllocations :: Maybe Integer,
    -- |
    poolArenaStatsNumHugeAllocations :: Maybe Integer,
    -- |
    poolArenaStatsNumDeallocations :: Maybe Integer,
    -- |
    poolArenaStatsNumTinyDeallocations :: Maybe Integer,
    -- |
    poolArenaStatsNumSmallDeallocations :: Maybe Integer,
    -- |
    poolArenaStatsNumNormalDeallocations :: Maybe Integer,
    -- |
    poolArenaStatsNumHugeDeallocations :: Maybe Integer,
    -- |
    poolArenaStatsNumActiveAllocations :: Maybe Integer,
    -- |
    poolArenaStatsNumActiveTinyAllocations :: Maybe Integer,
    -- |
    poolArenaStatsNumActiveSmallAllocations :: Maybe Integer,
    -- |
    poolArenaStatsNumActiveNormalAllocations :: Maybe Integer,
    -- |
    poolArenaStatsNumActiveHugeAllocations :: Maybe Integer
  }
  deriving (Show, Eq, Generic)

instance FromJSON PoolArenaStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "poolArenaStats")

instance ToJSON PoolArenaStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "poolArenaStats")

-- |
data PoolChunkListStats = PoolChunkListStats
  { -- |
    poolChunkListStatsMinUsage :: Maybe Int,
    -- |
    poolChunkListStatsMaxUsage :: Maybe Int,
    -- |
    poolChunkListStatsChunks :: Maybe [PoolChunkStats]
  }
  deriving (Show, Eq, Generic)

instance FromJSON PoolChunkListStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "poolChunkListStats")

instance ToJSON PoolChunkListStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "poolChunkListStats")

-- |
data PoolChunkStats = PoolChunkStats
  { -- |
    poolChunkStatsUsage :: Maybe Int,
    -- |
    poolChunkStatsChunkSize :: Maybe Int,
    -- |
    poolChunkStatsFreeBytes :: Maybe Int
  }
  deriving (Show, Eq, Generic)

instance FromJSON PoolChunkStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "poolChunkStats")

instance ToJSON PoolChunkStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "poolChunkStats")

-- |
data PoolSubpageStats = PoolSubpageStats
  { -- |
    poolSubpageStatsMaxNumElements :: Maybe Int,
    -- |
    poolSubpageStatsNumAvailable :: Maybe Int,
    -- |
    poolSubpageStatsElementSize :: Maybe Int,
    -- |
    poolSubpageStatsPageSize :: Maybe Int
  }
  deriving (Show, Eq, Generic)

instance FromJSON PoolSubpageStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "poolSubpageStats")

instance ToJSON PoolSubpageStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "poolSubpageStats")

-- |
data PostSchemaPayload = PostSchemaPayload
  { -- |
    postSchemaPayloadType :: Maybe Text,
    -- |
    postSchemaPayloadSchema :: Maybe Text,
    -- |
    postSchemaPayloadProperties :: Maybe (Map.Map String Text)
  }
  deriving (Show, Eq, Generic)

instance FromJSON PostSchemaPayload where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "postSchemaPayload")

instance ToJSON PostSchemaPayload where
  toJSON = genericToJSON (removeFieldLabelPrefix False "postSchemaPayload")

-- |
data PostSchemaResponse = PostSchemaResponse
  { -- |
    postSchemaResponseVersion :: Maybe Value
  }
  deriving (Show, Eq, Generic)

instance FromJSON PostSchemaResponse where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "postSchemaResponse")

instance ToJSON PostSchemaResponse where
  toJSON = genericToJSON (removeFieldLabelPrefix False "postSchemaResponse")

-- |
data Principal = Principal
  { -- |
    principalName :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON Principal where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "principal")

instance ToJSON Principal where
  toJSON = genericToJSON (removeFieldLabelPrefix False "principal")

-- |
data ProcessContainerFactory = ProcessContainerFactory
  { -- |
    processContainerFactoryJavaInstanceJarLocation :: Maybe Text,
    -- |
    processContainerFactoryPythonInstanceLocation :: Maybe Text,
    -- |
    processContainerFactoryLogDirectory :: Maybe Text,
    -- |
    processContainerFactoryExtraFunctionDependenciesDir :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON ProcessContainerFactory where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "processContainerFactory")

instance ToJSON ProcessContainerFactory where
  toJSON = genericToJSON (removeFieldLabelPrefix False "processContainerFactory")

-- |
data PropertyName = PropertyName
  { -- |
    propertyNameNamespace :: Maybe Text,
    -- |
    propertyNameEmpty :: Maybe Bool,
    -- |
    propertyNameSimpleName :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON PropertyName where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "propertyName")

instance ToJSON PropertyName where
  toJSON = genericToJSON (removeFieldLabelPrefix False "propertyName")

-- |
data PublicKey = PublicKey
  { -- |
    publicKeyFormat :: Maybe Text,
    -- |
    publicKeyAlgorithm :: Maybe Text,
    -- |
    publicKeyEncoded :: Maybe [Text]
  }
  deriving (Show, Eq, Generic)

instance FromJSON PublicKey where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "publicKey")

instance ToJSON PublicKey where
  toJSON = genericToJSON (removeFieldLabelPrefix False "publicKey")

-- |
data PublishRate = PublishRate
  { -- |
    publishRatePublishThrottlingRateInMsg :: Maybe Int,
    -- |
    publishRatePublishThrottlingRateInByte :: Maybe Integer
  }
  deriving (Show, Eq, Generic)

instance FromJSON PublishRate where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "publishRate")

instance ToJSON PublishRate where
  toJSON = genericToJSON (removeFieldLabelPrefix False "publishRate")

-- |
data PublisherStats = PublisherStats
  { -- |
    publisherStatsMsgRateIn :: Maybe Double,
    -- |
    publisherStatsMsgThroughputIn :: Maybe Double,
    -- |
    publisherStatsAverageMsgSize :: Maybe Double,
    -- |
    publisherStatsMetadata :: Maybe (Map.Map String Text),
    -- |
    publisherStatsAccessMode :: Maybe Text,
    -- |
    publisherStatsChunkedMessageRate :: Maybe Double,
    -- |
    publisherStatsProducerId :: Maybe Integer,
    -- |
    publisherStatsConnectedSince :: Maybe Text,
    -- |
    publisherStatsClientVersion :: Maybe Text,
    -- |
    publisherStatsProducerName :: Maybe Text,
    -- |
    publisherStatsAddress :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON PublisherStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "publisherStats")

instance ToJSON PublisherStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "publisherStats")

-- |
data RawBookieInfo = RawBookieInfo
  { -- |
    rawBookieInfoBookieId :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON RawBookieInfo where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "rawBookieInfo")

instance ToJSON RawBookieInfo where
  toJSON = genericToJSON (removeFieldLabelPrefix False "rawBookieInfo")

-- |
data ReplicatorStats = ReplicatorStats
  { -- |
    replicatorStatsMsgRateIn :: Maybe Double,
    -- |
    replicatorStatsMsgRateOut :: Maybe Double,
    -- |
    replicatorStatsMsgThroughputIn :: Maybe Double,
    -- |
    replicatorStatsConnected :: Maybe Bool,
    -- |
    replicatorStatsMsgRateExpired :: Maybe Double,
    -- |
    replicatorStatsReplicationBacklog :: Maybe Integer,
    -- |
    replicatorStatsReplicationDelayInSeconds :: Maybe Integer,
    -- |
    replicatorStatsInboundConnection :: Maybe Text,
    -- |
    replicatorStatsInboundConnectedSince :: Maybe Text,
    -- |
    replicatorStatsOutboundConnection :: Maybe Text,
    -- |
    replicatorStatsOutboundConnectedSince :: Maybe Text,
    -- |
    replicatorStatsMsgThroughputOut :: Maybe Double
  }
  deriving (Show, Eq, Generic)

instance FromJSON ReplicatorStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "replicatorStats")

instance ToJSON ReplicatorStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "replicatorStats")

-- |
data ResetCursorData = ResetCursorData
  { -- |
    resetCursorDataLedgerId :: Maybe Integer,
    -- |
    resetCursorDataEntryId :: Maybe Integer,
    -- |
    resetCursorDataPartitionIndex :: Maybe Int,
    -- |
    resetCursorDataBatchIndex :: Maybe Int,
    -- |
    resetCursorDataExcluded :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON ResetCursorData where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "resetCursorData")

instance ToJSON ResetCursorData where
  toJSON = genericToJSON (removeFieldLabelPrefix False "resetCursorData")

-- |
data ResourceDescription = ResourceDescription
  { -- |
    resourceDescriptionUsagePct :: Maybe Int,
    -- |
    resourceDescriptionResourceUsage :: Maybe (Map.Map String ResourceUsage)
  }
  deriving (Show, Eq, Generic)

instance FromJSON ResourceDescription where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "resourceDescription")

instance ToJSON ResourceDescription where
  toJSON = genericToJSON (removeFieldLabelPrefix False "resourceDescription")

-- |
data ResourceGroup = ResourceGroup
  { -- |
    resourceGroupPublishRateInMsgs :: Maybe Int,
    -- |
    resourceGroupPublishRateInBytes :: Maybe Integer,
    -- |
    resourceGroupDispatchRateInMsgs :: Maybe Int,
    -- |
    resourceGroupDispatchRateInBytes :: Maybe Integer
  }
  deriving (Show, Eq, Generic)

instance FromJSON ResourceGroup where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "resourceGroup")

instance ToJSON ResourceGroup where
  toJSON = genericToJSON (removeFieldLabelPrefix False "resourceGroup")

-- |
data ResourceQuota = ResourceQuota
  { -- |
    resourceQuotaMsgRateIn :: Maybe Double,
    -- |
    resourceQuotaMsgRateOut :: Maybe Double,
    -- |
    resourceQuotaBandwidthIn :: Maybe Double,
    -- |
    resourceQuotaBandwidthOut :: Maybe Double,
    -- |
    resourceQuotaMemory :: Maybe Double,
    -- |
    resourceQuotaDynamic :: Maybe Bool
  }
  deriving (Show, Eq, Generic)

instance FromJSON ResourceQuota where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "resourceQuota")

instance ToJSON ResourceQuota where
  toJSON = genericToJSON (removeFieldLabelPrefix False "resourceQuota")

-- |
data ResourceUnit = ResourceUnit
  { -- |
    resourceUnitAvailableResource :: Maybe ResourceDescription,
    -- |
    resourceUnitResourceId :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON ResourceUnit where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "resourceUnit")

instance ToJSON ResourceUnit where
  toJSON = genericToJSON (removeFieldLabelPrefix False "resourceUnit")

-- |
data ResourceUsage = ResourceUsage
  { -- |
    resourceUsageUsage :: Maybe Double,
    -- |
    resourceUsageLimit :: Maybe Double
  }
  deriving (Show, Eq, Generic)

instance FromJSON ResourceUsage where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "resourceUsage")

instance ToJSON ResourceUsage where
  toJSON = genericToJSON (removeFieldLabelPrefix False "resourceUsage")

-- |
data Resources = Resources
  { -- |
    resourcesCpu :: Maybe Double,
    -- |
    resourcesRam :: Maybe Integer,
    -- |
    resourcesDisk :: Maybe Integer
  }
  deriving (Show, Eq, Generic)

instance FromJSON Resources where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "resources")

instance ToJSON Resources where
  toJSON = genericToJSON (removeFieldLabelPrefix False "resources")

-- |
data RetentionPolicies = RetentionPolicies
  { -- |
    retentionPoliciesRetentionTimeInMinutes :: Maybe Int,
    -- |
    retentionPoliciesRetentionSizeInMB :: Maybe Integer
  }
  deriving (Show, Eq, Generic)

instance FromJSON RetentionPolicies where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "retentionPolicies")

instance ToJSON RetentionPolicies where
  toJSON = genericToJSON (removeFieldLabelPrefix False "retentionPolicies")

-- |
data SerializationConfig = SerializationConfig
  { -- |
    serializationConfigDefaultPropertyInclusion :: Maybe Value,
    -- |
    serializationConfigFilterProvider :: Maybe Value,
    -- |
    serializationConfigDefaultPrettyPrinter :: Maybe Value,
    -- |
    serializationConfigAnnotationIntrospector :: Maybe Value,
    -- |
    serializationConfigSerializationInclusion :: Maybe Text,
    -- |
    serializationConfigSerializationFeatures :: Maybe Int,
    -- |
    serializationConfigRootName :: Maybe Text,
    -- |
    serializationConfigFullRootName :: Maybe PropertyName,
    -- |
    serializationConfigSubtypeResolver :: Maybe Value,
    -- |
    serializationConfigDefaultVisibilityChecker :: Maybe Value,
    -- |
    serializationConfigAttributes :: Maybe Value,
    -- |
    serializationConfigLocale :: Maybe Locale,
    -- |
    serializationConfigTimeZone :: Maybe TimeZone,
    -- |
    serializationConfigTypeFactory :: Maybe TypeFactory,
    -- |
    serializationConfigAnnotationProcessingEnabled :: Maybe Bool,
    -- |
    serializationConfigBase64Variant :: Maybe Base64Variant,
    -- |
    serializationConfigHandlerInstantiator :: Maybe Value,
    -- |
    serializationConfigPropertyNamingStrategy :: Maybe Value,
    -- |
    serializationConfigDateFormat :: Maybe DateFormat,
    -- |
    serializationConfigClassIntrospector :: Maybe Value
  }
  deriving (Show, Eq, Generic)

instance FromJSON SerializationConfig where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "serializationConfig")

instance ToJSON SerializationConfig where
  toJSON = genericToJSON (removeFieldLabelPrefix False "serializationConfig")

-- |
data SerializerProvider = SerializerProvider
  { -- |
    serializerProviderLocale :: Maybe Locale,
    -- |
    serializerProviderTimeZone :: Maybe TimeZone,
    -- |
    serializerProviderConfig :: Maybe SerializationConfig,
    -- |
    serializerProviderTypeFactory :: Maybe TypeFactory,
    -- |
    serializerProviderFilterProvider :: Maybe Value,
    -- |
    serializerProviderDefaultNullKeySerializer :: Maybe JsonSerializerObject,
    -- |
    serializerProviderDefaultNullValueSerializer :: Maybe JsonSerializerObject,
    -- |
    serializerProviderGenerator :: Maybe JsonGenerator,
    -- |
    serializerProviderAnnotationIntrospector :: Maybe Value
  }
  deriving (Show, Eq, Generic)

instance FromJSON SerializerProvider where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "serializerProvider")

instance ToJSON SerializerProvider where
  toJSON = genericToJSON (removeFieldLabelPrefix False "serializerProvider")

-- |
data Sinks = Sinks
  { -- |
    sinksSinkList :: Maybe [ConnectorDefinition],
    -- |
    sinksListOfConnectors :: Maybe [ConnectorDefinition]
  }
  deriving (Show, Eq, Generic)

instance FromJSON Sinks where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "sinks")

instance ToJSON Sinks where
  toJSON = genericToJSON (removeFieldLabelPrefix False "sinks")

-- |
data SinksWorkerService = SinksWorkerService
  { -- |
    sinksWorkerServiceSinkList :: Maybe [ConnectorDefinition],
    -- |
    sinksWorkerServiceListOfConnectors :: Maybe [ConnectorDefinition]
  }
  deriving (Show, Eq, Generic)

instance FromJSON SinksWorkerService where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "sinksWorkerService")

instance ToJSON SinksWorkerService where
  toJSON = genericToJSON (removeFieldLabelPrefix False "sinksWorkerService")

-- |
data Sources = Sources
  { -- |
    sourcesSourceList :: Maybe [ConnectorDefinition],
    -- |
    sourcesListOfConnectors :: Maybe [ConnectorDefinition]
  }
  deriving (Show, Eq, Generic)

instance FromJSON Sources where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "sources")

instance ToJSON Sources where
  toJSON = genericToJSON (removeFieldLabelPrefix False "sources")

-- |
data SourcesWorkerService = SourcesWorkerService
  { -- |
    sourcesWorkerServiceSourceList :: Maybe [ConnectorDefinition],
    -- |
    sourcesWorkerServiceListOfConnectors :: Maybe [ConnectorDefinition]
  }
  deriving (Show, Eq, Generic)

instance FromJSON SourcesWorkerService where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "sourcesWorkerService")

instance ToJSON SourcesWorkerService where
  toJSON = genericToJSON (removeFieldLabelPrefix False "sourcesWorkerService")

-- |
data SubscribeRate = SubscribeRate
  { -- |
    subscribeRateSubscribeThrottlingRatePerConsumer :: Maybe Int,
    -- |
    subscribeRateRatePeriodInSecond :: Maybe Int
  }
  deriving (Show, Eq, Generic)

instance FromJSON SubscribeRate where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "subscribeRate")

instance ToJSON SubscribeRate where
  toJSON = genericToJSON (removeFieldLabelPrefix False "subscribeRate")

-- |
data SubscriptionStats = SubscriptionStats
  { -- |
    subscriptionStatsConsumers :: Maybe [ConsumerStats],
    -- |
    subscriptionStatsMsgRateOut :: Maybe Double,
    -- |
    subscriptionStatsReplicated :: Maybe Bool,
    -- |
    subscriptionStatsBytesOutCounter :: Maybe Integer,
    -- |
    subscriptionStatsNonContiguousDeletedMessagesRangesSerializedSize :: Maybe Int,
    -- |
    subscriptionStatsMsgOutCounter :: Maybe Integer,
    -- |
    subscriptionStatsBacklogSize :: Maybe Integer,
    -- |
    subscriptionStatsNonContiguousDeletedMessagesRanges :: Maybe Int,
    -- |
    subscriptionStatsChunkedMessageRate :: Maybe Int,
    -- |
    subscriptionStatsMsgRateExpired :: Maybe Double,
    -- |
    subscriptionStatsMsgBacklog :: Maybe Integer,
    -- |
    subscriptionStatsMsgRateRedeliver :: Maybe Double,
    -- |
    subscriptionStatsMsgBacklogNoDelayed :: Maybe Integer,
    -- |
    subscriptionStatsBlockedSubscriptionOnUnackedMsgs :: Maybe Bool,
    -- |
    subscriptionStatsMsgDelayed :: Maybe Integer,
    -- |
    subscriptionStatsUnackedMessages :: Maybe Integer,
    -- |
    subscriptionStatsActiveConsumerName :: Maybe Text,
    -- |
    subscriptionStatsTotalMsgExpired :: Maybe Integer,
    -- |
    subscriptionStatsLastExpireTimestamp :: Maybe Integer,
    -- |
    subscriptionStatsLastConsumedFlowTimestamp :: Maybe Integer,
    -- |
    subscriptionStatsLastConsumedTimestamp :: Maybe Integer,
    -- |
    subscriptionStatsLastAckedTimestamp :: Maybe Integer,
    -- |
    subscriptionStatsLastMarkDeleteAdvancedTimestamp :: Maybe Integer,
    -- |
    subscriptionStatsConsumersAfterMarkDeletePosition :: Maybe (Map.Map String Text),
    -- |
    subscriptionStatsDurable :: Maybe Bool,
    -- |
    subscriptionStatsMsgThroughputOut :: Maybe Double,
    -- |
    subscriptionStatsType :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON SubscriptionStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "subscriptionStats")

instance ToJSON SubscriptionStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "subscriptionStats")

-- |
data SystemResourceUsage = SystemResourceUsage
  { -- |
    systemResourceUsageBandwidthIn :: Maybe ResourceUsage,
    -- |
    systemResourceUsageBandwidthOut :: Maybe ResourceUsage,
    -- |
    systemResourceUsageCpu :: Maybe ResourceUsage,
    -- |
    systemResourceUsageMemory :: Maybe ResourceUsage,
    -- |
    systemResourceUsageDirectMemory :: Maybe ResourceUsage
  }
  deriving (Show, Eq, Generic)

instance FromJSON SystemResourceUsage where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "systemResourceUsage")

instance ToJSON SystemResourceUsage where
  toJSON = genericToJSON (removeFieldLabelPrefix False "systemResourceUsage")

-- | Information of adminRoles and allowedClusters for tenant
data TenantInfo = TenantInfo
  { -- | Comma separated list of auth principal allowed to administrate the tenant.
    tenantInfoAdminRoles :: Maybe [Text],
    -- | Comma separated allowed clusters.
    tenantInfoAllowedClusters :: Maybe [Text]
  }
  deriving (Show, Eq, Generic)

instance FromJSON TenantInfo where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "tenantInfo")

instance ToJSON TenantInfo where
  toJSON = genericToJSON (removeFieldLabelPrefix False "tenantInfo")

-- |
data ThreadContainerFactory = ThreadContainerFactory
  { -- |
    threadContainerFactoryThreadGroupName :: Maybe Text,
    -- |
    threadContainerFactoryPulsarClientMemoryLimit :: Maybe MemoryLimit
  }
  deriving (Show, Eq, Generic)

instance FromJSON ThreadContainerFactory where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "threadContainerFactory")

instance ToJSON ThreadContainerFactory where
  toJSON = genericToJSON (removeFieldLabelPrefix False "threadContainerFactory")

-- |
data TimeZone = TimeZone
  { -- |
    timeZoneDisplayName :: Maybe Text,
    -- |
    timeZoneDstsavings :: Maybe Int,
    -- |
    timeZoneRawOffset :: Maybe Int,
    -- |
    timeZoneId :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON TimeZone where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "timeZone")

instance ToJSON TimeZone where
  toJSON = genericToJSON (removeFieldLabelPrefix False "timeZone")

-- |
data TopicStats = TopicStats
  { -- |
    topicStatsOffloadedStorageSize :: Maybe Integer,
    -- |
    topicStatsMsgRateIn :: Maybe Double,
    -- |
    topicStatsMsgRateOut :: Maybe Double,
    -- |
    topicStatsMsgThroughputIn :: Maybe Double,
    -- |
    topicStatsBytesInCounter :: Maybe Integer,
    -- |
    topicStatsMsgInCounter :: Maybe Integer,
    -- |
    topicStatsBytesOutCounter :: Maybe Integer,
    -- |
    topicStatsNonContiguousDeletedMessagesRangesSerializedSize :: Maybe Int,
    -- |
    topicStatsMsgOutCounter :: Maybe Integer,
    -- |
    topicStatsAverageMsgSize :: Maybe Double,
    -- |
    topicStatsStorageSize :: Maybe Integer,
    -- |
    topicStatsBacklogSize :: Maybe Integer,
    -- |
    topicStatsPublishers :: Maybe [PublisherStats],
    -- |
    topicStatsReplication :: Maybe (Map.Map String ReplicatorStats),
    -- |
    topicStatsDeduplicationStatus :: Maybe Text,
    -- |
    topicStatsTopicEpoch :: Maybe Integer,
    -- |
    topicStatsNonContiguousDeletedMessagesRanges :: Maybe Int,
    -- |
    topicStatsCompaction :: Maybe CompactionStats,
    -- |
    topicStatsSubscriptions :: Maybe (Map.Map String SubscriptionStats),
    -- |
    topicStatsWaitingPublishers :: Maybe Int,
    -- |
    topicStatsMsgChunkPublished :: Maybe Bool,
    -- |
    topicStatsMsgThroughputOut :: Maybe Double
  }
  deriving (Show, Eq, Generic)

instance FromJSON TopicStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "topicStats")

instance ToJSON TopicStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "topicStats")

-- |
data TypeBindings = TypeBindings
  { -- |
    typeBindingsEmpty :: Maybe Bool,
    -- |
    typeBindingsTypeParameters :: Maybe [JavaType]
  }
  deriving (Show, Eq, Generic)

instance FromJSON TypeBindings where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "typeBindings")

instance ToJSON TypeBindings where
  toJSON = genericToJSON (removeFieldLabelPrefix False "typeBindings")

-- |
data TypeFactory = TypeFactory
  { -- |
    typeFactoryClassLoader :: Maybe ClassLoader
  }
  deriving (Show, Eq, Generic)

instance FromJSON TypeFactory where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "typeFactory")

instance ToJSON TypeFactory where
  toJSON = genericToJSON (removeFieldLabelPrefix False "typeFactory")

-- |
data Value_ = Value_
  { -- |
    valueContentInclusion :: Maybe Text,
    -- |
    valueValueInclusion :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON Value_ where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "value")

instance ToJSON Value_ where
  toJSON = genericToJSON (removeFieldLabelPrefix False "value")

-- |
data WorkerConfig = WorkerConfig
  { -- |
    workerConfigWorkerId :: Maybe Text,
    -- |
    workerConfigWorkerHostname :: Maybe Text,
    -- |
    workerConfigWorkerPort :: Maybe Int,
    -- |
    workerConfigWorkerPortTls :: Maybe Int,
    -- |
    workerConfigAuthenticateMetricsEndpoint :: Maybe Bool,
    -- |
    workerConfigIncludeStandardPrometheusMetrics :: Maybe Bool,
    -- |
    workerConfigJvmGCMetricsLoggerClassName :: Maybe Text,
    -- |
    workerConfigNumHttpServerThreads :: Maybe Int,
    -- |
    workerConfigHttpRequestsLimitEnabled :: Maybe Bool,
    -- |
    workerConfigHttpRequestsMaxPerSecond :: Maybe Double,
    -- |
    workerConfigConfigurationStoreServers :: Maybe Text,
    -- |
    workerConfigZooKeeperSessionTimeoutMillis :: Maybe Integer,
    -- |
    workerConfigZooKeeperOperationTimeoutSeconds :: Maybe Int,
    -- |
    workerConfigZooKeeperCacheExpirySeconds :: Maybe Int,
    -- |
    workerConfigConnectorsDirectory :: Maybe Text,
    -- |
    workerConfigNarExtractionDirectory :: Maybe Text,
    -- |
    workerConfigValidateConnectorConfig :: Maybe Bool,
    -- |
    workerConfigFunctionsDirectory :: Maybe Text,
    -- |
    workerConfigFunctionMetadataTopicName :: Maybe Text,
    -- |
    workerConfigUseCompactedMetadataTopic :: Maybe Bool,
    -- |
    workerConfigFunctionWebServiceUrl :: Maybe Text,
    -- |
    workerConfigPulsarServiceUrl :: Maybe Text,
    -- |
    workerConfigPulsarWebServiceUrl :: Maybe Text,
    -- |
    workerConfigClusterCoordinationTopicName :: Maybe Text,
    -- |
    workerConfigPulsarFunctionsNamespace :: Maybe Text,
    -- |
    workerConfigPulsarFunctionsCluster :: Maybe Text,
    -- |
    workerConfigNumFunctionPackageReplicas :: Maybe Int,
    -- |
    workerConfigDownloadDirectory :: Maybe Text,
    -- |
    workerConfigStateStorageServiceUrl :: Maybe Text,
    -- |
    workerConfigFunctionAssignmentTopicName :: Maybe Text,
    -- |
    workerConfigSchedulerClassName :: Maybe Text,
    -- |
    workerConfigFailureCheckFreqMs :: Maybe Integer,
    -- |
    workerConfigRescheduleTimeoutMs :: Maybe Integer,
    -- |
    workerConfigRebalanceCheckFreqSec :: Maybe Integer,
    -- |
    workerConfigInitialBrokerReconnectMaxRetries :: Maybe Int,
    -- |
    workerConfigAssignmentWriteMaxRetries :: Maybe Int,
    -- |
    workerConfigInstanceLivenessCheckFreqMs :: Maybe Integer,
    -- |
    workerConfigBrokerClientAuthenticationEnabled :: Maybe Bool,
    -- |
    workerConfigBrokerClientAuthenticationPlugin :: Maybe Text,
    -- |
    workerConfigBrokerClientAuthenticationParameters :: Maybe Text,
    -- |
    workerConfigBookkeeperClientAuthenticationPlugin :: Maybe Text,
    -- |
    workerConfigBookkeeperClientAuthenticationParametersName :: Maybe Text,
    -- |
    workerConfigBookkeeperClientAuthenticationParameters :: Maybe Text,
    -- |
    workerConfigTopicCompactionFrequencySec :: Maybe Integer,
    -- |
    workerConfigTlsEnabled :: Maybe Bool,
    -- |
    workerConfigTlsCertificateFilePath :: Maybe Text,
    -- |
    workerConfigTlsKeyFilePath :: Maybe Text,
    -- |
    workerConfigTlsTrustCertsFilePath :: Maybe Text,
    -- |
    workerConfigTlsAllowInsecureConnection :: Maybe Bool,
    -- |
    workerConfigTlsRequireTrustedClientCertOnConnect :: Maybe Bool,
    -- |
    workerConfigUseTls :: Maybe Bool,
    -- |
    workerConfigTlsEnableHostnameVerification :: Maybe Bool,
    -- |
    workerConfigTlsCertRefreshCheckDurationSec :: Maybe Integer,
    -- |
    workerConfigAuthenticationEnabled :: Maybe Bool,
    -- |
    workerConfigAuthenticationProviders :: Maybe [Text],
    -- |
    workerConfigAuthorizationEnabled :: Maybe Bool,
    -- |
    workerConfigAuthorizationProvider :: Maybe Text,
    -- |
    workerConfigSuperUserRoles :: Maybe [Text],
    -- |
    workerConfigProperties :: Maybe (Map.Map String Text),
    -- |
    workerConfigInitializedDlogMetadata :: Maybe Bool,
    -- |
    workerConfigBrokerClientTrustCertsFilePath :: Maybe Text,
    -- |
    workerConfigFunctionRuntimeFactoryClassName :: Maybe Text,
    -- |
    workerConfigFunctionRuntimeFactoryConfigs :: Maybe (Map.Map String Value),
    -- |
    workerConfigSecretsProviderConfiguratorClassName :: Maybe Text,
    -- |
    workerConfigSecretsProviderConfiguratorConfig :: Maybe (Map.Map String Text),
    -- |
    workerConfigFunctionInstanceMinResources :: Maybe Resources,
    -- |
    workerConfigFunctionInstanceMaxResources :: Maybe Resources,
    -- |
    workerConfigFunctionInstanceResourceGranularities :: Maybe Resources,
    -- |
    workerConfigFunctionInstanceResourceChangeInLockStep :: Maybe Bool,
    -- |
    workerConfigFunctionAuthProviderClassName :: Maybe Text,
    -- |
    workerConfigRuntimeCustomizerClassName :: Maybe Text,
    -- |
    workerConfigRuntimeCustomizerConfig :: Maybe (Map.Map String Value),
    -- |
    workerConfigMaxPendingAsyncRequests :: Maybe Int,
    -- |
    workerConfigForwardSourceMessageProperty :: Maybe Bool,
    -- |
    workerConfigFunctionsWorkerServiceNarPackage :: Maybe Text,
    -- |
    workerConfigFunctionsWorkerServiceCustomConfigs :: Maybe (Map.Map String Value),
    -- |
    workerConfigExposeAdminClientEnabled :: Maybe Bool,
    -- |
    workerConfigThreadContainerFactory :: Maybe ThreadContainerFactory,
    -- |
    workerConfigProcessContainerFactory :: Maybe ProcessContainerFactory,
    -- |
    workerConfigKubernetesContainerFactory :: Maybe KubernetesContainerFactory,
    -- |
    workerConfigClientAuthenticationParameters :: Maybe Text,
    -- |
    workerConfigClientAuthenticationPlugin :: Maybe Text,
    -- |
    workerConfigFunctionMetadataTopic :: Maybe Text,
    -- |
    workerConfigClusterCoordinationTopic :: Maybe Text,
    -- |
    workerConfigFunctionAssignmentTopic :: Maybe Text,
    -- |
    workerConfigTlsTrustChainBytes :: Maybe [Text],
    -- |
    workerConfigWorkerWebAddress :: Maybe Text,
    -- |
    workerConfigWorkerWebAddressTls :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON WorkerConfig where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "workerConfig")

instance ToJSON WorkerConfig where
  toJSON = genericToJSON (removeFieldLabelPrefix False "workerConfig")

-- |
data WorkerFunctionInstanceStats = WorkerFunctionInstanceStats
  { -- |
    workerFunctionInstanceStatsName :: Maybe Text,
    -- |
    workerFunctionInstanceStatsMetrics :: Maybe FunctionInstanceStatsData
  }
  deriving (Show, Eq, Generic)

instance FromJSON WorkerFunctionInstanceStats where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "workerFunctionInstanceStats")

instance ToJSON WorkerFunctionInstanceStats where
  toJSON = genericToJSON (removeFieldLabelPrefix False "workerFunctionInstanceStats")

-- |
data WorkerInfo = WorkerInfo
  { -- |
    workerInfoWorkerId :: Maybe Text,
    -- |
    workerInfoWorkerHostname :: Maybe Text,
    -- |
    workerInfoPort :: Maybe Int
  }
  deriving (Show, Eq, Generic)

instance FromJSON WorkerInfo where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "workerInfo")

instance ToJSON WorkerInfo where
  toJSON = genericToJSON (removeFieldLabelPrefix False "workerInfo")

-- |
data WorkerService = WorkerService
  { -- |
    workerServiceSources :: Maybe SourcesWorkerService,
    -- |
    workerServiceInitialized :: Maybe Bool,
    -- |
    workerServiceFunctions :: Maybe FunctionsWorkerService,
    -- |
    workerServiceSinks :: Maybe SinksWorkerService,
    -- |
    workerServiceFunctionsV2 :: Maybe FunctionsV2WorkerService,
    -- |
    workerServiceWorkers :: Maybe Value,
    -- |
    workerServiceWorkerConfig :: Maybe WorkerConfig
  }
  deriving (Show, Eq, Generic)

instance FromJSON WorkerService where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "workerService")

instance ToJSON WorkerService where
  toJSON = genericToJSON (removeFieldLabelPrefix False "workerService")

-- |
data X500Principal = X500Principal
  { -- |
    x500PrincipalName :: Maybe Text,
    -- |
    x500PrincipalEncoded :: Maybe [Text]
  }
  deriving (Show, Eq, Generic)

instance FromJSON X500Principal where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "x500Principal")

instance ToJSON X500Principal where
  toJSON = genericToJSON (removeFieldLabelPrefix False "x500Principal")

-- |
data X509Certificate = X509Certificate
  { -- |
    x509CertificateType :: Maybe Text,
    -- |
    x509CertificateSubjectX500Principal :: Maybe X500Principal,
    -- |
    x509CertificateIssuerX500Principal :: Maybe X500Principal,
    -- |
    x509CertificateSerialNumber :: Maybe Int,
    -- |
    x509CertificateTbscertificate :: Maybe [Text],
    -- |
    x509CertificateExtendedKeyUsage :: Maybe [Text],
    -- |
    x509CertificateSigAlgName :: Maybe Text,
    -- |
    x509CertificateNotBefore :: Maybe UTCTime,
    -- |
    x509CertificateNotAfter :: Maybe UTCTime,
    -- |
    x509CertificateSigAlgOID :: Maybe Text,
    -- |
    x509CertificateSigAlgParams :: Maybe [Text],
    -- |
    x509CertificateIssuerUniqueID :: Maybe [Bool],
    -- |
    x509CertificateSubjectUniqueID :: Maybe [Bool],
    -- |
    x509CertificateKeyUsage :: Maybe [Bool],
    -- |
    x509CertificateSubjectAlternativeNames :: Maybe [[Value]],
    -- |
    x509CertificateIssuerAlternativeNames :: Maybe [[Value]],
    -- |
    x509CertificateIssuerDN :: Maybe Principal,
    -- |
    x509CertificateSubjectDN :: Maybe Principal,
    -- |
    x509CertificateVersion :: Maybe Int,
    -- |
    x509CertificateSignature :: Maybe [Text],
    -- |
    x509CertificateBasicConstraints :: Maybe Int,
    -- |
    x509CertificateCriticalExtensionOIDs :: Maybe [Text],
    -- |
    x509CertificateNonCriticalExtensionOIDs :: Maybe [Text],
    -- |
    x509CertificateEncoded :: Maybe [Text],
    -- |
    x509CertificatePublicKey :: Maybe PublicKey
  }
  deriving (Show, Eq, Generic)

instance FromJSON X509Certificate where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "x509Certificate")

instance ToJSON X509Certificate where
  toJSON = genericToJSON (removeFieldLabelPrefix False "x509Certificate")

uncapitalize :: String -> String
uncapitalize (first : rest) = Char.toLower first : rest
uncapitalize [] = []

-- | Remove a field label prefix during JSON parsing.
--   Also perform any replacements for special characters.
--   The @forParsing@ parameter is to distinguish between the cases in which we're using this
--   to power a @FromJSON@ or a @ToJSON@ instance. In the first case we're parsing, and we want
--   to replace special characters with their quoted equivalents (because we cannot have special
--   chars in identifier names), while we want to do viceversa when sending data instead.
removeFieldLabelPrefix :: Bool -> String -> Options
removeFieldLabelPrefix forParsing prefix =
  defaultOptions
    { omitNothingFields = True,
      fieldLabelModifier = uncapitalize . fromMaybe (error ("did not find prefix " ++ prefix)) . stripPrefix prefix . replaceSpecialChars
    }
  where
    replaceSpecialChars field = foldl (&) field (map mkCharReplacement specialChars)
    specialChars =
      [ ("@", "'At"),
        ("\\", "'Back_Slash"),
        ("<=", "'Less_Than_Or_Equal_To"),
        ("\"", "'Double_Quote"),
        ("[", "'Left_Square_Bracket"),
        ("]", "'Right_Square_Bracket"),
        ("^", "'Caret"),
        ("_", "'Underscore"),
        ("`", "'Backtick"),
        ("!", "'Exclamation"),
        ("#", "'Hash"),
        ("$", "'Dollar"),
        ("%", "'Percent"),
        ("&", "'Ampersand"),
        ("'", "'Quote"),
        ("(", "'Left_Parenthesis"),
        (")", "'Right_Parenthesis"),
        ("*", "'Star"),
        ("+", "'Plus"),
        (",", "'Comma"),
        ("-", "'Dash"),
        (".", "'Period"),
        ("/", "'Slash"),
        (":", "'Colon"),
        ("{", "'Left_Curly_Bracket"),
        ("|", "'Pipe"),
        ("<", "'LessThan"),
        ("!=", "'Not_Equal"),
        ("=", "'Equal"),
        ("}", "'Right_Curly_Bracket"),
        (">", "'GreaterThan"),
        ("~", "'Tilde"),
        ("?", "'Question_Mark"),
        (">=", "'Greater_Than_Or_Equal_To"),
        ("~=", "'Tilde_Equal")
      ]
    mkCharReplacement (replaceStr, searchStr) = T.unpack . replacer (T.pack searchStr) (T.pack replaceStr) . T.pack
    replacer =
      if forParsing
        then flip T.replace
        else T.replace
