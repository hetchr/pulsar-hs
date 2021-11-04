{-# LANGUAGE OverloadedStrings #-}

module Main
  ( main,
  )
where

import Control.Concurrent
import Control.Monad
import Control.Monad.IO.Class
import Control.Monad.Trans.Class
import Control.Monad.Trans.Resource
import qualified Data.ByteString.Char8 as B
import Pulsar.Client

topic :: TopicName
topic = TopicName "a-topic"

onError :: String -> RawResult -> IO ()
onError action result =
  case renderResult result of
    Just r -> putStrLn $ "Unable to " <> action <> " with error: " <> show r
    Nothing -> putStrLn $ "Unable to " <> action <> " with other error: " <> show (unRawResult result)

main :: IO ()
main =
  withClient defaultClientConfiguration "pulsar://localhost:6650" $
    withProducer defaultProducerConfiguration topic (onError "initiate") $
      forM_ [0 ..] $ \i -> do
        result <- runResourceT $ do
          (_, message) <- buildMessage $ defaultMessageBuilder {content = Just $ "Message #" <> B.pack (show i)}
          lift $ sendMessage message
        liftIO $ B.putStrLn $ "Message #" <> B.pack (show i) <> " " <> B.pack (show $ renderResult result)
        liftIO $ threadDelay 2000000
