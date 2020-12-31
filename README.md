# <ゼミB>プロジェクトII - Webアプリケーション構築
hackmd.ioメモ(https://hackmd.io/@koyasu/Bkfry8ttw)<br>
**目標** — Webブラウザで図形をドラッグ＆ドロップで動かせるようにする．
* HTML5を用いる
* つまんだ位置を変えない
* なめらかに
* 最小限の機能，コードを短く

## 1. インポートするパッケージ
* svg
* list-extra
* elm-pointer-events

## 2. Elm アーキテクチャ
Elm アーキテクチャでは、3 つの項目によって成り立っている．
* Model … ステート
* Update … ステートの更新．メッセージ（Msg)を受け取って Model を更新．
* View … html への描画

今回それぞれに用いた関数を以下に示す．
| アーキテクチャ | 関数                             |
| -------------- | -------------------------------- |
| model          | init                             |
| update         | update<br>intersects<br>intersec |
| view           | view<br>viewRect                 |

## 3. 動作原理


## 改善点

## 参考文献
* Elm で mouse のイベントを取得する覚書
(https://blog.emattsan.org/entry/2019/05/26/093114)
* Elmの関数型的側面の多分ていねいな解説
(https://qiita.com/A_kirisaki/items/8fa5563a035c8c4d977c)
* elmのサンプルコードを自分なりに解釈する
(https://qiita.com/matsugaknight/items/00f35c99a9d539ddc9e4)
* https://github.com/mpizenberg/elm-pointer-events/blob/master/examples/Mouse/Main.elm
* Elm入門(https://youtube.com/playlist?list=PLp_EUEO9JJP2P4fW-73jR3iC14476twsW)
