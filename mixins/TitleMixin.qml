BaseMixin {
	property string value;
	property bool enabled: true;

	onValueChanged,
	onEnabledChanged: {
		this.parent.element.dom.setAttribute('title', this.enabled ? this.value : '');
	}
}
