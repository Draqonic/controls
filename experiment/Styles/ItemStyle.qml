Object {
	property int width;
	property int height;
	property bool clip;
	property real radius;
	property real scale: 1;
	property bool fixed;
	property bool visible: true;
	property real opacity: 1;
	property real rotation;
	
	property Object effects: EffectsStyle { }
	//property Object transform;
	
	function _itemStyle(obj) {
		if (!obj.width)
			obj.width = this.width
		if (!obj.height)
			obj.height = this.height
		if (!obj.clip)
			obj.clip = this.clip
		if (!obj.radius)
			obj.radius = this.radius
		if (obj.scale === 1)
			obj.scale = this.scale
		if (!obj.fixed)
			obj.fixed = this.fixed
		if (obj.visible)
			obj.visible = this.visible
		if (obj.opacity === 1)
			obj.opacity = this.opacity
		if (!obj.rotation)
			obj.rotation = this.rotation

		if (this.effects.blur)
			obj.effects.blur = this.effects.blur
		if (this.effects.grayscale)
			obj.effects.grayscale = this.effects.grayscale
		if (this.effects.sepia)
			obj.effects.sepia = this.effects.sepia
		if (this.effects.brightness)
			obj.effects.brightness = this.effects.brightness
		if (this.effects.contrast)
			obj.effects.contrast = this.effects.contrast
		if (this.effects.hueRotate)
			obj.effects.hueRotate = this.effects.hueRotate
		if (this.effects.invert)
			obj.effects.invert = this.effects.invert
		if (this.effects.saturate)
			obj.effects.saturate = this.effects.saturate
		if (this.effects.shadow.x)
			obj.effects.shadow.x = this.effects.shadow.x
		if (this.effects.shadow.y)
			obj.effects.shadow.y = this.effects.shadow.y
		if (this.effects.shadow.blur)
			obj.effects.shadow.blur = this.effects.shadow.blur
		if (this.effects.shadow.spread)
			obj.effects.shadow.spread = this.effects.shadow.spread
		if (this.effects.shadow.color !== "black")
			obj.effects.shadow.color = this.effects.shadow.color
	}

	function _getStyle(obj) {
		this._itemStyle(obj)
	}
}