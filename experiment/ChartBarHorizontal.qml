ChartBar {
	function _drawChart() {
		var ctx = this.getContext('2d')
		this.chart = new Chart(ctx, { type: 'horizontalBar', data: {}, options: {} })
	}
}
