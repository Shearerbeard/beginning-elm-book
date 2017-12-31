module BrowserRunner exposing (..)

import Test.Runner.Html
import TestMain exposing (suite)


main : Test.Runner.Html.TestProgram
main =
    Test.Runner.Html.run suite
