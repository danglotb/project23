part of ui;

typedef void ListenerInteractiveFunc(InteractiveComponent source);


abstract class InteractiveComponent extends Container {
	
	bool _overflew;
	bool _pushed;
	bool _enable;
	
	List<ListenerInteractiveFunc> _overflewInListeners;
	List<ListenerInteractiveFunc> _overflewOutListeners;
	List<ListenerInteractiveFunc> _pushedListeners;
	List<ListenerInteractiveFunc> _releasedListeners;
	List<ListenerInteractiveFunc> _clickListeners;
	
	InteractiveComponent(InteractiveComponentStyle style) : super(style) {
		this._overflew = false;
		this._pushed = false;
		this._enable = true;
		
		this._overflewInListeners = new List<ListenerInteractiveFunc>();
		this._overflewOutListeners = new List<ListenerInteractiveFunc>();
		this._pushedListeners = new List<ListenerInteractiveFunc>();
		this._releasedListeners = new List<ListenerInteractiveFunc>();
		this._clickListeners = new List<ListenerInteractiveFunc>();
	}
	
	void addOverflewInListener(ListenerInteractiveFunc function) {
		_overflewInListeners.add(function);
	}
	
	void addOverflewOutListener(ListenerInteractiveFunc function) {
		_overflewOutListeners.add(function);
	}
		
	void addPushedListener(ListenerInteractiveFunc function) {
		_pushedListeners.add(function);
	}

	void addReleasedListener(ListenerInteractiveFunc function) {
		_releasedListeners.add(function);
	}
	
	void addClickListener(ListenerInteractiveFunc function) {
		_clickListeners.add(function);
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
	
	
	void _onOverflowIn(Event event) {
		
	}
	
	void _onOverflowOut(Event event) {
		
	}
	
	void _onPush(Event event) {
		
	}
	
	void _onRelease(Event event) {
		
	}
	
	void _onClick(Event event) {
		
	}
	
	void dispatchEvent(Event event) {
		
		InteractiveComponentStyle castStyle = this._style as InteractiveComponentStyle;

		if(event.getType() == EventType.MOUSE_MOVE) {
			if(castStyle.isInteractiveArea(event.getMousePosition()) && !event.isComsumed()) {
				
				//overflew in event
				if(!this._overflew) {
					this._onOverflowIn(event);
					this._overflewInListeners.forEach((el) => el(this));
					this._overflew = true;
				}
				
				event.setComsumed();
			}
			else {
				
				//overflew out event
				if(this._overflew) {
					this._onOverflowOut(event);
					this._overflewOutListeners.forEach((el) => el(this));
					this._overflew = false;
				}
				
				
			}
		}
		else if(event.getType() == EventType.MOUSE_PUSH) {
			if(castStyle.isInteractiveArea(event.getMousePosition()) && !event.isComsumed()) {
				
				if(!this._pushed) {
					this._onPush(event);
					this._pushedListeners.forEach((el) => el(this));
					this._pushed = true;
				}
				
				event.setComsumed();
			}
		}
		else if(event.getType() == EventType.MOUSE_RELEASE) {
			if(this._pushed) {
				this._onRelease(event);
				this._releasedListeners.forEach((el) => el(this));
				this._pushed = false;
				
				if(this._overflew) {
					this._onClick(event);
					this._clickListeners.forEach((el) => el(this));
				}
			}
		}
		else if(event.getType() == EventType.MOUSE_OUT) {
			if(this._pushed) {
				this._onRelease(event);
				this._releasedListeners.forEach((el) => el(this));
				this._pushed = false;
			}
			if(this._overflew) {
				this._onOverflowOut(event);
				this._overflewOutListeners.forEach((el) => el(this));
				this._overflew = false;
			}
		}
	}
}