part of ui;

/* A text label */
class TextLabel extends Label {
	
	/* The text of the label */
	String _text;
	
	/* Constructors */
	
	TextLabel(String text, TextLabelStyle style) : super(style) {
		this._text = text;
	}
	
	/* Getters & Setters */
	
	String getText() {
		return this._text;
	}
	
	void setText(String text) {
		this._text = text;
	}
	
}