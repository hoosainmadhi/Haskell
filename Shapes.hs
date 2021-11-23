type Point = (Float, Float)

type Radius = Float

data Triangle = Triangle Point Point Point deriving (Show)

data Square = Square Point Point Point Point deriving (Show)

data Circle = Circle Point Radius deriving (Show)

class Shape a where
  simple :: a
  rotate :: a -> Maybe a
  area :: a -> Maybe Float
  (<^>) :: a -> Maybe a
  pp :: a -> String

instance Shape Triangle where
  simple = Triangle (0, 0) (1, 0) (0, 1)
  rotate (Triangle x y z) = Just (Triangle z x y)
  area (Triangle x y z) = Nothing
  (<^>) (Triangle x y z) = Just (Triangle z x y)
  pp (Triangle x y z) = "Triangle" ++ show x ++ show y ++ show z ++ "pretty print"

--area = (x1y2 + x2y3 + x3y1 – x1y3 – x2y1 – x3y2)/2.

instance Shape Square where
  simple = Square (0, 0) (1, 0) (1, 1) (0, 1)
  rotate (Square w x y z) = Just (Square z w x y)
  area (Square w x y z) = Nothing
  (<^>) (Square w x y z) = Nothing
  pp (Square w x y z) = "notDef"

instance Shape Circle where
  simple = Circle (0, 0) 10
  rotate (Circle x r) = Nothing
  area (Circle x r) = Just (pi * r ^ 2)
  (<^>) (Circle x r) = Nothing
  pp (Circle x r) = "Circle " ++ show x ++ " " ++ show r ++ " pretty print"

class Show' a where
  show' :: a -> String

instance Show' Triangle where
  show' (Triangle x y z) = "foo"
