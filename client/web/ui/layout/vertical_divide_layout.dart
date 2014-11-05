part of ui;

/*
 * This layout need contains exactly 2 children.
 * Goal of this layout is to separate 2 part. one part can be fixed size, or else the separation is compute by ratio
 * 
 */
class VerticalDivideLayout extends Layout {
	
	bool _leftPartFixed;
	int _leftPartSize;
	
	bool _rightPartFixed;
	int _rightPartSize;
	
	num _separationRatio;
	
	VerticalDivideLayout({int separationRatio, bool leftPartFixed, int leftPartSize, bool rightPartFixed, int rightPartSize}) {
		this._separationRatio = separationRatio;
		this._leftPartFixed = leftPartFixed != null && leftPartFixed;
		this._leftPartSize = leftPartSize;
  	
		this._rightPartFixed = rightPartFixed != null && rightPartFixed;
		this._rightPartSize = rightPartSize;
	}
	
	void validate() {
		if(this._leftPartFixed) {
			this._model.getChild(0).setPosition(new utils.Coordinates2D(this._model.getPosition().x, this._model.getPosition().y));
			this._model.getChild(0).setSize(new utils.Vector2D(this._leftPartSize, this._model.getSize().y));
			
			this._model.getChild(1).setPosition(new utils.Coordinates2D(this._model.getPosition().x+this._leftPartSize, this._model.getPosition().y+0));
			this._model.getChild(1).setSize(new utils.Vector2D(this._model.getSize().x-this._leftPartSize, this._model.getSize().y));
		}
		else if(this._rightPartFixed) {
			
		}
		else {
			
		}
	}
	
	utils.Vector2D getMinimalSize() {
		return new utils.Vector2D(0,0);
	}
	
}