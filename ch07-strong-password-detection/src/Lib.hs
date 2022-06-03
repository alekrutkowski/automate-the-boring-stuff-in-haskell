{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}

module Lib
    ( isValidPassword
    ) where

import Text.RE.PCRE.Text
import qualified Data.Text as T

isValidPassword :: T.Text -> Bool
isValidPassword x =
    T.length x >= 8 &&
    (and $ map matched [
            x ?=~ [re|[0-9]|]
        ,   x ?=~ [re|[a-z]|]
        ,   x ?=~ [re|[A-Z]|]
    ])
