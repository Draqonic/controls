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
	
	//property lazy effects;
	//property lazy transform;
	
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
	}
	
	function _getStyle(obj) {
		this._itemStyle(obj)
	}
}