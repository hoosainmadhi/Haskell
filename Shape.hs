module Shape where

-- data Shape = Circle Float Float Float | Rectangle Float Float Float Float

-- area :: Shape -> Float
-- area (Circle _ _ r) = pi * r ^ 2

data Shape = Circle {radius :: Float} | Square {side :: Float}
  deriving (Show)

area :: Shape -> Float
area (Circle r) = pi * r ^ 2
area (Square s) = s * s

---