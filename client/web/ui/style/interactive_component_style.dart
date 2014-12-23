part of ui;

/* A Style of a component */
abstract class InteractiveComponentStyle extends ContainerStyle {

	/* Constructors */
	InteractiveComponentStyle() {
		
	}
	
	bool isInteractiveArea(utils.Coordinates2D coordinates) {
		return coordinates.x >= this._model.getAbsolutePosition().x && coordinates.x < this._model.getAbsolutePosition().x+this._model.getSize().x 
    					&& coordinates.y >= this._model.getAbsolutePosition().y && coordinates.y < this._model.getAbsolutePosition().y+this._model.getSize().y;
	}

}