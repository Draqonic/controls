Item {
	width: prvtComboBoxButton.width;
	height: prvtComboBoxButton.height;
	property alias model: prvtMenuListView.model;
	property string currentText: "ComboBox";
	property string displayText: currentText;
	property int currentIndex; // TODO: changed
	property alias textRole: prvtComboBoxMenu.textRole;
	property int count: prvtMenuListView.model.count;
	property int menuWidth;

	onCompleted: {
		if  (this.currentIndex > this.model.count)
			this.currentIndex = 0

		if (this.model.count)
			this.currentText = prvtMenuListView.model.get(this.currentIndex)[this.textRole]
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
		y: parent.height + 2;
		menuMode: false;

		onClicked(index, name): {
			this.parent.currentText = name
			this.parent.currentIndex = index
			prvtComboBoxMenu.visible = false
		}
	}
}