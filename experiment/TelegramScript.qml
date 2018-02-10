Item {
	property string source;
	signal loaded;

	constructor: {
		this.element.dom.setAttribute('type', 'text/javascript')
	} 


	function _delayedLoad() {
	this._context.delayedAction('script:load', this, function load() {
			var source = this.source
			if (!source)
				return
				
			this.element.dom.setAttribute('data-telegram-post', source)
			//this.element.dom.setAttribute('data-width', "")
			this.element.dom.setAttribute('src', "https://telegram.org/js/telegram-widget.js?1")
	
			log(this.element.dom)
		})
	}

	onSourceChanged:	{ this._delayedLoad() }
	onCompleted:		{ this._delayedLoad() }

	function getTag() { return 'script' }	

	Timer {
		interval: 2000;
		running: true;
		onTriggered: {
			this.parent.loaded()
		}
	}
}