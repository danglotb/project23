part of ui;

/* One column, each component has the same size */
class VerticalLayout extends Layout {
	
	/* Constructor */
	
	VerticalLayout() {
		
	}
	
	/* Methods */

	/* Order the container's children */
	void validate() {
		
		num totalY = 0;
		for(int i = 0; i<this._model.getChildNumber(); i++) {
			this._model.getChild(i).setPosition(new utils.Coordinates2D(this._model.getPosition().x, this._model.getPosition().y+this._model.getSize().y~/this._model.getChildNumber()*i));
			this._model.getChild(i).setSize(new utils.Vector2D(this._model.getSize().x, i == this._model.getChildNumber()-1 ? this._model.getSize().y-totalY :  this._model.getSize().y~/this._model.getChildNumber()));
			totalY += this._model.getSize().y~/this._model.getChildNumber();
		}
	}
	
	utils.Vector2D getMinimalSize() {
		num minX = 0;
		num minY = 0;
		
		
		for(int i = 0; i<this._model.getChildNumber(); i++) {
			utils.Vector2D currentMin = this._model.getChild(i).getMinimalSize();
			if(currentMin.x > minX) {
				minX = currentMin.x;
			}
			minY += currentMin.y;
		}
		return new utils.Vector2D(minX,minY);
	}
	
}