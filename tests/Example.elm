module Example exposing (..)

import Expect
import Fuzz exposing (char, int, list, string)
import Fuzz.Extra
import Test exposing (..)


suite : Test
suite =
    describe "fuzzy"
        [ describe "with list and string"
            [ fuzz (list (list int)) "list (list int)" <|
                \xs ->
                    List.reverse (List.reverse xs) |> Expect.equal xs
            , fuzz (list (list string)) "list (list string)" <|
                \xs ->
                    List.reverse (List.reverse xs) |> Expect.equal xs
            , fuzz (list int) "list int" <|
                \xs ->
                    List.reverse (List.reverse xs) |> Expect.equal xs
            , fuzz (list string) "list string" <|
                \xs ->
                    List.reverse (List.reverse xs) |> Expect.equal xs
            ]
        , describe "with shorList and shortString"
            [ fuzz (shortList (shortList int)) "shortList (shortList int)" <|
                \xs ->
                    List.reverse (List.reverse xs) |> Expect.equal xs
            , fuzz (shortList (shortList shortString)) "shortList (shortList shortString)" <|
                \xs ->
                    List.reverse (List.reverse xs) |> Expect.equal xs
            , fuzz (shortList int) "shortList int" <|
                \xs ->
                    List.reverse (List.reverse xs) |> Expect.equal xs
            , fuzz (shortList shortString) "shortList shortString" <|
                \xs ->
                    List.reverse (List.reverse xs) |> Expect.equal xs
            ]
        ]


shortList : Fuzz.Fuzzer a -> Fuzz.Fuzzer (List a)
shortList itemFuzzer =
    Fuzz.Extra.uniformOrCrash
        [ Fuzz.constant []
        , Fuzz.map (\a -> [ a ]) itemFuzzer
        , Fuzz.map2 (\a b -> [ a, b ]) itemFuzzer itemFuzzer
        ]


shortString : Fuzz.Fuzzer String
shortString =
    Fuzz.Extra.uniformOrCrash
        [ Fuzz.constant ""
        , Fuzz.map (\a -> String.fromList [ a ]) char
        , Fuzz.map2 (\a b -> String.fromList [ a, b ]) char char
        , Fuzz.map3 (\a b c -> String.fromList [ a, b, c ]) char char char
        , Fuzz.map4 (\a b c d -> String.fromList [ a, b, c, d ]) char char char char
        , Fuzz.map5 (\a b c d e -> String.fromList [ a, b, c, d, e ]) char char char char char
        ]
