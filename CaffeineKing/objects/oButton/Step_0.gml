
var _x = device_mouse_x_to_gui(0);
var _y = device_mouse_y_to_gui(0);

pressed = false;

hovered = point_in_rectangle(_x, _y, x0, y0, x1, y1);

if (mouse_check_button_pressed(mb_left) && hovered) {
	pressed = true;
}