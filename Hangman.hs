import System.IO (IOMode (ReadMode), hClose, hGetContents, openFile)

main :: IO ()
main = do
  putStr "Hangman "
  handle <- openFile "enable1.txt" ReadMode
  contents <- hGetContents handle
  putStrLn ("there are " ++ show (length (lines contents)) ++ " words")
  putStrLn contents
  hClose handle
