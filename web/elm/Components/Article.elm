module Article exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Model = {
  title : String,
  url : String,
  postedBy : String,
  postedOn : String
}

view : Model -> Html a
view model = span [ class "article" ] [
  a[ href model.url ][ strong [] [ text model.title ] ],
  span [] [ text (" Posted by: " ++ model.postedBy) ],
  em [] [ text (" (posted on: " ++ model.postedOn ++ ")") ]
  ]