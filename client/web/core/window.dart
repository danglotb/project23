part of core;

class Window {
	
	//debug
	static const bool ACTIVE_DEBUG = true;
	
	//singleton instance
	static Window _instance;
	
	html.CanvasRenderingContext2D _context;
	ui.Component _content;
	utils.Vector2D _size;
	
	_Window() {
		
	}
	
	/*
	 * Initialize window singleton
	 */
	static void initialize(html.CanvasElement canvas) {
		_instance = new Window();
		_instance._context = canvas.context2D;
		_instance._size = new utils.Vector2D(canvas.width, canvas.height);
		canvas.addEventListener('mousemove', (e) => _instance._dispatchEvent(
				new ui.Event(ui.EventType.MOUSE_MOVE, mousePosition:new utils.Coordinates2D(e.client.x, e.client.y))));
		canvas.addEventListener('mousedown', (e) => _instance._dispatchEvent(
				new ui.Event(ui.EventType.MOUSE_PUSH, mousePosition:new utils.Coordinates2D(e.client.x, e.client.y))));
		canvas.addEventListener('mouseup', (e) => _instance._dispatchEvent(
				new ui.Event(ui.EventType.MOUSE_RELEASE, mousePosition:new utils.Coordinates2D(e.client.x, e.client.y))));
		canvas.addEventListener('mouseout', (e) => _instance._dispatchEvent(
				new ui.Event(ui.EventType.MOUSE_OUT)));
		html.window.addEventListener('keydown', (e) => _instance._dispatchEvent(
				new ui.Event(ui.EventType.KEY_PUSHED, keyCode: e.keyCode)));	
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
	html.CanvasRenderingContext2D getContext() {
		return _context;
	}
	
	utils.Vector2D getSize() {
		return _size;
	}
	
	/*
	 * Set the content pane
	 */
	void setContent(ui.Component component) {
		ui.SelectableManager.getInstance().reset();
		
		_content = component;
		_content.setPosition(new utils.Coordinates2D(0, 0));
		_content.setSize(new utils.Vector2D(_size.x, _size.y));
		_content.validate();
		_content. addedToWindow();
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
		html.window.requestAnimationFrame(_run);
	}
	
	void _drawDebug(num timer) {
		_context..fillStyle = "#000"
						..fillText("timer : "+timer.toString(), 10, 20);
	}
	
	void _dispatchEvent(ui.Event event) {
		_content.dispatchEvent(event);
	}
	
}