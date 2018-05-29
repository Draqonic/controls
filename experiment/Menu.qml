Item {
	// TODO: correct position for window end
	// TODO: add, remove items, visible

	id: prvtMenuItem;
	width: 200;
	height: prvtMenuListView.height; // 300
	visible: false;
	property bool menuMode: true;
	
	constructor: {
		this.objs = []
	}

	onCompleted: {
		this.background.anchors.fill = this
	}

	property Object model: ListModel {
		id: prvtMenuListModel;
	}

	property Object background: Rectangle {
		color: "white";
	}

	function open() {
		if (this.menuMode) {
			this.x = window.event.clientX + 10
			this.y = window.event.clientY + 10
		}
		this.visible = true
	}

	function close() {
		if (this.menuMode)
			this.visible = false
	}

	function openOrClose() {
 		this.visible ? this.close() : this.open()
	}

	Rectangle {
		color: "white";
		width: 20;
		height: 20;
		radius: 10;
		onCompleted: { this.color = prvtMenuItem.background.color }
		border.width: 2;
		z: 2;
		x: parent.width - 10;
		y: -10;
		visible: false;
		MousePressMixin { onPressedChanged: { prvtMenuItem.close() } }
	}
	
	property var objs;
	ListView {
		id: prvtMenuListView;
		width: 100%;
		height: contentHeight;
		model: parent.model;
		z: 1;
		
		delegate: ItemDelegate {
			width: 100%;
			text: model.text;
			onClicked: {
				prvtMenuItem.close()
				prvtMenuItem.objs[model.index].triggered()
			}
		}
	}
}