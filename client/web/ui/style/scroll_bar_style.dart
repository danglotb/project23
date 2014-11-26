part of ui;

abstract class ScrollBarStyle extends InteractiveComponentStyle{
	
	utils.Rect getBarRect();
	
	/**
	 * Length of the movable bar component without the bar cursor
	 */
	num getEmptyBarLength();
	
	bool isInteractiveArea(utils.Coordinates2D coordinates) {
		utils.Rect rect = this.getBarRect();
		return coordinates.x >= rect.left && coordinates.x < rect.right
    					&& coordinates.y >= rect.top && coordinates.y < rect.bottom;
	}
	
}

abstract class HorizontalScrollBarStyle extends ScrollBarStyle{
	
}

abstract class VerticalScrollBarStyle extends ScrollBarStyle {
	
}