part of ui;

/* A text label */
class TextLabel extends Label {
	
	static const int H1 = 1;
	static const int H2 = 2;
	static const int H3 = 3;
	
	static const int LEFT = 1;
	static const int CENTER = 2;
	static const int RIGHT = 3;
	
	int _textSize;
	int _textAlign;
	
	/* The text of the label */
	String _text;
	
	/* Constructors */
	
	TextLabel(String text, TextLabelStyle style) : super(style) {
		this._text = text;
		this._textSize = H3;
		this._textAlign = LEFT;
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
	
	void setTextAlign(int align) {
		this._textAlign = align;
	}
	
	int getTextAlign() {
		return this._textAlign;
	}
	
}