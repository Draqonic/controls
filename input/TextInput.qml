///HTML text input item
BaseInput {
	property string text;		///< input text string property
	height: 20;	///<@private
	width: 173;	///<@private
	backgroundColor: "transparent";
	property Validator validator;
	property int length;
	property enum echoMode { Normal, Password, NoEcho, PasswordEchoOnEdit };
	property enum horizontalAlignment { AlignLeft, AlignRight, AlignHCenter, AlignJustify };
	property string selectedText;
	property int selectionStart;
	property int selectionEnd;
	property int maximumLength;
	property bool cursorVisible: true;

	onTextChanged: {
		this._updateValue(value)
		this.length = this.element.dom.textLength
	}

	constructor: {
		this.element.on("input", function() {
			this.text = this._getValue()
		}.bind(this))
		this.element.on('select', context.wrapNativeCallback(function() {
			this.selectionStart = this.element.dom.selectionStart
			this.selectionEnd = this.element.dom.selectionEnd
			this.selectedText = this.getText(this.selectionStart, this.selectionEnd)
		}.bind(this)))
		this.element.on('focus', context.wrapNativeCallback(function() {
			this.focused = true
		}.bind(this)))
		this.element.on('blur', context.wrapNativeCallback(function() {
			this.focused = false
		}.bind(this)))
	}

	onEchoModeChanged: {
		switch(value) {
		case this.Normal: this.type = "text"; break;
		case this.Password: this.type = "password"; break;
		//case this.NoEcho: break;
		//case this.PasswordEchoOnEdit: break;
		}
	}

	onHorizontalAlignmentChanged: {
		switch(value) {
		case this.AlignLeft:	this.style('text-align', 'left'); break
		case this.AlignRight:	this.style('text-align', 'right'); break
		case this.AlignHCenter:	this.style('text-align', 'center'); break
		case this.AlignJustify:	this.style('text-align', 'justify'); break
		}
	}

	onMaximumLengthChanged: { this.element.dom.maxLength = value }
	onCursorVisibleChanged: { this.style('caret-color', _globals.core.normalizeColor("transparent")) }

	function clear() {
		this.text = ''
	}

	function insert(position, text) {
		this.text = this.text.slice(0, position) + text + this.text.slice(position);
	}

	function remove(start, end) {
		this.text = this.text.slice(0, start) + this.text.slice(end);
	}

	function select(start, end) {
		this.element.dom.focus()
		this.element.dom.setSelectionRange(start, end)
	}

	function selectAll() {
		this.element.dom.select()
	}

	function getText(start, end) {
		return this.text.substring(start, end)
	}


	function copy() {
		document.execCommand("Copy");
	}

	function cut() {
		document.execCommand("Cut");
	}

	function selectWord() {
	}
	
	//property int cursorPosition;
	
	
	// TODO
	property color selectedTextColor: "red";
	onSelectedTextColorChanged: {
		log("COLOR")
		
	}
	// selectionColor
	// alignment
	
	function deselect() {
	}
	
	function paste() {
	}
	
	function redo() {
	}
}
