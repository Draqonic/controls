Text {
	property Markdown markdown: Markdown { }
	property Emoji emoji: Emoji { }
	property string textContent;
	property bool hyphens;
	property bool hyphenopoly; // github.com/mnater/Hyphenopoly support
	property string lang;

	onTextChanged: {
		this.textContent = this.element.dom.textContent
	}

	onHyphensChanged: {
		if (!this.lang)
			this.lang = 'en'

		var hyphens = this.hyphens ? 'auto' : 'none'
		this.style('hyphens', hyphens)
	}

	onHyphenopolyChanged: {
		this.class = 'hyphenopoly'
	}

	onLangChanged: {
		this.element.dom.setAttribute('lang', value)
	}
}