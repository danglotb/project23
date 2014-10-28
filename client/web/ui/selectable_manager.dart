part of ui;

/* Singleton */
class SelectableManager {
	
	static SelectableManager _instance;
	
	List<SelectableComponent> _selectables;
	
	SelectableComponent _currentSelected;
	
	_SelectableManager() {
		
	}
	
	void _init() {
		_selectables = new List<SelectableComponent>();
	}
	
	static SelectableManager getInstance() {
		if(_instance == null) {
			_instance = new SelectableManager();
			_instance._init();
		}
		
		return _instance;
	}
	
	void add(SelectableComponent component) {
		this._selectables.add(component);
	}
	
	void reset() {
		this._currentSelected = null;
		this._selectables.clear();
	}
	
	void select(SelectableComponent component) {
		if(this._currentSelected != null)
			_currentSelected.setSelected(false);
		
		component.setSelected(true);
		_currentSelected = component;
	}
	
	void next() {
		
	}
}