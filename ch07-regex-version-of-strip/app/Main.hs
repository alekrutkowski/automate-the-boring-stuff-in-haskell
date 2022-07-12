module Main where

import Lib

main :: IO ()
main = do
    pp $ strip [">>  testing <<"]
        -- output: Right ">>testing<<"
    pp $ strip [">>  testing <<", "ei"]
        -- output: Right ">>  tstng <<"
    pp $ strip [">>  testing <<", "t "]
        -- output: Right ">>esing<<"
    pp $ strip []
        -- output: Left "Too few arguments!"
    pp $ strip ["a","b","c"]
        -- output: Left "Too many arguments!"
    where pp = putStrLn . show
