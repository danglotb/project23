part of core;

class Window {
	
	//debug
	static const bool ACTIVE_DEBUG = true;
	
	//singleton instance
	static Window _instance;
	
	dart.CanvasRenderingContext2D _context;
	ui.Component _content;
	utils.Vector2D _size;
	
	_Window() {
		
	}
	
	/*
	 * Initialize window singleton
	 */
	static void initialize(dart.CanvasElement canvas) {
		_instance = new Window();
		_instance._context = canvas.context2D;
		_instance._size = new utils.Vector2D(canvas.width, canvas.height);
  }
  	
	/*
	 * Get unique instance 
	 */
	static Window getInstance() {
		return _instance;
	}
	
	/*
	 * get canvas 2d context
	 */
	dart.CanvasRenderingContext2D getContext() {
		return _context;
	}
	
	utils.Vector2D getSize() {
		return _size;
	}
	
	/*
	 * Set the content pane
	 */
	void setContent(ui.Component component) {
		_content = component; 
	}
	

	
	/*
	 * Start the paint of the window
	 */
	void run() {
		_run(0);
	}
	
	void _run(num timer) {
		_instance._content.draw();
		if(ACTIVE_DEBUG) {
			_instance._drawDebug(timer);
		}
		dart.window.requestAnimationFrame(_run);
	}
	
	void _drawDebug(num timer) {
		_context..fillStyle = "#000"
						..fillText("timer : "+timer.toString(), 10, 20);
	}
	
	
}