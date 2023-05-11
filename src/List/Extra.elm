module List.Extra exposing (rangeN)

import List


{-| Create a list of `n` natural integers starting from 1.

    rangeN 0 == []

    rangeN 3 == [ 1, 2, 3 ]

-}
rangeN : Int -> List Int
rangeN n =
    rangeNHelp n []


rangeNHelp : Int -> List Int -> List Int
rangeNHelp n list =
    if n < 1 then
        list

    else
        rangeNHelp (n - 1) (n :: list)
