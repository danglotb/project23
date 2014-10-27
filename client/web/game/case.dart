part of game;

class Case {
	
	int x, y; // TODO change this coordinate with the Coordinates object
	
	/**
	 * the index of the sprite
	 */
	int _spriteValue;
	/**
	 * boolean to know if the case is passable or not 
	 */
	bool _passable;
	
	/**
	 * Constructor
	 */
	Case(int x, int y,{bool passable, int spriteValue}){
		this.x = x;
		this.y = y;
		
		if (passable != null)
			this._passable = passable;
		else 
			this._passable = true;
		
		if (spriteValue != null)
			this._spriteValue = spriteValue;
		else
			this._spriteValue = -1;
	}
	
	void setValue(int spriteValue) {
		this._spriteValue = spriteValue;
	}
	
	void setPassable(bool passable) {
		this._passable = passable;
	}
	
	int getSpriteValue() => this._spriteValue;
	bool getPassable() => this._passable;
	
	String toString() => this._spriteValue.toString();
	
}