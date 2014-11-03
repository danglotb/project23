part of game;

final int SIZE_CASE = 50;

class Gameboard {
	
	List<Case> _gameboardTab;
	utils.Vector2D _dimensions;

	Camera _camera;
	
	html.CanvasElement canvas;
	html.ImageElement grass, sand;
	
	Player player;
	
	Gameboard(utils.Vector2D dimensions , html.CanvasElement canvas, {List<Case> gameCase}) {
		this._camera = new Camera(new utils.Vector2D(10*SIZE_CASE ,10*SIZE_CASE ), new utils.Coordinates2D(0,0));
		//TO REMOVE
		this.canvas = canvas;
	  this.canvas.width =  html.window.innerWidth;
	  this.canvas.height =  html.window.innerHeight;
		canvas.context2D..beginPath()
    										..fillStyle = "#eee"
    										..rect(0, 0, html.window.innerWidth, html.window.innerHeight)
    										..fill();
		canvas.onClick.listen(setTarget);
		canvas.onKeyDown.listen(moveCamera);
		//
		
		this._dimensions = dimensions;
		this.player = new Player(new utils.Coordinates2D(0, 0));
		
		if (gameCase != null)
			this._gameboardTab = gameCase;
		else {
			this._gameboardTab = new List(dimensions.x * dimensions.y);
		}
		
		//
		this.sand = new html.ImageElement(src:"sand.png");
    this.sand.onLoad.listen((e) {
			draw(0);
    });
    
  	this.grass = new html.ImageElement(src:"grass.png");
      this.grass.onLoad.listen((e) {
  			draw(0);
      });
    //
	}
	
	void setTarget(html.MouseEvent e) {
		this.player.setTarget(e.client.x, e.client.y);
	}
	
	void moveCamera(html.KeyboardEvent e) {
		print("MOVE CAMERA");
		switch (e.keyCode) {
		case 37:
			this._camera.getCoordinates().x--;
			break;
		case 38:
			this._camera.getCoordinates().y--;
			break;
		case 39:
    	this._camera.getCoordinates().x++;
    	break;
		case 40:
    	this._camera.getCoordinates().y++;
    	break;
		}
	}
	
	void draw(num timer) {
	  
	  
		for (int y = this._camera.getCoordinates().y ; y < this._camera.getDimensions().y ; y++) {
      			for (int x = this._camera.getCoordinates().x ; x < this._camera.getDimensions().y ; x++) {
      				if (this._gameboardTab[x+(y*this._camera.getDimensions().y)].getSpriteValue() == 1)
      					canvas.context2D.drawImageScaled(this.grass, x*50, y*50, 50,50);
      				else
      					canvas.context2D.drawImageScaled(this.sand, x*50, y*50, 50,50);
      			}
      		}
		canvas.context2D.drawImageScaled(this.player.getSkin(), this.player.getCoordinates2D().x, 
		this.player.getCoordinates2D().y, 50 ,50);
 			if (this.player.onMove)
 				this.player.move();
 			
  	html.window.requestAnimationFrame(draw);
	}
}
