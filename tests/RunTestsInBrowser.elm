module RunTestsInBroswer exposing (main)

import RippleCarryAdderTests exposing (allTests)
import Test.Runner.Html exposing (run)


main : Test.Runner.Html.TestProgram
main =
    run allTests
