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

line1 "  _  _     _  _  _  _  _ "
line2 "| _| _||_||_ |_   ||_||_|"
line3 "||_  _|  | _||_|  ||_| _|" 

example 158
line1 " "  "_"   "_"
line2 "|" "|_"  "|_|"
line3 "|" " _|" "|_|"

         _______
        |       |           _
2 ->    |   f   | ->        _|
        |_______|          |_
              
                       line1  _
                       line2  _|   
                       line3 |_

l1 :: Int ->   String
l2 :: Int ->   String
l3 :: Int ->   String    

print l1 
print l2
print l3
--}
import Data.List ()
import System.IO
import Codec.Binary.UTF8.String (encode)

--             0   1  2   3   4   5   6   7   8   9
--  line1 = "  _       _   _       _   _  _   _   _ "  
--  line2 = " | |   |  _|  _| |_| |_  |_   | |_| |_|"  
--  line3 = " |_|   | |_   _|   |  _| |_|  | |_|  _|"  
--  
--  line1 = " sus sss sus sus sss sus sus us sus sus"  
--  line2 = " psp ssp sup sup pup pus pus sp pup pup"  
--  line3 = " pup ssp pus sup ssp sup pup sp pup sup"  
--
--  line1 " "  "_"   "_"
--  line2 "|" "|_"  "|_|"
--  line3 "|" " _|" "|_|"

-- s space | u underscore | p  pipe



sss = "   "  
sus = " _ " 
pss = "|  " 
sup = " _|" 
pup = "|_|" 
pus = "|_ "
ssp = "  |"
uup = "__|"
psp = "| |"
sp = " |"
us = "_ "
uss = "_  "
sps = " | "
line1 = [sus , sss , sus , sus , sss , sus , sus , us , sus , sus]
line2 = [psp , ssp , sup , sup , pup , pus , pus , sp , pup , pup]
line3 = [pup , ssp , pus , sup , ssp , sup , pup , sp , pup , sup]

-- encodeDigit :: Int -> [[Char]] -> [[Char]] --  encodeDigit 1 line1 line2 line3 = [sss,ssp,ssp] 
encodeDigit :: Int -> [String]
encodeDigit n   
        | n >= 0 && n <10 = [line1 !! n, line2 !!n, line3 !!n]
        | otherwise = [] 

l1 :: Integer -> String
l1 0 = sus
l1 1 = sss
l1 2 = sus
l1 3 = sus
l1 4 = sss
l1 5 = sus
l1 6 = sus
l1 7 = us
l1 8 = sus
l1 9 = sus

l2 :: Integer -> String
l2 0 = psp
l2 1 = sps
l2 2 = sup
l2 3 = sup
l2 4 = pup
l2 5 = pus
l2 6 = pus
l2 7 = sp
l2 8 = pup
l2 9 = pup

l3 :: Integer -> String
l3 0 = pup
l3 1 = sps
l3 2 = pus
l3 3 = sup
l3 4 = ssp
l3 5 = sup
l3 6 = pup
l3 7 = sp
l3 8 = pup
l3 9 = sup

digits :: Integral x => x -> [x]
digits 0 = []
digits x = digits (x `div` 10) ++ [x `mod` 10]



main :: IO ()
main = do
       
    let line1 = unwords [l1 x | x <- digits 2314675890]
    let line2 = unwords [l2 x | x <- digits 2314675890]
    let line3 = unwords [l3 x | x <- digits 2314675890]

--     let list = [encodeDigit x | x <- digits 123467854321123477543]
--     print list

    print line1
    print line2
    print line3      
     