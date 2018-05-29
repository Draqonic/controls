Item {
	width: prvtComboBoxButton.width;
	height: prvtComboBoxButton.height;
	property alias model: prvtComboBoxMenu.model;
	property alias text: prvtComboBoxButton.text;
	property int currentIndex; // TODO: changed

	ButtonMaterial {
		id: prvtComboBoxButton;
		text: "ComboBox";
		onClicked: {
			prvtComboBoxMenu.openOrClose()
		}
	}

	MenuMaterial {
		id: prvtComboBoxMenu;
		menuMode: false;
		anchors.horizontalCenter: parent;
		//height: maximum to page end
		y: parent.height + 3;

		onModelChanged: {
			if (this.model.count)
				this.parent.text = this.model.get(0).modelData
			else
				this.parent.text = "Empty"
		}

		onClicked(index, name): {
			this.parent.text = name
			this.parent.currentIndex = index
		}
	}
}