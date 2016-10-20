-- BEGIN
module App exposing (..)

-- IMPORTS
import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)
import Components.ArticleList as ArticleList

-- MAIN
init : (Model, Cmd Msg)
init = (initialModel, Cmd.none)

main : Program Never
main = Html.App.program {
  init = init,
  view = view,
  update = update,
  subscriptions = subscriptions
  }

-- MODEL
type alias Model = { articleListModel: ArticleList.Model }

initialModel = { articleListModel = ArticleList.initialModel}
model = { articleListModel = ArticleList.Model }

-- UPDATE
type Msg = ArticleListMsg ArticleList.Msg

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = 
  case msg of
    ArticleListMsg articleMsg ->
      let (updatedModel, cmd) = ArticleList.update articleMsg model.articleListModel
      in ( {model | articleListModel = updatedModel}, Cmd.map ArticleListMsg cmd )

-- PUBSUB
subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

-- VIEW
view : Model -> Html Msg
view model = div [ class "elm-app" ] [ Html.App.map ArticleListMsg (ArticleList.view model.articleListModel) ]
-- END
