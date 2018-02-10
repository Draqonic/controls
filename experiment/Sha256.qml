// need https://github.com/emn178/js-sha256
Item {
	property bool enabled: true;
	property string value;
	property string result;
	
	onValueChanged: {
		if (this.enabled && window.sha256)
			this.result =  window.sha256(this.value);
	}
	
	Script {
		id: script;
		source: "sha256.min.js";
	}
}