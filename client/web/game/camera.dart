part of game;

class Camera {
	
	utils.Vector2D _dimensions;
	utils.Coordinates2D _coordinates;
	int _speed;
	
	Camera(utils.Vector2D dimensions, utils.Coordinates2D coordinates, int speed) {
		this._coordinates = coordinates;
		this._dimensions = dimensions;
		this._speed = speed;
	}
	
	utils.Vector2D getDimensions() => this._dimensions;
	utils.Coordinates2D getCoordinates() => this._coordinates;
	int getSpeed() => this._speed;
	
	bool onRange(utils.Coordinates2D area) {
	   return this._coordinates.x <= area.x && this._coordinates.x + this._dimensions.x >= area.x
	       && this._coordinates.x <= area.y && this._coordinates.y + this._dimensions.y >= area.y;
	}

}