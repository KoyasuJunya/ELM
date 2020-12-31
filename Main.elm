module Main exposing (..)
import Browser
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Html.Events.Extra.Mouse as Mouse
import List.Extra

main = Browser.sandbox { init = init, update = update, view = view }

-- MODEL
type alias Model = {
  rects: List (Float, Float),
  dragState: DragState }

type DragState = NotDragging
  | Dragging Int

init : Model
init = { rects = [ (50, 50) ], dragState = NotDragging }

-- UPDATE
type Msg = Down Mouse.Event
    | Move Mouse.Event
    | Up Mouse.Event

update : Msg -> Model -> Model
update msg model =
  case msg of
    Down event ->
      case intersects event.clientPos model.rects of
        Just index ->
          { model | dragState = Dragging index}
        Nothing ->
          { model | dragState = NotDragging }
    Move event ->
      case model.dragState of
        Dragging index ->
          { model | rects = List.Extra.setAt index (event.clientPos) model.rects }
        NotDragging ->
          model   
    Up event ->
      { model | dragState = NotDragging }
      
intersects: (Float, Float) -> List (Float, Float) -> Maybe Int
intersects pos rects =
  rects
    |> List.Extra.findIndex (intersect pos)

intersect: (Float, Float) -> (Float, Float) -> Bool
intersect (px, py) (rx, ry) =
  if  (px > rx) && (px < (ry + 100)) then
    if  (py > ry) && (py < (ry + 100)) then
      True
    else
      False
  else
    False

-- VIEW
view : Model -> Svg Msg
view model =
  svg
    [ width "500" , height "500" , viewBox "0 0 500 500"
    , Mouse.onDown Down
    , Mouse.onMove Move
    , Mouse.onUp Up
    ]
    (List.append
      (List.map viewRect model.rects)
      [text (Debug.toString model) ]
    )

viewRect : (Float, Float) -> Svg msg
viewRect (xPos, yPos) =
   rect [ x (String.fromFloat xPos) , y (String.fromFloat yPos), width "100", height "100"] []
