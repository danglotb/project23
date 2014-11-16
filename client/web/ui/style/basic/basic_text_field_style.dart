part of ui;

class BasicTextFieldStyle extends TextFieldStyle {
	
	static const int BLINK_TIMER = 500;
	
	static const int IMG_BORDER_WIDTH = 11;
	static const int IMG_TEXT_BORDER_WIDTH = 3;
	static const int IMG_TEXT_BORDER_HEIGHT = 5;
	static const int IMG_HEIGHT = 80;
	
	bool _blinkOn;
	bool _wasSelected;
	int _lastCursorPosition;
	
	async.Timer _currentTimer;
	html.ImageElement _spriteTextField;
	
	BasicTextFieldStyle() {
		this._blinkOn = false;
		this._wasSelected = false;
		this._lastCursorPosition = 0;
		this._spriteTextField = new html.ImageElement(src: "image/ui/textfield-sprite.png");
	}
	
	void _blink() {
		this._blinkOn = !this._blinkOn;
		this._currentTimer = new async.Timer(new Duration(milliseconds: BLINK_TIMER), _blink);
	}
	
	void _checkBlink() {
		TextField castModel = this._model as TextField;
		
		if(castModel.isSelected() && !this._wasSelected || this._lastCursorPosition != castModel.getTextCursorPosition()) {
			if(this._currentTimer != null)
				this._currentTimer.cancel();
			this._blinkOn = true;
			this._wasSelected = true;
			this._currentTimer = new async.Timer(new Duration(milliseconds: BLINK_TIMER), _blink);
			this._lastCursorPosition = castModel.getTextCursorPosition();
		}
			
		if(!castModel.isSelected() && this._wasSelected) {
			this._currentTimer.cancel();
			this._blinkOn = false;
			this._wasSelected = false;
		}
	}
	
	void buildDraw() {
		
		core.DrawManager.getInstance().addToContentLayer(new ComponentDrawable(() {
			TextField castModel = this._model as TextField;
			
			_checkBlink();
			
			if(castModel.isSelected()) {
				if(castModel.isOverflew()) {
					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteTextField, 69, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteTextField, 80, 0, 1, IMG_HEIGHT, castModel.getPosition().x+IMG_BORDER_WIDTH, castModel.getPosition().y, castModel.getSize().x-2*IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteTextField, 81, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x+castModel.getSize().x-IMG_BORDER_WIDTH, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y);
				}
				else {
					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteTextField, 46, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteTextField, 57, 0, 1, IMG_HEIGHT, castModel.getPosition().x+IMG_BORDER_WIDTH, castModel.getPosition().y, castModel.getSize().x-2*IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteTextField, 58, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x+castModel.getSize().x-IMG_BORDER_WIDTH, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y);
				}
			}
			else {
				if(castModel.isOverflew()) {
					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteTextField, 23, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteTextField, 34, 0, 1, IMG_HEIGHT, castModel.getPosition().x+IMG_BORDER_WIDTH, castModel.getPosition().y, castModel.getSize().x-2*IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteTextField, 35, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x+castModel.getSize().x-IMG_BORDER_WIDTH, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y);
				}
				else {
					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteTextField, 0, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteTextField, 11, 0, 1, IMG_HEIGHT, castModel.getPosition().x+IMG_BORDER_WIDTH, castModel.getPosition().y, castModel.getSize().x-2*IMG_BORDER_WIDTH, castModel.getSize().y)
	    																					..drawImageScaledFromSource(this._spriteTextField, 12, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, castModel.getPosition().x+castModel.getSize().x-IMG_BORDER_WIDTH, castModel.getPosition().y, IMG_BORDER_WIDTH, castModel.getSize().y);
				}
			}
			//text
			core.Window.getInstance().getContext()..fillStyle = "#444"
			    																	..font= BasicStyleManager.getInstance().getConfig().getFontSize().toString()+" Arial"
																						..textBaseline = 'middle';
			
			html.TextMetrics textMetric = core.Window.getInstance().getContext().measureText(castModel.getText()+" ");
			
			if(textMetric.width > castModel.getSize().x-2*IMG_BORDER_WIDTH) {
				core.Window.getInstance().getContext()..save()
	      																			..beginPath()
	      																			..rect(castModel.getPosition().x+IMG_TEXT_BORDER_WIDTH, castModel.getPosition().y, castModel.getSize().x-IMG_TEXT_BORDER_WIDTH*2, castModel.getSize().y)
	      																			..clip()
	      																			..fillText(castModel.getText(), castModel.getPosition().x+castModel.getSize().x-IMG_TEXT_BORDER_WIDTH-textMetric.width, castModel.getPosition().y+castModel.getSize().y/2)
	      																			..restore();
				
				if(this._blinkOn) {
					html.TextMetrics textMetricCursor = core.Window.getInstance().getContext().measureText(castModel.getText().substring(castModel.getTextCursorPosition()));
					
					core.Window.getInstance().getContext()..strokeStyle = "#222"
																								..moveTo(castModel.getPosition().x+castModel.getSize().x-2*IMG_TEXT_BORDER_WIDTH-textMetricCursor.width.toInt(), castModel.getPosition().y+IMG_TEXT_BORDER_HEIGHT)
																								..lineTo(castModel.getPosition().x+castModel.getSize().x-2*IMG_TEXT_BORDER_WIDTH-textMetricCursor.width.toInt(), castModel.getPosition().y+castModel.getSize().y-IMG_TEXT_BORDER_HEIGHT)
																								..stroke();
				}
			}
			else {
				core.Window.getInstance().getContext()..fillText(castModel.getText(), castModel.getPosition().x+IMG_BORDER_WIDTH, castModel.getPosition().y+castModel.getSize().y/2);
				
				if(this._blinkOn) {
					html.TextMetrics textMetricCursor = core.Window.getInstance().getContext().measureText(castModel.getText().substring(0, castModel.getTextCursorPosition()));
					
					core.Window.getInstance().getContext()..strokeStyle = "#222"
																								..moveTo(castModel.getPosition().x+IMG_BORDER_WIDTH+textMetricCursor.width.toInt(), castModel.getPosition().y+IMG_TEXT_BORDER_HEIGHT)
																								..lineTo(castModel.getPosition().x+IMG_BORDER_WIDTH+textMetricCursor.width.toInt(), castModel.getPosition().y+castModel.getSize().y-IMG_TEXT_BORDER_HEIGHT)
																								..stroke();
				}
			}
		}));
	}
	
	int getCursorPosition(utils.Coordinates2D coordinates) {
		TextField castModel = this._model as TextField;
		
		core.Window.getInstance().getContext()..fillStyle = "#444"
		    																	..font= BasicStyleManager.getInstance().getConfig().getFontSize().toString()+" Arial"
																					..textBaseline = 'middle';
		
		html.TextMetrics textMetric = core.Window.getInstance().getContext().measureText(castModel.getText()+" ");
		
		if(textMetric.width > this._model.getSize().x-2*IMG_BORDER_WIDTH) {
			
		}
		else {

		}
		return 0;
	}
}