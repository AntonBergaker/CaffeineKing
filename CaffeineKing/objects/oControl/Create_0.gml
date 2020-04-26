randomize()

global.beans = 10;
global.speedMod = 1;

var _w = 64;

global.maze = mp_grid_create(0, 0, ceil(room_width/_w), ceil(room_height/_w), _w, _w);

global.timer = 0;