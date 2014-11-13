part of ui;

class MenuButtonStyle extends ButtonStyle {
	
	html.ImageElement _spriteButton;

	
	MenuButtonStyle(bool current) {
		this._spriteButton = new html.ImageElement(src: current ? "image/ui/menu-button-sprite-current.png" : "image/ui/menu-button-sprite.png");
	}
	
	void draw() {
		
		
		core.DrawManager.getInstance().addToContentFrontLayer(new ComponentDrawable(() {
			
			Button castModel = this._model as Button;
			if(castModel.isSelected()) {
  			if(castModel.isPushed()) {
  				if(castModel.isOverflew()) {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 105, 0, 13, 74, castModel.getPosition().x, castModel.getPosition().y, 13, castModel.getSize().y)
      																						..drawImageScaledFromSource(this._spriteButton, 118, 0, 1, 74, castModel.getPosition().x+13, castModel.getPosition().y, castModel.getSize().x-13, castModel.getSize().y);
  				}
  				else {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 90, 0, 13, 74, castModel.getPosition().x, castModel.getPosition().y, 13, castModel.getSize().y)
      																						..drawImageScaledFromSource(this._spriteButton, 103, 0, 1, 74, castModel.getPosition().x+13, castModel.getPosition().y, castModel.getSize().x-13, castModel.getSize().y);
  				}
  			}
  			else {
  				if(castModel.isOverflew()) {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 75, 0, 13, 74, castModel.getPosition().x, castModel.getPosition().y, 13, castModel.getSize().y)
      																						..drawImageScaledFromSource(this._spriteButton, 88, 0, 1, 74, castModel.getPosition().x+13, castModel.getPosition().y, castModel.getSize().x-13, castModel.getSize().y);
  				}
  				else {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 60, 0, 13, 74, castModel.getPosition().x, castModel.getPosition().y, 13, castModel.getSize().y)
      																						..drawImageScaledFromSource(this._spriteButton, 73, 0, 1, 74, castModel.getPosition().x+13, castModel.getPosition().y, castModel.getSize().x-13, castModel.getSize().y);
  				}
  			}
  		}
  		else {
  			if(castModel.isPushed()) {
  				if(castModel.isOverflew()) {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 45, 0, 13, 74, castModel.getPosition().x, castModel.getPosition().y, 13, castModel.getSize().y)
      																						..drawImageScaledFromSource(this._spriteButton, 58, 0, 1, 74, castModel.getPosition().x+13, castModel.getPosition().y, castModel.getSize().x-13, castModel.getSize().y);
  				}
  				else {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 30, 0, 13, 74, castModel.getPosition().x, castModel.getPosition().y, 13, castModel.getSize().y)
      																						..drawImageScaledFromSource(this._spriteButton, 43, 0, 1, 74, castModel.getPosition().x+13, castModel.getPosition().y, castModel.getSize().x-13, castModel.getSize().y);
  				}
  			}
  			else {
  				if(castModel.isOverflew()) {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 15, 0, 13, 74, castModel.getPosition().x, castModel.getPosition().y, 13, castModel.getSize().y)
      																						..drawImageScaledFromSource(this._spriteButton, 28, 0, 1, 74, castModel.getPosition().x+13, castModel.getPosition().y, castModel.getSize().x-13, castModel.getSize().y);
  				}
  				else {
  					core.Window.getInstance().getContext()..drawImageScaledFromSource(this._spriteButton, 0, 0, 13, 74, castModel.getPosition().x, castModel.getPosition().y, 13, castModel.getSize().y)
      																						..drawImageScaledFromSource(this._spriteButton, 13, 0, 1, 74, castModel.getPosition().x+13, castModel.getPosition().y, castModel.getSize().x-13, castModel.getSize().y);
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