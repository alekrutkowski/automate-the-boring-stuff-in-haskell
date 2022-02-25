module Main where

import Lib (collatz')
import Text.Read (readMaybe)
import Data.Maybe (isNothing, fromJust)
import System.IO (hFlush, stdout)
        
main :: IO ()
main = do
    putStr "\nEnter number: "
    hFlush stdout -- otherwise putStr is printed too late
    inp <- getLine
    let possibly_num = readMaybe inp :: Maybe Integer
    if ((not $ isNothing possibly_num) &&
            fromJust possibly_num > 1)
        then do
            collatz' $ fromJust possibly_num
            return ()
        else do
            putStrLn "Wrong input! It must be an integer > 1."
            main
