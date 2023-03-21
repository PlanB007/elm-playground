module BettysBikeShop exposing (poundsToString, penceToPounds)

-- TODO: import the String module
import String exposing (..)
import Basics exposing (..)

penceToPounds: Int -> Float
penceToPounds pence = (Basics.toFloat pence) / 100

poundsToString: Float -> String
poundsToString pounds = "£" ++ String.fromFloat pounds
