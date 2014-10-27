import 'dart:html' as html;
import 'game/game.dart';

void main() {
	html.CanvasElement canvas = html.querySelector("#main-frame");
  Gameboard gb = new Gameboard(10,10,canvas);
}