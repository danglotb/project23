part of ui;

class BasicScrollPaneStyle extends ScrollPaneStyle {
	
	HorizontalScrollBarStyle getHorizontalScrollBarStyle() {
		return new BasicHorizontalScrollBarStyle();
	}
	
	VerticalScrollBarStyle getVerticalScrollBarStyle() {
		return new BasicVerticalScrollBarStyle();
	}
	
	void buildDraw() {

	}
}