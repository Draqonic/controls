Validator {
	property int bottom: -2147483647;
	property int top: 2147483647;
	property string validText: parent.text;
	property string pastText;
	
	// TODO: enable first symbols (10 -> 21 -> need 1, 2)
	onValidTextChanged: {
		if (!value)
			return
	
		var check = (value == parseInt(value, 10))
			&& (value <= this.top && value >= this.bottom)
		
		if (check)
			this.pastText = value
		else
			this.parent.text = this.pastText
		this.valid = check
	}
}