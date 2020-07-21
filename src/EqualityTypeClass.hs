module EqualityTypeClass (isEqual, toString) where

isEqual :: Equality a => a -> a -> Bool
isEqual = (===)

addThenDouble :: Num a => a -> a -> a
addThenDouble x y = (x + y) * 2

class Equality a where
  (===) :: a -> a -> Bool

instance Equality Int where
  a === b = a == b

toString :: Bool -> [Char]
toString True = "True"
toString False = "False"
