module Pulsar.Client.Internal.Wrapper.MessageRouter
  ( topicMetadataPartitions,
  )
where

import Foreign.C.Types
import GHC.Ptr
import Pulsar.Client.Internal.Foreign.MessageRouter
import Pulsar.Client.Internal.Wrapper.Utils

topicMetadataPartitions :: Ptr C'_pulsar_topic_metadata -> IO Int32
topicMetadataPartitions x = undefined
