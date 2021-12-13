{-# LANGUAGE TypeFamilies #-}

module Pulsar.Client.Internal.Wrapper.Pointers
  ( Client (..),
    Consumer (..),
    Message (..),
    MessageId (..),
    Producer (..),
    Reader (..),
    RawResult (..),
    FetchedMessageId (..),
    BuiltMessage (..),
    FetchedMessage (..),
  )
where

import Pulsar.Client.Internal.Foreign.Client
import Pulsar.Client.Internal.Foreign.Consumer
import Pulsar.Client.Internal.Foreign.Message
import Pulsar.Client.Internal.Foreign.MessageId
import Pulsar.Client.Internal.Foreign.Producer
import Pulsar.Client.Internal.Foreign.Reader
import Pulsar.Client.Internal.Foreign.Result
import UnliftIO.Foreign hiding (new)

newtype Client = Client {unClient :: Ptr C'pulsar_client_t}

newtype Consumer = Consumer {unConsumer :: Ptr C'pulsar_consumer_t}

newtype Message = Message {unMessage :: Ptr C'_pulsar_message}

newtype MessageId = MessageId {unMessageId :: Ptr C'_pulsar_message_id}

newtype Producer = Producer {unProducer :: Ptr C'pulsar_producer_t}

newtype Reader = Reader {unReader :: Ptr C'pulsar_reader_t}

newtype RawResult = RawResult {unRawResult :: C'pulsar_result}

newtype BuiltMessage = BuiltMessage {unBuiltMessage :: Message}

data FetchedMessage source = FetchedMessage
  { fetchedMessageConsumer :: FetchedMessageLink source,
    unFetchedMessage :: Message
  }

data FetchedMessageId source = FetchedMessageId
  { fetchedMessageIdConsumer :: FetchedMessageLink source,
    unFetchedMessageId :: MessageId
  }

type family FetchedMessageLink source where
  FetchedMessageLink Consumer = Consumer
  FetchedMessageLink Reader = ()
