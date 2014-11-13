part of ui;

class BasicTextLabelStyle extends TextLabelStyle {
	
	
	void draw() {
		
		core.DrawManager.getInstance().addToContentFrontLayer(new ComponentDrawable(() {
			TextLabel castModel = this._model as TextLabel;
			
			core.Window.getInstance().getContext()..font = "30px arial"
																						..textAlign = "left"
																						..fillStyle = "#222"
	                                        	..fillText(castModel.getText(), castModel.getPosition().x, castModel.getPosition().y+(castModel.getSize().y)/2+10);
		}));
	}
}