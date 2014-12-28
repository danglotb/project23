part of ui;

class BasicInnerWindowStyle extends InnerWindowStyle {
	
	void buildDraw() {
		InnerWindow castModel = this._model as InnerWindow;
		
		
		ComponentDrawable drawable = new ComponentDrawable(this._model);
		
		num windowX;
		num windowY;
		num windowWidth;
		num windowHeight;
		
		drawable.setComputeFunction(() {
			windowX = this._model.getPosition().x;
  		windowY = this._model.getPosition().y;
  		windowWidth = this._model.getSize().x;
  		windowHeight = this._model.getSize().y;
		});
		
		drawable.setDrawFunction(() {
			core.Window.getInstance().getContext()..fillStyle = castModel.isOverflew() ? "#f00" : "#ccc"
																						..fillRect(windowX, windowY, windowWidth, windowHeight);
		});
		
		this.addToBackgroundLayer(drawable);
		
	}
}