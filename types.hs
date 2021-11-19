{--
`data` `type` `newtype`
`class` instance`

*   data is used to declare a new algebraic data types
*   type is used to create an alias for an algebraic data type
*   newtype acts similarly to type with a syntax akin to data
    newtype can only have a single constructor taking a single argument.
    newtype creates a strict value constructor and type creates a lazy one (see [1]).
    newtype introduces no runtime overhead.

*   A typeclass is a way to guarantee that a type implements certain functions (or data)
*   A type is declared to implement the functions using the keyword instance.

newtype can be declared in term of themselves

--}

data Shape = Circle {radius :: Float} | Square {side :: Float}
  deriving (Show)

data Box a = Box a deriving (Show)

data Triple a = Triple a a a deriving (Show)

data Quad a b c d = Quad a b c d deriving (Show)

type Point3D = Triple Double

type FullName = Triple String

--
data RhType = Pos | Neg

data ABOType = A | B | AB | O

data BloodType = BloodType ABOType RhType

showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"

showABO :: ABOType -> String
showABO A = "A"
showABO B = "B"
showABO AB = "AB"
showABO O = "O"

showBloodType :: BloodType -> String
showBloodType (BloodType abo rh) = showABO abo ++ showRh rh

--

aPoint :: Point3D
aPoint = Triple 0.1 0.2 100

aPerson :: FullName
aPerson = Triple "Hoosain" "Ebrahim" "Madhi"

area :: Shape -> Float
area (Circle r) = pi * r ^ 2
area (Square s) = s * s

first :: Triple a -> a
first (Triple x _ _) = x

second :: Triple a -> a
second (Triple _ x _) = x

third :: Triple a -> a
third (Triple _ _ x) = x

toList :: Triple a -> [a]
toList (Triple x y z) = [x, y, z]

transform :: (t -> a) -> Triple t -> Triple a
transform f (Triple x y z) = Triple (f x) (f y) (f z)
