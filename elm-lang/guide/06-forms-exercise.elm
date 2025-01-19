import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Char exposing (isDigit, isUpper, isLower)

-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }
  
-- MODEL

type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  }
  
init : Model
init = 
  Model "" "" ""
  
-- UPDATE

type Msg
  = Name String
  | Password String
  | PasswordAgain String
  
update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }
    
    Password password ->
      { model | password = password }
      
    PasswordAgain password ->
      { model | passwordAgain = password }
      
-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ viewInput "text" "Name" model.name Name
    , viewInput "password" "Password" model.password Password
    , viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain
    , viewValidation model
    ]
    
viewInput : String -> String -> String -> (String -> Msg) -> Html Msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] []
  
viewValidation : Model -> Html Msg
viewValidation model =
  if (String.length model.password) <= 8 then
    div [ style "color" "red" ] [ text "Password should be longer than 8 characters!" ]
  else if not (String.any isDigit model.password) then
    div [ style "color" "red" ] [ text "Password should contain at least 1 numeric character!" ]
  else if not (String.any isUpper model.password) then
    div [ style "color" "red" ] [ text "Password should contain at least 1 uppercase character!" ]
  else if not (String.any isLower model.password) then
    div [ style "color" "red" ] [ text "Password should contain at least 1 lowercase character!" ]
  else if model.password /= model.passwordAgain then
    div [ style "color" "red" ] [ text "Passwords do not match!" ]
  else
    div [ style "color" "green" ] [ text "OK" ]
