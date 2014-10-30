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
	
	/* Methods */
	
	/* Order the container's children */
	void validate();
	
	utils.Vector2D getMinimalSize();
	
}