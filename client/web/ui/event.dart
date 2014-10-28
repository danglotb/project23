part of ui;

class EventType {
	static const int MOUSE_MOVE = 1;
	static const int MOUSE_PUSH = 2;
	static const int MOUSE_RELEASE = 3;
	static const int MOUSE_OUT = 4;
	static const int KEY_PUSHED = 5;
}

class Event {
	
	bool _comsumed;
	int _eventType;
	int _keyCode;
	
	utils.Coordinates2D _mousePosition;
	
	Event(int eventType, {utils.Coordinates2D mousePosition, int keyCode}) {
		this._comsumed = false;
		this._eventType = eventType;
		
		this._mousePosition = mousePosition != null ? mousePosition : new utils.Coordinates2D(0, 0);
		this._keyCode = keyCode != null ? keyCode : 0;
	}
	
	int getType() {
		return this._eventType;
	}
	
	utils.Coordinates2D getMousePosition() {
		return this._mousePosition;
	}
	
	int getKeyCode() {
		return this._keyCode;
	}
	
	void setComsumed() {
		this._comsumed = true;
	}
	
	bool isComsumed() {
		return this._comsumed;
	}
}