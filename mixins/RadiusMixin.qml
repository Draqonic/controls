/// radius
BaseMixin {
	property bool enabled: true;	///< enable/disable mixin
	property int leftTop;
	property int leftBottom;
	property int rightTop;
	property int rightBottom;

	///@private
	onLeftTopChanged,
	onLeftBottomChanged,
	onRightTopChanged,
	onRightBottomChanged,
	onEnabledChanged: {
		if (!this.enabled) {
			log(this.enabled, this.parent.radius)
			this.parent.style('border-radius', this.parent.radius)
			return
		}

		var radius = this.leftTop + "px " + this.rightTop + "px " + this.rightBottom + "px " + this.leftBottom + "px "
		this.parent.style('border-radius', radius)
	}
}
