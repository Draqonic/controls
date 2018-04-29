///Control for playing audio
Item {
	property bool autoLoad: false;
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
		onTriggered: { console.log("Timer"); this.parent.play() }
	}
	property bool _timerRunning: autoPlay;
	
	onPlaying: {
		this._timerRunning = false
	}
	
	constructor: {
		this.element.dom.preload = "none"
		this.element.dom.onloadstart = context.wrapNativeCallback(function() { console.log("LOADSTAT", this.Loading); this.status = this.Loading }.bind(this))
		this.element.dom.ondurationchange = context.wrapNativeCallback(function() { this.duration = this.element.dom.duration * 1000; }.bind(this))
		this.element.dom.onloadeddata = context.wrapNativeCallback(function() { this.status = this.Loaded }.bind(this))
		this.element.dom.onplaying = context.wrapNativeCallback(function() { this.running = true; this.playing() }.bind(this))
		this.element.dom.onpause = context.wrapNativeCallback(function() { this.running = false; this.paused() }.bind(this))
		this.element.dom.onended = context.wrapNativeCallback(function() { this.running = false; this.status = this.EndOfMedia; this.stopped() }.bind(this))
		this.element.dom.ontimeupdate = context.wrapNativeCallback(function() { this.position = this.element.dom.currentTime * 1000 }.bind(this))
		this.element.dom.onerror = context.wrapNativeCallback(function() { this._timerRunning = false; this.status = this.InvalidMedia }.bind(this))
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
