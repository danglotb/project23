part of ui;

class BasicTextStyle extends TextStyle {
	
	static const int TEXT_SIZE_H1 = 1;
	static const int TEXT_SIZE_H2 = 2;
	static const int TEXT_SIZE_H3 = 3;
	
	static const int TEXT_ALIGN_LEFT = 1;
	static const int TEXT_ALIGN_CENTER = 2;
	static const int TEXT_ALIGN_RIGHT = 3;
	
	String _color;
	int _textSize;
	int _textAlign;
	
	
	BasicTextStyle({textSize : TEXT_SIZE_H3, textAlign: TEXT_ALIGN_LEFT, color}) {
		
		this._textSize = textSize;
		this._textAlign = textAlign;
		this._color = color == null ? BasicStyleManager.getInstance().getTextColor() : color;
	}
	
	utils.Vector2D getStringDimension(String text) {
		return new utils.Vector2D(core.Window.getInstance().getContext().measureText(text).width.roundToDouble(), BasicStyleManager.getInstance().getFontSize(this._textSize));
	}
	
	void buildDraw() {
		Text castModel = this._model as Text;
		
		ComponentDrawable drawable = new ComponentDrawable(this._model);
		
		num textX;
		num textY;
		String text;
		String font;
		
		drawable.setComputeFunction(() {
			text = castModel.getText();
			
			num textLength = core.Window.getInstance().getContext().measureText(castModel.getText()).width.roundToDouble();

			switch(this._textAlign) {
				case TextLabel.LEFT:
					textX = castModel.getPosition().x;
					break;
				case TextLabel.CENTER:
					textX = castModel.getPosition().x+(castModel.getSize().x-textLength)~/2;
					break;
				case TextLabel.RIGHT:
					textX = castModel.getPosition().x+castModel.getSize().x-textLength;
					break;
			}
			
			int fontSize = BasicStyleManager.getInstance().getFontSize(this._textSize);
			
			textY = castModel.getPosition().y+(castModel.getSize().y-fontSize)~/2+fontSize~/2;
			font = fontSize.toString()+'px '+BasicStyleManager.getInstance().getFontName();

		});
		
		drawable.setDrawFunction(() {
			
			core.Window.getInstance().getContext()..font = font
																						..textAlign = "left"
																						..fillStyle = this._color
																						..textBaseline = "middle"
	                                        	..fillText(text, textX, textY);
		});
		
		this.addToContentLayer(drawable);
	}
}