part of utils;

class Coordinates2D {
	
	num x;
	num y;
	
	Coordinates2D(num x, num y) {
		this.x = x;
		this.y = y;
	}
	
	operator== (Coordinates2D coordinates) {
		return this.x == coordinates.x && this.y == coordinates.y;
	}
	
}