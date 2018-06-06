Object {
	signal change;
	property var target;

	onCompleted: {
		this._random = (Math.random() + 1).toString(36).substring(7)

		this._bindArray = []
		var children = this.children
		for(var i = 0; i !== children.length; ++i) {
			var target = children[i]['target'] ? children[i]['target'] : this.target
			var property = children[i]['property']
			this._bindArray.push([target, property])
		}

		this.target._replaceUpdater(this._random, function() { this.change(this.target) }.bind(this), this._bindArray)
	}
}