{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}

module Lib
    ( toDate
    ) where

import Text.RE.PCRE.Text
import qualified Data.Text as T
import qualified Data.Text.Read as TR
import Data.Either (fromRight)

matchedDate :: T.Text -> Maybe T.Text
matchedDate x =
    x ?=~ [re|[0-9]{2}/[0-9]{2}/[0-9]{4}|] |>
    matchedText

(|>) x f = f x

txtToInt x =
    x |>
    TR.decimal |>
    fromRight (0,"") |>
    fst

isDivisibleBy a b =
    a `mod` b == 0

-- the eta-reduction for 2-argument inner function
-- taken from:
-- https://melkornemesis.medium.com/haskell-explained-3f91658a67d3    
isNotDivisibleBy =
    (not .) . isDivisibleBy

isLeapYear :: Int -> Bool
isLeapYear y =
    y `isDivisibleBy` 4 &&
    (y `isNotDivisibleBy` 100 ||
     y `isDivisibleBy` 400)
    
if' a b =
    if a then b else True

isCorrectDate :: [Int] -> Bool
isCorrectDate [d,m,y] =
    d>0 && d<=31 &&
    m>0 && m<=12 &&
    if' (m==2)
        (if isLeapYear y then d<=29 else d<=28) &&
    if' (m `elem` [4,6,9,11])
        (d<=30)

toDate :: T.Text -> [Int]
toDate x =
    case matchedDate x of
        Nothing -> []
        Just a -> T.splitOn "/" a |>
                    map txtToInt |>
                    \x -> if isCorrectDate x
                          then x else []
