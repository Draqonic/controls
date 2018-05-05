///Control for playing audio
Item {
	property bool autoLoad: autoPlay;
	property bool autoPlay: false;	///<autoplay flag, audio start to play immediately after source was changed
	property bool repeat;
	property bool muted;
	property bool seekable: true;
	property string source: "";		///<audio source URL
	property int duration; ///<readonly
	property int position; ///<readonly
	property real volume: 1;
	property bool running; ///<readonly
	property enum status { NoMedia, Loading, Loaded, EndOfMedia, InvalidMedia };
	
	signal paused;
	signal playing;
	signal stopped;

	Timer { // chrome hack
	        id: timerAudioHack;
		running: parent._timerRunning;
		repeat: true;
		onTriggered: { this.parent.play() }
	}
	property bool _timerRunning: context.system.device !== System.Mobile && autoPlay;
	
	onPlaying: {
		this._timerRunning = false
	}
	
	constructor: {
		var dom = this.element.dom
		dom.preload = "none"
		dom.onloadstart = context.wrapNativeCallback(function() { this.status = this.Loading }.bind(this))
		dom.ondurationchange = context.wrapNativeCallback(function() { this.duration = this.element.dom.duration * 1000; }.bind(this))
		dom.onloadeddata = context.wrapNativeCallback(function() { this.status = this.Loaded }.bind(this))
		dom.onplaying = context.wrapNativeCallback(function() { this.running = true; this.playing() }.bind(this))
		dom.onpause = context.wrapNativeCallback(function() { this.running = false; this.paused() }.bind(this))
		dom.onended = context.wrapNativeCallback(function() { this.running = false; this.status = this.EndOfMedia; this.stopped() }.bind(this))
		dom.ontimeupdate = context.wrapNativeCallback(function() { this.position = this.element.dom.currentTime * 1000 }.bind(this))
		dom.onerror = context.wrapNativeCallback(function() { this._timerRunning = false; this.status = this.InvalidMedia }.bind(this))
	}

	///@private
	onSourceChanged: {
		if (!this.element)
			return

		this.element.dom.src = value
		if (this.autoPlay)
			this.play()
	}

	/// play current audio
	play: { log("Play audio", this.source); this.element.dom.play() }

	/// pause current audio
	pause: { this.element.dom.pause() }
	
	/// if the seekable property is true, seeks the current playback position
	seek(position): { if (this.seekable) this.element.dom.currentTime = position / 1000 }

	///@private
	onAutoLoadChanged: { this.element.dom.preload = value ? "auto" : "none" }
	onAutoPlayChanged: { if (value) { this.autoLoad = true; this.play() } }
	onRepeatChanged: { this.element.dom.loop = this.repeat }
	onMutedChanged: { this.element.dom.muted = this.muted }
	onVolumeChanged: {
		var volume = value
		if (volume > 1)
			volume = 1
		else if (volume < 0)
			volume = 0
		this.element.dom.volume = this.volume
	}

	/// @private returns tag for corresponding element
	function getTag() { return 'audio' }
}
