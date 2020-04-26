
if (instance_exists(carrying)) {
	carrying.x = x;
	carrying.y = y;
}


if (instance_exists(target) == false) {
	var _best = -1;
	var _bestValue = INT_32_MAX;
	repeat(100) {
		var _x = random_range(0, room_width);
		var _y = random_range(0, room_height);
			
		if (point_distance(_x, _y, oKing.x, oKing.y) < 300) {
			continue;	
		}
			
		var _near = instance_nearest(_x, _y, oCoffeeTree);
		if (_near && point_distance(_x, _y, _near.x, _near.y) < 60) {
			continue;	
		}
			
		var _near = instance_nearest(_x, _y, oCoffeeSprout);
		if (_near && point_distance(_x, _y, _near.x, _near.y) < 60) {
			continue;	
		}
			
		var _value = sqr(x-_x) + sqr(y-_y);
		if (_value < _bestValue) {
			_bestValue = _value;
			_best = [_x, _y];
		}
	}
	
	if (_best != -1) {
		target = instance_create_depth(_best[0], _best[1], 0, oCoffeeSprout);
	}
	
}
	
if (instance_exists(target)) {
	if (hasPath == false) {
		var _success = mp_grid_path(global.maze, path, x, y, target.x, target.y, true);
		
		if (_success) {
			hasPath = true;	
			path_start(path, spd * global.speedMod, path_action_stop, true);	
		} else {
			// go towards it anyway
			var _len = point_distance(x, y, target.x, target.y);
			var _xDiff = (target.x - x)/_len;
			var _yDiff = (target.y - y)/_len;
		
			x += _xDiff * spd * global.speedMod;
			y += _yDiff * spd * global.speedMod;
		}
	}

	
	if (point_distance(x, y, target.x, target.y) < 10) {
		if (target.object_index == oFarm) {
			if (global.beans > 0) {
				global.beans--;
				carrying = instance_create_depth(x, y, 0, oCoffeeBean);
				target = noone;
				
				if (hasPath) {
					hasPath = false;
					path_end();
				}
			}
			
		} else {
			// todo particles
			if (instance_exists(carrying)) {
				instance_destroy(carrying);	
			}
			
			target.planted = true;
			target = noone;
		
			target = instance_nearest(x, y, oFarm);
			
			if (hasPath) {
				hasPath = false;
				path_end();
			}
		}
	}
}



depth = -y;

if (x < lastx) {
	image_xscale = -1;
} else if (x > lastx) {
	image_xscale = 1;	
}

lastx = x;