part of ui;

class ComponentDrawable extends core.DrawableItem {
	
	Component _model;
	Function _computeFunction;
	Function _drawFunction;
	
	ComponentDrawable(Component model) {
		this._model = model;
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
		if(this.getViewport() != null) {
			core.Window.getInstance().getContext()
				..save()
				..beginPath()
				..rect(this.getViewport().left, this.getViewport().top, this.getViewport().right, this.getViewport().bottom)
				..clip();
				
		}
		this._drawFunction();
		if(this.getViewport() != null) {
			core.Window.getInstance().getContext().restore();
		}
	}
	
	void compute() {
		
		this._computeFunction();
	}
	
	void processEvent(core.Event event) {
		this._model.processEvent(event, this.getViewport());
	}
	
}