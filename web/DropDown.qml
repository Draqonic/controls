Item {
	property Font font: Font {}
	signal fontChanged;
	property Color color: "#000";
	property int currentIndex;
	property int count;
	property string value;
	property string text;
	width: 100;
	height: 40;

	constructor: {
		this.count = 0
		this.element.on("change", function() {
			this.value = this.element.dom.value
			var idx = this.element.dom.selectedIndex
			this.currentIndex = idx
			this.text = this.element.dom[idx].label
		}.bind(this))
	}

	/// @private
	onWidthChanged, onHeightChanged: { this._updateSize(); }

	/// @private
	function getTag() { return 'select' }

	/// @private
	function registerStyle(style, tag)
	{ style.addRule(tag, "position: absolute; visibility: inherit; margin: 0px;") }

	/// @private
	function _updateSize() {
		var style = { width: this.width, height: this.height }
		this.style(style)
	}

	/// add option into select
	append(value, text): {
		var option = this._context.createElement('option')
		option.dom.value = value
		option.dom.innerHTML = text
		this.element.append(option)
		++this.count
	}

	clear: {
		if (!this.element.dom.options || !this.element.dom.options.length)
			return

		var options = this.element.dom.options
		for (var i = options.length - 1; i >= 0; --i)
			options[i].remove()
	}

	onCountChanged: {
		if (value == 1) {
			this.value = this.element.dom.value
			this.text = this.element.dom[0].label
			this.currentIndex = 0
		}
	}

	remove(idx): {
		if (!this.element.dom.options || idx >= this.element.dom.options.length || idx < 0) {
			log("bad index")
			return
		}
		this.element.dom.options[idx].remove()
		--this.count
	}
}
