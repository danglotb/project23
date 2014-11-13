part of core;

/*
 * Singleton
 * 
 * Render window with z-index
 */
class DrawManager {
	
	static DrawManager _instance;
	
	static const int MAX_LAYER = 8;
	
	static const int NB_LAYER_PER_WINDOW = 4;
	
	static const int BACKGROUND_LAYER = 0;
	static const int CONTENT_LAYER = 1;
	static const int CONTENT_FRONT_LAYER = 2;
	static const int TOOLTIP_LAYER = 3;
	
	int _currentWindow;
	List<DrawLayer> _layers;
	
	
	_DrawManager() {

	}
	
	void initialize() {
		this._currentWindow = 0;
		this._layers = new List<DrawLayer>(MAX_LAYER);
		
		for(int i=0; i<this._layers.length; i++) {
			this._layers[i] = new DrawLayer();
		}	
	}
	
	static DrawManager getInstance() {
		if(_instance == null) {
			_instance = new DrawManager();
			_instance.initialize();
		}
		return _instance;
	}
	
	void setCurrentWindow(int i) {
		_currentWindow = i;
	}
	
	void addToBackgroundLayer(DrawableItem item) {
		this._layers[_currentWindow* NB_LAYER_PER_WINDOW+BACKGROUND_LAYER].add(item);
	}
	
	void addToContentLayer(DrawableItem item) {
		this._layers[_currentWindow* NB_LAYER_PER_WINDOW+CONTENT_LAYER].add(item);
	}
	
	void addToContentFrontLayer(DrawableItem item) {
		this._layers[_currentWindow* NB_LAYER_PER_WINDOW+CONTENT_FRONT_LAYER].add(item);
	}
	
	void addToTooltipLayer(DrawableItem item) {
		this._layers[_currentWindow* NB_LAYER_PER_WINDOW+TOOLTIP_LAYER].add(item);
	}
	
	void clear() {
		for(int i=0; i<this._layers.length; i++) {
			this._layers[i].clear();
		}
	}
	
	void draw() {
		for(int i=0; i<this._layers.length; i++) {
			this._layers[i].draw();
		}
	}
	
	
	
}