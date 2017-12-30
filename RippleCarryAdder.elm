module RippleCarryAdder exposing (..)

import Array
import Bitwise


type alias CarrySum =
    { carry : Int
    , sum : Int
    }

andGate : Int -> Int -> Int
andGate a b =
    Bitwise.and a b


orGate : Int -> Int -> Int
orGate a b =
    Bitwise.or a b


inverter : Int -> Int
inverter a =
    case a of
        0 ->
            1

        1 ->
            0

        _ ->
            -1


halfAdder : Int -> Int -> CarrySum
halfAdder a b =
    let
        d =
            orGate a b

        e =
            andGate a b
                |> inverter

        sumDigit =
            andGate d e

        carryOut =
            andGate a b
    in
        { carry = carryOut
        , sum = sumDigit
        }


fullAdder : Int -> Int -> Int -> CarrySum
fullAdder a b carryIn =
    let
        firstResult =
            halfAdder b carryIn

        secondResult =
            halfAdder a firstResult.sum

        finalCarry =
            orGate firstResult.carry secondResult.carry
    in
        { carry = finalCarry
        , sum = secondResult.sum
        }


rippleCarryAdder : Int -> Int -> Int -> Int
rippleCarryAdder a b carryIn =
    let
        -- Extract Digits
        ( a3, a2, a1, a0 ) =
            extractDigits a

        ( b3, b2, b1, b0 ) =
            extractDigits b

        firstResult =
            fullAdder a0 b0 carryIn

        secondResult =
            fullAdder a1 b1 firstResult.carry

        thirdResult =
            fullAdder a2 b2 secondResult.carry

        finalResult =
            fullAdder a3 b3 thirdResult.carry
    in
        [finalResult, thirdResult, secondResult, firstResult]
            |> List.map .sum
            |> (::) finalResult.carry
            |> numberFromDigits

stringToInt : String -> Int
stringToInt string =
    String.toInt string
        |> Result.withDefault -1


arrayToTuple : Array.Array Int -> ( Int, Int, Int, Int )
arrayToTuple array =
    let
        firstElement =
            Array.get 0 array
                |> Maybe.withDefault -1

        secondElement =
            Array.get 1 array
                |> Maybe.withDefault -1

        thirdElement =
            Array.get 2 array
                |> Maybe.withDefault -1

        forthElement =
            Array.get 3 array
                |> Maybe.withDefault -1
    in
        ( firstElement, secondElement, thirdElement, forthElement )


extractDigits : Int -> ( Int, Int, Int, Int )
extractDigits number =
    digits number
        |> padZeros 4
        |> Array.fromList
        |> arrayToTuple

digits : Int -> List Int
digits number =
    let
        digits n =
            if n == 0 then
                []
            else
                (n % 10) :: digits (n // 10)

    in
        digits number
            |> List.reverse

padZeros : Int -> List Int -> List Int
padZeros total list =
    let
        numberOfZeros =
            total - (List.length list)

    in
        (List.repeat numberOfZeros 0) ++ list

numberFromDigits : List Int -> Int
numberFromDigits digitsList =
    List.foldl (\digit number -> digit + 10 * number) 0 digitsList
