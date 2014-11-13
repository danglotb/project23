part of ui;

class BidonStyle extends SelectableComponentStyle {
	
	BidonStyle() {
		
	}
	
	void draw() {
		Bidon castModel = this._model as Bidon;
		
		String color = "#f00";
		
		if(castModel.isPushed()) {
    	color = "#00f";
    }
		else if(castModel.isOverflew()) {
			color = "#0f0";
		}
			
		core.Window.getInstance().getContext()..beginPath()
																					..fillStyle = color
																					..strokeStyle = castModel.isSelected() ? "#ff0" : "#000"
																					..lineWidth = castModel.isSelected() ? 4 : 1
																					..rect(castModel.getPosition().x, castModel.getPosition().y, castModel.getSize().x, castModel.getSize().y)
																					..fill()
																					..stroke();
	}
}