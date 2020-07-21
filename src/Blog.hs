{-# LANGUAGE DeriveGeneric #-}
module Blog
  ( someFunc,
    Activity (BlogPost, Comment),
  )
where

import GHC.Generics (Generic)
import Data.Aeson

someFunc :: IO ()
someFunc = putStrLn "someFunc"

data Activity
  = BlogPost
      { id :: Int,
        title :: String,
        summary :: String
      }
  | Comment
      { blogPostId :: Int,
        content :: String
      } deriving (Generic, Show)

instance ToJSON Activity
instance FromJSON Activity
