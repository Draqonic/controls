WebItem {
	id: toTop;
	property bool enabled: true;
	height: 100%;
	width: 70;
	color: activeHover && enabled ? "gray" : "#d3d3d3";
	activeHoverEnabled: true;
	fixed: true;
	opacity: 0;
	visible: opacity > 0;
	//onOpacityChanged: { log("OPACITY", value) }
	Behavior on opacity, background { Animation { duration: 500; } }
	property int scroll: applicationWindow.scroll.y;

	onScrollChanged: {
		if (this.toTopStatus && value > 100) {
			lab.back = 0
			this.toTopStatus = false
		}
		if (!this.toTopStatus && lab.back > 0 & !value)
			this.toTopStatus = true
		if (!lab.back)
			opa.start()
	}
	property bool toTopStatus: false;
		
	Timer {
		id: opa;
		interval: 10;
		onTriggered: { toTop.opacity = applicationWindow.scroll.y > 100 ? 0.5 : 0 }
	}

	onClicked: {
		if (!toTop.enabled)
			return
		
		log("lab", lab.back, lab.back === 0)
		if (lab.back === 0) {
			lab.back = applicationWindow.scroll.y
			applicationWindow.scroll.change(0, 0)
			log("to 0")
		} else {
			applicationWindow.scroll.change(0, lab.back)
			log("to", lab.back)
			lab.back = 0
		}
	}
	
	Label {
		id: lab;
		property int back: 0;
		text: back === 0 ? "Up" :  "Back";
		color: "white";
		anchors.centerIn: parent;
	}
}