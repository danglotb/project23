part of core;

class DrawFrame {
	
	DrawPane _foregroundLayer;
	List<DrawPane> _contentLayers;
	DrawPane _backgroundLayer;
	
	DrawFrame() {
		this._foregroundLayer = new DrawPane();
		this._contentLayers = new List<DrawPane>();
		this._backgroundLayer = new DrawPane();
	}
	
	void addToBackgroundLayer(DrawableItem item, bool enableEvent) {
		this._backgroundLayer.add(item, enableEvent);
	}
	
	void addToContentLayer(DrawableItem item, bool enableEvent, int paneLevel) {
		
		while(paneLevel >= this._contentLayers.length) {
			this._contentLayers.add(new DrawPane());
		}
		
		this._contentLayers[paneLevel].add(item, enableEvent);
	}
	
	void addToFrontLayer(DrawableItem item, bool enableEvent) {
		this._foregroundLayer.add(item, enableEvent);
	}
	
	void draw() {
		this._backgroundLayer.draw();
		
		for(int i=this._contentLayers.length-1; i>=0; i--) {
			this._contentLayers[i].draw();
		}
		
		this._foregroundLayer.draw();
	}
	
	void clear() {
		this._backgroundLayer.clear();
		
		this._contentLayers.forEach((DrawPane e) => e.clear());
		
		this._foregroundLayer.clear();
	}
	
	void dispatchEvent(Event event) {
		
		this._foregroundLayer.dispatchEvent(event);
		
		for(int i=0; i<this._contentLayers.length; i++) {
			this._contentLayers[i].dispatchEvent(event);
		}
		
		this._backgroundLayer.dispatchEvent(event);
		
		
	}
	
	
}