///item for embedded youtube video
// TODO
IFrame {
	property string source;			///< video source URL
	property bool allowFullScreen;	///< allow fullscreen flag
	height: 315;	///<@private
	width: 560;		///<@private

	///@private
	onWidthChanged,
	onHeightChanged: { this._updateSize(); }

	///@private
	onSourceChanged: {
		// TODO: urls without https, urls with www
		if (this.source.indexOf("watch?v=") > -1 || this.source.indexOf("youtu.be") > -1) {
			var source = this.source
			source = source.replace("watch?v=", "embed/")
			source = source.replace("youtu.be", "youtube.com/embed/")
			this.source = source
			return
		}
		this.element.dom.src = this.source
	}

	///@private
	onAllowFullScreenChanged: { this.element.dom.allowFullscreen = value; }

	///@private
	function getTag() { return 'iframe' }

	///@private
	function _updateSize() {
		var style = { width: this.width, height: this.height }
		this.style(style)
	}
}
