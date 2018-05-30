Item {
	width: prvtComboBoxButton.width;
	height: prvtComboBoxButton.height;
	property alias model: prvtMenuListView.model;
	property string currentText: "ComboBox";
	property string displayText: currentText;
	property int currentIndex; // TODO: changed
	property alias textRole: prvtComboBoxMenu.textRole;
	property int count: prvtMenuItem.count;
	property int menuWidth;
	
	onCompleted: {
		if  (this.currentIndex > this.model.count)
			this.currentIndex = 0

		if (this.model.count)
			this.currentText = prvtMenuListView.model.get(this.currentIndex)[this.textRole]
	}

	ButtonMaterial {
		id: prvtComboBoxButton;
		text: parent.displayText;
		onClicked: {
			prvtComboBoxMenu.openOrClose()
		}
	}

	MenuMaterial {
		id: prvtComboBoxMenu;
		anchors.horizontalCenter: parent;
		width: parent.menuWidth ? parent.menuWidth : privateAbstractButtonRow.width + 15;
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