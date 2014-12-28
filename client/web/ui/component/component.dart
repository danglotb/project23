part of ui;

enum PositionMode {
	ABSOLUTE, RELATIVE
}

/* A component of the window 
 * 
 * the size, minimalSize & position properties correspond to the external (borders are including)
 * the internalSize & internalPosition properties correspond to the internal (borders are excluding)
 */
abstract class Component {
	
	/*
	 * Position management
	 */
	utils.Coordinates2D _userPosition;
	utils.Coordinates2D _computedPosition;
	PositionMode _positionMode;
	/* Is component is computed in absolute coordinates */
	
	
	/* The size of the component */
	utils.Vector2D _size;
	
	/* The style of the component */
	ComponentStyle _style;
	
	utils.Vector2D _minimalSize;
	
	/* True if the component is visible, else false */
	bool _visible;
	
	/* is added to window */
	bool _addedToWindow;
	
	bool _enableEvent;
	
	/* Constructors */
	
	Component(ComponentStyle style) {
		this._style = style;
		if(this._style != null)
			this._style.setModel(this);
		else
			this._style = new EmptyStyle();
		
		this._userPosition = new utils.Coordinates2D(0, 0);
		this._computedPosition = new utils.Coordinates2D(0, 0);
		this._positionMode = PositionMode.RELATIVE;
		
		this._size = new utils.Vector2D(0, 0);
		this._visible = true;
		this._addedToWindow = false;
		this._minimalSize = new utils.Vector2D(0, 0);
		this._enableEvent = true;
		// To do : Init class variables
	}
	
	/*
	 * Function called when component is added to window
	 */
	void addedToWindow() {
		this._addedToWindow = true;
	}
	
	void removedToWindow() {
		this._addedToWindow = false;
	}
	
	/* Methods */
	
	/* Draw the component */
	void buildDraw() {
		if(this._visible)
			_style.buildDraw();
	}
	
	void clearDraw() {
		_style.clearDraw();
	}
	
	/* Validate the component */
	void validate() {
		
	}
	
	/* Spread the event to the component */
	void processEvent(core.Event event, utils.Rect viewport) {

	}
	
	void computePosition([utils.Coordinates2D reference]) {
		switch(this._positionMode) {
			case PositionMode.ABSOLUTE:
				this._computedPosition = this._userPosition;
				break;
			case PositionMode.RELATIVE:
				this._computedPosition = new utils.Coordinates2D(reference.x+this._userPosition.x, reference.y+this._userPosition.y);
				break;
		}
		
	}
	
	/* Getters & Setters */
	
	/* Getters & setters of _visible */
	bool isVisible() {
		return this._visible;
	}
	
	void setVisible(bool state) {
		this._visible = state;
	}
	     
	/* Getters & setters of _relativePosition & _absolutePosition */
	utils.Coordinates2D getPosition() {
		return this._computedPosition;
	}
	
	utils.Coordinates2D getUserPosition() {
		return this._userPosition;
	}

	void setPosition(utils.Coordinates2D position) {
		this._userPosition = position;
	}
	
	void setPositionMode(PositionMode mode) {
		this._positionMode = mode;
	}
	
	PositionMode getPositionMode() {
		return this._positionMode;
	}
	
	/* Getters & setters of _size */
	utils.Vector2D getSize() {
		return this._size;
	}
	
	void setSize(utils.Vector2D size) {
		this._size = size;
	}
	
	void setMinimalSize([utils.Vector2D size]) {
		this._minimalSize = size == null ? this.getMinimalSize() : size;
	}
	
	utils.Vector2D getMinimalSize() {
		if(this._minimalSize.x != 0 || this._minimalSize.y != 0)
			return this._minimalSize;
		else
			return this._style.getMinimalSize();
	}
	
	ComponentStyle getStyle() {
		return this._style;
	}
	
	void pack() {
		this._size = this.getMinimalSize();
	}
	
	/*
	 * Call update of the model
	 */
	void notify() {
		this._style.update();
	}
	
	void setEnableEvent(bool state) {
		this._enableEvent = state;
	}
	
	bool isEnableEvent() {
		return this._enableEvent;
	}
	
								
}