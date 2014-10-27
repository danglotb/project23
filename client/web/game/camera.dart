part of game;

class Camera {
	
	int _height, _width;
	int _x, _y;
	
	Camera(int height, int width,{int x, int y}) {
		
		if (x != null)
			this._x = x;
		else
			this._x = 0;
		
		if (y != null)
			this._y = y;
		else
			this._y = 0;
		
		this._height = height;
		this._width = width;
		
	}
	
	int getHeight() => this._height;
	int getWidth() => this._width;
	int getX() => this._x;
	int getY() => this._y;
	
}