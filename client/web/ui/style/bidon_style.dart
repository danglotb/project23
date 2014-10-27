part of ui;

class BidonStyle extends InteractiveComponentStyle {
	
	BidonStyle() {
		
	}
	
	void draw(Component model) {
		Bidon castModel = model as Bidon;
		
		String color = "#f00";
		
		if(castModel.isPushed()) {
    	color = "#00f";
    }
		else if(castModel.isOverflew()) {
			color = "#0f0";
		}
			
		core.Window.getInstance().getContext()..beginPath()
																					..fillStyle = color
																					..strokeStyle = "#000"
																					..rect(castModel.getPosition().x, castModel.getPosition().y, castModel.getSize().x, castModel.getSize().y)
																					..fill()
																					..stroke();
	}
}