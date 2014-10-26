import 'dart:html' as dart;

import 'ui/ui.dart' as ui;

import 'window.dart';

void main() {
	dart.CanvasElement canvas = dart.querySelector('#canvas');
	
	//resize canvas
  canvas.width =  dart.window.innerWidth;
  canvas.height =  dart.window.innerHeight;
 
	Window.initialize(canvas.context2D);
	
	Window.run();

}