part of game;

class Player {
	
	//TODO CHANGE COORDINATES
	int x, y;
	int tx, ty;
	bool onMove;
	html.ImageElement skin;
	
	Player(int x, int y) {
		this.x = x;
		this.y = y;
		this.onMove = false;
		this.skin = new html.ImageElement(src:'char.png');
	}
	
	html.ImageElement getSkin() => this.skin;
	
	int getX() => this.x;
	int getY() => this.y;
	
	void setTarget(int x, int y) {
		this.tx = x; this.ty = y;
		this.onMove = true;
	}
	
	void move() {
		if (onMove) {
			tx!=x?tx>x?x++:x--:x;
			ty!=y?ty>y?y++:y--:y;
			if (tx == x && ty == y)
				onMove = false;
		}
	}
	
}