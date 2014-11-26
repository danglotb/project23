part of ui;

/*
 * Singleton
*/

class BasicStyleManager {
	
	static BasicStyleManager _instance;
	
	int _fontSizeH1;
	int _fontSizeH2;
	int _fontSizeH3;
	String _fontName;
	
	_BasicStyleManager() {
		
	}
	
	void _init() {
		this._fontSizeH1 = (36.0*core.ResolutionManager.getInstance().getFontScale()).toInt();
		this._fontSizeH2 = (28.0*core.ResolutionManager.getInstance().getFontScale()).toInt();
		this._fontSizeH3 = (20.0*core.ResolutionManager.getInstance().getFontScale()).toInt();
		this._fontName = "arial";
	}
	
	static BasicStyleManager getInstance() {
		if(_instance == null) {
			_instance = new BasicStyleManager();
			_instance._init();
		}
		return _instance;
	}
	
	int getFontSizeH1() {
		return this._fontSizeH1;
	}
	
	int getFontSizeH2() {
		return this._fontSizeH2;
	}
	
	int getFontSizeH3() {
		return this._fontSizeH3;
	}
	
	int getFontSize(int num) {
		switch(num) {
			case 1:
				return this._fontSizeH1;
			case 2:
				return this._fontSizeH2;
			case 3:
				return this._fontSizeH3;
			default:
				return 0;
		}
	}
	
	String getFontName() {
		return this._fontName;
	}

}