part of utils;

class Vector2D {
	
	num x;
	num y;
	
	Vector2D(num x, num y) {
		this.x = x;
		this.y = y;
	}
	
	 String toString() {
     return "("+this.x.toString()+";"+this.y.toString()+")";
   }
}