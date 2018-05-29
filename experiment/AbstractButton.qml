Rectangle {
	id: privateAbstractButton;
	property string text;
	property bool pressed: privateAbstractButtonMouse.pressed;
	property bool hovered: privateAbstractButtonMouse.containsMouse;
	property bool enabled: true;
	property enum position { None, Center, Left, Right}: Center;
	color: hovered ? (pressed ? colors.pressed : colors.hovered) : colors.default;
	width: privateAbstractButtonRow.width + 15;
	height: 45;
	signal clicked;
	property alias font: privateAbstractButtonText.font;
	property int spacing: 5;

	property Object colors: Object {
		id: privateAbstractButtonColor;
		property string pressed: "darkgray";
		property string hovered: "lightgray";
		property string default: "transparent";

		property string text: "black";
		//textPressed
		//textHovered
	}

	property Object icon: Object {
		id: privateAbstractButtonIcon;
		property string source;
		property int width: parent.height;
		property int height: 0; // TODO
		property real opacity: 1;
	}

	Row {
		id: privateAbstractButtonRow;
		spacing: !privateAbstractButtonText.text || !privateAbstractButtonIcon.source ? 0 : privateAbstractButton.spacing;
		anchors.left: privateAbstractButton.position === parent.Left ? parent.left : null;
		anchors.right: privateAbstractButton.position === parent.Right ? parent.right : null;
		anchors.centerIn: privateAbstractButton.position === parent.Center ? parent : null;
		anchors.verticalCenter: privateAbstractButton.position !== parent.Center ? parent.verticalCenter : null;

		Image {
			anchors.verticalCenter: parent.verticalCenter;
			width: source ? privateAbstractButtonIcon.width : 0;
			height: privateAbstractButtonIcon.height ? privateAbstractButtonIcon.height : source ? sourceHeight : 0;
			source: privateAbstractButtonIcon.source;
			opacity: privateAbstractButtonIcon.opacity;
			fillMode: privateAbstractButtonIcon.height ? Image.Stretch : Image.PreserveAspectFit;
			onHeightChanged, onWidthChanged: { log(this.width, this.height, "?") }
		}

		Text {
			id: privateAbstractButtonText;
			anchors.verticalCenter: parent.verticalCenter;
			text: privateAbstractButton.text;
			color: privateAbstractButtonColor.text;
		}
	}

	MouseArea {
		id: privateAbstractButtonMouse;
		anchors.fill: parent;
		onClicked: { if (privateAbstractButton.enabled) this.parent.clicked() }
	}
}
