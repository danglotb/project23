part of ui;

/* A selectable component to choose a value between a min and a max */
class Cursor extends SelectableComponent {
	
	/* The selected value */
	num _value;
	
	/* The min value */
	num _min;
	
	/* The max value */
	num _max;
	
	/* List of listener */
	List<Function> _valueChangedListener;
	
	/* Constructors */
	
	Cursor(num init, num min, num max, CursorStyle style) : super(style) {
		
		/* min value must be lesser or equal to max */
		if(min > max) {
			// To do : Exception
			print("Error : min must be lesser or equal to max");
			return;
		}
		
		/* If init isn't between min and max, set value to min or max */
		this._value = init<min?min:init>max?max:init;
		
		this._min = min;
		this._max = max;

		this._valueChangedListener = new List<Function>();
		
	}
	
	/* Methods */
	
	/* Add a listener in _valueChangedListener */
	void addListenerSelected(Function fun) {
		this._valueChangedListener.add(fun);
	}
	
	void dispatchEvent(Event event) {
		
		super.dispatchEvent(event);
		
		if(event.getType() == EventType.MOUSE_PUSH || this._pushed) {
			
			num mousePosX = event.getMousePosition().x;
  		num mousePosY = event.getMousePosition().y;
  		num cursorPosMinX = this._position.x;
  		num cursorPosMaxX = this._position.x + this._size.x;
  		num cursorPosY = this._position.y + this._size.y/2;			
			
  		this._value = (mousePosX - cursorPosMinX)/this._size.x * (this._max - this._min);
  		draw();
		
		}
  		
  }
	
	/* Getters & Setters */
	
	/* Get the selected value */
	num getValue() {
		return this._value;
	}
	
	/* Get the min value */
	num getMin() {
		return this._min;
	}
	
	/* Get the max value */
	num getMax() {
		return this._max;
	}
	
}