part of ui;

/* A component of the window */
abstract class Component {
	
	/* The position of the component in the window */
	utils.Coordinates2D _position;
	
	/* The size of the component */
	utils.Vector2D _size;
	
	/* The style of the component */
	ComponentStyle _style;
	
	/* True if the component is visible, else false */
	bool _visible;
	
	/* Constructors */
	
	Component(ComponentStyle style) {
		this._style = style;
		this._position = new utils.Coordinates2D(0, 0);
		this._size = new utils.Vector2D(0, 0);
		this._visible = true;
		// To do : Init class variables
	}
	
	/* Methods */
	
	/* Draw the component */
	void draw() {
		if(this._visible && this._style != null)
			_style.draw(this);
	}
	
	/* Validate the component */
	void validate() {

	}
	
	/* Spread the event to the component */
	void dispatchEvent(Event event) {

	}
	
	/* Getters & Setters */
	
	/* Getters & setters of _visible */
	bool isVisible() {
		return this._visible;
	}
	
	void setVisible(bool state) {
		this._visible = state;
	}
	     
	/* Getters & setters of _position */
	utils.Coordinates2D getPosition() {
		return this._position;
	}

	void setPosition(utils.Coordinates2D position) {
		this._position = position;
	}
	
	/* Getters & setters of _size */
	utils.Vector2D getSize() {
		return this._size;
	}
	
	void setSize(utils.Vector2D size) {
		this._size = size;
	}
								
}