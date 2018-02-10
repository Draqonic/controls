///setup parents overflow mode
BaseMixin {
	property bool global: false;
	property enum value { Visible, Hidden, Scroll, ScrollX, ScrollY };	///< overflow mode value, can be:  Visible, Hidden, Scroll, ScrollX, ScrollY

	/// @internal
	_updateOverflow(value): {
		switch(value) {
			case this.Visible:
				if (!this.global)
					this.parent.style('overflow', 'visible');
				else
					document.documentElement.style.overflow = 'visible'
				break;
			case this.Hidden:
				if (!this.global)
					this.parent.style('overflow', 'hidden');
				else
					document.documentElement.style.overflow = 'hidden'
				break;
			case this.Scroll:
				if (!this.global)
					this.parent.style('overflow', 'auto');
				else
					document.documentElement.style.overflow = 'auto'
				break;
			case this.ScrollX:
				if (!this.global) {
					this.parent.style('overflow', 'auto');
					this.parent.style('overflow-y', 'hidden');
				} else {
					document.documentElement.style.overflow = 'auto'
					document.documentElement.style.overflowY = 'hidden'
				}
				break;
			case this.ScrollY:
				log("case")
				if (!this.global) {
					this.parent.style('overflow', 'auto');
					this.parent.style('overflow-x', 'hidden');
				} else {
					document.documentElement.style.overflow = 'auto'
					document.documentElement.style.overflowX = 'hidden'
				}
				break;
		}
	}
	onValueChanged: { this._updateOverflow(value) }
	onCompleted: { this._updateOverflow(this.value) }
}
