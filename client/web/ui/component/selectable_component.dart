part of ui;

abstract class SelectableComponent extends InteractiveComponent {
	
	bool _selected;
	List<ListenerStateFunc> _selectedListeners;
	
	SelectableComponent(SelectableComponentStyle style) : super(style) {
		this._selected = false;
		this._selectedListeners = new List<ListenerStateFunc>();
	}
	
	void setSelected(bool state) {
		this._selected = state;
	}
	
	bool isSelected() {
		return this._selected;
	}
	
	void addSelectedListener(ListenerStateFunc function) {
		this._selectedListeners.add(function);
	}
	
	
}