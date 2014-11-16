part of ui;

abstract class ComboboxStyle extends SelectableComponentStyle {

	ComboboxStyleInputArea _inputArea;
	ComboboxStyleDropDown _dropDown;
	ComboboxStyleDropDownUnit _dropDownUnit;
	
	ComboboxStyle() {
		this._inputArea = getInputAreaStyle();
		this._dropDown = getDropDownStyle();
		this._dropDownUnit = getDropDownUnitStyle();
	}

	void buildDraw() {

	}
	
	ComboboxStyleInputArea getInputAreaStyle();
	
	ComboboxStyleDropDown getDropDownStyle();
	
	ComboboxStyleDropDownUnit getDropDownUnitStyle();
	
	int getMaxDropDownHeight();
	
	int getDropDownUnitHeight();
}

abstract class ComboboxStyleInputArea extends SelectableComponentStyle {
	
}

abstract class ComboboxStyleDropDown extends ContainerStyle {
	
}

abstract class ComboboxStyleDropDownUnit extends InteractiveComponentStyle {
	
}