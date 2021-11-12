import Lib
  ( a,
    addMe,
    doubleUs,
    factorial,
    lucky,
    mesg,
    message,
    msg,
    removeNonUpperCase,
  )

-- functional
-- lazy
-- type inference
main :: IO ()
main =
  do
    putStr "sum of x + y = "
    print (addMe 10 33)
    print (factorial 8)
    putStr (lucky 777)
    print (lucky 9)
    print (removeNonUpperCase "FooBar")
    print a
    print (doubleUs 8 9)
    putStrLn (message "Hoosain")
    putStrLn (mesg "Foo")
    putStrLn (msg "Other")
    print (abs (-100))