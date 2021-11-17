{--
1. name the function
2. write down the type
3. enumerate the cases
4. define the simple case
5. List the ingrdients
6. define the other cases
7. think about result
--}

myGCD :: Integral t => t -> t -> t
myGCD a b =
  if remainder == 0
    then b
    else myGCD b remainder
  where
    remainder = a `mod` b

addAnA :: [[Char]] -> [[Char]]
addAnA [] = []
addAnA (x : xs) = ("a " ++ x) : addAnA xs

-- sum (1,2,3,4)
sum' :: Num a => [a] -> a
sum' [] = 0
sum' (x : xs) = x + sum' xs

-- summ = foldr (+) 0

-- drop' :: a -> [a] -> [a]

-- eg drop 4 [1,2,3,4,6,7]

drop' :: (Eq t, Num t) => t -> [a] -> [a]
drop' 0 [] = []
drop' 0 (x : xs) = x : xs
-- drop' 0 xs = xs
drop' n (x : xs) = drop' (n -1) xs

-- function removes last element frim non-emp list

init' :: [a] -> [a]
init' (x : xs)
  | null xs = []
  | otherwise = init' xs

initt :: [a] -> [a]
initt [_] = []
initt (x : xs) = x : initt xs

ini :: a -> [a]
ini [_] = []
ini (x:xs) = x:ini x