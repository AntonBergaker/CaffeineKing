
if (hovered) {
	var _x = device_mouse_x_to_gui(0)-300;
	var _y = device_mouse_y_to_gui(0);
	draw_set_font(fScore);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	draw_set_color(c_black)
	draw_set_alpha(0.33);
	draw_rectangle(_x, _y, _x+300, _y+200, false)
	
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text(_x + 30, _y + 30, hoverTitle);
	
	draw_text_ext(_x + 30, _y + 60, hoverText, 25, 240);
}