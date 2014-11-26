part of core;

abstract class DrawableItem {
	
	utils.Rect _viewport;
	
	void draw();
	
	void processEvent(Event event) {
		
	}
	
	void setViewport(utils.Rect rect) {
		this._viewport = rect;
	}
	
	utils.Rect getViewport() {
		return this._viewport;
	}
	
}