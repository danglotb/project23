part of ui;

class BasicButtonStyle extends ButtonStyle {
	
	html.ImageElement _spriteButton;

	
	BasicButtonStyle() {
		this._spriteButton = new html.ImageElement(src: "image/ui/button-sprite.png");
	}
	
	void draw() {
		
		core.DrawManager.getInstance().addToContentFrontLayer(new ComponentDrawable(() {
			Button castModel = this._model as Button;
			
			if(castModel.isSelected()) {
				if(castModel.isPushed()) {
					if(castModel.isOverflew()) {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 161, 0, 11, 80, castModel.getPosition().x, castModel.getPosition().y, 11, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 172, 0, 1, 80, castModel.getPosition().x+11, castModel.getPosition().y, castModel.getSize().x-22, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 173, 0, 11, 80, castModel.getPosition().x+castModel.getSize().x-11, castModel.getPosition().y, 11, castModel.getSize().y);
					}
					else {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 138, 0, 11, 80, castModel.getPosition().x, castModel.getPosition().y, 11, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 149, 0, 1, 80, castModel.getPosition().x+11, castModel.getPosition().y, castModel.getSize().x-22, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 150, 0, 11, 80, castModel.getPosition().x+castModel.getSize().x-11, castModel.getPosition().y, 11, castModel.getSize().y);
					}
				}
				else {
					if(castModel.isOverflew()) {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 115, 0, 11, 80, castModel.getPosition().x, castModel.getPosition().y, 11, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 126, 0, 1, 80, castModel.getPosition().x+11, castModel.getPosition().y, castModel.getSize().x-22, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 127, 0, 11, 80, castModel.getPosition().x+castModel.getSize().x-11, castModel.getPosition().y, 11, castModel.getSize().y);
					}
					else {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 92, 0, 11, 80, castModel.getPosition().x, castModel.getPosition().y, 11, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 103, 0, 1, 80, castModel.getPosition().x+11, castModel.getPosition().y, castModel.getSize().x-22, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 104, 0, 11, 80, castModel.getPosition().x+castModel.getSize().x-11, castModel.getPosition().y, 11, castModel.getSize().y);
					}
				}
			}
			else {
				if(castModel.isPushed()) {
					if(castModel.isOverflew()) {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 69, 0, 11, 80, castModel.getPosition().x, castModel.getPosition().y, 11, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 80, 0, 1, 80, castModel.getPosition().x+11, castModel.getPosition().y, castModel.getSize().x-22, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 81, 0, 11, 80, castModel.getPosition().x+castModel.getSize().x-11, castModel.getPosition().y, 11, castModel.getSize().y);
					}
					else {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 46, 0, 11, 80, castModel.getPosition().x, castModel.getPosition().y, 11, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 57, 0, 1, 80, castModel.getPosition().x+11, castModel.getPosition().y, castModel.getSize().x-22, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 58, 0, 11, 80, castModel.getPosition().x+castModel.getSize().x-11, castModel.getPosition().y, 11, castModel.getSize().y);
					}
				}
				else {
					if(castModel.isOverflew()) {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 23, 0, 11, 80, castModel.getPosition().x, castModel.getPosition().y, 11, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 34, 0, 1, 80, castModel.getPosition().x+11, castModel.getPosition().y, castModel.getSize().x-22, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 35, 0, 11, 80, castModel.getPosition().x+castModel.getSize().x-11, castModel.getPosition().y, 11, castModel.getSize().y);
					}
					else {
						core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 0, 0, 11, 80, castModel.getPosition().x, castModel.getPosition().y, 11, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 11, 0, 1, 80, castModel.getPosition().x+11, castModel.getPosition().y, castModel.getSize().x-22, castModel.getSize().y)
	      																					..drawImageScaledFromSource(this._spriteButton, 12, 0, 11, 80, castModel.getPosition().x+castModel.getSize().x-11, castModel.getPosition().y, 11, castModel.getSize().y);
					}
				}
			}
			
			core.Window.getInstance().getContext()..font = "30px arial"
																						..textAlign = "left"
																						..fillStyle = "#fff"
																					 	..textBaseline = 'middle';
			
			html.TextMetrics metric = core.Window.getInstance().getContext().measureText(castModel.getText());
			
			
			core.Window.getInstance().getContext()..shadowColor = "#000"
																						..shadowBlur = 5
																						..fillText(castModel.getText(), castModel.getPosition().x+(castModel.getSize().x-metric.width)/2, castModel.getPosition().y+(castModel.getSize().y)/2);
			core.Window.getInstance().getContext().shadowBlur = 0;
		}));
	}
	
	utils.Vector2D getMinimalSize() {
		return new utils.Vector2D(1, 74);
	}
	
	
}