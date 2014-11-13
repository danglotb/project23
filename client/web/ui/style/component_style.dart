part of ui;

/* A Style of a component */
abstract class ComponentStyle {
	
	Component _model;

	/* Constructors */
	
	ComponentStyle() {

	}
	
	void setModel(Component model) {
		this._model = model;
	}
	
	/* Methods */
	
	/* Draw the component model */
	void draw();
	
	utils.Vector2D getMinimalSize() {
		return new utils.Vector2D(0, 0);
	}
	
}