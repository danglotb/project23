part of ui;

/*
 * Singleton
*/

class BasicStyleConfig {
	
	int _fontSize;
	
	BasicStyleConfig(int fontSize) {
		this._fontSize = fontSize;
	}
	
	int getFontSize() {
		return this._fontSize;
	}
}

class BasicStyleManager {
	
	static BasicStyleManager _instance;
	BasicStyleConfig _config;
	
	_BasicStyleManager() {
		
	}
	
	void _init() {

		int width = html.window.innerWidth;
		int height = html.window.innerHeight;
		if(width >= 800 && height >= 600) {
			this._config = new BasicStyleConfig(14);
		}
		else {
			this._config = new BasicStyleConfig(20);
		}
	}
	
	static BasicStyleManager getInstance() {
		if(_instance == null) {
			_instance = new BasicStyleManager();
			_instance._init();
		}
		return _instance;
	}
	
	BasicStyleConfig getConfig() {
		return this._config;
	}
}