
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fBigScore);

draw_text_outline(640, 240, "Game Over", c_white, 1);

draw_set_font(fScore);
draw_text_outline(640, 300, "The King stayed awake for", c_white, 1);

draw_set_font(fBigScore);

var _sec = floor(points/60);
var _min = floor(_sec / 60);

_sec -= _min*60;
var _secStr = _sec <= 9 ? "0" + string(_sec) : string(_sec);

draw_text_outline(640, 380, string(_min) + ":" + _secStr, c_white, 1);

if (timer > 120) {
	draw_set_font(fScore);
	draw_text_outline(640, 440, "Press anywhere to play again", c_white, 1);
}