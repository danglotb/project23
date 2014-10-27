import 'dart:html' as html;

import 'ui/ui.dart' as ui;
import 'utils/utils.dart' as utils;
import 'core/core.dart' as core;

void main() {
	html.CanvasElement canvas = html.querySelector('#canvas');
	
	//resize canvas
  canvas.width =  html.window.innerWidth;
  canvas.height =  html.window.innerHeight;
 
	core.Window.initialize(canvas);
	
	ui.Container container = new ui.Container();
	container.setLayout(new ui.VerticalLayout());
	container.addChild(new ui.Bidon(new ui.BidonStyle()));
	container.addChild(new ui.Bidon(new ui.BidonStyle()));
	
	ui.Container container2 = new ui.Container();
	container2.setLayout(new ui.VerticalLayout());
	container.addChild(container2);
	
	container2.addChild(new ui.Bidon(new ui.BidonStyle()));
	container2.addChild(new ui.Bidon(new ui.BidonStyle()));
	container2.addChild(new ui.Cursor(0, 0, 5, new ui.CursorStyle()));
	
	core.Window.getInstance().setContent(container);
	
	core.Window.getInstance().run();

}