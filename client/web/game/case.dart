part of game;

class Case {
	
	/**
	 * Coordinates2D of the case
	 */
	utils.Coordinates2D coordinates;
	
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
	Case(utils.Coordinates2D coordinates, {bool passable, int spriteValue}){
		this.coordinates = coordinates;
		
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