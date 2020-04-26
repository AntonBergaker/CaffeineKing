if (planted) {
	timer--;
	
	if (timer <= 0) {
		instance_create_depth(x, y, 0, oCoffeeTree);
		instance_destroy();	
	}
}

visible = planted;