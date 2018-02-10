Rectangle {
	z: 1;
	fixed: true;
	width: 100%;
	opacity: 1;
	height: 50;
	effects.shadow.x: 1	;
	effects.shadow.y: 1;
	effects.shadow.color: "#d3d3d3";
	effects.shadow.blur: 6;
	effects.shadow.spread: 2;
			
	color: applicationWindow.theme.toolBarColor;
			
	Behavior on background { Animation { duration: 500; } }
}