module Lib
    ( addToInventory
    ) where

import qualified Data.HashMap.Strict as Map
import Data.List (foldl')

addToInventory :: Map.HashMap String Int ->
                  [String] ->
                  Map.HashMap String Int
addToInventory     inventory added_items =
    foldl' addItem inventory added_items
-- idiomatic Haskell:
-- addToInventory = foldl' addItem


addItem :: Map.HashMap String Int ->
           String ->
           Map.HashMap String Int
addItem inventory item =
    let old_val = Map.lookup item inventory in
    case old_val of
        Nothing -> Map.insert item 1 inventory
        Just x -> Map.insert item (x + 1) inventory
