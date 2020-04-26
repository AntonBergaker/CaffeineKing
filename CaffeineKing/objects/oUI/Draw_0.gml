if (drawSpriteAtMouse != noone) {
	for (var i=0;i<array_length_1d(drawSpriteAtMouse);i++) {
		var _a = drawSpriteAtMouse[i];
		var _c = array_length_1d(_a);
		var _col = _c > 2 ? _a[2] : c_white;
		draw_sprite_ext(_a[0], _a[1], mouse_x, mouse_y, 1, 1, 0, _col, 1);
	}
}