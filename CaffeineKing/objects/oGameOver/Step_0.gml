timer++;
if (timer > 120) {
	if (mouse_check_button_pressed(mb_left)) {
		game_restart();	
	}
}