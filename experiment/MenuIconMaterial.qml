Item {
	id: menuIconPrivate;
	width: 24;
	height: 24;
	property Color color: "black";
	property int animationDuration: 150;
	property int colorDuration: 150;
	property bool activated;

	Behavior on rotation { Animation { duration: menuIconPrivate.animationDuration; } }

	Rectangle {
		id: bar1;
		x: 2;
		y: 5;
		width: 20;
		height: 2;
 		color: parent.color;
		Behavior on background { Animation { duration: menuIconPrivate.colorDuration; } }
		Behavior on rotation, x, y, width, height { Animation { duration: menuIconPrivate.animationDuration; } }
	}

	Rectangle {
		id: bar2;
		x: 2;
		y: 10;
		width: 20;
		height: 2;
		color: parent.color;
		Behavior on background { Animation { duration: menuIconPrivate.colorDuration; } }
		Behavior on rotation, x, y, width, height { Animation { duration: menuIconPrivate.animationDuration; } }
	}

	Rectangle {
		id: bar3;
		x: 2;
		y: 15;
		width: 20;
		height: 2;
		color: parent.color;
		Behavior on background { Animation { duration: menuIconPrivate.colorDuration; } }
		Behavior on rotation, x, y, width, height { Animation { duration: menuIconPrivate.animationDuration; } }
	}

	function activate() {
		menuIconPrivate.rotation = 180
		bar1.rotation = 45
		bar1.width = 13
		bar1.x = 9.5
		bar1.y = 8
		bar2.width = 17
		bar2.x = 3
		bar2.y = 12
		bar3.rotation = -45
		bar3.width = 13
		bar3.x = 9.5
		bar3.y = 16
		this.activated = true
	}

	function deactivate() {
		menuIconPrivate.rotation = 0
		bar1.rotation = 0
		bar1.width = 20
		bar1.x = 2
		bar1.y = 5
		bar2.width = 20
		bar2.x = 2
		bar2.y = 10
		bar3.rotation = 0
		bar3.width = 20
		bar3.x = 2
		bar3.y = 15
		this.activated = false
	}
}
