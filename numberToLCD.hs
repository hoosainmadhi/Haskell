{--
## Goal: write a program that displays LCD style numbers.

### Part 1

Write a program that given a number (with arbitrary number of digits), converts it into LCD style numbers using the following format:

   _  _     _  _  _  _  _  
 | _| _||_||_ |_   ||_||_|  
 ||_  _|  | _||_|  ||_| _|  
  
(each digit is 3 lines high)
--------------------------------------------------------------------
125
line1 n _   _
line2 | _| |_
line3 ||_   _| 

line1 " " "_" "_" " " "_" "_" "_" "_" "_"
line2 "|" "_|" "_|" "|_|" "|_" "|_" "|" "|_|" "|_|"
line3 "|" "|_" "_|" "s|" "_|" "|_|" "|" "|_|" "_|"

example 158
line1 " "  "_"   "_"
line2 "|" "|_"  "|_|"
line3 "|" " _|" "|_|"
 
         _______
        |       |           _
2 ->    |       | ->        _|
        |_______|          |_
            

--}



-- <= 0 [] else 1234 -> 1,2,3,4


import Data.List ()

digits :: Integral x => x -> [x]
digits 0 = []
digits x = digits (x `div` 10) ++ [x `mod` 10]



digitToLCD :: Int -> String
digitToLCD 1 = "|\n\
               \|\n"

digitToLCD 2 = "_\n\
               \ _|\n\
               \|_\n"

digitToLCD 3 = "_\n\
               \ _|\n\
               \ _|\n"

digitToLCD 4 = "Four"
digitToLCD 5 = "Five"
digitToLCD 6 = "Six"
digitToLCD 7 = "Seven"
digitToLCD 8 = "Eight"
digitToLCD 9 = "Nine"
digitToLCD 0 = "Zero"





digitToLCD a = show a

main :: IO ()
main = do
--     let a = map digitToLCD (digits 12)
--     putStr(unwords a)
--     print a
       print [digitToLCD x | x <-digits 12]
    -- print "\n"