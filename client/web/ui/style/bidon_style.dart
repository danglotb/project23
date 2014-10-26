part of ui;

class BidonStyle extends ComponentStyle {
	
	BidonStyle() {
		
	}
	
	void draw(Component model) {
		Bidon castModel = model as Bidon;
		core.Window.getInstance().getContext()..fillStyle = castModel.getColor()
																					..rect(0, 0, core.Window.getInstance().getSize().x, core.Window.getInstance().getSize().y)
																					..fill();
		
	}
}