Item {
	id: applicationWindow;
	property Theme theme: Theme { }
	
	onCompleted: { 

	 }

	OverflowMixin { global: true; value: OverflowMixin.ScrollY; }
	signal scrolling;
	property Object scroll: Object {
		property real x: -1;
		property real y: -1;
		property int maxX: -1;
		property int maxY: -1;
		property int width: -1;
		property int height: -1;
		
		function change(x, y) {
			window.scroll({
				left: x,
	      			top: y,
	      			behavior: 'smooth' 
			});
		}
	}
	
	constructor: {
		window.onscroll = function() {
			this.scroll.x = window.pageXOffset
			this.scroll.y = window.pageYOffset
			this.scroll.height = document.documentElement.scrollHeight
			this.scroll.width = document.documentElement.scrollWidth
			this.scrolling()
		}.bind(this);
	}
	
	/* // TODO: move to overflow; overflow -> move to ScrollView
	constructor: {
		document.documentElement.onscroll = function() {
			this.scroll.x = this.element.dom.scrollLeft
			this.scroll.y = this.element.dom.scrollTop
			this.scroll.maxX = this.element.dom.scrollLeftMax
			this.scroll.maxY = this.element.dom.scrollTopMax
			this.scroll.height = this.element.dom.scrollHeight
			this.scroll.width = this.element.dom.scrollWidth
			this.scrolling()
		}.bind(this);
	}
	*/

	anchors.fill: parent;
	property bool dark: theme.dark;
	
	Rectangle {
		fixed: true;
		anchors.fill: parent;
		color: applicationWindow.theme.bgColor;
		Behavior on background { Animation { duration: 500; } }	
	}

	
	// Button
	WebItem {
		clip: true;
		id: button;
		anchors.centerIn: parent;
		effects.shadow.x: 1	;
		effects.shadow.y: 1;
		effects.shadow.color: "#d3d3d3";
		effects.shadow.blur: 6;
		effects.shadow.spread: 2;
		width: 120;
		height: 50;
		Label {
			anchors.fill: parent;
			horizontalAlignment: Label.AlignHCenter;
			verticalAlignment: Label.AlignVCenter;
			text: "THEMED!";
		}
		Rectangle {
			id: ripple;
			visible: mouseRipple.pressed;
			onVisibleChanged: { log("WTF", this.visible) }
			color: "red";
			height: 10;
			width: 10;
			radius: width / 2;
			opacity: 0.3;
			anchors.centerIn: parent;
			property bool anim: false;
			Behavior on width, height { Animation { running: ripple.anim;  duration: 1050; } }
			//Behavior on x, y { Animation { running: ripple.anim; duration: 650; } }
		}
		MouseArea {
			id: mouseRipple;
			anchors.fill: parent;
		onClicked: {
			switch(applicationWindow.theme.theme) {
			case Theme.Light:
				applicationWindow.theme.theme = Theme.Dark
				break
			case Theme.Dark:
				applicationWindow.theme.theme = Material.Light
				break
			case Material.Light:
				applicationWindow.theme.theme = Material.Dark
				break
			case Material.Dark:
				applicationWindow.theme.theme = Theme.Light
				break
		}
		}
			onPressedChanged: {
				if (this.pressed) {
					ripple.x = (this.mouseX - 5) / 2
					ripple.y = (this.mouseY - 5) /2
					ripple.width = button.width * 1.5
					ripple.height = button.width * 1.5
					ripple.color = "green"
				} else {
					ripple.width = 10
					ripple.height = 10
					ripple.color = "red"
				}
				//log("PRESS", this.pressed)
				//if (!this.pressed)
			//	//	ripple.visible = false
			}
		}
	}

	Button {
		anchors.centerIn: parent;
		effects.shadow.x: 1	;
		effects.shadow.y: 1;
		effects.shadow.color: "#d3d3d3";
		effects.shadow.blur: 6;
		effects.shadow.spread: 2;
		width: 120;
		height: 50;
		visible: false;
		Label {
			anchors.fill: parent;
			horizontalAlignment: Label.AlignHCenter;
			verticalAlignment: Label.AlignVCenter;
			text: "THEMED!";
		}
		onClicked: {
			switch(applicationWindow.theme.theme) {
			case Theme.Light:
				applicationWindow.theme.theme = Theme.Dark
				break
			case Theme.Dark:
				applicationWindow.theme.theme = Material.Light
				break
			case Material.Light:
				applicationWindow.theme.theme = Material.Dark
				break
			case Material.Dark:
				applicationWindow.theme.theme = Theme.Light
				break
		}
		}
	}
	
	property int sss: context.system.pageActive;
	//property Font fonnt: context.font;
	//onSssChanged: { log("!", context.theme.font ) }
	
	Column {
		height: 70%;
		anchors.centerIn: parent;
	Text {
		text: "<br><br><br><br><h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	Label {
		text: "<h1>Test!</h1>";
	}
	}
}