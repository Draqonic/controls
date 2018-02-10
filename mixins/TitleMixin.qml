BaseMixin {
	property bool enabled: true;
	property string value;

	onValueChanged,
	onEnabledChanged: {
		this.parent.element.dom.setAttribute('title', this.enabled ? this.value : '');
	}
}
