part of core;

class Window {
	
	//debug
	static const bool ACTIVE_DEBUG = true;
	
	//singleton instance
	static Window _instance;
	
	html.CanvasRenderingContext2D _context;
	ui.Component _content;
	utils.Vector2D _size;
	utils.Vector2D _offset;
	bool _requireRebuildDraw;
	
	//fps
	int _currentFpsNumber;
	int _lastFpsNumber;
	int _lastTimerSec;
	num _currentUsageTimer;
	num _currentNonUsageTimer;
	num _lastUsageRate;
	num _lastTimer;
	
	_Window() {
		
	}
	
	/*
	 * Initialize window singleton
	 */
	static void initialize(html.CanvasElement canvas, utils.Vector2D margin) {
		_instance = new Window();
		_instance._context = canvas.context2D;
		_instance._size = new utils.Vector2D(canvas.width, canvas.height);
		_instance._offset = margin;
		_instance._requireRebuildDraw= true; 
		canvas.addEventListener('mousemove', (e) => _instance._dispatchEvent(
				new Event(EventType.MOUSE_MOVE, mousePosition:new utils.Coordinates2D(e.client.x-_instance._offset.x, e.client.y-_instance._offset.y))));
		canvas.addEventListener('mousedown', (e) => _instance._dispatchEvent(
				new Event(EventType.MOUSE_PUSH, mousePosition:new utils.Coordinates2D(e.client.x-_instance._offset.x, e.client.y-_instance._offset.y))));
		canvas.addEventListener('mouseup', (e) => _instance._dispatchEvent(
				new Event(EventType.MOUSE_RELEASE, mousePosition:new utils.Coordinates2D(e.client.x-_instance._offset.x, e.client.y-_instance._offset.y))));
		canvas.addEventListener('mouseout', (e) => _instance._dispatchEvent(
				new Event(EventType.MOUSE_OUT)));
		html.window.addEventListener('keypress', (e) {
			if(e.charCode != 0)
				_instance._dispatchEvent(new Event(EventType.KEY_PRESSED, charCode: e.charCode));
		});	
		html.window.addEventListener('keydown', (e) {
			_instance._dispatchEvent(new Event(EventType.KEY_PUSHED, keyCode: e.keyCode));
			//prevent browser to do bad event when tab or backspace pressed
			if(e.keyCode == 9 || e.keyCode == 8) {
				e.preventDefault();
			}
		});	
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
	
	utils.Vector2D getOffset() {
		return _offset;
	}
	
	/*
	 * Set the content pane
	 */
	void setContent(ui.Component component) {
		ui.SelectableManager.getInstance().reset();
		
		_content = component;
		_content.setRelativePosition(new utils.Coordinates2D(0, 0));
		_content.setAbsolutePosition(new utils.Coordinates2D(0, 0));
		_content.setSize(new utils.Vector2D(_size.x, _size.y));
		_content. addedToWindow();
	}
	

	
	/*
	 * Start the paint of the window
	 */
	void run() {
		this._currentFpsNumber = 0;
		this._lastFpsNumber = 0;
		this._lastTimerSec = 0;
		this._currentUsageTimer = 0;
		this._lastUsageRate = 0;
		this._currentNonUsageTimer = 0;
		this._lastTimer = 0;
		_run(0);
	}
	
	void _run(num timer) {
		this._currentNonUsageTimer += timer-this._lastTimer;
		_currentFpsNumber++;
		
		if(this._lastTimerSec+1000 <= timer) {
			_lastFpsNumber = _currentFpsNumber;
			_currentFpsNumber = 0;
			this._lastTimerSec += 1000;
			this._lastUsageRate = this._currentUsageTimer/(this._currentNonUsageTimer+this._currentUsageTimer)*100;
			this._currentUsageTimer = 0;
			this._currentNonUsageTimer = 0;
		}
		_context..beginPath()
		        ..fillStyle = "#fff"
		        ..rect(0, 0, _size.x, _size.y)
		        ..fill();
		
		if(this._requireRebuildDraw) {
			DrawManager.getInstance().clear();
			this._content.validate();
			this._content.clearDraw();
			DrawManager.getInstance().newBuild();
			this._content.buildDraw();
			this._requireRebuildDraw = false;
			this._content.notify();
		}

		DrawManager.getInstance().draw();
		
		this._lastTimer = html.window.performance.now();
		this._currentUsageTimer += this._lastTimer-timer;
		
		if(ACTIVE_DEBUG) {
			_instance._drawDebug(timer);
		}
		html.window.requestAnimationFrame(_run);
	}
	
	void _drawDebug(num timer) {
		_context..fillStyle = "#000"
						..font = "16px arial"
						..fillText("FPS : "+this._lastFpsNumber.toString()+" | Usage : "+this._lastUsageRate.round().toString()+"%", 10, 20);
	}
	
	void _dispatchEvent(Event event) {
		
		//selectable
		if(event.getType() == EventType.KEY_PUSHED) {
			if(event.getKeyCode() == 9) { //tab
				ui.SelectableManager.getInstance().next();
				event.setComsumed();
			}
		}
		
		DrawManager.getInstance().dispatchEvent(event);
	}
	
	void requireRebuildDraw() {
		this._requireRebuildDraw = true;
	}
}