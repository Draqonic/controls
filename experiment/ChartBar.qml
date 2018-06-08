/// Need Chart.js

Canvas {
	property var chart;
	property string title;
	property array labels;
	property bool legend: true;
	property bool responsive: true;

	onTitleChanged: {
		this.chart.options.title.display = !!value
		this.chart.options.title.text = value
		this.chart.update()
	}
	
	onLabelsChanged: {
		this.chart.data.labels = value
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
 		resizeTimer.restart()
	}
	
	Timer {
 		id: resizeTimer; interval: 100;
		onTriggered: { if (!this.parent.chart) return; log('resize')
		this.parent.chart.resize(); this.parent.chart.resize() }
	}
	
	function _drawChart() {
		var ctx = this.getContext('2d');
		this.chart = new Chart(ctx, { type: 'bar', data: {}, options: {} })
	}

	constructor: {
		this._drawChart()
	}
}