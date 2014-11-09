part of ui;

/*
 * 
 * Must have exactly 1 child
 */
class BorderLayout extends Layout {
	
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
	
	void validate() {
		
		assert(this._model.getChildNumber() == 1);
		
		print(this._model.getSize().x.toString()+';'+this._model.getSize().y.toString());
		print(this._model.getChild(0).getSize().x.toString()+';'+this._model.getChild(0).getSize().y.toString());
		this._model.getChild(0).setPosition(new utils.Coordinates2D(this._model.getPosition().x+this._left, this._model.getPosition().y+this._top));
	}
	
	utils.Vector2D getMinimalSize() {
		assert(this._model.getChildNumber() == 1);
		
		print('>'+(this._model.getChild(0).getSize().x+this._left+this._right).toString()+";"+(this._model.getChild(0).getSize().y+this._top+this._bottom).toString());
		return new utils.Vector2D(this._model.getChild(0).getSize().x+this._left+this._right, this._model.getChild(0).getSize().y+this._top+this._bottom);
	}
}