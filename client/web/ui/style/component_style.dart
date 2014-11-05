part of ui;

/* A Style of a component */
abstract class ComponentStyle {

	/* Constructors */
	
	ComponentStyle() {

	}
	
	/* Methods */
	
	/* Draw the component model */
	void draw(Component model);
	
	utils.Vector2D getMinimalSize() {
		return new utils.Vector2D(0, 0);
	}
	
}