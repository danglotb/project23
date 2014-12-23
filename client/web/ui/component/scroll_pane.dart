part of ui;

class ScrollPane extends Container {
	
	HorizontalScrollBar _horizontalScrollBar;
	VerticalScrollBar _verticalScrollBar;
	utils.Rect _viewport;
	
	ScrollPane(ScrollPaneStyle style) : super(style) {
		this.setLayout(new _ScrollPaneLayout());
		
		this.addChild(new Container());
		this._viewport = new utils.Rect();
	}
	
	void buildDraw() {
		if(this._visible) {
			_style.buildDraw();
			
			core.DrawManager.getInstance().setCurrentPaneLevel(core.DrawManager.getInstance().getCurrentPaneLevel()+1);
			utils.Rect oldViewport = core.DrawManager.getInstance().getCurrentViewport();
			
			core.DrawManager.getInstance().setCurrentViewport(this._viewport);
			this.getChild(0).buildDraw();
			core.DrawManager.getInstance().setCurrentViewport(oldViewport);
			core.DrawManager.getInstance().setCurrentPaneLevel(core.DrawManager.getInstance().getCurrentPaneLevel()-1);
			
			if(this._horizontalScrollBar != null)
				this._horizontalScrollBar.buildDraw();
			
			if(this._verticalScrollBar != null)
				this._verticalScrollBar.buildDraw();
		}
	}
	
	void setContent(Component component) {
		this.clearChild();
		this.addChild(component);
	}
	
	HorizontalScrollBar getHorizontalScrollBar() {
		return _horizontalScrollBar;
	}
	
	VerticalScrollBar getVerticalScrollBar() {
		return _verticalScrollBar;
	}
	
	void setHorizontalScrollBar(HorizontalScrollBar scrollBar) {
		assert(this._horizontalScrollBar == null);
		this._horizontalScrollBar = scrollBar;
		this.addChild(scrollBar);
	}
	
	void setVerticalScrollBar(VerticalScrollBar scrollBar) {
		assert(this._verticalScrollBar == null);
		this._verticalScrollBar = scrollBar;
		this.addChild(scrollBar);
	}
	
	void setViewport(utils.Rect viewport) {
		this._viewport.left = viewport.left;
		this._viewport.top = viewport.top;
		this._viewport.right = viewport.right;
		this._viewport.bottom = viewport.bottom;
	}
	
	void notify() {
		
		
		super.notify();
	
		this._viewport.left = this._absolutePosition.x;
		this._viewport.top = this._absolutePosition.y;
		this._viewport.right = this._size.x-(this._verticalScrollBar != null ? this._verticalScrollBar.getMinimalSize().x : 0);
		this._viewport.bottom = this._size.y-(this._horizontalScrollBar != null ? this._horizontalScrollBar.getMinimalSize().y : 0);
	}
	
}

class _ScrollPaneLayout extends RelativeLayout {
	
	void update() {
		
		ScrollPaneStyle castStyle = this._model.getStyle() as ScrollPaneStyle;
		ScrollPane castModel = this._model as ScrollPane;

		if(this._model.getChild(0).getSize().x > this._model.getSize().x && castModel.getHorizontalScrollBar() == null) {
			HorizontalScrollBar hsb = new HorizontalScrollBar(castStyle.getHorizontalScrollBarStyle());
			hsb.addValueChangedListener((ScrollBar source) {
				this._model.getChild(0).setRelativePosition(new utils.Coordinates2D(-source.getBarPositionRatio()*(this._model.getChild(0).getSize().x-this._model.getSize().x+(castModel.getVerticalScrollBar() != null ? castModel.getVerticalScrollBar().getMinimalSize().x : 0)), this._model.getChild(0).getRelativePosition().y));
				this._model.notify();
			});
				
			castModel.setHorizontalScrollBar(hsb);
		}
		
		if(this._model.getChild(0).getSize().y > this._model.getSize().y && castModel.getVerticalScrollBar() == null) {
			VerticalScrollBar vsb = new VerticalScrollBar(castStyle.getVerticalScrollBarStyle());
			vsb.addValueChangedListener((ScrollBar source) {
				this._model.getChild(0).setRelativePosition(new utils.Coordinates2D(this._model.getChild(0).getRelativePosition().x, -source.getBarPositionRatio()*(this._model.getChild(0).getSize().y-this._model.getSize().y+(castModel.getHorizontalScrollBar() != null ? castModel.getHorizontalScrollBar().getMinimalSize().y : 0))));
				this._model.notify();
			});
				
			castModel.setVerticalScrollBar(vsb);
		}
		
		
		if(castModel.getHorizontalScrollBar() != null) {
			castModel.getHorizontalScrollBar().setRelativePosition(new utils.Coordinates2D(0, this._model.getSize().y-castModel.getHorizontalScrollBar().getMinimalSize().y));
			castModel.getHorizontalScrollBar().setSize(new utils.Vector2D(this._model.getSize().x-(castModel.getVerticalScrollBar() != null ? castModel.getVerticalScrollBar().getMinimalSize().x : 0), castModel.getHorizontalScrollBar().getMinimalSize().y));
			castModel.getHorizontalScrollBar().setViewportRatio((this._model.getSize().x-(castModel.getVerticalScrollBar() != null ? castModel.getVerticalScrollBar().getMinimalSize().x : 0))/this._model.getChild(0).getSize().x);
		}
		
		if(castModel.getVerticalScrollBar() != null) {
			castModel.getVerticalScrollBar().setRelativePosition(new utils.Coordinates2D(this._model.getSize().x-castModel.getVerticalScrollBar().getMinimalSize().x, 0));
			castModel.getVerticalScrollBar().setSize(new utils.Vector2D(castModel.getVerticalScrollBar().getMinimalSize().x, this._model.getSize().y-(castModel.getHorizontalScrollBar() != null ? castModel.getHorizontalScrollBar().getMinimalSize().y : 0)));
			castModel.getVerticalScrollBar().setViewportRatio((this._model.getSize().y-(castModel.getHorizontalScrollBar() != null ? castModel.getHorizontalScrollBar().getMinimalSize().y : 0))/this._model.getChild(0).getSize().x);
		}
		
		
		num posX = 0;
		if(castModel.getHorizontalScrollBar() != null)
			posX -= castModel.getHorizontalScrollBar().getBarPositionRatio()*(this._model.getChild(0).getSize().x-this._model.getSize().x+(castModel.getVerticalScrollBar() != null ? castModel.getVerticalScrollBar().getMinimalSize().x : 0));
		
		num posY = 0;
		if(castModel.getVerticalScrollBar() != null)
			posY -= castModel.getVerticalScrollBar().getBarPositionRatio()*(this._model.getChild(0).getSize().y-this._model.getSize().y+(castModel.getHorizontalScrollBar() != null ? castModel.getHorizontalScrollBar().getMinimalSize().y : 0));
		this._model.getChild(0).setRelativePosition(new utils.Coordinates2D(posX, posY));
	}
	
	utils.Vector2D getMinimalSize() {
		return new utils.Vector2D(0, 0);
	}
}