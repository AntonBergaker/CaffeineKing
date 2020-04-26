x += 7*(keyboard_check(vk_right) - keyboard_check(vk_left));
y += 7*(keyboard_check(vk_down)  - keyboard_check(vk_up)  );

x += 7*(keyboard_check(ord("D")) - keyboard_check(ord("A")));
y += 7*(keyboard_check(ord("S")) - keyboard_check(ord("W")));

var _w = 1280;
var _h = 720;

x = clamp(x, 0+_w/2, room_width-_w/2);
y = clamp(y, 0+_h/2, room_height-_h/2);

camera_set_view_pos(cam, x-_w/2, y-_h/2);