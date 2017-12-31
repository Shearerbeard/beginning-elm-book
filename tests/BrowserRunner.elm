module BrowserRunner exposing (..)

import RippleCarryAdderTests exposing (allTests)
import Test.Runner.Html


main : Test.Runner.Html.TestProgram
main =
    Test.Runner.Html.run allTests
