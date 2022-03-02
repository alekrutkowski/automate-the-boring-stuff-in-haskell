module Lib
    ( coinFlip
    , streakCount
    ) where

import System.Random (RandomGen, uniformR)
import Data.List (unfoldr)

coinFlip :: RandomGen g => Int -> g -> [Int]
coinFlip n g = take n .
    unfoldr
    (Just . uniformR (0, 1)) $
    g

streakCount :: [Int] -> Integer
streakCount xs
    | length xs < 6 = 0
    | otherwise =
        (if allEqual [a,b,c,d,e,f] then 1 else 0) +
        streakCount ([b,c,d,e,f] ++ z)
            where a:b:c:d:e:f : z = xs

allEqual :: [Int] -> Bool
allEqual xs
    | length xs < 2 = True
    | otherwise = x==y && allEqual (y:z)
        where x:y:z = xs
