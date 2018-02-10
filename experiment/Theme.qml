Object {
	property bool dark: false;
	property Object font: Object {
		property string family: "Roboto";
	}
	onCompleted: { this._setMaterial(false) }
	property color bgColor: !dark ? "#FAFAFA" : "#303030";
	property color dialogColor: dark ? "#424242" : "#FAFAFA";
	property color fontColorMain: dark ? "white" : "black";
	property color toolBarColor: !dark ? "#F5F5F5" : "#212121";
	
	property enum theme { Light, Dark };
	onThemeChanged: {
		log("THEME")
		switch(value) {
		case this.Light:
			this._setDefault(false)
			break
		case this.Dark:
			this._setDefault(true)
			break
		case Material.Light:
			this._setMaterial(false)
			break
		case Material.Dark:
			this._setMaterial(true)
			break
		}
	}
	
	function _setDefault(dark) {
		log("Default", dark)
		this.dark = dark
		this.bgColor = !dark ? "white" : "black"
		this.fontColorMain = !dark ? "black" : "white"
		this.font.family = "Times New Roman"
	}
	
	function _setMaterial(dark) {
		log("Material", dark)
		this.dark = dark
		this.bgColor = !dark ? "#FAFAFA" : "#303030"
		this.fontColorMain = dark ? "white" : "black"
		this.font.family = "Roboto"
		this.toolBarColor = !dark ? "#F5F5F5" : "#212121"
	}
	
}