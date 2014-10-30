part of ui;

class Button extends SelectableComponent {
	
	String _text;
	
	Button(String text, ButtonStyle style) : super(style) {
		this._text = text;
	}
	
	String getText() {
		return this._text;
	}
}