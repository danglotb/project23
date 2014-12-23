part of ui;

class Text extends Component {
	
	String _text;
	
	Text(String text, TextStyle style) : super(style) {
		setText(text);
	}
	
	String getText() {
		return this._text;
	}
	
	void setText(String text) {
		this._text = text;
	}

}