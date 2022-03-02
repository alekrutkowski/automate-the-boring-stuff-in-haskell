module Main where

import qualified Data.Text  as T (Text, pack, transpose)
import qualified Data.Text.IO as TIO (putStrLn) 

grid :: [T.Text]
grid = map T.pack
       [['.', '.', '.', '.', '.', '.'],
        ['.', 'O', 'O', '.', '.', '.'],
        ['O', 'O', 'O', 'O', '.', '.'],
        ['O', 'O', 'O', 'O', 'O', '.'],
        ['.', 'O', 'O', 'O', 'O', 'O'],
        ['O', 'O', 'O', 'O', 'O', '.'],
        ['O', 'O', 'O', 'O', '.', '.'],
        ['.', 'O', 'O', '.', '.', '.'],
        ['.', '.', '.', '.', '.', '.']]

main :: IO ()
main =
    mapM_ TIO.putStrLn $
        T.transpose grid
