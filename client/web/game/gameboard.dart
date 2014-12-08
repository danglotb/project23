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
		this._camera = new Camera(new utils.Vector2D(10*SIZE_CASE ,10*SIZE_CASE ), new utils.Coordinates2D(0,0), 10);
		//TO REMOVE
		this.canvas = canvas;
	  this.canvas.width =  html.window.innerWidth;
	  this.canvas.height =  html.window.innerHeight;
		canvas.context2D..beginPath()
    										..fillStyle = "#eee"
    										..rect(0, 0, html.window.innerWidth, html.window.innerHeight)
    										..fill();
		canvas.onClick.listen(setTarget);
		
		html.window.onKeyDown.listen(moveCamera);
		
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
	  utils.Vector2D area =  new utils.Vector2D(e.client.x, e.client.y);
	  if (this._camera.onRange(this.player.getCoordinates2D() + area)){
		this.player.setTarget(this._camera.getCoordinates().x + e.client.x,
		    this._camera.getCoordinates().y + e.client.y);
	  }
	}
	
	void moveCamera(html.KeyboardEvent e) {
		switch (e.keyCode) {
		case 37:
			this._camera.getCoordinates().x = this._camera.getCoordinates().x-this._camera.getSpeed()<0?
			    0:this._camera.getCoordinates().x-this._camera.getSpeed();
			break;
		case 38:
		  this._camera.getCoordinates().y = this._camera.getCoordinates().y-this._camera.getSpeed()<0?
                0:this._camera.getCoordinates().y-this._camera.getSpeed();
			break;
		case 39:
    	this._camera.getCoordinates().x = this._camera.getCoordinates().x + this._camera.getDimensions().x+this._camera.getSpeed()!= this._dimensions.x * SIZE_CASE?
    	    this._camera.getCoordinates().x+this._camera.getSpeed():this._camera.getCoordinates().x;
    	break;
		case 40:
		  this._camera.getCoordinates().y = this._camera.getCoordinates().y + this._camera.getDimensions().y+this._camera.getSpeed()!= this._dimensions.y * SIZE_CASE?
        this._camera.getCoordinates().y+this._camera.getSpeed():this._camera.getCoordinates().y;
    	break;
		}
	}
	
	void draw(num timer) {
	  
	  int endX, endY, i, startX, startY;
	  int resteX, resteY;
	  
	  /* cleaning the canvas */
	  canvas.context2D..fillStyle = "#eee"
              ..rect(0, 0, this._dimensions.x, this._dimensions.y)
              ..fill();
	  
	  /* calculation of border */
	  endX = this._camera.getCoordinates().x + this._camera._dimensions.x > this._dimensions.x?
	      this._dimensions.x:this._camera.getCoordinates().x + this._camera._dimensions.x;
	  
	  endY = this._camera.getCoordinates().y + this._camera._dimensions.y > this._dimensions.y?
            this._dimensions.y:this._camera.getCoordinates().y + this._camera._dimensions.y;
	  
	  endX ~/= SIZE_CASE;
	  endY ~/= SIZE_CASE;
	  
	  resteX = SIZE_CASE - (this._camera.getCoordinates().x % SIZE_CASE);
	  resteY = SIZE_CASE - (this._camera.getCoordinates().y % SIZE_CASE);
	  
	  /* for the case 0;0 */
	  html.Rectangle sourceRect = new html.Rectangle(this._camera.getCoordinates().x % SIZE_CASE, 
	      this._camera.getCoordinates().y % SIZE_CASE, resteX, resteY);
	  canvas.context2D.drawImageToRect(this.grass, 
	      new html.Rectangle(0,0,resteX,resteY), sourceRect:sourceRect);
	  
	  /* for the line 0 */
	  sourceRect = new html.Rectangle(0, this._camera.getCoordinates().y % SIZE_CASE,
	      SIZE_CASE, resteY);
	  i = (this._camera.getCoordinates().x ~/ SIZE_CASE) + ( (this._camera.getCoordinates().y ~/ SIZE_CASE) * (this._dimensions.x ~/ SIZE_CASE));
	  for (int x = 0 ; x < this._camera.getDimensions().x ~/ SIZE_CASE - 1; x ++) {
	    if (this._gameboardTab[i+x].getSpriteValue() == 1)
	    canvas.context2D.drawImageToRect(this.grass,
	        new html.Rectangle( (x * SIZE_CASE) + resteX
	            , 0, SIZE_CASE, resteY), sourceRect:sourceRect);
	    else
	      canvas.context2D.drawImageToRect(this.sand,
                 new html.Rectangle( (x * SIZE_CASE) + resteX
                     , 0, SIZE_CASE, resteY), sourceRect:sourceRect);
	  }
	  
	  /* for the column 0 */
	  sourceRect = new html.Rectangle(this._camera.getCoordinates().x % SIZE_CASE, 0, resteX, SIZE_CASE);
	  i = (this._camera.getCoordinates().x ~/ SIZE_CASE) + ( (this._camera.getCoordinates().y ~/ SIZE_CASE) * (this._dimensions.x ~/ SIZE_CASE));
	  for (int y = 0 ; y < this._camera.getDimensions().y ~/ SIZE_CASE - 1; y ++) {
          if (this._gameboardTab[(y*(this._dimensions.x  ~/ SIZE_CASE) )+i].getSpriteValue() == 1)
          canvas.context2D.drawImageToRect(this.grass,
              new html.Rectangle( 0, (y * SIZE_CASE) + resteY
                  , resteX, SIZE_CASE), sourceRect:sourceRect);
          else
            canvas.context2D.drawImageToRect(this.sand,
                new html.Rectangle( 0, (y * SIZE_CASE) + resteY
                  , resteX, SIZE_CASE), sourceRect:sourceRect);
    }
	  
	/* draw each case on the gameboard */
  for(int iY = 0 , y = this._camera.getCoordinates().y ~/SIZE_CASE + 1 ; y < endY - 1; y++, iY++) {
        for (int iX = 0 , x = this._camera.getCoordinates().x ~/SIZE_CASE +1 ; x < endX - 1; x++, iX++) {
                  i = (x + (y*SIZE_CASE));
                  if (this._gameboardTab[i].getSpriteValue() == 1)
                    canvas.context2D.drawImage(this.grass,iX*SIZE_CASE+resteX,iY*SIZE_CASE+resteY);
                  else
                    canvas.context2D.drawImage(this.sand,iX*SIZE_CASE+resteX,iY*SIZE_CASE+resteY);
         }
  }
  
  /* moving the player */
	 if (this.player.onMove)
         this.player.move();	
		
	 /* If the player is in the range of camera, display it */
	 if (this._camera.onRange(this.player.getCoordinates2D())) {
		canvas.context2D.drawImageScaled(this.player.getSkin(), this.player.getCoordinates2D().x -  this._camera.getCoordinates().x, 
		this.player.getCoordinates2D().y  -  this._camera.getCoordinates().y , 50 ,50);
	 }
	 
  	html.window.requestAnimationFrame(draw);
	}
}
