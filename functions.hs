-- Functions can be used as arguments and returned as
-- values from other functions

ifEvenInc :: Integral p => p -> p
ifEvenInc n =
  if even n
    then n + 1
    else n

ifEvenDouble :: Integral p => p -> p
ifEvenDouble n =
  if even n
    then n * 2
    else n

ifEvenSquare :: Integral p => p -> p
ifEvenSquare n =
  if even n
    then n ^ 2
    else n

-- if a number is even call function to inc/double/etc
ifEven :: Integral p => (p -> p) -> p -> p
ifEven myFunc x =
  if even x
    then myFunc x
    else x

-- closure :
-- By combining these lambda functions and first-class functions to create closures, you can
-- dynamically create functions.

-- When you capture a value inside
-- a lambda function, this is referred to as a closure
genIfEven :: Integral p => (p -> p) -> p -> p
genIfEven f = (\x -> ifEven f x)

ifEvenInc' :: Integer -> Integer
ifEvenInc' = genIfEven inc

ifEvenDouble' :: Integer -> Integer
ifEvenDouble' = genIfEven double

inc :: Num a => a -> a
inc n = n + 1

double :: Num a => a -> a
double n = n * 2

square :: Num a => a -> a
square n = n ^ 2

cube :: Num a => a -> a
cube n = n ^ 3

negate' :: Num a => a -> a
negate' n = - n

--can also write wwith  a lamda
-- ifEven (\x -> x^3) n

names :: [([Char], [Char])]
names =
  [ ("Ian", "Curtis"),
    ("Bernard", "Sumner"),
    ("Peter", "Hook"),
    ("Stephen", "Morris")
  ]

compareLastNames :: Ord a1 => (a2, a1) -> (a3, a1) -> Ordering
compareLastNames name1 name2 =
  if lastName1 > lastName2
    then GT
    else
      if lastName1 < lastName2
        then LT
        else EQ
  where
    lastName1 = snd name1
    lastName2 = snd name2

-- return a function

addressLetter :: ([Char], [Char]) -> [Char] -> [Char]
addressLetter name location = nameText ++ " - " ++ location
  where
    nameText = (fst name) ++ " " ++ (snd name)

-- function as arguments

applyTwice :: (t -> t) -> t -> t
applyTwice f x = f (f x)

zipWith' :: (t1 -> t2 -> a) -> [t1] -> [t2] -> [a]
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

-- FLip

flip' :: (t1 -> t2 -> t3) -> t2 -> t1 -> t3
flip' f x y = f y x

flip'' :: (t1 -> t2 -> t3) -> t2 -> t1 -> t3
flip'' f = g
  where
    g x y = f y x

-- closure :
-- By combining lambda functions and first-class functions to create closures, you can
-- dynamically create functions.

-- When you capture a value inside
-- a lambda function, this is referred to as a closure
getRequestURL :: [Char] -> [Char] -> [Char] -> [Char] -> [Char]
getRequestURL host apiKey resource id =
  host
    ++ "/"
    ++ resource
    ++ "/"
    ++ id
    ++ "?token="
    ++ apiKey

getUrl :: p1 -> p2 -> p3 -> p4 -> [Char]
getUrl a b c d  = "a" ++ "b" ++ "c" ++ "d"

buildURL a = (\b c d -> )


genHostRequestBuilder :: [Char] -> [Char] -> [Char] -> [Char] -> [Char]
genHostRequestBuilder host = (\apiKey resource id -> getRequestURL host apiKey resource id)


{--
f(x) = x^2 -2x + 5
or
f x = x^2 -2x + 5
or
λx[x2−2⋅x+5].
The λ operators allows us to abstract over x.
One can intuitively read ‘λx[x2−2⋅x+5]’
as an expression that is waiting for a value
a for the variable x.
When given such a value a (such as the number 2),
the value of the expression is a2−2⋅a+5.

basic example:
f(x) = x^2
or
x->x^2
or
\x->x^2 (haskell  lamda)
or
f x = x^2 (haskell)

--}
