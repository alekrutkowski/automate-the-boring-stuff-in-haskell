module Main where

import Lib
import qualified Data.HashMap.Strict as Map

printValKey entry =
    let (k,v) = entry in
        putStrLn $
        show v ++ " " ++ k

main :: IO ()
main = do
    let dragon_loot = ["gold coin"
                      ,"dagger"
                      ,"gold coin"
                      ,"gold coin"
                      ,"ruby"]
        inv = Map.fromList
            [("gold coin", 42)
            ,("rope", 1)]
        new_inv = addToInventory inv dragon_loot
    putStrLn "Inventory:"
    mapM_ printValKey $ Map.toList
        new_inv
    putStrLn $
        "\nTotal number of items: " ++
        show (sum $ Map.elems new_inv)
