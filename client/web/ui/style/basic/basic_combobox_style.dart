part of ui;

class BasicComboboxStyle extends ComboboxStyle {
	
	static const int DROP_DOWN_UNIT_HEIGHT = 40;
	
	ComboboxStyleInputArea getInputAreaStyle() {
		return new BasicComboboxStyleInputArea();
	}
	
	ComboboxStyleDropDown getDropDownStyle() {
		return new BasicComboboxStyleDropDown();
	}
	
	ComboboxStyleDropDownUnit getDropDownUnitStyle() {
		return new BasicComboboxStyleDropDownUnit();
	}
	
	int getMaxDropDownHeight() {
		return 250;
	}
	
	int getDropDownUnitHeight() {
		return DROP_DOWN_UNIT_HEIGHT;
	}

}

class BasicComboboxStyleInputArea extends ComboboxStyleInputArea {
	html.ImageElement _spriteCombobox;
	
	static const int IMG_BORDER_WIDTH = 11;
	static const int IMG_HEIGHT = 80;
	static const int ICON_WIDTH = 40;
	static const int ICON_HEIGHT = 80;
	ComponentDrawable _drawable;
	
	BasicComboboxStyleInputArea() {
		this._spriteCombobox = new html.ImageElement(src: "image/ui/combobox-sprite.png");
	}
	
	void buildDraw() {
		_ComboboxInputArea castModel = this._model as _ComboboxInputArea;
		
		num backgroundLeftX;
		num backgroundMiddleX;
		num backgroundMiddleWidth;
		num backgroundRightX;
		num backgroundY;
		num backgroundHeight;
		
		String text;
		num textX;
		num textY;
		
		num iconX;
		num iconWidth;
		
		
		this._drawable = new ComponentDrawable();
		
		this._drawable.setComputeFunction(() {
			backgroundLeftX = castModel.getPosition().x;
			backgroundMiddleX = castModel.getPosition().x + IMG_BORDER_WIDTH;
			backgroundMiddleWidth = castModel.getSize().x - 2 * IMG_BORDER_WIDTH;
			backgroundRightX = castModel.getPosition().x + castModel.getSize().x - IMG_BORDER_WIDTH;
			backgroundY = castModel.getPosition().y;
			backgroundHeight = castModel.getSize().y;
			
			text = castModel.getCombobox().getCurrentChoice();
			textX = castModel.getPosition().x+IMG_BORDER_WIDTH;
			textY = castModel.getPosition().y+castModel.getSize().y~/2;
			
			iconWidth = (ICON_WIDTH*(castModel.getSize().y/ICON_HEIGHT)).toInt();
			
			
			iconX = castModel.getPosition().x+castModel.getSize().x-iconWidth-IMG_BORDER_WIDTH;
		});
		
		this._drawable.setDrawFunction(() {
			if(castModel.isSelected()) {
				if(castModel.isOverflew()) {
					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteCombobox, 69, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 80, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 81, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
				}
				else {
					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteCombobox, 46, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 57, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 58, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
				}
			}
			else {
				if(castModel.isOverflew()) {
					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteCombobox, 23, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 34, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 35, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
				}
				else {
					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteCombobox, 0, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 11, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 12, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
				}
			}
			
			if(castModel.getCombobox().isDropDownUnroll()) {
				core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteCombobox, 132, 0, 40, IMG_HEIGHT, iconX, backgroundY, iconWidth, backgroundHeight);
			}
			else {
				core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteCombobox, 92, 0, 40, IMG_HEIGHT, iconX, backgroundY, iconWidth, backgroundHeight);
			}
			core.Window.getInstance().getContext()..fillStyle = "#444"
			    																	..font = BasicStyleManager.getInstance().getFontSizeH3().toString()+'px '+BasicStyleManager.getInstance().getFontName()
																						..fillText(text, textX, textY);
		});
		
		core.DrawManager.getInstance().addToContentLayer(this._drawable);
	}
}

class BasicComboboxStyleDropDown extends ComboboxStyleDropDown {
	
	void buildDraw() {

	}
}

class BasicComboboxStyleDropDownUnit extends ComboboxStyleDropDownUnit {
	
	void buildDraw() {
		ComponentDrawable drawable = new ComponentDrawable();
		
		drawable.setDrawFunction(() {
			_ComboboxDropDownUnit castModel = this._model as _ComboboxDropDownUnit;
			
			if(castModel.isOverflew()) {
				core.Window.getInstance().getContext()..fillStyle = "#ddd"
        																			..fillRect(castModel.getPosition().x, castModel.getPosition().y, castModel.getSize().x, castModel.getSize().y);

			}
			else {
				core.Window.getInstance().getContext()..fillStyle = "#aaa"
        																			..fillRect(castModel.getPosition().x, castModel.getPosition().y, castModel.getSize().x, castModel.getSize().y);
			}
			core.Window.getInstance().getContext()..fillStyle = "#444"
			   																		..font = BasicStyleManager.getInstance().getFontSizeH3().toString()+'px '+BasicStyleManager.getInstance().getFontName()
																						..fillText(castModel.getText(), castModel.getPosition().x+BasicComboboxStyleInputArea.IMG_BORDER_WIDTH, castModel.getPosition().y+castModel.getSize().y/2);
		});
		
		core.DrawManager.getInstance().addToContentFrontLayer(drawable);
	}
}