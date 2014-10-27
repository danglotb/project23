part of game;

class Camera {
	
	utils.Vector2D _dimensions;
	utils.Coordinates2D _coordinates;
	
	Camera(utils.Vector2D dimensions, utils.Coordinates2D coordinates) {
		this._coordinates = coordinates;
		this._dimensions = dimensions;
	}
	
	utils.Vector2D getDimensions() => this._dimensions;
	utils.Coordinates2D getCoordinates() => this._coordinates;

}