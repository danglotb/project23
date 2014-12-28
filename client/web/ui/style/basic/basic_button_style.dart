part of ui;

class BasicButtonStyle extends ButtonStyle {
	
	static const int IMG_HEIGHT = 80;
	static const int IMG_BORDER_WIDTH = 11;
	
	html.ImageElement _spriteButton;

	BasicButtonStyle() {
		this._spriteButton = new html.ImageElement(src: "image/ui/button-sprite.png");
	}
	
	TextLabelStyle getTextLabelStyle() {
		return new BasicTextLabelStyle();
	}
	
	utils.Rect getBorderSize() {
		return new utils.Rect(left: IMG_BORDER_WIDTH, right: IMG_BORDER_WIDTH, top: IMG_BORDER_WIDTH, bottom: IMG_BORDER_WIDTH);
	}
	
	void buildDraw() {
		
		Button castModel = this._model as Button;
		
		num backgroundLeftX;
		num backgroundMiddleX;
		num backgroundMiddleWidth;
		num backgroundRightX;
		num backgroundY;
		num backgroundHeight;
		
		ComponentDrawable drawable = new ComponentDrawable(this._model);
		
		drawable.setComputeFunction(() {
			backgroundLeftX = castModel.getPosition().x;
			backgroundMiddleX = castModel.getPosition().x + IMG_BORDER_WIDTH;
			backgroundMiddleWidth = castModel.getSize().x - 2 * IMG_BORDER_WIDTH;
			backgroundRightX = castModel.getPosition().x + castModel.getSize().x - IMG_BORDER_WIDTH;
			backgroundY = castModel.getPosition().y;
			backgroundHeight = castModel.getSize().y;
		});
		
		drawable.setDrawFunction(() {
			
			
			if(castModel.isSelected()) {
				if(castModel.isPushed()) {
					if(castModel.isOverflew()) {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 161, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 172, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 173, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
					}
					else {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 138, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 149, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 150, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
					}
				}
				else {
					if(castModel.isOverflew()) {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 115, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 126, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 127, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
					}
					else {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 92, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 103, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 104, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
					}
				}
			}
			else {
				if(castModel.isPushed()) {
					if(castModel.isOverflew()) {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 69, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 80, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 81, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
					}
					else {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 46, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 57, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 58, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
					}
				}
				else {
					if(castModel.isOverflew()) {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 23, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 34, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 35, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
					}
					else {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 0, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 11, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
	      																					..drawImageScaledFromSource(this._spriteButton, 12, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
					}
				}
			}
		});
		
		this.addToContentLayer(drawable);
	}
	
	utils.Vector2D getMinimalSize() {
		return new utils.Vector2D(1, 74);
	}

}