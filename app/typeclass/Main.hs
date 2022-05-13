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

data SixSidedDie = S1 | S2 | S3 | S4 | S5 | S6

instance Show SixSidedDie where
  show S1 = "one"
  show S2 = "two"
  show S3 = "three"
  show S4 = "four"
  show S5 = "five"
  show S6 = "six"

data TwoSidedDie = One | Two

instance Eq TwoSidedDie where
  (==) One Two = False
  (==) One One = True
  (==) Two Two = True
  (==) Two One = False

instance Ord TwoSidedDie where
  compare One Two = LT
  compare Two One = GT
  compare One One = EQ
  compare Two Two = EQ

data Card = Front | Back deriving (Eq, Ord, Enum)

data Week = Sat | Sun | Mon | Tue | Wed | Thr | Fri deriving (Show, Eq, Ord, Enum)

--type Name = (String, String)
newtype Name = Name (String, String) deriving (Show, Eq)

names :: [Name]
names = [Name ("Milad", "Khajavi"), Name ("Ali", "Zabeti")]

instance Ord Name where
  compare (Name (f1, l1)) (Name (f2, l2)) = compare (l1, f1) (l2, f2)

data AuthorName = AuthorName
  { first :: String,
    last :: String
  }

--data Book = Author String String Int
data Book = Book
  { author :: AuthorName,
    isbn :: String,
    title :: String,
    year :: Int,
    price :: Double
  }

myLast :: [a] -> a
myLast = head . reverse

myLast' :: [a] -> a
myLast' a = head (reverse a)

data Color = Red | Yellow | Blue | Green | Purple | Orange | Brown deriving (Show, Eq)

instance Semigroup Color where
  (<>) Red Blue = Purple
  (<>) Blue Red = Purple
  (<>) Yellow Blue = Green
  (<>) a b
    | a == b = a
    | all (`elem` [Red, Blue, Purple]) [a, b] = Purple

howMuch :: Int -> String
howMuch n
  | n > 10 = "a whole bunch"
  | n > 0 = "not much"
  | otherwise = "We're in debt!"

class Semigroup a => Monoid a where
  identity :: a

data Box a = Box a deriving (Show)

wrap :: a -> Box a
wrap = Box

unwrap :: Box a -> a
unwrap (Box x) = x

data Triple a = Triple a a a deriving (Show)

type Point3D = Triple Double

aPoint :: Point3D
aPoint = Triple 0.1 234.3 34.21

type FullName = Triple String

aPerson :: FullName
aPerson = Triple "A" "B" "C"

first' :: Triple a -> a
first' (Triple x _ _) = x

toList :: Triple a -> [a]
toList (Triple x y z) = [x, y, z]

transform :: (a -> a) -> Triple a -> Triple a
transform f (Triple x y z) = Triple (f x) (f y) (f z)



