part of ui;

class BasicContainerStyle extends ContainerStyle {
	
	String _backgroundColor;
	String _backgroundImage;
	
	BasicContainerStyle({String backgroundColor, String backgroundImage}) {
		this._backgroundColor = backgroundColor;
		this._backgroundImage = backgroundImage;
	}
	
	void buildDraw() {
		
		if(this._backgroundColor != null) {
			ComponentDrawable drawable = new ComponentDrawable(this._model);
			
			drawable.setDrawFunction(() {
				core.Window.getInstance().getContext()..fillStyle = this._backgroundColor
																							..fillRect(this._model.getPosition().x, this._model.getPosition().y, this._model.getSize().x, this._model.getSize().y);
			});
			
			this.addToBackgroundLayer(drawable);
		}
		
	}
	
}