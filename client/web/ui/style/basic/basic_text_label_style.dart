part of ui;

class BasicTextLabelStyle extends TextLabelStyle {
	
	
	void draw(Component model) {
		TextLabel castModel = model as TextLabel;
		
		core.Window.getInstance().getContext()..font = "30px arial"
																					..textAlign = "left"
																					..fillStyle = "#222"
                                        	..fillText(castModel.getText(), castModel.getPosition().x, castModel.getPosition().y+(castModel.getSize().y)/2+10);
	}
}