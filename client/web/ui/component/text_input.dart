part of ui;

abstract class TextInput extends SelectableComponent {
	
	String _text;
	
	TextInput(TextInputStyle style) : super(style) {
		this._text = "";
	}
	
	void dispatchEvent(Event event) {
		super.dispatchEvent(event);
		if(this._selected) {
			if(event.getType() == EventType.KEY_PUSHED) {
				if(event.getKeyCode() == 8) { // backspace
					if(!_text.isEmpty)
						_text = _text.substring(0, _text.length-1);
				}
				//TODO change cursor
			}
			if(event.getType() == EventType.KEY_PRESSED) {
				_text += new String.fromCharCode(event.getCharCode());
			}
		}
	}
	
	String getText() {
		return _text;
	}
	
}