// need https://github.com/emn178/js-sha256 + <script src="sha256.js"></script> in dist/index.html
Object {
	property bool enabled: true;
	property string value;
	property string result;
	
	onValueChanged: {
		if (this.enabled)
			this.result =  window.sha256(this.value);
	}
}