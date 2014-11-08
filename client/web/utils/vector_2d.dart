part of utils;

class Vector2D {
	
	num x;
	num y;
	
	Vector2D(num x, num y) {
		this.x = x;
		this.y = y;
	}
	
	Vector2D operator+(Vector2D other) {
		return new Vector2D(x+other.x, y+other.y);
	}
}