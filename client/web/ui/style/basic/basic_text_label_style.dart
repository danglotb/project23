part of ui;

class BasicTextLabelStyle extends TextLabelStyle {
	
	
	void buildDraw() {
		
		ComponentDrawable drawable = new ComponentDrawable();
		
		drawable.setDrawFunction(() {
			TextLabel castModel = this._model as TextLabel;
			
			switch(castModel.getTextSize()) {
				
				case TextLabel.H1:
					core.Window.getInstance().getContext()..font = BasicStyleManager.getInstance().getFontSizeH1().toString()+'px '+BasicStyleManager.getInstance().getFontName();
					break;
				case TextLabel.H2:
					core.Window.getInstance().getContext()..font = BasicStyleManager.getInstance().getFontSizeH2().toString()+'px '+BasicStyleManager.getInstance().getFontName();
					break;
				case TextLabel.H3:
					core.Window.getInstance().getContext()..font = BasicStyleManager.getInstance().getFontSizeH3().toString()+'px '+BasicStyleManager.getInstance().getFontName();
					break;					
			}
			
			core.Window.getInstance().getContext()..textAlign = "left"
																						..fillStyle = "#222"
	                                        	..fillText(castModel.getText(), castModel.getPosition().x, castModel.getPosition().y+(castModel.getSize().y)/2+10);
		});
		
		core.DrawManager.getInstance().addToContentLayer(drawable);
	}
}