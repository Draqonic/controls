Item {
	width: prvtComboBoxButton.width;
	height: prvtComboBoxButton.height;
	property alias model: prvtMenuListView.model;
	property string currentText: "";
	property string displayText: currentText;
	property int currentIndex: 0; // TODO: onCurrentIndexChanged
	property alias textRole: prvtComboBoxMenu.textRole;
	property int count: prvtMenuListView.model.count;
	property int menuWidth;
	property var button: prvtComboBoxButton;
	property var menu: prvtComboBoxMenu;

	onCompleted: {
		if  (this.currentIndex > this.model.count)
			this._setProperty('currentIndex', 0)

		if (this.model.count && this.currentIndex >= 0) {
			this.currentText = this.model instanceof _globals.core.ListModel
							? this.model.get(this.currentIndex)[this.textRole]
								: this.model[this.currentIndex]
		}
	}

	AbstractButton {
		id: prvtComboBoxButton;
		text: parent.displayText;
		colors.default: "white";
		width: Math.max(privateAbstractButtonRow.width + 15, parent.width);
		height: Math.max(45, parent.height);

		onClicked: {
			prvtComboBoxMenu.visible = !prvtComboBoxMenu.visible
		}
	}

	Menu {
		id: prvtComboBoxMenu;
		anchors.horizontalCenter: parent;
		width: parent.menuWidth ? parent.menuWidth : Math.max(prvtComboBoxButton.width, privateAbstractButtonRow.width + 15);
		//height: maximum to page end
		menuMode: false;

		onClicked(index, name): {
			this.parent.currentText = name
			this.parent.currentIndex = index
			prvtComboBoxMenu.visible = false
		}
	}
}