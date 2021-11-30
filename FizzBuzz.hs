fizzBuzz :: Int -> String
fizzBuzz a
  | a `mod` 3 == 0 && a `mod` 5 == 0 = "FizzBuzz"
  | a `mod` 5 == 0 = "Buzz"
  | a `mod` 3 == 0 = "Fizz"
  | otherwise = show a

main :: IO ()
main = putStr $ unlines $ map fizzBuzz [1 .. 100]