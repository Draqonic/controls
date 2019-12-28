/// web browser checkbox
BaseInput {
	property bool checked: false;	///< checked flag value
	height: 20;
	width: 20;
	type: "checkbox";

	onCheckedChanged: {
		this.element.setAttribute('checked', value)
	}

	constructor: {
		this.element.on("change", function() {
			this.checked = this.element.getAttribute('checked')
		}.bind(this))
	}
}
