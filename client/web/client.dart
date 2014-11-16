import 'dart:html' as html;
import 'ui/ui.dart' as ui;
import 'utils/utils.dart' as utils;
import 'core/core.dart' as core;

void main() {
	try {
		html.CanvasElement canvas = html.querySelector('#canvas');
   	
		//resize canvas
		utils.Vector2D screenSize = core.ResolutionManager.initialize(new utils.Vector2D(html.window.innerWidth, html.window.innerHeight));
		canvas.width =  screenSize.x;
		canvas.height =  screenSize.y;
		
		utils.Vector2D margin = new utils.Vector2D((html.window.innerWidth-screenSize.x)~/2, (html.window.innerHeight-screenSize.y)~/2);
		
		canvas.style.marginLeft = margin.x.toString()+"px";
		canvas.style.marginTop  = margin.y.toString()+"px";
		core.Window.initialize(canvas, margin);
	   	
		core.Window.getInstance().setContent(new ui.ScreenMenuUnlogged());
	   	
		//before image loader
	   	
		core.Window.getInstance().run();
	}
	catch (exception, stackTrace) {
		print(exception); 
		print(stackTrace); 
	}
}