///object for handling XML/HTTP requests
Object {
	property bool loading: false;	///< loading flag, is true when request was send and false when answer was recieved or error occured

	/**@param request:Object request object
	send request using 'XMLHttpRequest' object*/
	ajax(request): {
		var url = request.url
		var error = request.error,
			data = request.data,
			headers = request.headers,
			done = request.done,
			settings = request.settings

		var xhr = new XMLHttpRequest()

		var self = this
		if (error)
			xhr.addEventListener('error', function(event) { self.loading = false; log("Error"); error(event) })

		if (done)
			xhr.addEventListener('load', function(event) { self.loading = false; done(event) })

		xhr.open(request.method || 'GET', url);

		for (var i in settings)
			xhr[i] = settings[i]

		for (var i in headers)
			xhr.setRequestHeader(i, headers[i])

		this.loading = true
		if (request.data)
			xhr.send(request.data)
		else
			xhr.send()
	}
}
