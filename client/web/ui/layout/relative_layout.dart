part of ui;

abstract class RelativeLayout extends Layout {
	
	void setPositionMode(Component model) {
		model.setPositionMode(PositionMode.RELATIVE);
	}
	
}