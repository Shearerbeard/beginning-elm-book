module TestMain exposing (..)

import RippleCarryAdderTests exposing (allTests)
import Test exposing (Test)


suite : Test
suite =
    Test.concat
        [ allTests ]
