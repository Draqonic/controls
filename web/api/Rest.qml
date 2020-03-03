Object {
	Request { id: apiRequest; }

	property string baseUrl;

	signal error;
	signal internetConnectionLost;

	constructor: {
		this._methods = {}
	}

	onError(url, method, response): {
		if ((typeof window !== 'undefined' && !window.navigator.onLine) || response && response.target && response.target.status === 0 && response.target.response === "") {
			this.internetConnectionLost({ "url": url, "method": method, "response": response })
		}
	}

	function args(args) {
		return args
	}

	function headers(headers) {
	}

	function _call(name, callback, error, method, data, head) {
		var headers = head || {}

		if (data) {
			data = this.args(data)
			headers["Content-Type"] = "application/json"
		}

		var newHeaders = this.headers(headers)
		if (newHeaders !== undefined)
			headers = newHeaders

		var url = name
		var self = this

		apiRequest.ajax({
			method: method || "GET",
			headers: headers,
			contentType: 'application/json',
			url: url,
			data: data,
			done: function(res) {
				if (res.target && res.target.status >= 400) {
					log("Error in request", res)
					if (error)
						error(res)
					self.error({"url": url, "method": method, "response": res})
					return
				}

				var text = res.target.responseText
				if (!text) {
					callback("")
					return
				}
				var res
				try {
					res = JSON.parse(text)
				} catch (e) {
					res = text
				}
				callback(res)
			},
			error: function(res) {
				if (error)
					error(res)
				self.error({"url": url, "method": method, "response": res})
			}
		})
	}

	function call(name, callback, error, method, data, head) {
		if (name.indexOf('://') < 0) {
			var baseUrl = this.baseUrl
			if (baseUrl[baseUrl.length - 1] === '/' || name[0] === '/')
				name = baseUrl + name
			else
				name = baseUrl + '/' + name
		}
		this._call(name, callback, error, method, JSON.stringify(data), head)
	}

	function _registerMethod(name, method) {
		if (!name)
			return

		var api = this
		this[name] = function() {
			method.call(api, arguments)
		}
	}
}
