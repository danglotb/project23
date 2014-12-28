part of ui;

abstract class AbsoluteLayout extends Layout {
	
	void setPositionMode(Component model) {
		model.setPositionMode(PositionMode.ABSOLUTE);
	}
	
}