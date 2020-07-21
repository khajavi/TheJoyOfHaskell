module Main where

import Control.Arrow
import Data.Aeson
import qualified Data.ByteString.Lazy.Internal as C
import Data.List
import EqualityTypeClass

a :: Int
a = 1

b :: Int
b = 1

main :: IO ()
main = putStrLn $ toString $ isEqual a b

