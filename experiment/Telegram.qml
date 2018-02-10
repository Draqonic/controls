//TODO: Script To Item
Item {
	id: telegram;
	signal loaded;
	property string source;
	width: 300;
	height: 300;

	onCompleted: { script.source = this.source }
	
	TelegramScript {
		id: script;
		onLoaded: {
			telegram.width = script.element.dom.previousSibling.clientWidth
			telegram.height = script.element.dom.previousSibling.clientHeight
		}
	}
}
