part of ui;

/*
 * This layout need contains exactly 1 or 2 children.
 */

class VerticalGapLayout extends Layout {
	
	bool _gapBottom;
	
	VerticalGapLayout({bool gapBottom: true}) {
		this._gapBottom = gapBottom;
	}
	
	
	void validate() {
		
		if(this._model.getChildNumber() == 2) { //gap between
			utils.Vector2D minimal1 = this._model.getChild(0).getMinimalSize();
			utils.Vector2D minimal2 = this._model.getChild(1).getMinimalSize();
			
			this._model.getChild(0).setPosition(new utils.Coordinates2D(this._model.getPosition().x, this._model.getPosition().y));
			this._model.getChild(0).setSize(new utils.Vector2D(this._model.getSize().x, minimal1.y));
			
			this._model.getChild(1).setPosition(new utils.Coordinates2D(this._model.getPosition().x, this._model.getPosition().y+this._model.getSize().y-this._model.getChild(1).getMinimalSize().y));
			this._model.getChild(1).setSize(new utils.Vector2D(this._model.getSize().x, minimal2.y));
			
		}
		else if(this._gapBottom) { //gap bottom
			
		}
		else { //gap top
			
		}
		
	}
	
	utils.Vector2D getMinimalSize() {
		return new utils.Vector2D(0,0);
	}
}