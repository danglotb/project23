part of ui;

/* A Style of a component */
abstract class ComponentStyle {
	
	utils.Vector2D _minimalSize;

	/* Constructors */
	
	ComponentStyle() {
		
	}
	
	/* Methods */
	
	/* Draw the component model */
	void draw(Component model);
	
	utils.Vector2D getMinimalSize() {
		return this._minimalSize;
	}
	
}