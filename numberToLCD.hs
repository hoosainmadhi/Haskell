import Graphics.Rendering.OpenGL (DataType (TwoBytes))
import Distribution.Compat.CharParsing (newline)

{--
## Goal: write a program that displays LCD style numbers.

### Part 1

Write a program that given a number (with arbitrary number of digits), converts it into LCD style numbers using the following format:

   _  _     _  _  _  _  _  
 | _| _||_||_ |_   ||_||_|  
 ||_  _|  | _||_|  ||_| _|  
  
(each digit is 3 lines high)
--------------------------------------------------------------------
         _______
        |       |           _
2 ->    |       | ->        _|
        |_______|          |_
            

--}

numberToLCD :: Int -> String
numberToLCD 1 = "foo"
numberToLCD 2 = "Two"
numberToLCD a = show a

main = putStr $ numberToLCD 3
