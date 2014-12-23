part of ui;

/*
 * Vertical align children, without change their size
 */

class VerticalPassifLayout extends RelativeLayout {
	
	void update() {
		num totalY = this._model.getSize().y;
		for(int i = 0; i<this._model.getChildNumber(); i++) {
			totalY -= this._model.getChild(i).getSize().y;
		}
		
		num currentY = 0;
		for(int i = 0; i<this._model.getChildNumber(); i++) {
			currentY += totalY/(this._model.getChildNumber()*2);
			this._model.getChild(i).setRelativePosition(new utils.Coordinates2D((this._model.getSize().x-this._model.getChild(i).getSize().x)~/2, currentY));
			currentY += totalY/(this._model.getChildNumber()*2)+this._model.getChild(i).getSize().y;
		}
	}
	
	utils.Vector2D getMinimalSize() {
		int minX = 0;
		int minY = 0;
		
		for(int i = 0; i<this._model.getChildNumber(); i++) {
			utils.Vector2D currentMin = this._model.getChild(i).getSize();
			if(currentMin.x > minX) {
				minX = currentMin.x;
			}
			minY += currentMin.y;
		}
		return new utils.Vector2D(minX,minY);
	}
	
}