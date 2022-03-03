module Lib
    ( isValidChessBoard
    ) where

import qualified Data.HashMap.Strict as Map
import Text.Read (readMaybe)
import Data.Maybe (isJust, fromJust)
import Data.List (takeWhile) -- not used: sort, foldl'

-- import Debug.Trace (trace)
-- tr x = trace (show x) x

type ChessBoard = Map.HashMap

isValidChessBoard :: ChessBoard String String -> Bool
isValidChessBoard chb =
    all' (map isValidKey $ Map.keys chb)              &&
    all' (map isValidVal vals)                        &&
    all' (map (\x -> length x <= 16) [whites,blacks]) &&
    all' (map correctNumOf [whites,blacks])          
    where
        vals = Map.elems chb
        takeColor c vs = map tail $ -- get rid of initial 'w' or 'b'
            filter (\v -> head v == c) $
            vs
        whites = takeColor 'w' vals
        blacks = takeColor 'b' vals
        maxNums = Map.fromList [
                ("king"  ,1)
            ,   ("queen" ,1)
            ,   ("rook"  ,2)
            ,   ("bishop",2)
            ,   ("knight",2)
            ,   ("pawn"  ,8)
            ] :: Map.HashMap String Int
        maxNumOf piece = fromJust $
            Map.lookup piece maxNums
        correctNumOf pieces =
            all' $
            map (\p -> count p pieces <= maxNumOf p) pieces

all' =
    all (== True)

count :: Eq a => a -> [a] -> Int      
count x =
    length . filter (== x)

-- Ultimately not used

-- counts :: [a] -> Map.HashMap a Int
-- counts xs =
--     Map.fromList $
--     map (\x -> (x , count x xs)) $
--     uniq xs

-- uniq :: Ord a => [a] -> [a]
-- uniq xs =
--     let s = sort xs in
--         foldl'
--         (\ y x -> if x == last y then y else y ++ [x])
--         [head s] $ tail s

isValidVal :: [Char] -> Bool
isValidVal v =
    length v > 1 &&
    head v `elem` ['w','b'] &&
    tail v `elem` ["pawn"
                   ,"knight"
                   ,"bishop"
                   ,"rook"
                   ,"queen"
                   ,"king"]    

isValidKey :: [Char] -> Bool
isValidKey k =
    length k == 2 &&
    k !! 1 `elem` ['a'..'h'] &&
    isJust n &&
    fromJust n `elem` [1..8]
    where
        n = readMaybe [k !! 0] :: Maybe Int
