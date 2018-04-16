Item {
	width: 120;
	height: ti.height + 15;
	property string text: "";
	property enum echoMode;
	property var textInput: ti;
	property Color materialColor: "#E91E63";
	property alias font: ti.font;
	property alias placeholder: ti.placeholder;

	onMaterialColorChanged: {
		ti.style('caret-color', _globals.core.normalizeColor(this.materialColor))
	}

	TextInput {
		id: ti;
		width: 100%;
		height: font.pixelSize + font.pixelSize * 0.4;
		font.family: "Roboto";
		placeholder.family: "Roboto";
		font.pointSize: 12.1; // 16px
		text: parent.text;
		echoMode: parent.echoMode;
	}

	Rectangle {
		anchors.bottom: parent.bottom;
		anchors.bottomMargin: 8 + ti.font.pixelSize * 0.1;
		height: hover.value || ti.focused ? 2 : 1;
		width: 100%;
		color: hover.value ? (ti.focused ? parent.materialColor : "black") : (ti.focused ? parent.materialColor : "gray");
	}

	HoverMixin {
		id: hover;
	}
}