-- BEGIN
module Components.ArticleList exposing (..)

-- IMPORTS
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- COMPONENTS
import List
import Article

-- MODEL
type alias Model = { articles: List Article.Model }

initialModel : Model
initialModel = { articles = [] }

articles : Model
articles = { articles = postedArticles }

postedArticles : List (Article.Model)
postedArticles = [
  { title = "Article 1", url = "http://google.com", postedBy = "Author", postedOn = "10/19/16" },
  { title = "Article 2", url = "http://google.com", postedBy = "Author", postedOn = "10/19/16" },
  { title = "Article 3", url = "http://google.com", postedBy = "Author", postedOn = "10/19/16" }
  ]

renderedArticle : Article.Model -> Html a
renderedArticle article = li [] [ Article.view article ]

renderedarticles : Model -> List (Html a)
renderedarticles model = List.map renderedArticle model.articles

-- UPDATE
type Msg = NoOp | Fetch

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoOp -> (model, Cmd.none)
    Fetch -> (articles, Cmd.none)

-- VIEW
view : Model -> Html Msg
view model = div [ class "article-list" ] [
  h2 [][ text "Article List" ],
  button [ onClick Fetch, class "btn btn-primary" ] [ text "Fetch Articles" ],
  ul [] (renderedarticles model)
  ]