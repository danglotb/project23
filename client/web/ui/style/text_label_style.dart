part of ui;

/* Style of a text label */
abstract class TextLabelStyle extends LabelStyle {
	
	/* Constructor */
	
	TextLabelStyle() {
		
	}
	
	utils.Vector2D getMinimalSize() {
		TextLabel castModel = this._model as TextLabel;
		core.Window.getInstance().getContext().font = BasicStyleManager.getInstance().getFontSize(castModel.getTextSize()).toString()+'px '+BasicStyleManager.getInstance().getFontName();
		return new utils.Vector2D(core.Window.getInstance().getContext().measureText(castModel.getText()).width.roundToDouble(), BasicStyleManager.getInstance().getFontSize(castModel.getTextSize()));
	}
}