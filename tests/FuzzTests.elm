module FuzzTests exposing (allTests)

import Expect
import Fuzz exposing (..)
import RippleCarryAdder exposing (..)
import Test exposing (Test, describe, test, fuzzWith, fuzz3)


allTests : Test
allTests =
    describe "Example Fuzz Tests"
        [ addOneTests, rippleCarryAdderFuzzTests ]


addOneTests : Test
addOneTests =
    describe "addOne"
        [ fuzzWith { runs = 200 } int "adds 1 to any integer" <|
            \num ->
                addOne num |> Expect.equal (num + 1)
        ]


addOne : Int -> Int
addOne x =
    1 + x


rippleCarryAdderFuzzTests : Test
rippleCarryAdderFuzzTests =
    describe "Fuzz tests"
        [ fuzz3
            (intRange 0 1111)
            (intRange 0 1111)
            (intRange 0 1)
            "fuzz tests for ripple carry adder" <|
            \a b carryIn ->
                rippleCarryAdder a b carryIn
                    |> digits
                    |> List.length
                    |> Expect.lessThan 5
        ]
