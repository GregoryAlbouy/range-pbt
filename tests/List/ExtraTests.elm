module List.ExtraTests exposing (..)

import Expect
import Fuzz exposing (Fuzzer)
import List.Extra exposing (rangeN)
import Test exposing (Test, describe, fuzz)


nat : Fuzzer Int
nat =
    Fuzz.intRange 0 100


testRangeN : Test
testRangeN =
    describe "rangeN"
        [ fuzz nat "creates a list of given length" <|
            \n ->
                rangeN n
                    |> List.length
                    |> Expect.equal n
        , fuzz nat "sum" <|
            \n ->
                rangeN n
                    |> (++) (List.reverse (rangeN n))
                    |> List.sum
                    |> Expect.equal (n * (n + 1))
        , fuzz nat "exact values" <|
            \n ->
                rangeN n
                    |> List.indexedMap Tuple.pair
                    |> List.all (\( i, v ) -> v == i + 1)
                    |> Expect.equal True
        ]
