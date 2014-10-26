import 'dart:html' as dart;

import 'ui/ui.dart' as ui;
import 'utils/utils.dart' as utils;
import 'core/core.dart' as core;

void main() {
	dart.CanvasElement canvas = dart.querySelector('#canvas');
	
	//resize canvas
  canvas.width =  dart.window.innerWidth;
  canvas.height =  dart.window.innerHeight;
 
	core.Window.initialize(canvas);
	
	ui.Container container = new ui.Container();
	container.setLayout(new ui.VerticalLayout());
	container.addChild(new ui.Bidon("#f00", new ui.BidonStyle()));
	container.addChild(new ui.Bidon("#f00", new ui.BidonStyle()));
	container.addChild(new ui.Bidon("#f00", new ui.BidonStyle()));
	
	core.Window.getInstance().setContent(new ui.Bidon(new ui.BidonStyle()));
	
	core.Window.getInstance().run();

}