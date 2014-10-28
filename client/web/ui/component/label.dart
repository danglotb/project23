part of ui;

/* A Label component that can be linked to a SelectableComponent */
abstract class Label extends InteractiveComponent {
	
	/* The linked SelectableComponent */
	SelectableComponent _target;
	
	/* Constructor */
	
	Label(LabelStyle style, {SelectableComponent target}): super(style) {
		if(target != null) {
			this._target = target;
		}
	}
	
	/* Getters & Setters */	
	
	/* Link the Label to a Selectable Component */
	void setTarget(SelectableComponent target) {
		this._target = target;
	}
	
}