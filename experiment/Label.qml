Text {
	font.family: "Roboto";
	property Markdown markdown: Markdown { }
	property Emoji emoji: Emoji { }
	property string textContent;

	onTextChanged: {
		this.textContent = this.element.dom.textContent
	}
}