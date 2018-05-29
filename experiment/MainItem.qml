Item {
	id: mainItemPrivateItem;
	property bool active: context.system.pageActive;
	anchors.fill: parent;
	property Color color;
	property string title;
	property bool mobile: context.system.device === System.Mobile || width < height;

	constructor: {
		this.title = document.title
	}

	Rectangle {
		id: mainItemBackground;
		fixed: true;
		anchors.fill: parent;
        	color: "transparent";
		Behavior on background { Animation { duration: 500; } }	
	}

    onColorChanged: { mainItemBackground.color = value; document.body.style.background = _globals.core.Color.normalize(value) }
    onTitleChanged: { document.title = value }
}