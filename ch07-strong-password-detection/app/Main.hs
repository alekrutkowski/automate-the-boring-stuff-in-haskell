{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib
import qualified Data.Text.IO as TIO

verify x =
    let ok = isValidPassword x
    in TIO.putStrLn $
        (if ok
         then "correct password: "
         else "wrong password: ") <>
        x

main :: IO ()
main = do
    let correct_password1 = "abc_DEF1"
        correct_password2 = "0@passWORD"
        wrong_password1 =   "abc1DE"  -- too short
        wrong_password2 =   "__abcdef" -- no capital letter
        wrong_password3 =   "abc_DEFG" -- no digit
    verify correct_password1
    verify correct_password2
    verify wrong_password1
    verify wrong_password2
    verify wrong_password3
