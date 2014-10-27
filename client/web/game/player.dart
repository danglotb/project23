part of game;

class Player {
	
	//TODO CHANGE COORDINATES
	int x, y;
	html.ImageElement skin;
	
	Player(int x, int y) {
		this.x = x;
		this.y = y;
		this.skin = new html.ImageElement(src:'char.png');
	}
	
	html.ImageElement getSkin() => this.skin;
	
	int getX() => this.x;
	int getY() => this.y;
	
}