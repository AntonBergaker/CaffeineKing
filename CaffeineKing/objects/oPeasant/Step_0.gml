// try to select a tree

if (instance_exists(target) == false) {
	
	if (instance_exists(carrying)) {
		target = oTreasury;
	}
		else {
		var _c = instance_number(oCoffeeTree);
	
		var _best = INT_32_MAX;
		var _bestInst = noone;
	
		var _useRand = _c >= 200;
	
		for (var i=0;i<_c;i++) {
			if (i > 200) {
				break;	
			}
		
			var _index = _useRand ? irandom(_c-1) : i;
			var _inst = instance_find(oCoffeeTree, _index);
			if (instance_exists(_inst.targetedBy)) {
				continue;	
			}
			var _value = sqr(x-_inst.x) + sqr(y-_inst.y);
			if (_value < _best) {
				_best = _value;
				_bestInst = _inst;
			}
		
		}
	
		if (_bestInst != noone) {
			target = _bestInst;
			_bestInst.targetedBy = id;
		}
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
		if (target.object_index == oTreasury) {
			
			if (instance_exists(carrying)) {
				treasury_absorb_item(carrying);
			}
			
			target = noone;
			if (hasPath) {
				hasPath = false;
				path_end();
			}
		} else {
			// todo particles
			carrying = instance_create_depth(target.x, target.y, 0, oCoffeeBean)
	
			target.plantsLeft--;
			target.targetedBy = noone;
			if (target.plantsLeft == 0) {
				instance_destroy(target);
			}
			target = noone;
		
			if (hasPath) {
				hasPath = false;
				path_end();
			}
		}
	}
}

if (instance_exists(carrying)) {
	carrying.x = x;
	carrying.y = y;
}

depth = -y;

if (x < lastx) {
	image_xscale = -1;
} else if (x > lastx) {
	image_xscale = 1;	
}

lastx = x;