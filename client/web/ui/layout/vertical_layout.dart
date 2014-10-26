part of ui;

/* One column, each component has the same size */
class VerticalLayout extends Layout {
	
	/* Constructor */
	
	VerticalLayout(): super();
	
	/* Methods */

	/* Order the container's children */
	void validate(Container model) {
		Component comp;
		Coordinates2D position;
		/* Each component has the container's width and the same height (container's height divided by the number of component)*/
		Vector2D size = new Vector2D(model.getSize.x, model.getSize.y/model.getChildNumber);
		for(int i = 0; i < model.getChildNumber; i++) {
			comp = model.getChild(i);
			comp.setSize = size;
			/* Each component are align on the left */
			if(i == 0) {
				position = new Coordinates2D(0, 0);
			} else {
				/* The component is put under the previous one (Previous component x + Previous component height) */
				position = new Coordinates2D(0, model.getChild(i-1).getPosition.y);
			}
			comp.setPosition = position;
		}
	}
	
}