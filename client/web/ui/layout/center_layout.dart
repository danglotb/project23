part of ui;

/*
 * This layout take exactly 1 child
 * This one center it child.
 * if width or height is not given, component size is set to it minimal size
 */

class CenterLayout extends Layout {
	
	num _width;
	num _height;
	
	CenterLayout({num width : 0, num height : 0}) {
		this._width = width;
		this._height = height;
	}
	
	void validate() {
		this._model.getChild(0).setSize(this.getMinimalSize());
		this._model.getChild(0).setPosition(new utils.Coordinates2D(this._model.getPosition().x+(this._model.getSize().x-this._model.getChild(0).getSize().x)/2, this._model.getPosition().y+(this._model.getSize().y-this._model.getChild(0).getSize().y)/2));
		
	}
	
	utils.Vector2D getMinimalSize() {
		utils.Vector2D min = this._model.getChild(0).getMinimalSize();
		return new utils.Vector2D(this._width != 0 ? this._width : min.x, this._height != 0 ? this._height : min.y);
	}
	
	
}