
{-# LANGUAGE LambdaCase #-}

module Lib
    ( strip
    ) where

import Data.Either
import Text.Regex

strip :: [String] -> Either String String
strip = \case
    [] -> Left "Too few arguments!"
    [txt] -> txt `without` " " 
    [txt, chars] -> txt `without` chars
    _ -> Left "Too many arguments!"

without txt chars =
    Right $
        subRegex
            (mkRegex $ "[" ++ chars ++ "]") txt ""
