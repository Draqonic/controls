Item {
	width: 100%;
	height: 8;
	clip: true;
	property alias effects: prvtTriangle.effects;

	property color color: "white";
	
	Rectangle {
		z: parent.z;
    	anchors.horizontalCenter: parent;
		id: prvtTriangle;
		color: parent.color
		anchors.top: parent;
		width: parent.height * 2;
		height: parent.height * 2;
		rotation: 45;
	}   
}