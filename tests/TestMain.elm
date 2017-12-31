module TestMain exposing (..)

import RippleCarryAdderTests exposing (all)
import Test exposing (Test)


suite : Test
suite =
    Test.concat
        [ all ]
