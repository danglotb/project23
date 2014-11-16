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
	
	BasicComboboxStyleInputArea() {
		this._spriteCombobox = new html.ImageElement(src: "image/ui/combobox-sprite.png");
	}
	
	void buildDraw() {
		
		core.DrawManager.getInstance().addToContentLayer(new ComponentDrawable(() {
			_ComboboxInputArea castModel = this._model as _ComboboxInputArea;
			
			if(castModel.isSelected()) {
				if(castModel.isOverflew()) {
					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteCombobox, 69, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 80, 0, 1, IMG_HEIGHT, castModel.getPosition().x+IMG_BORDER_WIDTH, castModel.getPosition().y, castModel.getSize().x-2*IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 81, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x+castModel.getSize().x-IMG_BORDER_WIDTH, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y);
				}
				else {
					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteCombobox, 46, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 57, 0, 1, IMG_HEIGHT, castModel.getPosition().x+IMG_BORDER_WIDTH, castModel.getPosition().y, castModel.getSize().x-2*IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 58, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x+castModel.getSize().x-IMG_BORDER_WIDTH, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y);
				}
			}
			else {
				if(castModel.isOverflew()) {
					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteCombobox, 23, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 34, 0, 1, IMG_HEIGHT, castModel.getPosition().x+IMG_BORDER_WIDTH, castModel.getPosition().y, castModel.getSize().x-2*IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 35, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x+castModel.getSize().x-IMG_BORDER_WIDTH, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y);
				}
				else {
					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteCombobox, 0, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 11, 0, 1, IMG_HEIGHT, castModel.getPosition().x+IMG_BORDER_WIDTH, castModel.getPosition().y, castModel.getSize().x-2*IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteCombobox, 12, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x+castModel.getSize().x-IMG_BORDER_WIDTH, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y);
				}
			}
			
			if(castModel.getCombobox().isDropDownUnroll()) {
				core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteCombobox, 132, 0, 40, IMG_HEIGHT, castModel.getPosition().x+castModel.getSize().x-40-IMG_BORDER_WIDTH, castModel.getPosition().y, 40, castModel.getSize().y);
			}
			else {
				core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteCombobox, 92, 0, 40, IMG_HEIGHT, castModel.getPosition().x+castModel.getSize().x-40-IMG_BORDER_WIDTH, castModel.getPosition().y, 40, castModel.getSize().y);
			}
			core.Window.getInstance().getContext()..fillStyle = "#000"
			    																	..font = "20px arial"
																						..fillText(castModel.getCombobox().getCurrentChoice(), castModel.getPosition().x+IMG_BORDER_WIDTH, castModel.getPosition().y+castModel.getSize().y/2);
		}));
	}
}

class BasicComboboxStyleDropDown extends ComboboxStyleDropDown {
	
	void buildDraw() {
		core.DrawManager.getInstance().addToContentFrontLayer(new ComponentDrawable(() {
			core.Window.getInstance().getContext()..fillStyle = "#eee"
																						..fillRect(this._model.getPosition().x, this._model.getPosition().y, this._model.getSize().x, this._model.getSize().y);
		}));
	}
}

class BasicComboboxStyleDropDownUnit extends ComboboxStyleDropDownUnit {
	
	void buildDraw() {
		core.DrawManager.getInstance().addToContentFrontLayer(new ComponentDrawable(() {
			_ComboboxDropDownUnit castModel = this._model as _ComboboxDropDownUnit;
			
			if(castModel.isOverflew()) {
				core.Window.getInstance().getContext()..fillStyle = "#ddd"
        																			..fillRect(castModel.getPosition().x, castModel.getPosition().y, castModel.getSize().x, castModel.getSize().y);

			}
			core.Window.getInstance().getContext()..fillStyle = "#000"
			   																		..font = "20px arial"
																						..fillText(castModel.getText(), castModel.getPosition().x+BasicComboboxStyleInputArea.IMG_BORDER_WIDTH, castModel.getPosition().y+castModel.getSize().y/2);
		}));
	}
}