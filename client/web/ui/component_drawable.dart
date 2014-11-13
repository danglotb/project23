part of ui;

class ComponentDrawable extends core.DrawableItem{
	
	Function _drawFunction;
	
	ComponentDrawable(Function drawFunction) {
		this._drawFunction = drawFunction;
	}
	
	void draw() {
		_drawFunction();
	}
	
	
}