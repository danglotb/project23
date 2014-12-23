part of ui;

/* A Style of a component */
abstract class ComponentStyle {
	
	Component _model;
	ComponentDrawable _drawable;

	/* Constructors */
	
	ComponentStyle() {

	}
	
	void setModel(Component model) {
		this._model = model;
	}
	
	/* Methods */
	
	/* Draw the component model */
	void buildDraw();
	
	void clearDraw() {
		this._drawable = null;
	}
	
	utils.Vector2D getMinimalSize() {
		return new utils.Vector2D(0, 0);
	}
	
	/*
	 * Called when notify() is invoked on component model
	 */
	void update() {
		if(this._drawable != null) {
			this._drawable.compute();
		}
	}
	
	/*
	 * redefine layer draw
	 */
	
	void addToBackgroundLayer(ComponentDrawable drawable) {
		assert(this._drawable == null);
		this._drawable = drawable;
		core.DrawManager.getInstance().addToBackgroundLayer(drawable, this._model.isEnableEvent());
	}
	
	void addToContentLayer(ComponentDrawable drawable) {
		assert(this._drawable == null);
		this._drawable = drawable;
		core.DrawManager.getInstance().addToContentLayer(drawable, this._model.isEnableEvent());
	}
	
	void addToContentFrontLayer(ComponentDrawable drawable) {
		assert(this._drawable == null);
		this._drawable = drawable;
		core.DrawManager.getInstance().addToContentFrontLayer(drawable, this._model.isEnableEvent());
	}
	
	void addToTooltipLayer(ComponentDrawable drawable) {
		assert(this._drawable == null);
		this._drawable = drawable;
		core.DrawManager.getInstance().addToTooltipLayer(drawable, this._model.isEnableEvent());
	}
	
}