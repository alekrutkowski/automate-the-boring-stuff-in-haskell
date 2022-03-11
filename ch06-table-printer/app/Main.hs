{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

main :: IO ()
main = do
    let table_data =
         [["apples","oranges","cherries","banana"],
          ["Alice","Bob","Carol","David"],
          ["dogs","cats","moose","goose"]] :: [[T.Text]]
    mapM_ TIO.putStrLn $
        forPrinting table_data
