Object {
	property array values;
	property string label: 'Label ' + (dataId + 1);
	property array color;
	property int borderWidth;
	property var borderColor;
	property int dataId;

	constructor: {
		this.parent.chart.data.datasets.push([])
		this.dataId = this.parent.chart.data.datasets.length - 1
	}

	onValuesChanged: {
		this.parent.chart.data.datasets[this.dataId].data = typeof value === 'number' ? Array.apply(null, Array(Math.round(value))).map(function() { return Math.round(Math.random() * value); }) : value
		this.parent.chart.update()
	}

	onLabelChanged: {
		this.parent.chart.data.datasets[this.dataId].label = value
		this.parent.chart.update()
	}

	onColorChanged: {
		this.parent.chart.data.datasets[this.dataId].backgroundColor = value
		this.parent.chart.update()
	}

	onBorderWidthChanged: {
		this.parent.chart.data.datasets[this.dataId].borderWidth = value
		this.parent.chart.update()
	}

	onBorderColorChanged: {
		this.parent.chart.data.datasets[this.dataId].borderColor = value
		this.parent.chart.update()
		log(this.parent.chart.data.datasets[this.dataId].fill)
	}
}
