part of ui;

abstract class TextInput extends SelectableComponent {
	
	String _text;
	int _textCursorPosition;
	
	TextInput(TextInputStyle style) : super(style) {
		this._text = "";
		this._textCursorPosition = 0;
	}
	
	void processEvent(core.Event event, utils.Rect viewport) {
		
		super.processEvent(event, viewport);
		
		if(this._selected) {
			if(event.getType() == core.EventType.KEY_PUSHED) {
				if(event.getKeyCode() == 8) { // backspace
					if(this._textCursorPosition > 0) {
						this._text = this._text.substring(0, this._textCursorPosition-1)+this._text.substring(this._textCursorPosition);
						this._textCursorPosition--;
					}
				}
				else if(event.getKeyCode() == 46) { // delete
					if(this._textCursorPosition < this._text.length) {
						this._text = this._text.substring(0, this._textCursorPosition)+this._text.substring(this._textCursorPosition+1);
					}
				}
				else if(event.getKeyCode() == 37) { //left arrow
					if(this._textCursorPosition > 0)
						this._textCursorPosition--;
				}
				else if(event.getKeyCode() == 39) { //right arrow
					if(this._textCursorPosition < this._text.length)
						this._textCursorPosition++;
				}
				notify();
			}
			if(event.getType() == core.EventType.KEY_PRESSED) {
				this._text = this._text.substring(0, this._textCursorPosition)+(new String.fromCharCode(event.getCharCode()))+this._text.substring(this._textCursorPosition);
				this._textCursorPosition++;
				notify();
			}
		}
	}
	
	String getText() {
		return this._text;
	}
	
	int getTextCursorPosition() {
		return this._textCursorPosition;
	}
	
	void setTextCursorPosition(int index) {
		assert(index >= 0 && index <= this._text.length);
		
		this._textCursorPosition = index;
	}
	
	void _onPush(core.Event event) {
		super._onPush(event);
		this._textCursorPosition = (this._style as TextInputStyle).getCursorPosition(event.getMousePosition());
		notify();
	}
	
}