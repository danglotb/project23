part of game;

class Player {
	
	utils.Coordinates2D _coordinates, _targetCoordinates;
	bool onMove;
	html.ImageElement skin;
	
	List<utils.Coordinates2D> path;
	
	Player(utils.Coordinates2D coordinates) {
		this._coordinates = coordinates;
		this.onMove = false;
		this.skin = new html.ImageElement(src:'char.png');
	}
	
	html.ImageElement getSkin() => this.skin;
	utils.Coordinates2D getCoordinates2D() => this._coordinates;
	
	void setTarget(int x, int y) {
		this._targetCoordinates = new utils.Coordinates2D(x, y);
		this.onMove = true;
	}
	
	void move() {
		if (onMove) {
			if (this._targetCoordinates.x != this._coordinates.x) {
				if (this._targetCoordinates.x > this._coordinates.x) 
					this._coordinates.x++;
				 else
					this._coordinates.x--;
			}
			if (this._targetCoordinates.y != this._coordinates.y) {
				if (this._targetCoordinates.y > this._coordinates.y) 
					this._coordinates.y++;
				 else
					this._coordinates.y--;
			}
				if (this._coordinates == this._targetCoordinates)
					onMove = false;
		}
	}
	
}