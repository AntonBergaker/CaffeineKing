awake -= .0004;

displayAwake = clamp(awake, 0, 1);

image_index = clamp(floor( awake * 3), 0, 2);

depth = -y - 100

if (awake < 0) {
	if (!instance_exists(oGameOver)) {
		instance_create_depth(x, y, -10000, oGameOver);	
	}
}

