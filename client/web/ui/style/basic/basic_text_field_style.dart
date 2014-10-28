part of ui;

class BasicTextFieldStyle extends TextFieldStyle {
	
	static const int BLINK_TIMER = 500;
	
	bool _blinkOn;
	bool _wasSelected;
	
	async.Timer _currentTimer;
	
	BasicTextFieldStyle() {
		this._blinkOn = false;
		this._wasSelected = false;
	}
	
	void _blink() {
		this._blinkOn = !this._blinkOn;
		this._currentTimer = new async.Timer(new Duration(milliseconds: BLINK_TIMER), _blink);
	}
	
	void draw(Component model) {
		TextField castModel = model as TextField;
		
		if(castModel.isSelected() && !this._wasSelected) {
			this._blinkOn = true;
			this._wasSelected = true;
			this._currentTimer = new async.Timer(new Duration(milliseconds: BLINK_TIMER), _blink);
			
		}
			
		if(!castModel.isSelected() && this._wasSelected) {
			this._currentTimer.cancel();
			this._blinkOn = false;
			this._wasSelected = false;
		}
		
		String color = "#ddd";
		
		if(castModel.isPushed()) {
    	color = "#fff";
    }
		else if(castModel.isOverflew()) {
			color = "#eee";
		}
			
		//background
		core.Window.getInstance().getContext()..beginPath()
																					..fillStyle = color
																					..strokeStyle = castModel.isSelected() ? "#0ff" : "#000"
																					..lineWidth = 2
																					..rect(castModel.getPosition().x, castModel.getPosition().y, castModel.getSize().x, castModel.getSize().y)
																					..fill()
																					..stroke();
		//text
		core.Window.getInstance().getContext()..fillStyle = "#000"
		    																	..font="50px Arial"
        																	..fillText(castModel.getText()+(this._blinkOn ? "|" : ""), castModel.getPosition().x, castModel.getPosition().y+castModel.getSize().y/2);
	}
}