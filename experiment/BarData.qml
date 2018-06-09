Object {
	property array data;
	property string label: 'Label ' + (dataId + 1);
	property array color;
	property int dataId;
	
	constructor: {
		this.parent.chart.data.datasets.push([])
		this.dataId = this.parent.chart.data.datasets.length - 1
	}
	
	onDataChanged: {
		this.parent.chart.data.datasets[this.dataId].data = value
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
}