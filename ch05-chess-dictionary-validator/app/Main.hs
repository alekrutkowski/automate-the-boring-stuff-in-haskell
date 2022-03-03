module Main where

import Lib
import qualified Data.HashMap.Strict as Map

isCorrect x
    | x = "yes"
    | not x = "something's wrong in the program!"

main :: IO ()
main = do
    let good_board =
            Map.fromList [
                    ("1h" , "bking")
                ,   ("6c" , "wqueen")
                ,   ("2g" , "bbishop")
                ,   ("5h" , "bqueen")
                ,   ("3e" , "wking")
            ]
    let bad_board_1 =
            Map.fromList [
                    ("9z" , "bking") -- wrong position
                ,   ("6c" , "wqueen")
                ,   ("2g" , "bbishop")
                ,   ("5h" , "bqueen")
                ,   ("3e" , "wking")
            ]
    let bad_board_2 =
            Map.fromList [
                    ("1h" , "bking")
                ,   ("6c" , "wqueen")
                ,   ("2g" , "bbishop")
                ,   ("5h" , "bqueen")
                ,   ("3e" , "wking")
                ,   ("4f" , "wking") -- duplicated king
            ]
    putStrLn $ "good_board? " ++
        isCorrect (isValidChessBoard good_board)
    putStrLn $ "bad_board_1? " ++
        isCorrect (not $ isValidChessBoard bad_board_1)
    putStrLn $ "bad_board_2? " ++
        isCorrect (not $ isValidChessBoard bad_board_2)
