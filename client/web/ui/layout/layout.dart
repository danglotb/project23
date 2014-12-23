part of ui;

/* A Layout of a window or container */
abstract class Layout {
	
	Container _model;
	
	/* Constructor */
	
	Layout() {
		
	}
	
	void setModel(Container model) {
		this._model = model;
	}
	
	void setPositionMode(Component model);
	
	/* Methods */
	
	/* Order the container's children */
	void validate() {
		for(int i = 0; i < this._model.getChildNumber(); i++) {
			this.setPositionMode(this._model.getChild(i));
		}
		
		this.update();
	}
	
	void update();
	
	utils.Vector2D getMinimalSize();
	
}