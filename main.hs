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
import Shape (Shape (Circle), area)

-- functional
-- lazy
-- type inference

main :: IO ()
main =
  do
    let c1 = Circle 10
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
    print c1
    print (area c1)