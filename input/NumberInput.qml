///number input
BaseInput {
	property float max;		///< maximum number value
	property float min;		///< minimum number value
	property float step;	///< number step value
	property float value;	///< number value
	horizontalAlignment: BaseInput.AlignHCenter;
	width: 50;
	height: 25;
	type: "number";

	onMinChanged: { this.element.setProperty('min', value) }
	onMaxChanged: { this.element.setProperty('max', value) }
	onStepChanged: { this.element.setProperty('step', value) }
	onValueChanged: { this._setValue(value) }

	constructor: {
		this.element.on("input", function() {
			this.value = this._getValue()
		}.bind(this))
	}
}
