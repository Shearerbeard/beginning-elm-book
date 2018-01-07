module Playground exposing (..)

import Html exposing (Html, text)
import List exposing (isEmpty)
import MyList exposing (..)
import Regex


multiplier : Int
multiplier =
    2


scores : List Int
scores =
    [ 316, 320, 312, 370, 337, 318, 314 ]


doubleScores : List Int -> List Int
doubleScores scores =
    List.map (\x -> x * multiplier) scores



{- Takes a list of string and
   returns an integer value
-}


guardiansWithShortNames : List String -> Int
guardiansWithShortNames guardians =
    guardians
        |> List.map String.length
        |> List.filter (\x -> x < 6)
        |> List.length


type Greeting
    = Howdy
    | Hola
    | Namaste String
    | NumericalHi Int Int


sayHello : Greeting -> String
sayHello greeting =
    case greeting of
        Howdy ->
            "How y'all doin'?"

        Hola ->
            "Hola amigo!"

        Namaste message ->
            message

        NumericalHi value1 value2 ->
            value1 + value2 |> toString

type alias User =
    { name : String
    , email : String
    , age : Int
    , isLoggedIn : Bool
    }


welcomeMessage : { a | isLoggedIn : Bool, name : String } -> String
welcomeMessage { isLoggedIn, name } =
    case isLoggedIn of
        True ->
            "Welcome " ++ name ++ "!"

        False ->
            "Please log in"


signUp : String -> String -> Result String String
signUp email age =
    case String.toInt age of
        Err message ->
            Err message

        Ok age ->
            let
                emailPattern =
                    Regex.regex "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b"

                isValidEmail =
                    Regex.contains emailPattern email
            in
                if age < 13 then
                    Err "You need to be at least 13 years old to sign up."
                else if isValidEmail then
                    Ok "Your account has been created successfully!"
                else
                    Err "You entered an invalid email."


type alias Character =
    { name : String
    , age : Maybe Int
    }


sansa : Character
sansa =
    { name = "Sansa"
    , age = Just 19
    }


arya : Character
arya =
    { name = "Arya"
    , age = Nothing
    }


jonSnow : Character
jonSnow =
    Character "Jon Snow" <| Just 21


rickon : Character
rickon =
    Character "Rickon" <| Just 11


robb : Character
robb =
    Character "Robb" <| Just 18


getAdultAge : Character -> Maybe Int
getAdultAge character =
    case character.age of
        Nothing ->
            Nothing

        Just age ->
            if age >= 18 then
                Just age
            else
                Nothing



-- type Tree a
--     = Empty
--     | Node a (Tree a) (Tree a)
-- exampleTree : Tree Int
-- exampleTree =
--     Node '1'
--         (Node '2'
--             (Node '4'
--                 Empty
--                 (Node '8' Empty Empty)
--             )
--             (Node '5' Empty Empty)
--         )
--         (Node '3'
--             (Node '6' Empty Empty)
--             (Node '7'
--                 (Node '9' Empty Empty)
--                 Empty
--             )
--         )


list1 : MyList a
list1 =
    Empty


list2 : MyList number
list2 =
    Node 9 Empty


list3 : List a
list3 =
    []


main : Html msg
main =
    List.isEmpty list3
        |> toString
        |> text


weekday : Int -> String
weekday dayInNumber =
    case dayInNumber of
        0 ->
            "Sunday"

        1 ->
            "Monday"

        2 ->
            "Tuesday"

        3 ->
            "Wednesday"

        4 ->
            "Thursday"

        5 ->
            "Friday"

        6 ->
            "Saturday"

        _ ->
            "Unknown day"


resultMap5Example : Result String Int
resultMap5Example =
    Result.map5 addFiveNumbers
        (String.toInt "1")
        (String.toInt "2")
        (String.toInt "2")
        (String.toInt "2")
        (String.toInt "2")


addFiveNumbers : Int -> Int -> Int -> Int -> Int -> Int
addFiveNumbers a b c d e =
    a + b + c + d + e


-- main =
