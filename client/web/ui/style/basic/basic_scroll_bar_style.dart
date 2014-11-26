part of ui;

class BasicHorizontalScrollBarStyle extends HorizontalScrollBarStyle {
	
	static const int BACKGROUND_BORDER_WIDTH = 2;
	static const int BAR_BORDER_WIDTH = 2;
	static const int IMG_HEIGHT = 20;
	utils.Coordinates2D _barPosition;
	utils.Vector2D _barSize;
	
	
	html.ImageElement _spriteScrollBar;

	BasicHorizontalScrollBarStyle() {
		this._spriteScrollBar = new html.ImageElement(src: "image/ui/horizontal-scroll-bar.png");
		this._barPosition = new utils.Coordinates2D(0, 0);
		this._barSize = new utils.Vector2D(0, 0);
	}
	
	utils.Rect getBarRect() {
		return new utils.Rect(left: this._barPosition.x, top: this._barPosition.y, right: this._barPosition.x+this._barSize.x, bottom: this._barPosition.y+this._barSize.y);
	}
	
	num getEmptyBarLength() {
		return this._model.getSize().x-this._barSize.x-2*BACKGROUND_BORDER_WIDTH;
	}
	
	void buildDraw() {
		
		ScrollBar castModel = this._model as ScrollBar;
		
		num backgroundLeftX;
		num backgroundMiddleX;
		num backgroundMiddleWidth;
		num backgroundRightX;
		num backgroundY;
		num backgroundHeight;
		num barLeftX;
		num barMiddleX;
		num barMiddleWidth;
		num barRightX;
		
		ComponentDrawable drawable = new ComponentDrawable(this._model);
		
		drawable.setComputeFunction(() {
			backgroundLeftX = castModel.getPosition().x;
			backgroundMiddleX = castModel.getPosition().x + BACKGROUND_BORDER_WIDTH;
			backgroundMiddleWidth = castModel.getSize().x - 2 * BACKGROUND_BORDER_WIDTH;
			backgroundRightX = castModel.getPosition().x + castModel.getSize().x - BACKGROUND_BORDER_WIDTH;
			backgroundY = castModel.getPosition().y;
			backgroundHeight = castModel.getSize().y;
			
			this._barSize = new utils.Vector2D((castModel.getSize().x-2*BACKGROUND_BORDER_WIDTH)*castModel.getViewportRatio(), castModel.getSize().y);
			this._barPosition = new utils.Coordinates2D(castModel.getPosition().x + BACKGROUND_BORDER_WIDTH + castModel.getBarPositionRatio()*(castModel.getSize().x-2*BACKGROUND_BORDER_WIDTH-this._barSize.x), castModel.getPosition().y);
			
			
			barLeftX = this._barPosition.x;
			barMiddleX = barLeftX + BAR_BORDER_WIDTH;
			barMiddleWidth = this._barSize.x - 2*BAR_BORDER_WIDTH;
			barRightX = barMiddleX + barMiddleWidth;
			
		});
		
		drawable.setDrawFunction(() {
			core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteScrollBar, 0, 0, BACKGROUND_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, BACKGROUND_BORDER_WIDTH, backgroundHeight)
  																					..drawImageScaledFromSource(this._spriteScrollBar, 18, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
  																					..drawImageScaledFromSource(this._spriteScrollBar, 20, 0, BACKGROUND_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, BACKGROUND_BORDER_WIDTH, backgroundHeight);
			
			if(castModel.isOverflew()) {
				core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteScrollBar, 9, 0, BAR_BORDER_WIDTH, IMG_HEIGHT, barLeftX, backgroundY, BAR_BORDER_WIDTH, backgroundHeight)
	  																					..drawImageScaledFromSource(this._spriteScrollBar, 12, 0, 1, IMG_HEIGHT, barMiddleX, backgroundY, barMiddleWidth, backgroundHeight)
	  																					..drawImageScaledFromSource(this._spriteScrollBar, 14, 0, BAR_BORDER_WIDTH, IMG_HEIGHT, barRightX, backgroundY, BAR_BORDER_WIDTH, backgroundHeight);
			}
			else {
				core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteScrollBar, 2, 0, BAR_BORDER_WIDTH, IMG_HEIGHT, barLeftX, backgroundY, BAR_BORDER_WIDTH, backgroundHeight)
	  																					..drawImageScaledFromSource(this._spriteScrollBar, 5, 0, 1, IMG_HEIGHT, barMiddleX, backgroundY, barMiddleWidth, backgroundHeight)
	  																					..drawImageScaledFromSource(this._spriteScrollBar, 7, 0, BAR_BORDER_WIDTH, IMG_HEIGHT, barRightX, backgroundY, BAR_BORDER_WIDTH, backgroundHeight);
			}
		});
		
		this.addToContentLayer(drawable);
	}
	
	utils.Vector2D getMinimalSize() {
		return new utils.Vector2D(1, IMG_HEIGHT);
	}

	
}

class BasicVerticalScrollBarStyle extends VerticalScrollBarStyle {
	
	static const int BACKGROUND_BORDER_HEIGHT = 2;
	static const int BAR_BORDER_HEIGHT = 2;
	static const int IMG_WIDTH = 20;
	utils.Coordinates2D _barPosition;
	utils.Vector2D _barSize;
	
	
	html.ImageElement _spriteScrollBar;

	BasicVerticalScrollBarStyle() {
		this._spriteScrollBar = new html.ImageElement(src: "image/ui/vertical-scroll-bar.png");
		this._barPosition = new utils.Coordinates2D(0, 0);
		this._barSize = new utils.Vector2D(0, 0);
	}
	
	utils.Rect getBarRect() {
		return new utils.Rect(left: this._barPosition.x, top: this._barPosition.y, right: this._barPosition.x+this._barSize.x, bottom: this._barPosition.y+this._barSize.y);
	}
	
	num getEmptyBarLength() {
		return this._model.getSize().y-this._barSize.y-2*BACKGROUND_BORDER_HEIGHT;
	}
	
	void buildDraw() {
		
		ScrollBar castModel = this._model as ScrollBar;
		
		num backgroundX;
		num backgroundWidth;
		num backgroundTopY;
		num backgroundMiddleY;
		num backgroundMiddleHeight;
		num backgroundBottomY;
		
		num barTopY;
		num barMiddleY;
		num barMiddleHeight;
		num barBottomY;
		
		ComponentDrawable drawable = new ComponentDrawable(this._model);
		
		drawable.setComputeFunction(() {
			backgroundX = castModel.getPosition().x;
  		backgroundWidth = castModel.getSize().x;
  		backgroundTopY = castModel.getPosition().y;
  		backgroundMiddleY = castModel.getPosition().y+BACKGROUND_BORDER_HEIGHT;
  		backgroundMiddleHeight = castModel.getSize().y - 2 * BACKGROUND_BORDER_HEIGHT;
  		backgroundBottomY = castModel.getPosition().y + castModel.getSize().y - BACKGROUND_BORDER_HEIGHT;
  		
			this._barSize = new utils.Vector2D(castModel.getSize().x, (castModel.getSize().y-2*BACKGROUND_BORDER_HEIGHT)*castModel.getViewportRatio());
			this._barPosition = new utils.Coordinates2D(castModel.getPosition().x, castModel.getPosition().y + BACKGROUND_BORDER_HEIGHT + castModel.getBarPositionRatio()*(castModel.getSize().y-2*BACKGROUND_BORDER_HEIGHT-this._barSize.y));
			
  		barTopY = this._barPosition.y;
  		barMiddleY = barTopY + BAR_BORDER_HEIGHT;
  		barMiddleHeight = this._barSize.y - 2*BAR_BORDER_HEIGHT;
  		barBottomY =  barMiddleY + barMiddleHeight;
			
		});
		
		drawable.setDrawFunction(() {
			core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteScrollBar, 0, 0, IMG_WIDTH, BACKGROUND_BORDER_HEIGHT, backgroundX, backgroundTopY, backgroundWidth, BACKGROUND_BORDER_HEIGHT)
  																					..drawImageScaledFromSource(this._spriteScrollBar, 0, 18, IMG_WIDTH, 1, backgroundX, backgroundMiddleY, backgroundWidth, backgroundMiddleHeight)
  																					..drawImageScaledFromSource(this._spriteScrollBar, 0, 20, IMG_WIDTH, BACKGROUND_BORDER_HEIGHT, backgroundX, backgroundBottomY, backgroundWidth, BACKGROUND_BORDER_HEIGHT);
			
			if(castModel.isOverflew()) {
				core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteScrollBar, 0, 9, IMG_WIDTH, BAR_BORDER_HEIGHT, backgroundX, barTopY, backgroundWidth, BAR_BORDER_HEIGHT)
	  																					..drawImageScaledFromSource(this._spriteScrollBar, 0, 12, IMG_WIDTH, 1, backgroundX, barMiddleY, backgroundWidth, barMiddleHeight)
	  																					..drawImageScaledFromSource(this._spriteScrollBar, 0, 14, IMG_WIDTH, BAR_BORDER_HEIGHT, backgroundX, barBottomY, backgroundWidth, BAR_BORDER_HEIGHT);
			}
			else {
				core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteScrollBar, 0, 2, IMG_WIDTH, BAR_BORDER_HEIGHT, backgroundX, barTopY, backgroundWidth, BAR_BORDER_HEIGHT)
	  																					..drawImageScaledFromSource(this._spriteScrollBar, 0, 5, IMG_WIDTH, 1, backgroundX, barMiddleY, backgroundWidth, barMiddleHeight)
	  																					..drawImageScaledFromSource(this._spriteScrollBar, 0, 7, IMG_WIDTH, BAR_BORDER_HEIGHT, backgroundX, barBottomY, backgroundWidth, BAR_BORDER_HEIGHT);
			}
		});
		
		this.addToContentLayer(drawable);
	}
	
	utils.Vector2D getMinimalSize() {
		return new utils.Vector2D(IMG_WIDTH, 1);
	}

}