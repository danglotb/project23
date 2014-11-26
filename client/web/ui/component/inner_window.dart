part of ui;

class InnerWindow extends InteractiveComponent {
	
	int _windowNumber;
	utils.Coordinates2D _originMousePosition;
	utils.Coordinates2D _originWindowPosition;
	
	Container _topBar;
	Component _content;
	
	Button _closeButton;
	
	InnerWindow(String name, BasicInnerWindowStyle style) : super(style) {
		this.setLayout(new _InnerWindowLayout());
		
		this._topBar = new Container();
		this._topBar.setLayout(new _TopBarLayout());
		
		TextLabel windowName = new TextLabel(name, new BasicTextLabelStyle());
		windowName.setEnableEvent(false);
		windowName.setTextSize(TextLabel.H3);
		this._topBar.addChild(windowName);
		
		this._closeButton = new Button(new BasicButtonStyle());
		this._topBar.addChild(this._closeButton);
		
		this.addChild(this._topBar);
		
		
		
		this._content = new Container();
		this.addChild(this._content);
	}
	
	void addedToWindow() {
		super.addedToWindow();
		core.InnerWindowManager.getInstance().addWindow(this);
	}
	
	void removedToWindow() {
		super.removedToWindow();
		core.InnerWindowManager.getInstance().removeWindow(this);
	}
	
	void buildDraw() {
		core.DrawManager.getInstance().setCurrentFrameLevel(core.InnerWindowManager.getInstance().getIndex(this));
		super.buildDraw();
		core.DrawManager.getInstance().setCurrentFrameLevel(0);
	}
	
	void _onPush(core.Event event) {
		this._originMousePosition = event.getMousePosition();
		this._originWindowPosition = this._position;
		core.InnerWindowManager.getInstance().setFrontground(this);
		core.Window.getInstance().requireRebuildDraw();
	}
	
	void setContent(Component component) {
		this.removeChild(this._content);
		this._content = component;
		this.addChild(this._content);
	}
	
	void setCloseAction(void function()) {
		this._closeButton.addClickListener((InteractiveComponent source) => function());
	}
	
	void processEvent(core.Event event, utils.Rect viewport) {
		
		super.processEvent(event, viewport);
		
		if(event.getType() == core.EventType.MOUSE_MOVE) {
			if(this._pushed) {
				this._position = new utils.Coordinates2D(this._originWindowPosition.x+event.getMousePosition().x-this._originMousePosition.x, this._originWindowPosition.y+event.getMousePosition().y-this._originMousePosition.y);
				event.setComsumed();
				this.validate();
			}
		}
		
		
	}
}

class _InnerWindowLayout extends Layout {
	
	static const int TOP_BAR_HEIGHT = 30;
	
	void validate() {
		assert(this._model.getChildNumber() == 2);
		
		this._model.getChild(0).setPosition(new utils.Coordinates2D(this._model.getPosition().x, this._model.getPosition().y));
		this._model.getChild(0).setSize(new utils.Vector2D(this._model.getSize().x, TOP_BAR_HEIGHT));
		
		this._model.getChild(1).setPosition(new utils.Coordinates2D(this._model.getPosition().x, this._model.getPosition().y+TOP_BAR_HEIGHT));
		this._model.getChild(1).setSize(new utils.Vector2D(this._model.getSize().x, this._model.getSize().y-TOP_BAR_HEIGHT));
	}
	
	utils.Vector2D getMinimalSize() {
		return new utils.Vector2D(0, 0);
	}
}

class _TopBarLayout extends Layout {
	
	static const int BUTTON_SIZE = 24;
	static const int BUTTON_BORDER = 3;
	static const int NAME_BORDER = 10;
	
	void validate() {
		assert(this._model.getChildNumber() == 2);
		this._model.getChild(0).setPosition(new utils.Coordinates2D(this._model.getPosition().x+NAME_BORDER, this._model.getPosition().y));
		this._model.getChild(0).setSize(new utils.Vector2D(this._model.getSize().x-BUTTON_SIZE-BUTTON_BORDER*2-NAME_BORDER, this._model.getSize().y));
		
		this._model.getChild(1).setPosition(new utils.Coordinates2D(this._model.getPosition().x+this._model.getSize().x-BUTTON_SIZE-BUTTON_BORDER*2, this._model.getPosition().y+BUTTON_BORDER));
		this._model.getChild(1).setSize(new utils.Vector2D(BUTTON_SIZE, BUTTON_SIZE));
	}
	
	utils.Vector2D getMinimalSize() {
		return new utils.Vector2D(0, 0);
	}
}