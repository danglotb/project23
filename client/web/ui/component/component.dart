part of ui;

abstract class Component {
	
	/* The position of the component in the window */
	Coordinates2D _position;
	
	/* The size of the component */
	Vectore2D _size;
	
	/* The style of the component */
	ComponentStyleUI _style;
	
	/* True if the component is visible, else false */
	bool _visible;
	
	/* Constructors */
	
	Component(ComponentStyleUI style) {
		this._style = style;
		// To do : Init class variables
	}
	
	/* Methods */
	
	/* Draw the component */
	void draw();
	
	/* Spread the event to the component */
	void dispatchEvent(Event event);
	
	/* Setters */
	
	/* Set _visible to state */
	void setVisible(bool state) {
		this._visible = state;
	}
	
	/* Getters */
	
	/* Return true if the component is visible, else false */
	bool isVisible() {
		return this._visible;
	}
	
}