///object for sharing URL in corresponded social network
Object {
	property enum socialNetwork { None, GPlus, Facebook, Vk, Twitter, Telegram, OK }; ///< social network name
	property string href; ///<
	property string url; ///< URL you want to share
	// TODO: title, description

	onSocialNetworkChanged: {
		switch(value) {
		case this.None:		this.href = ''; break
		case this.GPlus:	this.href = 'https://plus.google.com/share?url='; break
		case this.Facebook:	this.href = 'https://www.facebook.com/sharer/sharer.php?u='; break
		case this.Vk:		this.href = 'https://vk.com/share.php?url='; break
		case this.Twitter:	this.href = 'https://twitter.com/share?url='; break
		case this.Telegram:	this.href = 'https://t.me/share/url?url='; break
		case this.OK:		this.href = 'https://connect.ok.ru/offer?url='; break
		}
	}

	///load URL
	open: {
		if (!this.href) {
			log("href is undefined!")
			return
		}
		if (!this.url)
			this.url = window.location.href

		window.open(this.href + this.url)
	}

	///set location to corresponded URL
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
