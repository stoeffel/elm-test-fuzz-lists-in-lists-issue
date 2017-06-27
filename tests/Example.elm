module Example exposing (..)

import Expect
import Fuzz exposing (int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "fuzz list in list"
        [ fuzz (list (list int)) "List (List Int)" <|
            \xs ->
                List.reverse (List.reverse xs) |> Expect.equal xs
        , fuzz (list (list string)) "List (List String)" <|
            \xs ->
                List.reverse (List.reverse xs) |> Expect.equal xs
        , fuzz (list int) "List Int" <|
            \xs ->
                List.reverse (List.reverse xs) |> Expect.equal xs
        , fuzz (list string) "List String" <|
            \xs ->
                List.reverse (List.reverse xs) |> Expect.equal xs
        ]
