part of ui;

class BasicTextLabelStyle extends TextLabelStyle {
	
	
	void buildDraw() {
		
		TextLabel castModel = this._model as TextLabel;
		
		ComponentDrawable drawable = new ComponentDrawable(this._model);
		
		num textX;
		num textY;
		String text;
		String font;
		
		drawable.setComputeFunction(() {
			text = castModel.getText();
			
			num textLength = core.Window.getInstance().getContext().measureText(castModel.getText()).width.roundToDouble();
			switch(castModel.getTextAlign()) {
				case TextLabel.LEFT:
					textX = castModel.getAbsolutePosition().x;
					break;
				case TextLabel.CENTER:
					textX = castModel.getAbsolutePosition().x+(castModel.getSize().x-textLength)~/2;
					break;
				case TextLabel.RIGHT:
					textX = castModel.getAbsolutePosition().x+castModel.getSize().x-textLength;
					break;
			}
			
			font = BasicStyleManager.getInstance().getFontSize(castModel.getTextSize()).toString()+'px '+BasicStyleManager.getInstance().getFontName();
			textY = castModel.getAbsolutePosition().y+(castModel.getSize().y-BasicStyleManager.getInstance().getFontSize(castModel.getTextSize()))~/2+BasicStyleManager.getInstance().getFontSize(castModel.getTextSize())~/2;

		});
		
		drawable.setDrawFunction(() {
			
			core.Window.getInstance().getContext()..font = font
																						..textAlign = "left"
																						..fillStyle = "#111"
																						..textBaseline = "middle"
	                                        	..fillText(text, textX, textY);
		});
		
		this.addToContentLayer(drawable);
	}
}