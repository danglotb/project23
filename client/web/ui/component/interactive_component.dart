part of ui;

abstract class InteractiveComponent extends Container {
	
	bool _overflew;
	bool _pushed;
	bool _enable;
	
	List<ListenerStateFunc> _overflewListeners;
	List<ListenerStateFunc> _pushedListeners;
	
	InteractiveComponent(InteractiveComponentStyle style) : super(style) {
		this._overflew = false;
		this._pushed = false;
		this._enable = true;
	}
	
	void addOverflewListener(ListenerStateFunc function) {
		_overflewListeners.add(function);
	}
	
	void addPushedListener(ListenerStateFunc function) {
		_pushedListeners.add(function);
	}
	
	void setEnable(bool state) {
		this._enable = state;
	}
	
	void setOverflew(bool state) {
		this._overflew = state;
	}
	
	void setPushed(bool state) {
		this._pushed = state;
	}
	
	bool isEnable() {
		return this._enable;
	}
	
	bool isOverflew() {
		return this._overflew;
	}
	
	bool isPushed() {
		return this._pushed;
	}
	
	void dispatchEvent(Event event) {

		if(event.getType() == EventType.MOUSE_MOVE) {
			if(event.getMousePosition().x >= this.getPosition().x && event.getMousePosition().x < this.getPosition().x+this.getSize().x 
					&& event.getMousePosition().y >= this.getPosition().y && event.getMousePosition().y < this.getPosition().y+this.getSize().y
					&& !event.isComsumed()) {
				this._overflew = true;
				event.setComsumed();
			}
			else {
				this._overflew = false;
			}
		}
		else if(event.getType() == EventType.MOUSE_PUSH) {
			print('x='+event.getMousePosition().x.toString()+',y='+event.getMousePosition().y.toString());
			if(event.getMousePosition().x >= this.getPosition().x && event.getMousePosition().x < this.getPosition().x+this.getSize().x 
					&& event.getMousePosition().y >= this.getPosition().y && event.getMousePosition().y < this.getPosition().y+this.getSize().y
					&& !event.isComsumed()) {
				this._pushed = true;
				event.setComsumed();
			}
		}
		else if(event.getType() == EventType.MOUSE_RELEASE) {
			this._pushed = false;
		}
	}
}