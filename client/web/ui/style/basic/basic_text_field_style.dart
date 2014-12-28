part of ui;

/*
 * 
 * TODO cursor in middle of text
 */

class BasicTextFieldStyle extends TextFieldStyle {

	static const int BLINK_TIMER = 500;

	static const int IMG_BORDER_WIDTH = 11;
	static const int IMG_TEXT_BORDER_WIDTH = 3;
	static const int IMG_TEXT_BORDER_HEIGHT = 5;
	static const int IMG_HEIGHT = 80;

	bool _blinkOn;
	bool _wasSelected;
	String _oldText;
	int _oldCursorPosition;

	async.Timer _currentTimer;
	html.ImageElement _spriteTextField;

	BasicTextFieldStyle() {
		this._blinkOn = false;
		this._wasSelected = false;
		this._oldText = "";
		this._oldCursorPosition = 0;
		this._spriteTextField = new html.ImageElement(src: "image/ui/textfield-sprite.png");
	}

	void _blink() {
		this._blinkOn = !this._blinkOn;
		this._currentTimer = new async.Timer(new Duration(milliseconds: BLINK_TIMER), _blink);
	}

	void _checkBlink() {
		TextField castModel = this._model as TextField;

		if (castModel.isSelected() && !this._wasSelected || this._oldText != castModel.getText() || this._oldCursorPosition != castModel.getTextCursorPosition()) {
			if (this._currentTimer != null) this._currentTimer.cancel();
			this._blinkOn = true;
			this._wasSelected = true;
			this._currentTimer = new async.Timer(new Duration(milliseconds: BLINK_TIMER), _blink);
			this._oldText = castModel.getText();
			this._oldCursorPosition = castModel.getTextCursorPosition();
		}

		if (!castModel.isSelected() && this._wasSelected) {
			this._currentTimer.cancel();
			this._blinkOn = false;
			this._wasSelected = false;
		}
	}

	void buildDraw() {

		TextField castModel = this._model as TextField;

		num backgroundLeftX;
		num backgroundMiddleX;
		num backgroundMiddleWidth;
		num backgroundRightX;
		num backgroundY;
		num backgroundHeight;

		num clipX;
		num clipY;
		num clipWidth;
		num clipHeight;

		String text;
		num textX;
		num textY;

		num cursorX;
		num cursorTopY;
		num cursorBottomY;


		ComponentDrawable drawable = new ComponentDrawable(this._model);

		drawable.setComputeFunction(() {
			backgroundLeftX = castModel.getPosition().x;
			backgroundMiddleX = castModel.getPosition().x + IMG_BORDER_WIDTH;
			backgroundMiddleWidth = castModel.getSize().x - 2 * IMG_BORDER_WIDTH;
			backgroundRightX = castModel.getPosition().x + castModel.getSize().x - IMG_BORDER_WIDTH;
			backgroundY = castModel.getPosition().y;
			backgroundHeight = castModel.getSize().y;

			clipX = castModel.getPosition().x + IMG_TEXT_BORDER_WIDTH;
			clipY = castModel.getPosition().y;
			clipWidth = castModel.getSize().x - IMG_TEXT_BORDER_WIDTH * 2;
			clipHeight = castModel.getSize().y;


			//compute text
			text = castModel.getText();
			cursorTopY = castModel.getPosition().y + IMG_TEXT_BORDER_HEIGHT;
			cursorBottomY = castModel.getPosition().y + castModel.getSize().y - IMG_TEXT_BORDER_HEIGHT;

			core.Window.getInstance().getContext()
					..fillStyle = "#444"
					..font = BasicStyleManager.getInstance().getFontSizeH3().toString() + 'px ' + BasicStyleManager.getInstance().getFontName()
					..textBaseline = 'middle';

			html.TextMetrics textMetric = core.Window.getInstance().getContext().measureText(castModel.getText());

			if (textMetric.width > castModel.getSize().x - 2 * IMG_BORDER_WIDTH) {

				html.TextMetrics textMetric2 = core.Window.getInstance().getContext().measureText(castModel.getText().substring(castModel.getTextCursorPosition()));

				if (textMetric2.width > castModel.getSize().x - 2 * IMG_BORDER_WIDTH) {

					text = castModel.getText();
					textX = castModel.getPosition().x + IMG_BORDER_WIDTH - core.Window.getInstance().getContext().measureText(castModel.getText().substring(0, castModel.getTextCursorPosition())).width;
					textY = castModel.getPosition().y + castModel.getSize().y ~/ 2;

					cursorX = castModel.getPosition().x + IMG_BORDER_WIDTH;
				} else {

					textX = castModel.getPosition().x + castModel.getSize().x - IMG_BORDER_WIDTH - textMetric.width.toInt();
					textY = castModel.getPosition().y + castModel.getSize().y ~/ 2;


					cursorX = castModel.getPosition().x + castModel.getSize().x - IMG_BORDER_WIDTH - core.Window.getInstance().getContext().measureText(castModel.getText().substring(castModel.getTextCursorPosition())).width.toInt();

				}
			} else {
				textX = castModel.getPosition().x + IMG_BORDER_WIDTH;
				textY = castModel.getPosition().y + castModel.getSize().y ~/ 2;
				cursorX = castModel.getPosition().x + IMG_BORDER_WIDTH + core.Window.getInstance().getContext().measureText(castModel.getText().substring(0, castModel.getTextCursorPosition())).width.toInt();

			}
		});
		
		drawable.setDrawFunction(() {
			_checkBlink();

			if (castModel.isSelected()) {
				if (castModel.isOverflew()) {
					core.Window.getInstance().getContext()
							..drawImageScaledFromSource(this._spriteTextField, 69, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
							..drawImageScaledFromSource(this._spriteTextField, 80, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
							..drawImageScaledFromSource(this._spriteTextField, 81, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
				} else {
					core.Window.getInstance().getContext()
							..drawImageScaledFromSource(this._spriteTextField, 46, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
							..drawImageScaledFromSource(this._spriteTextField, 57, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
							..drawImageScaledFromSource(this._spriteTextField, 58, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
				}
			} else {
				if (castModel.isOverflew()) {
					core.Window.getInstance().getContext()
							..drawImageScaledFromSource(this._spriteTextField, 23, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
							..drawImageScaledFromSource(this._spriteTextField, 34, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
							..drawImageScaledFromSource(this._spriteTextField, 35, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
				} else {
					core.Window.getInstance().getContext()
							..drawImageScaledFromSource(this._spriteTextField, 0, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundLeftX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight)
							..drawImageScaledFromSource(this._spriteTextField, 11, 0, 1, IMG_HEIGHT, backgroundMiddleX, backgroundY, backgroundMiddleWidth, backgroundHeight)
							..drawImageScaledFromSource(this._spriteTextField, 12, 0, IMG_BORDER_WIDTH, IMG_HEIGHT, backgroundRightX, backgroundY, IMG_BORDER_WIDTH, backgroundHeight);
				}
			}


			core.Window.getInstance().getContext()
					..fillStyle = "#444"
					..font = BasicStyleManager.getInstance().getFontSizeH3().toString() + 'px ' + BasicStyleManager.getInstance().getFontName()
					..textBaseline = 'middle'
					..save()
					..beginPath()
					..rect(clipX, clipY, clipWidth, clipHeight)
					..clip()
					..fillText(text, textX, textY)
					..restore();

			if (this._blinkOn) {
				core.Window.getInstance().getContext()
						..strokeStyle = "#222"
						..beginPath()
						..moveTo(cursorX, cursorTopY)
						..lineTo(cursorX, cursorBottomY)
						..stroke();
			}
		});

		this.addToContentLayer(drawable);
	}

	int getCursorPosition(utils.Coordinates2D coordinates) {
		TextField castModel = this._model as TextField;

		core.Window.getInstance().getContext().font = BasicStyleManager.getInstance().getFontSizeH3().toString() + 'px ' + BasicStyleManager.getInstance().getFontName();

		html.TextMetrics textMetric = core.Window.getInstance().getContext().measureText(castModel.getText());

		if (textMetric.width > this._model.getSize().x - 2 * IMG_BORDER_WIDTH) {
			int i = castModel.getText().length - 1;

			while (i >= 0 && castModel.getPosition().x + castModel.getSize().x - IMG_BORDER_WIDTH - core.Window.getInstance().getContext().measureText(castModel.getText().substring(i)).width >= coordinates.x) {
				i--;
			}

			num i1 = castModel.getPosition().x + castModel.getSize().x - IMG_BORDER_WIDTH - core.Window.getInstance().getContext().measureText(castModel.getText().substring(i)).width;
			num i2 = castModel.getPosition().x + castModel.getSize().x - IMG_BORDER_WIDTH - core.Window.getInstance().getContext().measureText(i < castModel.getText().length ? castModel.getText().substring(i + 1) : castModel.getText()).width;

			num ri = coordinates.x - i1 < i2 - coordinates.x ? i : i + 1;

			return ri > castModel.getText().length ? castModel.getText().length - 1 : ri;

		} else {
			int i = 0;
			while (i < castModel.getText().length && this._model.getPosition().x + IMG_BORDER_WIDTH + core.Window.getInstance().getContext().measureText(castModel.getText().substring(0, i)).width <= coordinates.x) {
				i++;
			}

			num i1 = this._model.getPosition().x + IMG_BORDER_WIDTH + (i > 0 ? core.Window.getInstance().getContext().measureText(castModel.getText().substring(0, i - 1)).width : 0);
			num i2 = this._model.getPosition().x + IMG_BORDER_WIDTH + core.Window.getInstance().getContext().measureText(castModel.getText().substring(0, i)).width;


			num ri = coordinates.x - i1 < i2 - coordinates.x ? i - 1 : i;

			return ri < 0 ? 0 : ri;

		}
		return 0;
	}
}
