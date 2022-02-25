module Main where

import Lib (commaCode)
import System.Environment (getArgs)

main :: IO ()
main = do
    inp <- getArgs
    print $ commaCode inp
    return ()
