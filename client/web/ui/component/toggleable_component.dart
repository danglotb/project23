part of ui;

typedef void ListenerToggleableFunc(ToggleableComponent source);

/* A toggleable component */
abstract class ToggleableComponent extends SelectableComponent{

	/* The value of the component, true if the component is toggled, else false */
	bool _toggled;
	
	/* List of listener */
	List<ListenerToggleableFunc> _toggledListener;
	
	/* Constructors */
	
	ToggleableComponent(ToggleableComponentStyle style) : super(style) {
		this._toggled = false;
		this._toggledListener = new List<ListenerToggleableFunc>();
	}
	
	addToggledListener(ListenerToggleableFunc func) {
		this._toggledListener.add(func);
	}
}