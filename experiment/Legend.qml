Object {
	property bool visible: true;
	property enum alignment { Top, Left, Right, Bottom };
	property bool reverse;
	property string labelColor;

	onVisibleChanged: {
		this.parent.chart.options.legend.display = value
		this.parent.chart.update()
	}

	onAlignmentChanged: {
		var position
		switch(this.alignment) {
			case this.Top: position = 'top'; break;
			case this.Left: position = 'left'; break;
			case this.Right: position = 'right'; break;
			case this.Bottom: position = 'bottom'; break;
		}
		this.parent.chart.options.legend.position = position
		this.parent.chart.update()
	}

	onReverseChanged: {
		this.parent.chart.options.legend.reverse = value
		this.parent.chart.update()
	}

	onLabelColorChanged: {
		this.parent.chart.options.legend.labels.fontColor = value
		this.parent.chart.update()
	}
}
