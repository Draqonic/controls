ItemStyle {
	property string text;
	property color color;
	
	//property lazy shadow;
	property FontStyle font: FontStyle {}
	property int horizontalAlignment;
	property int verticalAlignment;
	property int wrapMode;
	property int textFormat;
	property int elide;
	
	function _textStyle(obj) {
		if (!obj.text)
			obj.text = this.text
		if (obj.color === "black")
			obj.color = this.color
		if (!obj.horizontalAlignment)
			obj.horizontalAlignment = this.horizontalAlignment
		if (!obj.horizontalAlignment)
			obj.horizontalAlignment = this.horizontalAlignment
		if (!obj.wrapMode)
			obj.wrapMode = this.wrapMode
		if (!obj.textFormat)
			obj.textFormat = this.textFormat
		if (!obj.elide)
			obj.elide = this.elide
		if (this.font.bold)
			obj.font.bold = this.font.bold
		if (this.font.capitalization) {
			if (!obj.font.capitalization)
				obj.font.bold = this.font.capitalization
		}
		if (this.font.family !== $manifest$style$font$family) {
			if (obj.font.family === $manifest$style$font$family)
				obj.font.family = this.font.family
		}
		if (this.font.italic)
			obj.font.italic = this.font.italic
		if (!this.font.kerning)
			obj.font.kerning = this.font.kerning
		if (this.font.letterSpacing)
			obj.font.letterSpacing = this.font.letterSpacing
		if (this.font.overline)
			obj.font.overline = this.font.overline
		if (this.font.pixelSize !== $manifest$style$font$pixelSize) {
			if (obj.font.pixelSize === $manifest$style$font$pixelSize)
				obj.font.pixelSize = this.font.pixelSize
		}
		if (this.font.strike)
			obj.font.strike = this.font.strike
		if (this.font.strikeout)
			obj.font.strikeout = this.font.strikeout
		if (this.font.underline)
			obj.font.italic = this.font.underline
		if (this.font.weight) {
			if (!obj.font.weight)
				obj.font.weight = this.font.weight
		}
		if (this.font.wordSpacing) {
			if (!obj.font.wordSpacing)
				obj.font.wordSpacing = this.font.wordSpacing
		}
	}
	
	function _getStyle(obj) {
		this._itemStyle(obj)
		this._textStyle(obj)
	}
}