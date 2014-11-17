part of ui;

class ComponentDrawable extends core.DrawableItem{
	
	Function _computeFunction;
	Function _drawFunction;
	
	ComponentDrawable() {
		this._computeFunction = () {};
		this._drawFunction = () {};
	}
	
	void setComputeFunction(Function computeFunction) {
		this._computeFunction = computeFunction;
		compute();
	}
	
	void setDrawFunction(Function drawFunction) {
		this._drawFunction = drawFunction;
	}
	
	void draw() {
		this._drawFunction();
	}
	
	void compute() {
		this._computeFunction();
	}
	
	
}