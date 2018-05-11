ItemStyle {
	property color color;
	//property lazy border;
 	//property Gradient gradient;
	
	function _rectStyle(obj) {
		if (obj.color === "#ffffff")
			obj.color = this.color
	}
	
	function _getStyle(obj) {
		this._itemStyle(obj)
		this._rectStyle(obj)
	}
}