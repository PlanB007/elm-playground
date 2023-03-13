-- Show the current time in your time zone.
--
-- Read how it works:
--   https://guide.elm-lang.org/effects/time.html
--
-- For an analog clock, check out this SVG example:
--   https://elm-lang.org/examples/clock
--

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Task
import Time



-- MAIN


main =
  Browser.element
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


type alias Model =
  { zone : Time.Zone
  , time : Time.Posix
  , paused : Bool
  }


init : () -> (Model, Cmd (Time.Posix -> Msg) )
init _ =
  ( Model Time.utc (Time.millisToPosix 0) False
  , Task.perform AdjustTimeZone Time.here
  )



-- UPDATE


type Msg
  = Tick Time.Posix
  | AdjustTimeZone Time.Zone
  | PauseTick Time.Posix



update : (Time.Posix -> Msg) -> Model -> (Model, Cmd (Time.Posix -> Msg) )
update msg model =
  case msg of
    Tick newTime ->
      ( { model | time = newTime }
      , Cmd.none
      )

    AdjustTimeZone newZone ->
      ( { model | zone = newZone }
      , Cmd.none
      )
      
    PauseTick newTime ->
      ( { model | time = newTime }
      , Cmd.none
      )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub (Time.Posix -> Msg)
subscriptions model =
  if model.paused
  then Sub.none
  else Time.every 1000 Tick



-- VIEW


view : Model -> Html (Time.Posix -> Msg)
view model =
  let
    hour   = String.fromInt (Time.toHour   model.zone model.time)
    minute = String.fromInt (Time.toMinute model.zone model.time)
    second = String.fromInt (Time.toSecond model.zone model.time)
  in
  div []
    [ h1 [] [ text (hour ++ ":" ++ minute ++ ":" ++ second) ]
    , button [ onClick PauseTick ] [text "pause"]
    ]

  
  
  
  
  
  
  
  
  
  