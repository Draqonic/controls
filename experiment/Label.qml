Text {
	font.family: applicationWindow.theme.font.family;
	property Markdown markdown: Markdown { }
	property Emoji emoji: Emoji { }
	property string textContent;

	color: applicationWindow.theme.fontColorMain;
	
	onTextChanged: {
		this.textContent = this.element.dom.textContent
	}
}