part of game;

class GameScreen {
	
	Gameboard _gameboard;
	HUD _hud;
	
	void draw() {
		this._gameboard.draw();
		this._hud.draw();
	}
	
	
}