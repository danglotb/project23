part of ui;

/*
 * 
 * Must have exactly 1 child
 */
class BorderLayout extends RelativeLayout {
	
	num _left;
	num _right;
	num _top;
	num _bottom;
	
	BorderLayout({num left : 0, num right : 0, num top : 0, num bottom : 0}) {
		this._left = left;
		this._right = right;
		this._top = top;
		this._bottom = bottom;
	}
	
	void update() {
		assert(this._model.getChildNumber() == 1);
		
		this._model.getChild(0).setPosition(new utils.Coordinates2D(this._left, this._top));
	}
	
	utils.Vector2D getMinimalSize() {
		assert(this._model.getChildNumber() == 1);
		
		return new utils.Vector2D(this._model.getChild(0).getSize().x+this._left+this._right, this._model.getChild(0).getSize().y+this._top+this._bottom);
	}
}