part of ui;

typedef void ScrollBarValueListenerFunc(ScrollBar source);

abstract class ScrollBar extends InteractiveComponent {
	
	num _barPositionRatio;
	num _viewportRatio;
	
	num _originMousePosition;
	num _originBarPosition;
	
	List<ScrollBarValueListenerFunc> _valueChangedListeners;
	
	ScrollBar(ScrollBarStyle style) : super(style) {
		this._barPositionRatio = 0.0;
		this._viewportRatio = 1.0;
		this._valueChangedListeners = new List<ScrollBarValueListenerFunc>();
	}
	
	num getBarPositionRatio() {
		return this._barPositionRatio;
	}
	
	void setBarPositionRatio(num value) {
		assert(value >= 0.0 && value <= 1.0);
		this._barPositionRatio = value;
		this._valueChangedListeners.forEach((ScrollBarValueListenerFunc function) => function(this));
	}
	
	num getViewportRatio() {
		return this._viewportRatio;
	}
	
	void setViewportRatio(num value) {
		assert(value >= 0.0 && value <= 1.0);
		this._viewportRatio = value;
	}
	
	void addValueChangedListener(ScrollBarValueListenerFunc function) {
		this._valueChangedListeners.add(function);
	}
	
}

class HorizontalScrollBar extends ScrollBar {
	
	HorizontalScrollBar(HorizontalScrollBarStyle style) : super(style) {
		
	}
	
	void processEvent(core.Event event, utils.Rect viewport) {
		
		ScrollBarStyle castStyle = this._style as ScrollBarStyle;
		
		super.processEvent(event, viewport);

		if(event.getType() == core.EventType.MOUSE_MOVE && this._pushed) {
			num value = this._originBarPosition+(event.getMousePosition().x-this._originMousePosition)/castStyle.getEmptyBarLength();
			if(value > 1.0)
				value = 1.0;
			else if(value < 0.0)
				value = 0.0;
			
			setBarPositionRatio(value);
			
			notify();
		}
	}
	
	void _onPush(core.Event event) {
		super._onPush(event);
		this._originMousePosition = event.getMousePosition().x;
		this._originBarPosition = this._barPositionRatio;
	}
	
}

class VerticalScrollBar extends ScrollBar {
	
	VerticalScrollBar(VerticalScrollBarStyle style) : super(style) {
		
	}
	
	void processEvent(core.Event event, utils.Rect viewport) {
		
		ScrollBarStyle castStyle = this._style as ScrollBarStyle;
		
		super.processEvent(event, viewport);

		if(event.getType() == core.EventType.MOUSE_MOVE && this._pushed) {
			num value = this._originBarPosition+(event.getMousePosition().y-this._originMousePosition)/castStyle.getEmptyBarLength();
			if(value > 1.0)
				value = 1.0;
			else if(value < 0.0)
				value = 0.0;
			setBarPositionRatio(value);
			
			notify();
		}
	}
	
	void _onPush(core.Event event) {
		super._onPush(event);
		this._originMousePosition = event.getMousePosition().y;
		this._originBarPosition = this._barPositionRatio;
	}	
	
}