part of ui;

typedef void ListenerSelectableFunc(SelectableComponent source);

abstract class SelectableComponent extends InteractiveComponent {
	
	bool _selected;
	List<ListenerSelectableFunc> _selectedListeners;
	
	SelectableComponent(SelectableComponentStyle style) : super(style) {
		this._selected = false;
		this._selectedListeners = new List<ListenerSelectableFunc>();
	}
	
	void setSelected(bool state) {
		this._selected = state;
	}
	
	bool isSelected() {
		return this._selected;
	}
	
	void addSelectedListener(ListenerSelectableFunc function) {
		this._selectedListeners.add(function);
	}
	
	void addedToWindow() {
		this._addedToWindow = true;
		
		SelectableManager.getInstance().add(this);
	}
	
	void removedToWindow() {
		SelectableManager.getInstance().remove(this);
	}
	
	void _onPush(core.Event event) {
		if(!this._selected) {
			SelectableManager.getInstance().select(this);
			this._selectedListeners.forEach((el) => el(this));
		}
	}
	
	
}