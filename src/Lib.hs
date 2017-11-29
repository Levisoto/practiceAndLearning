module Lib where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

--Function t call Gregory Series

piGuess :: Int -> Double
piGuess n = sum $ map f [1..n]

f :: Int -> Double
f x = 4*(-1)^(x+1)/(2.0*k-1)
  where
    k = fromIntegral x

data List t = E 
            | C t (List t)
            deriving (Show, Eq)

-- filterList E _ = E
-- filterList p (C x xs)
--   | p x = C x (filterList p xs)
--   | otherwise = filterList p xs

-------------------------------------------------------------------------
-------------------------------------------------------------------------

takePosition :: [a] -> Int -> [a]
takePosition list n = [ list !! (x-1)| x <-[1..length list], mod x n == 0]

skips :: [a] -> [[a]]
skips list = [takePosition list x | x <- [1..length list]]

-------------------------------------------------------------------------
-------------------------------------------------------------------------
