main :: IO ()
main = do
  putStrLn "Whats you Name"
  name <- getLine
  putStrLn ("hey" ++ name ++ "welcome to IO()")
  print $ "hey" ++ name ++ "howsut"
