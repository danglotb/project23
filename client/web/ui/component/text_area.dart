part of ui;

class TextArea extends Container {
	
	String _text;
	
	TextArea(String text, TextAreaStyle style) : super(style) {
		setLayout(new _TextAreaLayout());
		this._text = text;
	}
	
	String getText() {
		return this._text;
	}
	
	void setText(String text) {
		this._text = text;
	}
}

class _TextAreaLayout extends RelativeLayout {
	
	int _currentCursor;
	
	String _nextWord(String text) {
		while(this._currentCursor < text.length && text[ this._currentCursor] == " ") {
			 this._currentCursor++;
		}
		
		int begin =  this._currentCursor;
		
		while(this._currentCursor < text.length && text[ this._currentCursor] != " ") {
			 this._currentCursor++;
		}
		
		return begin !=  this._currentCursor ? text.substring(begin,  this._currentCursor) : null;
	}
	
	void update() {
		TextArea castModel = this._model as TextArea;
		TextAreaStyle castStyle = castModel.getStyle() as TextAreaStyle;
		
		
		castModel.removeAllChildren();
		 this._currentCursor = 0;
		
		String text = castModel.getText(); 
		
		String word;
		String line = "";
		
		int currentY = 0;
		
		while((word = _nextWord(text)) != null) {
			String tmpLine = line;
			if(line != "")
				tmpLine += " "+word;
			else
				tmpLine += word;
			utils.Vector2D currentSize = castStyle.getTextStyle().getStringDimension(tmpLine);
			if(currentSize.x < castModel.getSize().x) {
				line = tmpLine;
			}
			else {
				Text t = new Text(line, castStyle.getTextStyle());
				t.setPosition(new utils.Coordinates2D(0, currentY));
				t.setSize(new utils.Vector2D(currentSize.x, currentSize.y));
				currentY += currentSize.y+castStyle.getInterlineHeight();
				
				castModel.addChild(t);
				line = word;
			}
		}
		
		if(line != "") {
			utils.Vector2D currentSize = castStyle.getTextStyle().getStringDimension(line);
			Text t = new Text(line, castStyle.getTextStyle());
			t.setPosition(new utils.Coordinates2D(0, currentY));
			t.setSize(new utils.Vector2D(currentSize.x, currentSize.y));
			castModel.addChild(t);
		}
		
	}
	
	utils.Vector2D getMinimalSize() {
		return new utils.Vector2D(0, 0);
	}
}