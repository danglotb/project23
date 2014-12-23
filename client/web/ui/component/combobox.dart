part of ui;

class Combobox extends Container {
	
	List<String> _choices;
	int _currentChoice;
	
	 _ComboboxInputArea _inputArea;
	 _ComboboxDropDown _dropDown;
	
	Combobox(ComboboxStyle style) : super(style) {
		this.setLayout(new _ComboboxLayout());
		this._choices = new List<String>();
		_currentChoice = -1;
		
		this._inputArea = new _ComboboxInputArea(this, this._style);
		this.addChild(this._inputArea);
	}
	
	void setListChoice(List<String> choices) {
		this._choices = choices;
		this._currentChoice = this._choices.length > 0 ? 0 : -1;
	}
	
	int getCurrentChoiceIndex() {
		return this._currentChoice;
	}
	
	String getCurrentChoice() {
		return this._currentChoice == -1 ? "" :	this._choices[this._currentChoice];
	}
	
	void setCurrentChoice(String choice) {
		this._currentChoice = this._choices.indexOf(choice);
		setDropDownstate(false);
	}
	
	List<String> getChoiceList() {
		return this._choices;
	}
	
	void setDropDownstate(bool unroll) {
		if(unroll && this.getChildNumber() == 1) {
			async.scheduleMicrotask(() {
	  		this._dropDown = new _ComboboxDropDown(this._style);
	  		for(int i=0; i<this._choices.length; i++) {
	  			this._dropDown.addChild(new _ComboboxDropDownUnit(this, this._choices[i], this._style));
	  		}
	  		this.addChild(this._dropDown);
			});
		}
		else if(!unroll && this.getChildNumber() == 2) {
			async.scheduleMicrotask(() {
	  		this.removeChild(this._dropDown);
	  		this._dropDown = null;
			});
		}
	}
	
	bool isDropDownUnroll() {
		return this.getChildNumber() == 2;
	}
}

class _ComboboxInputArea extends SelectableComponent {
	
	Combobox _combobox;
	
	_ComboboxInputArea(Combobox combobox, ComboboxStyle style) : super(style.getInputAreaStyle()) {
		this._combobox = combobox;
	}
	
	void _onClick(core.Event event) {
		super._onPush(event);
		this._combobox.setDropDownstate(!this._combobox.isDropDownUnroll());
	}
	
	Combobox getCombobox() {
		return _combobox;
	}
}

class _ComboboxDropDown extends Container {
	
	_ComboboxDropDown(ComboboxStyle style) : super(style.getDropDownStyle()) {
		this.setLayout(new VerticalLayout());
	}
	
}

class _ComboboxDropDownUnit extends InteractiveComponent {
	
	String _text;
	Combobox _combobox;
	
	 _ComboboxDropDownUnit(Combobox combobox, String text, ComboboxStyle style) : super(style.getDropDownUnitStyle()) {
		 this._text = text;
			this._combobox = combobox;
	 }
	 
	 String getText() {
		 return this._text;
	 }
	 
		void _onClick(core.Event event) {
 		super._onPush(event);
 		this._combobox.setCurrentChoice(this._text);
 	}

}


class _ComboboxLayout extends RelativeLayout {
	
	void update() {
		this._model.getChild(0).setSize(this._model.getSize());
		
		if(this._model.getChildNumber() == 2) { //open list
			this._model.getChild(1).setRelativePosition(new utils.Coordinates2D(0, this._model.getSize().y));
  		this._model.getChild(1).setSize(new utils.Vector2D(this._model.getSize().x, (this._model.getStyle() as ComboboxStyle).getDropDownUnitHeight()*(this._model.getChild(1) as Container).getChildNumber()));
		}

	}
	
	utils.Vector2D getMinimalSize() {
		return this._model.getMinimalSize();
	}
}