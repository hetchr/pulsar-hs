{-# LANGUAGE OverloadedStrings #-}

module Main
  ( main,
  )
where

import Control.Monad
import Control.Monad.IO.Class
import Control.Monad.Trans.Reader
import qualified Data.ByteString.Char8 as B
import Pulsar.Client

topic :: TopicName
topic = TopicName "a-topic"

onError :: String -> RawResult -> IO ()
onError action result =
  case renderResult result of
    Just r -> putStrLn $ "Unable to " <> action <> " with error: " <> show r
    Nothing -> putStrLn $ "Unable to " <> action <> " with other error: " <> show (unRawResult result)

logger :: LogLevel -> LogFile -> LogLine -> LogMessage -> IO ()
logger level file line message = putStrLn $ "[" <> show level <> "] " <> file <> ":" <> show line <> ":" <> message

main :: IO ()
main =
  withClient (defaultClientConfiguration {clientLogger = Just logger}) "pulsar://localhost:6650" $
    withConsumer defaultConsumerConfiguration "a-sub" (Topic topic) (onError "initiate") $
      forever $
        receiveMessage (onError "recieveMessage") $ do
          id' <- messageId messageIdShow
          content <- messageContent
          liftIO $ B.putStrLn $ "Message (" <> B.pack id' <> "): " <> content
          void acknowledgeMessage
