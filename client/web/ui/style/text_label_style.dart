part of ui;

/* Style of a text label */
class TextLabelStyle extends LabelStyle {
	
	/* Constructor */
	
	TextLabelStyle() {}
	
	/* Methods */
	
	/* Draw the style */
	void draw(Component model) {
		
		/* Cast the model */
		TextLabel castModel = model as TextLabel;
    
		/* Colors */
		String color = "#000";
    
		if(castModel.isPushed()) {
     	color = "#444";
    } else if(castModel.isOverflew()) {
    	color = "#222";
    }
		
		/* Drawing */
		core.Window.getInstance().getContext()..beginPath()
																					..fillStyle = color
																					..strokeStyle = "#000"
																					..rect(castModel.getPosition().x, castModel.getPosition().y, castModel.getSize().x, castModel.getSize().y)
																					..font = "50px Arial"
																					..fillText(castModel.getText(), castModel.getPosition().x, castModel.getPosition().y)
																					..fill()
																					..stroke();
        
	}
	
}