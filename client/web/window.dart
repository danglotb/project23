import 'dart:html';
import 'ui/ui.dart' as ui;

class Window {
	
	//singleton instance
	static Window _instance;
	
	CanvasRenderingContext2D _context;
	ui.Component _content;
	
	_Window() {
		
	}
	
	/*
	 * Initialize window singleton
	 */
	static void initialize(CanvasRenderingContext2D context) {
		_instance = new Window();
		_instance._context = context;
  }
  	
	/*
	 * Get unique instance 
	 */
	static Window getInstance() {
		return _instance;
	}
	
	/*
	 * Set the content pane
	 */
	static void setContent(ui.Component component) {
		_instance._content = component; 
	}
	
	/*
	 * Start the paint of the window
	 */
	static void run() {
		_run(0);
	}
	
	static void _run(num timer) {
		print(timer);
		_instance._content.draw();
		window.requestAnimationFrame(_run);
	}
}