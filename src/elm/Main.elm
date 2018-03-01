module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


-- APP


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
    { editMessage : String, messages : List String }


model : Model
model =
    { editMessage = "Hello World", messages = [] }



-- UPDATE


type Msg
    = ChangeEditedMessage String
    | AddMessage


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeEditedMessage currentMessage ->
            { model | editMessage = currentMessage }

        AddMessage ->
            { editMessage = "", messages = [ model.editMessage ] ++ model.messages }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Elm Hack Night Leipzig, 28.02.2018" ]
        , div [ class "box" ]
            [ Html.form []
                [ textarea [ placeholder "Type Message...", value model.editMessage, onInput ChangeEditedMessage ] []
                , button [ type_ "button", onClick AddMessage ] [ text "Add!" ]
                ]
            , div [ class "messageList" ] (List.map renderMessage model.messages)
            ]
        ]


renderMessage : String -> Html Msg
renderMessage message =
    div [ class "message" ]
        [ p [] [ text message ]
        ]
