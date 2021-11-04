{-# LANGUAGE OverloadedStrings #-}

module Main
  ( main,
  )
where

import Control.Monad
import Control.Monad.IO.Class
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
  withClient defaultClientConfiguration "pulsar://localhost:6650" $ do
    messages <-
      consumeReader defaultReaderConfiguration topic messageIdEarliest (onError "initiate" >=> const (return [])) $
        (,)
          <$> (messageId >>= liftIO . messageIdShow)
          <*> messageContent
    liftIO $ print messages
