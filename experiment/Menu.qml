Item {
	// TODO: correct position for window end
	// TODO: add, remove items, visible

	id: prvtMenuItem;
	width: 200;
	height: Math.min(300, prvtMenuListView.height);
	OverflowMixin { value: OverflowMixin.ScrollY; }
	visible: false;
	property bool menuMode: true;
	signal clicked;
	
	constructor: {
		this.objs = []
	}

	onCompleted: {
		this.background._replaceUpdater('width', function() { this.background.width = this.width }.bind(this), [[this, 'width']])
		this.background._replaceUpdater('height', function() { this.background.height = prvtMenuListView.height }.bind(this), [[prvtMenuListView, 'height']])
	}

	property alias model: prvtMenuListView.model;

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
 		this.visible ? this.visible = false : this.open()
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
		model: ListModel {
			id: prvtMenuListModel;
		}
		z: 1;
		delegate: ItemDelegate {
			width: 100%;
			text: model.modelData;
			onClicked: {
				prvtMenuItem.close()
				prvtMenuItem.clicked(model.index, model.modelData)
				if (prvtMenuItem.objs[model.index])
					prvtMenuItem.objs[model.index].triggered()
			}
		}
	}
}