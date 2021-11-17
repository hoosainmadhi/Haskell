sayMe :: (Eq a, Num a) => a -> [Char]
sayMe 1 = "One"
sayMe 2 = "two"
sayMe 3 = "three"
sayMe 4 = "four"
sayMe 5 = "five"
sayMe 6 = "six"
sayMe _ = "not between 1 and 5" --catch all

charName :: Char -> [Char]
charName 'a' = "Albert"
charName 'b' = "Boi"
charName 'c' = "cecel"
charName _ = "foo" --  catchalle

-- BMI
bmiTell :: Double -> [Char]
bmiTell bmi
  | bmi <= 18.5 = "Underweight"
  | bmi <= 25 = "Normal"
  | bmi <= 30 = "fat"
  | otherwise = "you a whale"

bmiTell' :: (Fractional a, Ord a) => a -> a -> [Char]
bmiTell' weight height
  | weight / height ^ 2 <= 18.5 = "Under"
  | weight / height ^ 2 <= 25 = "Normal"
  | weight / height ^ 2 <= 30 = "fat"
  | otherwise = "whale"

bmiTell'' :: (Ord a, Fractional a) => a -> a -> [Char]
bmiTell'' weight height
  | bmi <= 18.5 = "Underweight"
  | bmi <= 25 = "Normal"
  | bmi <= 30 = "fat"
  | otherwise = "you a whale"
  where
    bmi = weight / height ^ 2

caclBmi :: Fractional a => [(a, a)] -> [a]
caclBmi xs = [bmi w h | (w, h) <- xs]
  where
    bmi weight height = weight / height ^ 2

calcBmis :: Fractional a => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]

{-
Really, the main difference between the two is that let expressions
are . . . well . . . expressions, whereas where bindings aren’t. If something is
an expression, then it has a value. "boo!" is an expression, as are 3 + 5 and
head [1,2,3] . This means that you can use let expressions almost anywhere
in your code, like this:
ghci> 4 * (let a = 9 in a + 1) + 2
42

-}

cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea = pi * r ^ 2
   in sideArea + 2 * topArea

