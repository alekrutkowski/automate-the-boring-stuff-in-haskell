module Lib
    ( commaCode
    ) where

import qualified Data.Text as T (Text, pack, append, concat)
import Data.List (init, last, intersperse)

commaCode :: [String] -> T.Text
commaCode x =
    let text_list = map T.pack x in 
    let all_but_last_word = init text_list in
    let last_word = T.append (T.pack "and ") (last text_list) in
    T.concat $
        intersperse (T.pack ", ") (all_but_last_word ++ [last_word])
