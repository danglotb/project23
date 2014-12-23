part of ui;

class BasicTextAreaStyle extends TextAreaStyle {
	
	TextStyle getTextStyle() {
		return new BasicTextStyle();
	}
	
	int getInterlineHeight() {
		return 2;
	}
	
	void buildDraw() {

	}
}