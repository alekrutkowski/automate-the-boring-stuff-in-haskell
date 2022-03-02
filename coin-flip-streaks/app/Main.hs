module Main where

import Lib (coinFlip, streakCount)
import System.Random (mkStdGen)
import System.Environment (getArgs)

main :: IO ()
main = do
    inp <- getArgs
    if length inp < 2
        then do
            putStrLn $
                "Error! 2 numbers required\n" ++
                "following the program name:\n" ++
                "the number of coin flips and\n" ++
                "the random gen. seed"
        else do
            let x = (read $ inp !! 0 :: Int)
            let seed = (read $ inp !! 1 :: Int)
            let pureGen = mkStdGen seed
            let cf = coinFlip x pureGen
            let n = streakCount cf
            putStrLn $
                "The number of consecutive\n" ++
                "6 heads and 6 tails\n" ++
                "in " ++ show x ++ " coin flips:\n" ++
                show n
