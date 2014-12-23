part of ui;

class MenuButtonStyle extends ButtonStyle {
	
	static const int IMG_BORDER_WIDTH = 13;
	
	html.ImageElement _spriteButton;

	
	MenuButtonStyle(bool current) {
		this._spriteButton = new html.ImageElement(src: current ? "image/ui/menu-button-sprite-current.png" : "image/ui/menu-button-sprite.png");
	}
	
	TextLabelStyle getTextLabelStyle() {
		return new _ButtonMenuTextStyle();
	}
	
	utils.Rect getBorderSize() {
		return new utils.Rect(left: IMG_BORDER_WIDTH, top: 20, bottom: 20);
	}
	
	void buildDraw() {
		
		Button castModel = this._model as Button;
		
		
		ComponentDrawable drawable = new ComponentDrawable(this._model);
		
		num backgroundLeftX;
		num backgroundMiddleX;
		num backgroundMiddleWidth;
		num backgroundY;
		num backgroundHeight;
		
		drawable.setComputeFunction(() {
			backgroundLeftX = castModel.getAbsolutePosition().x;
			backgroundY = castModel.getAbsolutePosition().y;
			backgroundMiddleX = castModel.getAbsolutePosition().x+IMG_BORDER_WIDTH;
			backgroundMiddleWidth = castModel.getSize().x-13;
			backgroundHeight = castModel.getSize().y;
		});
		
		drawable.setDrawFunction(() {
			
			
			if(castModel.isSelected()) {
  			if(castModel.isPushed()) {
  				if(castModel.isOverflew()) {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 105, 0, 13, 74, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
      																						..drawImageScaledFromSource(this._spriteButton, 118, 0, 1, 74, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight);
  				}
  				else {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 90, 0, 13, 74, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
      																						..drawImageScaledFromSource(this._spriteButton, 103, 0, 1, 74, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight);
  				}
  			}
  			else {
  				if(castModel.isOverflew()) {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 75, 0, 13, 74, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
      																						..drawImageScaledFromSource(this._spriteButton, 88, 0, 1, 74, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight);
  				}
  				else {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 60, 0, 13, 74, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
      																						..drawImageScaledFromSource(this._spriteButton, 73, 0, 1, 74, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight);
  				}
  			}
  		}
  		else {
  			if(castModel.isPushed()) {
  				if(castModel.isOverflew()) {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 45, 0, 13, 74, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
      																						..drawImageScaledFromSource(this._spriteButton, 58, 0, 1, 74, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight);
  				}
  				else {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 30, 0, 13, 74, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
      																						..drawImageScaledFromSource(this._spriteButton, 43, 0, 1, 74, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight);
  				}
  			}
  			else {
  				if(castModel.isOverflew()) {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 15, 0, 13, 74, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
      																						..drawImageScaledFromSource(this._spriteButton, 28, 0, 1, 74, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight);
  				}
  				else {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 0, 0, 13, 74, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
      																						..drawImageScaledFromSource(this._spriteButton, 13, 0, 1, 74, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight);
  				}
  			}
  		}

			
		});
		
		addToContentLayer(drawable);
		
	}
	
	utils.Vector2D getMinimalSize() {
		return new utils.Vector2D(1, 74);
	}
	
}

class _ButtonMenuTextStyle extends TextLabelStyle {
	void buildDraw() {
		
		TextLabel castModel = this._model as TextLabel;
		
		ComponentDrawable drawable = new ComponentDrawable(this._model);
		
		num textX;
		num textY;
		String text;
		String font;
		
		drawable.setComputeFunction(() {
			text = castModel.getText();
			num textLength = core.Window.getInstance().getContext().measureText(castModel.getText()).width.roundToDouble();
			textX = castModel.getAbsolutePosition().x+(castModel.getSize().x-textLength)~/2;
			font = BasicStyleManager.getInstance().getFontSize(castModel.getTextSize()).toString()+'px '+BasicStyleManager.getInstance().getFontName();
			textY = castModel.getAbsolutePosition().y+(castModel.getSize().y-BasicStyleManager.getInstance().getFontSize(castModel.getTextSize()))~/2+BasicStyleManager.getInstance().getFontSize(castModel.getTextSize())~/2;

		});
		
		drawable.setDrawFunction(() {
			
			core.Window.getInstance().getContext()..font = font
																						..textAlign = "left"
																						..fillStyle = "#eee"
																						..textBaseline = "middle"
	                                        	..fillText(text, textX, textY);
		});
		
		this.addToContentLayer(drawable);
	}
}