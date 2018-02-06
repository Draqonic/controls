Item {
	id: telegram;
	signal loaded;
	property string source;
	width: 300;
	height: 300;

	onCompleted: { script.source = this.source }
	
	Script {
		signal loaded;
		id: script;
		function load() {
			var source = this.source
			if (!source)
				return
			
			this.element.dom.setAttribute('data-telegram-post', source)
			//this.element.dom.setAttribute('data-width', "")
			this.element.dom.setAttribute('src', "https://telegram.org/js/telegram-widget.js?1")

			log(this.element.dom)

		}

		Timer {
			interval: 2000;
			running: true;
			onTriggered: {
				telegram.width = script.element.dom.previousSibling.clientWidth
				telegram.height = script.element.dom.previousSibling.clientHeight
				telegram.loaded()
			}
		}
	}
}
