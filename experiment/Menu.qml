Rectangle {
	// TODO: correct position for window end
	// TODO: add, remove items, visible

	id: prvtMenuItem;
	width: prvtMenuListView.width;
	height: Math.min(300, prvtMenuListView.height);
	OverflowMixin { value: OverflowMixin.ScrollY; }
	visible: false;
	property bool menuMode: true;
	property string textRole: "value";
	property int count: prvtMenuListView.model.count;
	signal clicked;
	color: "white";
	z: 10;
	property int buttonZ;

	constructor: {
		this.objs = []
	}

	property alias model: prvtMenuListView.model;

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

	property var objs;
	ListView {
		id: prvtMenuListView;
		width: contentWidth;
		height: contentHeight;
		model: ListModel {
			id: prvtMenuListModel;
		}

		delegate: AbstractButton {
			z: prvtMenuItem.buttonZ
			width: Math.max(prvtMenuItem.width, Math.max(privateAbstractButtonRow.width + 15, 100%));
			position: model.position

			onCompleted: {
				this.text = model[prvtMenuItem.textRole]
				if (!model.icon) return
				if (model.icon.source)
					this.icon.source = model.icon.source
				if (model.icon.opacity >= 0)
					this.icon.opacity = model.icon.opacity
				if (model.icon.width > 0)
					this.icon.width = model.icon.width
				if (model.icon.height > 0)
					this.icon.height = model.icon.height
			}

			onClicked: {
				prvtMenuItem.close()
				prvtMenuItem.clicked(model.index, model[prvtMenuItem.textRole])
				if (prvtMenuItem.objs[model.index])
					prvtMenuItem.objs[model.index].triggered()
			}
		}
	}
}