part of ui;

/* A container of components */
class Container extends Component {
	
	/* The list of components in this container */
	List<Component> _children;
	
	/* The layout of the container */
	Layout _layout;
	
	/* Constructors */
	
	Container([ComponentStyle style]) : super(style) {
		this._children = new List<Component>();
	}
	
	/* Methods */
	
	/* Draw the component */
	void buildDraw() {
		if(this._visible) {
			_style.buildDraw();
			
			for(Component component in this._children) {
				component.buildDraw();
			}
		}
	}
	
	void clearDraw() {
		_style.clearDraw();
		
		for(Component component in this._children) {
			component.clearDraw();
		}
	}
	
	/* Validate the component */
	void validate() {
		if(this._layout != null)
			_layout.validate();
		
		for(Component component in this._children) {
			component.validate();
		}
	}
	
	void notify() {
		
		for(Component component in this._children) {
			component.computePosition(this.getPosition());
			component.notify();
		}
		
		
		super.notify();
	}
	
	/* Add a component in this container */
	void addChild(Component component) {
		this._children.add(component);
		
		if(this._addedToWindow)
			component.addedToWindow();
		
		core.Window.getInstance().requireRebuildDraw();
	}
	
	void removeChild(Component component) {
		this._children.remove(component);
		core.Window.getInstance().requireRebuildDraw();
	}
	
	void removeAllChildren() {
		this._children.clear();
		core.Window.getInstance().requireRebuildDraw();
	}
	
	void clearChild() {
		for(Component component in this._children) {
			component.removedToWindow();
		}
		this._children.clear();
	}

	void addedToWindow() {
		this._addedToWindow = true;
		
		for(Component component in this._children) {
			component.addedToWindow();
		}
	}
	
	void removedToWindow() {
		this._addedToWindow = false;
		
		for(Component component in this._children) {
			component.removedToWindow();
		}
	}
	
	
	/* Getters & Setters */
	
	/* Setter of Layout */
	Layout getLayout() {
		return this._layout;
	}
	
	void setLayout(Layout layout) {
		this._layout = layout;
		this._layout.setModel(this);
	}
	
	/* Get the total number of component in this container */
	int getChildNumber() {
		return this._children.length;
	}
	
	/* Get the indexth component in the list */
	Component getChild(int index) {
		return this._children.elementAt(index);
	}
	
	utils.Vector2D getMinimalSize() {
		if(this._minimalSize.x != 0 || this._minimalSize.y != 0)
			return this._minimalSize;
		
		return this._layout == null ? super.getMinimalSize() : this._layout.getMinimalSize();
	}
	
	//pack in layout?
	
}