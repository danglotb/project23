part of ui;

class BasicContainerStyle extends ContainerStyle {
	
	String _backgroundColor;
	String _backgroundImage;
	
	BasicContainerStyle({String backgroundColor, String backgroundImage}) {
		this._backgroundColor = backgroundColor;
		this._backgroundImage = backgroundImage;
	}
	
	void draw(Component model) {
		
		if(this._backgroundColor != null) {
			core.Window.getInstance().getContext()..fillStyle = this._backgroundColor
																						..fillRect(model.getPosition().x, model.getPosition().y, model.getSize().x, model.getSize().y);
		}
	}
	
}