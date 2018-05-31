Object {
	property string text;
	property int currentIndex;
	signal triggered;
	// TODO: text changes

	onCompleted: {
		this.parent.model.append({"value": this.text })
		this.parent.objs.push(this)
		this.currentIndex = this.parent.objs.length - 1
	}
}