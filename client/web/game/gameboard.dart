part of game;

class Gameboard {
	
	List<Case> _gameboardTab;
	int _height;
	int _width;
	html.CanvasElement canvas;
	html.ImageElement beuh, sand;
	Player player;
	
	Gameboard(int height, int width , html.CanvasElement canvas, {List<Case> gameCase}) {
		
		//TO REMOVE
		this.canvas = canvas;
	  this.canvas.width =  html.window.innerWidth;
	  this.canvas.height =  html.window.innerHeight;
		canvas.context2D..beginPath()
    										..fillStyle = "#eee"
    										..rect(0, 0, html.window.innerWidth, html.window.innerHeight)
    										..fill();
		//
		
		this._height = height; 
		this._width = width;
		
		this.player = new Player(0,0);
		canvas.onClick.listen(anime);
		if (gameCase != null)
			this._gameboardTab = gameCase;
		else {
			this._gameboardTab = new List(this._height*this._width);
		}
		
		//
		this.sand = new html.ImageElement(src:"sand.png");
    this.sand.onLoad.listen((e) {
			draw(0);
    });
    
  	this.beuh = new html.ImageElement(src:"beuh.png");
      this.beuh.onLoad.listen((e) {
  			draw(0);
      });
    //
	}
	
	void anime(html.MouseEvent e) {
		this.player.setTarget(e.client.x, e.client.y);
	}
	
	void draw(num timer) {
		
		for (int y = 0 ; y < this._height ; y++) {
      			for (int x = 0 ; x < this._width ; x++) {
      				if (this._gameboardTab[x+(y*this._height)].getSpriteValue() == 1)
      					canvas.context2D.drawImageScaled(this.beuh, x*50, y*50, 50,50);
      				else
      					canvas.context2D.drawImageScaled(this.sand, x*50, y*50, 50,50);
      			}
      		}
		canvas.context2D.drawImageScaled(this.player.getSkin(), this.player.x, this.player.y, 50 ,50);
  		if (this.player.onMove)
  			this.player.move();
  	html.window.requestAnimationFrame(draw);
	}
}
