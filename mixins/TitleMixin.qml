BaseMixin {
	property bool enabled: true;
	property string value;

	onValueChanged,
	onEnabledChanged: {
		this.parent.element.setAttribute('title', this.enabled ? this.value : '');
	}
}
