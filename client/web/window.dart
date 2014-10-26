import 'dart:html';

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
	
	static void setContent(ui.Component component) {
		_instance._content = component; 
	}
}