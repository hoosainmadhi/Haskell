{-# LANGUAGE FlexibleContexts #-}

module Lib where

addMe :: Integer -> Integer -> Integer
addMe x y = x + y

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n -1)

lucky :: Int -> String
lucky 777 = "lucky you"
lucky a = "Sorry"

abs' :: Int -> Int
abs' n = if n >= 0 then 0 else - n

doubleUs :: Num a => a -> a -> a
doubleUs x y = x * 2 + y * 2

removeNonUpperCase :: [Char] -> [Char]
removeNonUpperCase st = [c | c <- st, c `elem` ['A' .. 'Z']]

a :: [Integer]
a = [x + 2 | x <- [1 .. 10]]

message :: String -> String
message name =
  case name of
    "Hoosain" -> "Yay thats me"
    "Fatima" -> "Thats her"
    _ -> "Oh Hello"

mesg :: String -> String
mesg name
  | name == "Hoosain" = "Yay tthats me"
  | name == "Fatima" = "thats her"
  | otherwise = "Oh hello"

-- pattern Matching

msg :: String -> String
msg "Hoosain" = "Thats Hoosain"
msg "Fatima" = "Thats her"
msg _ = "Oh Hellow"

-- Lists

aList :: [Integer]
aList = [1, 2]

-- gaurded where | is read  as "such that"
abs :: (Ord p, Num p) => p -> p
abs n
  | n >= 0 = n
  | otherwise = - n

signum :: (Ord a, Num a, Num p) => a -> p
signum n
  | n < 0 = -1
  | n == 0 = 1
  | otherwise = 1

-- lamda function

-- functions on lists:
-- head
-- tail
-- reverse
-- length
-- !! 3
-- last
-- init
-- elem
-- > < ==
--  max min
-- sum product
-- [1..] [2,4..100]

foo :: [Char]
foo = [x | x <- "outrageous", not (x `elem` " aeiou")]

hypotenuse :: Floating a => a -> a -> a
hypotenuse a b = sqrt (a ^ 2 + b ^ 2)

--  types are sets of Values
-- eg Int 3 8 10 etc

--  typeclasses are sets of types
-- eg Num Integer Int Double Float

-- Value ==> Type ==> Typeclass (Haskell)
-- Object ==> Class ==> Interface (java)
