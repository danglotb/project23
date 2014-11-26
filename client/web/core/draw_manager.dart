part of core;

/*
 * Singleton
 * 
 * Render window with z-index
 */
class DrawManager {
	
	static DrawManager _instance;
	
	int _currentFrameLevel;
	int _currentPaneLevel;
	utils.Rect _currentViewport;
	
	DrawPane _tooltipLayer;
	List<DrawFrame> _frames;
	
	_DrawManager() {

	}
	
	void initialize() {
		this._tooltipLayer = new DrawPane();
		this._frames = new List<DrawFrame>();
		this._frames.add(new DrawFrame());

	}
	
	static DrawManager getInstance() {
		if(_instance == null) {
			_instance = new DrawManager();
			_instance.initialize();
		}
		return _instance;
	}
	
	void newBuild() {
		this._currentFrameLevel = 0;
		this._currentPaneLevel = 0;
		this._currentViewport = null;
	}
	
	void setCurrentFrameLevel(int level) {
		assert(level >= 0);
		this._currentFrameLevel = level;
		this._currentPaneLevel = 0;
		
		while(this._currentFrameLevel >= this._frames.length) {
			this._frames.add(new DrawFrame());
		}
	}
	
	int getCurrentFrameLevel() {
		return this._currentFrameLevel;
	}
	
	void setCurrentPaneLevel(int level) {
		assert(level >= 0);
		this._currentPaneLevel = level;
	}	
	
	
	int getCurrentPaneLevel() {
		return this._currentPaneLevel;
	}
	
	void setCurrentViewport(utils.Rect rect) {
		this._currentViewport = rect;
	}
	
	utils.Rect getCurrentViewport() {
		return this._currentViewport;
	}
	
	void addToBackgroundLayer(DrawableItem item, bool enableEvent) {
		item.setViewport(this._currentViewport);
		this._frames[this._currentFrameLevel].addToBackgroundLayer(item, enableEvent);
	}
	
	void addToContentLayer(DrawableItem item, bool enableEvent) {
		item.setViewport(this._currentViewport);
		this._frames[this._currentFrameLevel].addToContentLayer(item, enableEvent, this._currentPaneLevel);
	}
	
	void addToContentFrontLayer(DrawableItem item, bool enableEvent) {
		this._frames[this._currentFrameLevel].addToFrontLayer(item, enableEvent);
	}
	
	void addToTooltipLayer(DrawableItem item, bool enableEvent) {
		this._tooltipLayer.add(item, enableEvent);
	}
	
	void clear() {
		this._tooltipLayer.clear();
		
  	this._frames.forEach((DrawFrame e) => e.clear());
	}
	
	void draw() {
		for(int i=0; i<this._frames.length; i++) {
			this._frames[i].draw();
		}
		
		this._tooltipLayer.draw();
	}
	
	void dispatchEvent(Event event) {
		
		this._tooltipLayer.dispatchEvent(event);
		
		for(int i=this._frames.length-1; i>=0; i--) {
			this._frames[i].dispatchEvent(event);
		}
	}
}