Object {
	property string text;
	property int currentIndex;
	signal triggered;
	onCompleted: {
		this.parent.model.append({text: this.text })
		this.parent.objs.push(this)
		currentIndex = this.parent.objs.length - 1
	}
}