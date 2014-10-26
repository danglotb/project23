part of ui;

/* A container of components */
abstract class Container extends Component {
	
	/* The list of components in this container */
	List<Component> _children;
	
	/* The layout of the container */
	Layout _layout;
	
	/* Constructors */
	
	Container(ComponentStyle style) : super(style);
	
	/* Methods */
	
	/* Draw the component */
	void draw() {
		for(Component component in this._children) {
			component.draw();
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
	}
	
	/* Getters & Setters */
	
	/* Setter of Layout */
	Layout get getLayout                => this._layout;
	       set setLayout(Layout layout) => this._layout = layout;
	
	/* Get the total number of component in this container */
	int get getChildNumber => this._children.length;
	
	/* Get the indexth component in the list */
	Component getChild(int index) {
		return this._children.elementAt(index);
	}
	
}