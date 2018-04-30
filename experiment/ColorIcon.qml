Rectangle {
	property string source;
	Behavior on background { Animation { duration: 100; } } // Firefox hack
	
	onCompleted: {
		var browser = context.system.browser
		//console.log(browser, browser == "Edge", ["IE", "Edge"].indexOf(browser) !== -1)
		if (["IE", "Edge"].indexOf(browser) !== -1)
			this.visible = false
	}

	onSourceChanged: {
		var mask = "url(" + this.source + ")"
		this.style("mask-image", mask)
		this.style("-webkit-mask-image", mask)
	}

	onWidthChanged, onHeightChanged: {
		var size = this.width + "px " + this.height + "px"
		this.style("mask-size", size)
		this.style("-webkit-mask-size", size)
	}
}