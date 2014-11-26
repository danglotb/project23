part of core;

class DrawPane {
	List<DrawableItem> _drawablesWithEvent;
	List<DrawableItem> _drawablesWithoutEvent;
	
	DrawPane() {
		this._drawablesWithEvent = new List<DrawableItem>();
		this._drawablesWithoutEvent = new List<DrawableItem>();
	}
	
	void add(DrawableItem item, bool enableEvent) {
		if(enableEvent)
			this._drawablesWithEvent.add(item);
		else
			this._drawablesWithoutEvent.add(item);
	}
	
	void draw() {
		for(int i=0; i<this._drawablesWithEvent.length; i++) {
			this._drawablesWithEvent[i].draw();
		}
		for(int i=0; i<this._drawablesWithoutEvent.length; i++) {
			this._drawablesWithoutEvent[i].draw();
		}
	}
	
	void clear() {

		this._drawablesWithEvent.clear();
		this._drawablesWithoutEvent.clear();
	}
	
	void dispatchEvent(Event event) {
		
		for(int i=0; i<this._drawablesWithEvent.length; i++) {
			this._drawablesWithEvent[i].processEvent(event);
		}
	}
}