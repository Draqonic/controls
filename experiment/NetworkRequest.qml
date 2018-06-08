Object {
	property bool autoLoad; // TODO
	property enum method { Get, Post };
	property enum status { Error, Loading, Loaded };
	signal loaded;
	signal error;
	property string url;
	property string result;
	property string header;

	function toJson() {
		var json
		try {
			json = JSON.parse(this.result)
		}
		catch(e) { console.warn("Error loading from " + this.url); this.error(); return []; }
		this.result = ''
		return json;
	}

	function send() {
		var xhr = new XMLHttpRequest()
		log(this.url)

		var self = this
		var ctx = this._context

		xhr.addEventListener('error', ctx.wrapNativeCallback(function(event) {
			self.status = this.Error
			this.result = ''
			self.error()
		}))

		xhr.addEventListener('load', ctx.wrapNativeCallback(function(event) {
			if (xhr.readyState != xhr.DONE) return
			if (xhr.status == 200) {
				self.result = xhr.responseText
				self.status = this.Loaded
				self.loaded()
			}
		}))

		var method = 'GET'
		if (this.method === this.Post)
			method = 'POST'
		xhr.open(method, this.url);

		this.loading = true
		//else
		xhr.send()
	}
}
