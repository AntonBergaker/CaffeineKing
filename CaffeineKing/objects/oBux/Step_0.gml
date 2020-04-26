timer--;
if (timer < 0) {
	timer = 60*60;
	global.beans = max(0, global.beans);
}	