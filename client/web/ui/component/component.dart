part of ui;

/* A component of the window */
abstract class Component {
	
	/* The position of the component in the window */
	Coordinates2D _position;
	
	/* The size of the component */
	Vector2D _size;
	
	/* The style of the component */
	ComponentStyle _style;
	
	/* True if the component is visible, else false */
	bool _visible;
	
	/* Constructors */
	
	Component(ComponentStyle style) {
		this._style = style;
		// To do : Init class variables
	}
	
	/* Methods */
	
	/* Draw the component */
	void draw();
	
	/* Spread the event to the component */
	void dispatchEvent(Event event);
	
	/* Getters & Setters */
	
	/* Getters & setters of _visible */
	bool get isVisible							=> this._visible;
	     set setVisible(bool state) => this._visible = state;
	     
	/* Getters & setters of _position */
	Coordinates2D get getPosition													=> this._position;
								set setPosition(Coordinates2D position) => this._position = position;
	
	/* Getters & setters of _size */
	Vector2D get getSize 								=> this._size;
					 set setSize(Vector2D size) => this._size = size;
								
}