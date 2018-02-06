///HTML text input item
BaseInput {
	property string text;		///< input text string property
	property bool passwordMode: false;	///< show password chars instead of input text flag property
	height: 20;	///<@private
	width: 173;	///<@private
	backgroundColor: "transparent"; ///<@private
	property Validator validator;
	property enum echoMode { Normal, Password, NoEcho, PasswordEchoOnEdit };

	onTextChanged: { if (value != this.element.dom.value) this.element.dom.value = value; }

	constructor: {
		this.element.on("input", function() { this.text = this.element.dom.value }.bind(this))
	}
	
	onEchoModeChanged: {
		switch(value) {
		case this.Normal: this.type = "text"; break;
		case this.Password: this.type = "password"; break;
		//case this.NoEcho: break;
		//case this.PasswordEchoOnEdit: break;
		}
	}
}
