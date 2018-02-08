Validator {
	property var regExp; // TODO: need fix parser to make RegExp
	property string validText: parent.text;

	onValidTextChanged: {
		if (!value)
			return

		var check = this.regExp.test(value)
		log("'%1' %2".arg(value).arg(check))

		this.valid = check
	}
}