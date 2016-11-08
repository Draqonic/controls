BaseView {
	property enum orientation { Vertical, Horizontal };
	property bool cacheEnable: true;

	constructor: {
		this._offset = 0
	}

	function positionViewAtIndex(idx) {
	}

	function _layout() {
		if (!this.recursiveVisible)
			return

		var model = this.model;
		if (!model)
			return

		this.count = model.count

		var horizontal = this.orientation === this.Horizontal

		var items = this._items
		var n = items.length
		if (!n) {
			this.rendered = true
			return
		}

		var w = this.width, h = this.height
		//log("layout " + n + " into " + w + "x" + h)
		var created = false
		var c = horizontal? this.content.x: this.content.y
		var size = horizontal? w: h

		var itemsCount = 0

		var ci = this.currentIndex
		var item = items[ci + this._offset]
		if (!item) {
			item = this._createDelegate(ci)
			created = true
		}

		var pb = (w - item.width) / 2
		var pf = pb + item.width + this.spacing
		if (horizontal)
			item.viewX = pb
		else
			item.viewY = pb

		log("current item", ci, pb)

		var renderedLeft, renderedRight, plusOne = this.cacheEnable;

		for (var i = ci - 1; pb > 0 || plusOne; --i) {
			var item = items[i + this._offset]

			if (!item) {
				item = this._createDelegate(i)
				created = true
			}

			var s = (horizontal? item.width: item.height)

			if (pb <= 0)
				plusOne = false

			pb -= s + this.spacing
			if (horizontal)
				item.viewX = pb
			else
				item.viewY = pb



			log("left item", i, pb)
			item.visible = true
			renderedLeft = i + this._offset
		}

		plusOne = this.cacheEnable;

		for (var i = ci + 1; pf < w || plusOne; ++i) {
			var item = items[i + this._offset]

			if (!item) {
				item = this._createDelegate(i)
				created = true
			}

			var s = (horizontal? item.width: item.height)

			if (horizontal)
				item.viewX = pf
			else
				item.viewY = pf

			if (pf >= w)
				plusOne = false

			log("right item", i, pf)
			pf += s + this.spacing
			item.visible = true
			renderedRight = i + this._offset + 1
		}

		for( var i = 0 ; i < this._items.length - renderedRight; ++i) {
			log("trying to remove from the end", i)
			var item = items.pop()
			if (item)
				item.discard()
		}

		for( var i = 0 ; i < renderedLeft; ++i) {
			log("trying to remove from the beginning", i)
			var item = items.shift()
			if (item) {
				this._offset--
				item.discard()
			}
		}

		this._items.splice(0, renderedLeft - 1);

		this.rendered = true
		if (created)
			this._context._complete()
	}

	/// @internal focuses current item
	function focusCurrent() {
	}

	/// @internal creates delegate in given item slot
	function _createDelegate(idx) {
		log("create", idx)
		var mapped 
		if (idx < 0)
			mapped = (this.count + (idx % this.count)) % this.count
		else
			mapped = idx % this.count

		log("mapped", mapped)
		var row = this.model.get(mapped)
		row['index'] = idx
		this._local['model'] = row
		var item = this.delegate()
		if (idx + this._offset >= 0)
			this._items[idx + this._offset] = item
		else {
			this._items.unshift(item)
			this._offset++
		}
		log ("_createDelegate", idx, mapped, this._offset)
		item.view = this
		this.element.append(item.element)
		item._local['model'] = row
		var delayedLayout = this._delayedLayout
		if (this.orientation === this.Horizontal)
			item.onChanged('width', delayedLayout.schedule.bind(delayedLayout))
		else
			item.onChanged('height', delayedLayout.schedule.bind(delayedLayout))

		delete this._local['model']
		return item
	}

	onKeyPressed: {
		if (!this.handleNavigationKeys) {
			event.accepted = false;
			return false;
		}

		var horizontal = this.orientation == this.Horizontal
		if (horizontal) {
			if (key == 'Left') {
				--this.currentIndex;
				event.accepted = true;
				return true;
			} else if (key == 'Right') {
				++this.currentIndex;
				event.accepted = true;
				return true;
			}
		} else {
			if (key == 'Up') {
				if (!this.currentIndex && !this.keyNavigationWraps) {
					event.accepted = false;
					return false;
				}
				--this.currentIndex;
				return true;
			} else if (key == 'Down') {
				if (this.currentIndex == this.count - 1 && !this.keyNavigationWraps) {
					event.accepted = false;
					return false;
				}
				++this.currentIndex;
				event.accepted = true;
				return true;
			}
		}
	}

	onOrientationChanged: { this._delayedLayout.schedule() }
	onCurrentIndexChanged: { this._delayedLayout.schedule() }
}
