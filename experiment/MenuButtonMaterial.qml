Rectangle {
	id: menuButtonPrivate;
	width: 24;
	height: 24;
	property Color colorIcon: "black";
	property string colorPressed: "darkgray";
	property string colorHovered: "lightgray";
	property int animationDuration: 150;
	property int colorDuration: 150;
	property bool hovered: hover.value;
	color: hovered ? (pressMixin.pressed ? colorPressed : colorHovered) : "transparent";

	signal clicked;

	MenuIconMaterial {
		id: menuIconPrivate;
		anchors.centerIn: parent;
		color: parent.colorIcon;
		animationDuration: parent.animationDuration;
		colorDuration: parent.colorDuration;
	}

	MousePressMixin {
		id: pressMixin;
		onPressedChanged: {
			if (!this.pressed) {
				menuIconPrivate.activated ? menuIconPrivate.deactivate() : menuIconPrivate.activate()
				menuButtonPrivate.clicked()
			}
		}
	}

	HoverMixin {
		id: hover;
	}
}
