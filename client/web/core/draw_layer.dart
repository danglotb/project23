part of core;

class DrawLayer {
	
	List<DrawableItem> _drawables;
	
	DrawLayer() {
		this._drawables = new List<DrawableItem>();
	}
	
	void add(DrawableItem item) {
		this._drawables.add(item);
	}
	
	void draw() {
		for(int i=0; i<this._drawables.length; i++) {
			this._drawables[i].draw();
		}
	}
	
	void clear() {
		this._drawables.clear();
	}
}