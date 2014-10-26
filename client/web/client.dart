import 'dart:html';
import 'ui/ui.dart' as ui;

void main() {
	CanvasElement canvas = querySelector('#canvas');
	
	//resize canvas
  canvas.width =  window.innerWidth;
  canvas.height =  window.innerHeight;
 
	Window.initialize(canvas.context2D);

}