import 'dart:html' as html;
import 'game/game.dart';

import 'dart:math' show Random;

void main() {
	html.CanvasElement canvas = html.querySelector("#main-frame");
	List<Case> cases = new List<Case>(100);
	Random r = new Random();
	for (int y = 0 ; y < 10 ; y++) {
  			for (int x = 0 ; x < 10 ; x++) {
					cases[x+(y*10)] = new Case(x,y, spriteValue:r.nextInt(2));
  			}
	}
  Gameboard gb = new Gameboard(10,10,canvas, gameCase:cases);
}