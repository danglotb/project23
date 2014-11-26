part of core;

class InnerWindowManager {
	
	static InnerWindowManager _instance;
	
	Queue<ui.InnerWindow> _windows;
	
	_InnerWindowManager() {
		
	}
	
	void initialize() {
		_windows = new Queue();
	}
	
	static InnerWindowManager getInstance() {
		if(_instance == null) {
			_instance = new InnerWindowManager();
			_instance.initialize();
		}
		
		return _instance;
	}
	
	void addWindow(ui.InnerWindow window) {
		_windows.addLast(window);
	}
	
	void removeWindow(ui.InnerWindow window) {
		_windows.remove(window);
	}
	
	int getIndex(ui.InnerWindow window) {
		int i = 1;
		for (ui.InnerWindow current in _windows) {
			if(window == current)
				return i;
			i++;
		}
		return 0;
	}
	
	void setFrontground(ui.InnerWindow window) {
		_windows.remove(window);
		_windows.addLast(window);
	}
	
	
	
}