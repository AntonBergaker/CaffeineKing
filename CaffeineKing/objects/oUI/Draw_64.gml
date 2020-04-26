
draw_set_color(c_black);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_set_font(fScore);
draw_sprite(sCoffeeBean, 0, 1280-50, 50);
draw_text_outline(1280-80, 50, string(global.beans), c_white, 1);

var _progress = oKing.displayAwake*107;

var _col = merge_color($3A4AE0, $00BAFF, oKing.displayAwake);

draw_sprite_part_ext(sSleepBar, 1, 0, 2-107+_progress, 25, 107, 1280-60, 95, 1, 1, _col, 1);
draw_sprite(sSleepBar, 0, 1280-60, 95);