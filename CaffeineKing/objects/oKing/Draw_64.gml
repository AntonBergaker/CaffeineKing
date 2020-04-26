if (awake < 0.2) {
	draw_set_alpha(clamp((0.2 - awake)*2, 0, 0.4));
	draw_set_color(c_black);
	draw_rectangle(0, 0, 1280, 720, false);
	draw_set_alpha(1);
}