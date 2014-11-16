import 'dart:html' as html;
import 'game/game.dart'; 
import 'utils/utils.dart' as utils;

final int size = 50;
final int SIZE_CASE = 50;

void main() {
	html.CanvasElement canvas = html.querySelector("#main-frame");
	List<Case> cases = new List<Case>(size*size);
	for (int y = 0 ; y < size ; y++) {
  			for (int x = 0 ; x < size; x++) {
					if (x % 10 == 0 || y % 10 == 0)
						cases[x+(y*size)] = new Case(new utils.Coordinates2D(x,y) , spriteValue:0);
					else
						cases[x+(y*size)] = new Case(new utils.Coordinates2D(x,y) , spriteValue:1);
  			}
	}
  Gameboard gb = new Gameboard(new utils.Vector2D(SIZE_CASE*size,SIZE_CASE*size),canvas, gameCase:cases);
}