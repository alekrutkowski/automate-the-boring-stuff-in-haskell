{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib
import qualified Data.Text.IO as TIO

verify x =
    let res = toDate x
    in TIO.putStrLn $
        (if length res /= 0
         then "correct date: "
         else "wrong date: ") <>
        x

main :: IO ()
main = do
    let correct_date1 = "01/01/2022"
        correct_date2 = "29/02/2020"
        wrong_date1 =   "31/02/2012"
        wrong_date2 =   "60/01/1901"
        wrong_date3 =   "06/16/1901"
    verify correct_date1
    verify correct_date2
    verify wrong_date1
    verify wrong_date2
    verify wrong_date3
