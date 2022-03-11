module Lib
    ( forPrinting
    ) where

import qualified Data.Text as T
import Data.List (transpose)

max' :: Ord a => [a] -> a
max' = foldl1 max

maxLength :: [T.Text] -> Int
maxLength = max' . map T.length

justify :: [T.Text] -> [T.Text]
justify xs =
    map
    (T.justifyRight (maxLength xs) ' ')
    xs

justifyMulti :: [[T.Text]] -> [[T.Text]]
justifyMulti =
    map justify
    
(|>) x f = f x

forPrinting :: [[T.Text]] -> [T.Text]
forPrinting x =
    x |>
    justifyMulti |>
    transpose |>
    map T.unwords
