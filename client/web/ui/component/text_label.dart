part of ui;

/* A text label */
class TextLabel extends Label {
	
	static const int H1 = 1;
	static const int H2 = 2;
	static const int H3 = 3;
	int _textSize;
	
	/* The text of the label */
	String _text;
	
	/* Constructors */
	
	TextLabel(String text, TextLabelStyle style) : super(style) {
		this._text = text;
		this._textSize = H3;
	}
	
	/* Getters & Setters */
	
	String getText() {
		return this._text;
	}
	
	void setText(String text) {
		this._text = text;
	}
	
	void setTextSize(int size) {
		this._textSize = size;
	}
	
	int getTextSize() {
		return this._textSize;
	}
	
}