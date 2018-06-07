Object {
	property string text;
	property int currentIndex;
	property bool visible: true;
	property Object icon: Object {
		property string source;
		property int width;
		property int height;
		property real opacity: 1;
	}
	property int position: 1;
	signal triggered;
	// TODO: changes

	onCompleted: {
		this.parent.model.append({"value": this.text, "visible": this.visible, "position": this.position, "icon": { "source": this.icon.source, "width": this.icon.width, "height": this.icon.height, "opacity": this.icon.opacity} })
		this.parent.objs.push(this)
		this.currentIndex = this.parent.objs.length - 1
	}
}