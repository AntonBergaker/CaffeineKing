///@param x
///@param y
///@param width
///@param height

var _x = argument0;
var _y = argument1;
var _w = argument2;
var _h = argument3;

var _inst = instance_create_depth(_x, _y, 0, oButton);
_inst.x0 = _x - _w/2;
_inst.y0 = _y - _h/2;
_inst.x1 = _x + _w/2;
_inst.y1 = _y + _h/2;

return _inst;