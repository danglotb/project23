part of ui;

/* One column, each component has the same size */
class VerticalLayout extends Layout {
	
	/* Constructor */
	
	VerticalLayout(): super();
	
	/* Methods */

	/* Order the container's children */
	void validate(Container model) {
		
		num totalY = 0;
		for(int i = 0; i<model.getChildNumber(); i++) {
			model.getChild(i).setPosition(new utils.Coordinates2D(model.getPosition().x, model.getPosition().y+model.getSize().y~/model.getChildNumber()*i));
			model.getChild(i).setSize(new utils.Vector2D(model.getSize().x, i == model.getChildNumber()-1 ? model.getSize().y-totalY :  model.getSize().y~/model.getChildNumber()));
			totalY += model.getSize().y~/model.getChildNumber();
		}
	}
	
}