module MyList exposing (..)


type MyList a
    = Empty
    | Node a (MyList a)


sum : MyList Int -> Int
sum myList =
    case myList of
        Empty ->
            0

        Node intValue remainingValues ->
            intValue + sum remainingValues


isEmpty : MyList a -> Bool
isEmpty xs =
    case xs of
        Empty ->
            True

        _ ->
            False
