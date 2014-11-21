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
	
	/* add a vector to this coordinates to find new coordinates */
	Coordinates2D operator+ (Vector2D v) {
	  return new Coordinates2D(this.x+v.x, this.y+v.y);
	}
	
	String toString() {
	  return "("+this.x.toString()+";"+this.y.toString()+")";
	}
	
}