/// Need Chart.js

Canvas {
	property var chart;
	property string title;
	property array categories;
	property bool legend: true;
	property bool responsive: true;

	onTitleChanged: {
		this.chart.options.title.display = !!value
		this.chart.options.title.text = value
		this.chart.update()
	}
	
	onCategoriesChanged: {
		this.chart.data.labels = typeof value === 'number' ? Array(Math.round(value)) : value
		this.chart.update()
	}
	
	onLegendChanged: {
		this.chart.options.legend.display = value
		this.chart.update()
	}
	
	onResponsiveChanged: {
		this.chart.options.responsive = value
		this.chart.update()
	}

	onNewBoundingBox: {
 		resizeTimer.restart() // temporary hack
	}
	
	Timer {
 		id: resizeTimer; interval: 60;
		onTriggered: { this.parent.chart.resize() }
	}
	
	function _drawChart() {
		var ctx = this.getContext('2d')
		this.chart = new Chart(ctx, { type: 'bar', data: {}, options: {} })
	}

	constructor: {
		this._drawChart()
	}
}
