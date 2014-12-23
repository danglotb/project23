part of ui;

class Button extends SelectableComponent {
	
	
	Button(ButtonStyle style) : super(style) {
		setLayout(new _ButtonLayout());
	}
	
	Button.text(String text, ButtonStyle style) : super(style) {
		setLayout(new _ButtonLayout());
		TextLabel label = new TextLabel(text, style.getTextLabelStyle());
		label.setEnableEvent(false);
		label.setTextAlign(TextLabel.CENTER);
		this.addChild(label);
	}

}

class _ButtonLayout extends RelativeLayout {
	
	
	
	void update() {
		
		num totalSize = this.getMinimalSize().x;
		num currentPosition = 0;
		
		for(int i=0; i<this._model.getChildNumber(); i++) {
			this._model.getChild(i).setSize(this._model.getChild(i).getMinimalSize());
			this._model.getChild(i).setRelativePosition(new utils.Coordinates2D((this._model.getSize().x-totalSize)~/2+currentPosition, (this._model.getSize().y-this._model.getChild(i).getSize().y)~/2));
			currentPosition += this._model.getChild(i).getSize().x;
		}
		
		
	}
	
	utils.Vector2D getMinimalSize() {
		ButtonStyle castModelStyle = this._model.getStyle() as ButtonStyle;
		
		num minX = 0;
		num minY = 0;
		
		for(int i = 0; i<this._model.getChildNumber(); i++) {
			utils.Vector2D currentMin = this._model.getChild(i).getMinimalSize();
			if(currentMin.y > minY) {
				minY = currentMin.y;
			}
			minX += currentMin.x;
		}
		return new utils.Vector2D(minX+castModelStyle.getBorderSize().left+castModelStyle.getBorderSize().right,minY+castModelStyle.getBorderSize().top+castModelStyle.getBorderSize().bottom);
	}
	
}