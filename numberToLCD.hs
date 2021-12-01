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



-- <= 0 [] else 1234 -> 1,2,3,4


import Data.List ()

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


l1 :: Int -> String 
l1 1 = sss
l1 2 = sus
l1 3 = sus
l1 4 = sss
l1 5 = sus

l2 :: Int -> String
l2 1 = ssp
l2 2 = sup
l2 3 = sup
l2 4 = pup
l2 5 = pus

l3 :: Int -> String
l3 1 = ssp
l3 2 = pus
l3 3 = sup
l3 4 = ssp
l3 5 = sup

displayLCD :: Int -> IO()
displayLCD 1 = do
    putStrLn (l1 1)
    putStrLn (l2 1)
    putStrLn (l3 1)
displayLCD 2 = do
    putStrLn (l1 2)
    putStrLn (l2 2)
    putStrLn (l3 2)





digits :: Integral x => x -> [x]
digits 0 = []
digits x = digits (x `div` 10) ++ [x `mod` 10]




-- main :: IO ()
main = do
       
    -- let a = map displayLCD (digits 12)
    -- putStr(unwords a)
    -- let line1 =  map l1 digits 12121212121212121 --[1,2,1,2,1,2]

    -- let b = unwords a
    let line1 = [l1 x | x<- digits 1234554321]
    let line2 = [l2 x | x<- digits 1234554321]
    let line3 = [l3 x | x<- digits 1234554321]
    
   
    print (unwords line1)
    print (unwords line2)
    print (unwords line3)
    
    -- print (unwords line2)
    -- print (unwords line3)
