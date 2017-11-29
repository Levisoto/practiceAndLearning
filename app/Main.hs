module Main where

import Control.Monad
import Lib

--main :: IO ()
--main = someFunc
--
main = do 
  --putStrLn "Hello World!"
  --putStrLn "main is a function"
---------------------------------------------------------------------
--  putStrLn "Why did the banker leave his job"
--  answer <- getLine
--  putStrLn (if answer == "he lost interest"
--            then "correct!" 
--            else "Wrong!"
--           )
---------------------------------------------------------------------
--  input <- getLine
--  putStrLn ("you wrote: " ++ input)
---------------------------------------------------------------------
--  putStrLn "quit the program? y/n"
--  ans <- getLine
--  if ans /= "y" then do
--    putStrLn "not quitting"
--    main
--  else return ()
---------------------------------------------------------------------
  putStrLn "quit? y/n"
  ans <- getLine
  when (ans /= "y") $ do
    putStrLn "not quiting"
    main
