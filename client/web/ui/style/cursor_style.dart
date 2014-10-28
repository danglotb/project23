part of ui;

/* Style of cursor component */
class CursorStyle extends SelectableComponentStyle {
	
	/* Constructor */
	
	CursorStyle() : super() {}
	
	/* Methods */
	
	/* Draw the style */
	void draw(Component model) {
		
		/* Cast the model */
		Cursor castModel = model as Cursor;
    
		/* Colors */
		String color = "#000";
    
		if(castModel.isPushed()) {
     	color = "#444";
    } else if(castModel.isOverflew()) {
    	color = "#222";
    }

		/* Start position */
		num x = castModel.getPosition().x;
		num y = castModel.getPosition().y + castModel.getSize().y/2;
		
		/* Drawing */
    core.Window.getInstance().getContext()..beginPath()
                                          ..fillStyle = color
                                          ..strokeStyle = "#000"
                                          ..moveTo(x, y)
                                          ..lineTo(x + castModel.getSize().x, y)
                                          ..arc(x + (castModel.getValue()/(castModel.getMax() - castModel.getMin())) * castModel.getSize().x, y, 20, 0, 2 * math.PI)
                                          ..fill()
                                          ..stroke();
	}
	
}