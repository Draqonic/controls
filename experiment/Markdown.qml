Object {
	property string markText: parent.text;
	property bool enabled;
	
	function _checkMarkdown(newText, mark, tag) {
		var check = false
		if (newText.indexOf(mark) !== -1) {
			while(newText.indexOf(mark) !== -1) {
				var start = '<%1>'.arg(tag)
				var back = '</%1>'.arg(tag)
				newText = check ? newText.replace(mark, back) : newText.replace(mark, start)
                		check = !check
			}
		}
		return newText
	}
	
	onMarkTextChanged: {
		if (!this.enabled || !this.markText)
			return

		var newText = this.markText
		newText = this._checkMarkdown(newText, '**', 'b')
		newText = this._checkMarkdown(newText, '__', 'i')
		
		if (this.qt) {
			this.enabled = false
			this.markText = ''
		}
		this.parent.text = newText
		if (this.qt) {
			markText = Qt.binding(function() { return text }) // temp hack for Qt
			this.enabled = true
		}
	}
}