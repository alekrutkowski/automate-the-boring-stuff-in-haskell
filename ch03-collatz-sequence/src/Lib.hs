module Lib
    ( collatz
    , collatz'
    ) where

collatz number
    | even number = number `div` 2
    | odd number = 3*number + 1

collatz' n =
    print n *>
    if n==1
        then return n
        else collatz' $ collatz n
