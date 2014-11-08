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
	void draw() {
		if(this._visible) {
			
			if(_style != null)
				_style.draw(this);
			
			for(Component component in this._children) {
				component.draw();
			}
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
	
	/* Spread the event to the component */
	void dispatchEvent(Event event) {
		for(Component component in this._children) {
			component.dispatchEvent(event);
		}
	}
	
	/* Add a component in this container */
	void addChild(Component component) {
		this._children.add(component);
		
		if(this._addedToWindow)
			component.addedToWindow();
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
	
}