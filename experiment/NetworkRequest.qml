Object {
	property bool autoLoad; // TODO
	property enum method { Get, Post, Put, Delete};
	property enum status { Error, Loading, Loaded };
	signal loaded;
	signal error;
	property string url;
	property string result;
	property string body;

	constructor: {
		this._method = 'GET'
	}
	
	onMethodChanged: {
		switch(this.method) {
 			case this.GET: this._method = 'GET'; break
			case this.Post: this._method = 'POST'; break
			case this.Put: this._method = 'PUT'; break
			case this.Delete: this._method = 'DELETE'; break
		}
	}

	function toJson() {
		var json
		try {
			json = JSON.parse(this.result)
		}
		catch(e) { log('Error loading from ' + this.url); this.error(); return []; }
		this.result = ''
		return json;
	}

	function send() {
		var xhr = new XMLHttpRequest()

		var self = this
		var ctx = this._context

		xhr.addEventListener('error', ctx.wrapNativeCallback(function(event) {
			self.status = this.Error
			self.result = ''
			self.error(event)
		}))

		xhr.addEventListener('load', ctx.wrapNativeCallback(function(event) {
			if (xhr.readyState == 4 && xhr.status == 200) {
				self.result = xhr.responseText
				self.status = this.Loaded
				self.loaded(self.result)
			}
		}))

		xhr.open(this._method, this.url);
		if ((this._method === 'POST' || this._method === 'PUT') && this.body)
			xhr.send(this.body)
		else
			xhr.send()
		this.loading = true
	}
}
