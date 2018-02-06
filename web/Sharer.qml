Object {
	property enum socialNetwork { None, GPlus, Facebook, Vk, Twitter, Telegram, OK }; ///<
	property string href; ///<
	property string url; ///<
	// TODO: title, description

	onSocialNetworkChanged: {
		switch(value) {
		case this.None:	this.href = ''; break
		case this.GPlus:	this.href = 'https://plus.google.com/share?url='; break
		case this.Facebook:	this.href = 'https://www.facebook.com/sharer/sharer.php?u='; break
		case this.Vk:		this.href = 'https://vk.com/share.php?url='; break
		case this.Twitter:	this.href = 'https://twitter.com/share?url='; break
		case this.Telegram:	this.href = 'https://t.me/share/url?url='; break
		case this.OK:	this.href = 'https://connect.ok.ru/offer?url='; break
		}
	}
	
	open: {
		if (!this.href) {
			log("href is undefined!")
			return
		}
		if (!this.url)
			this.url = window.location.href

		window.open(this.href + this.url)
	}

	redirect: {
		if (!this.href) {
			log("href is undefined!")
			return
		}
		if (!this.url)
			this.url = window.location.href
			
		window.location = this.href + this.url
	}
}
