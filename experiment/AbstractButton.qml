    Rectangle {
        id: privateAbstractButton;

        property string text;
        property bool pressed: privateAbstractButtonMouse.pressed;
        property bool hovered: privateAbstractButtonMouse.containsMouse;
        color: hovered ? (pressed ? privateAbstractButtonColor.pressed : privateAbstractButtonColor.hovered) : privateAbstractButtonColor.default;
        width: privateAbstractButtonRow.width + 15;
        height: 45;
        signal clicked;

        property Object colors: Object {
            id: privateAbstractButtonColor;
            property string pressed: "darkgray";
            property string hovered: "lightgray";
            property string default: "transparent";

            property string text: "black";
            //textPressed
            //textHovered
        }

        property Object icon: Object {
            id: privateAbstractButtonIcon;
            property string source;
            property int width: parent.height;
            property int height: 0; // TODO
        }

        Row {
            id: privateAbstractButtonRow;
            anchors.centerIn: parent;
            spacing: 5;
            Image {
                anchors.verticalCenter: parent.verticalCenter;
                width: source ? privateAbstractButtonIcon.width : 0;
                height: privateAbstractButtonIcon.height ? privateAbstractButtonIcon.height : sourceHeight;
                source: privateAbstractButtonIcon.source;
                fillMode: privateAbstractButtonIcon.height ? Image.Stretch : Image.PreserveAspectFit;
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter;
                text: privateAbstractButton.text;
                color: privateAbstractButtonColor.text;
            }
        }

        MouseArea {
            id: privateAbstractButtonMouse;
            anchors.fill: parent;
            onClicked: { this.parent.clicked() }
        }
    }
