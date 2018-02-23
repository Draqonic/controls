///setup page overflow mode
BaseMixin {
	property enum value { Visible, Hidden, Scroll, ScrollX, ScrollY };	///< global page overflow mode value, can be:  Visible, Hidden, Scroll, ScrollX, ScrollY

	/// @internal
	_updateOverflow(value): {
		switch(value) {
			case this.Visible:
				document.documentElement.style.overflow = 'visible'
				break;
			case this.Hidden:
				document.documentElement.style.overflow = 'hidden'
				break;
			case this.Scroll:
				document.documentElement.style.overflow = 'auto'
				break;
			case this.ScrollX:
				document.documentElement.style.overflow = 'auto'
				document.documentElement.style.overflowY = 'hidden'
				break;
			case this.ScrollY:
				document.documentElement.style.overflow = 'auto'
				document.documentElement.style.overflowX = 'hidden'
				break;
		}
	}

	onValueChanged: { this._updateOverflow(value) }
	onCompleted: { this._updateOverflow(this.value) }
}
