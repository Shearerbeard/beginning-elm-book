module TestMain exposing (..)

import FuzzTests exposing (allTests)
import RippleCarryAdderTests exposing (all)
import Test exposing (Test)


suite : Test
suite =
    Test.concat
        [ all, allTests ]
