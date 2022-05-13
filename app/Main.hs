module Main where

import Control.Arrow
import Data.Aeson
import qualified Data.ByteString.Lazy.Internal as C
import Data.List
import EqualityTypeClass
import Blog

main :: IO ()
main = do activitiesEither <- eitherDecodeFileStrict "input.json" :: IO(Either String [Activity])
          let output = case activitiesEither of
                            (Right activities) -> C.unpackChars $ process activities
                            (Left e) -> "Something went wrong " ++ e
               in (putStrLn output)
          
process :: [Activity] -> C.ByteString
process activities = encode $ onlyComments activities

onlyComments :: [Activity] -> [Activity]
onlyComments = filter isComment

isComment :: Activity -> Bool
isComment (Comment _ _) = True
isComment _ = False

