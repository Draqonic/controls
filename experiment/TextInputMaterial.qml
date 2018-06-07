Item {
	width: 120;
	height: ti.height + 15;
	property alias text: ti.text;
	property alias color: ti.color;
	property alias echoMode: ti.echoMode;
	property var textInput: ti;
	property Color materialColor: "#E91E63";
	property alias font: ti.font;
	property alias placeholder: ti.placeholder;
	property alias enabled: ti.enabled;

	onMaterialColorChanged: {
		ti.style('caret-color', _globals.core.Color.normalize(this.materialColor))
	}

	TextInput {
		id: ti;
		width: 100%;
		height: font.pixelSize * 1.4;
		font.pixelSize: 16;
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