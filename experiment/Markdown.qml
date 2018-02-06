QtObject {
	property string text: parent.text;
	property bool enabled;
	
	function _checkMarkdown(text, mark, tag) {
		var temp1 = false
		if (text.indexOf(mark) !== -1) {
			while(text.indexOf(mark) !== -1) {
				var start = '<%1>'.arg(tag)
				var back = '</%1>'.arg(tag)
				temp1 ? text = text.replace(mark, back) : text = text.replace(mark, start)
				temp1 = !temp1
			}
		}
		return text
	}
	
	onTextChanged: {
		if (!this.enabled)
			return

		var text = this.text
		text = this._checkMarkdown(text, '**', 'b')
		text = this._checkMarkdown(text, '__', 'i')
		this.parent.text = text
	}
}