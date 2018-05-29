Object {
	property real blur;
	property real grayscale;
	property real sepia;
	property real brightness;
	property real contrast;
	property real hueRotate;
	property real invert;
	property real saturate;
	property Object shadow : Object {
		property real x;
		property real y;
		property Color color: "black";
		property real blur;
		property real spread;
	}
}