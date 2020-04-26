if (inject10Button == noone && injectValue <= 0.06) {
	inject10Button = create_button(1280-100, 100, 64, 64);
	inject10Button.sprite_index = sInject10;
	inject10Button.hoverTitle = "Inject 10 coffee";
	inject10Button.hoverText = "Injects a lot of coffee into the King's bloodstream"
	
	injectButton.y += 30;
	injectButton.y0 += 30;
	injectButton.y1 += 30;
}

if (tryingToPlace == noone && !instance_exists(oGameOver)) {
	var _injections = 0;
	if (injectButton.pressed) {
		_injections = 1;
	}
	if (instance_exists(inject10Button) && inject10Button.pressed) {
		_injections = 10;	
	}
	
	repeat (_injections) {
		if (global.beans > 0) {
			var _toFullyAwake = 1 - oKing.awake
	
			if (injectValue > _toFullyAwake) {
				oKing.awake = 1;
				oKing.awake += log2(injectValue - _toFullyAwake + 1);
			} else {
				oKing.awake += injectValue;	
			}
	

			injectValue *= (1 - injectValue*0.08);
			
	
			global.beans--;
		}
	}

	if (peasantButton.pressed) {
		if (global.beans >= 10) {
			tryingToPlace = oPeasant;
			placingColor = choose($DBEBF8, $A5C6F3, $A5C6F3, $A5C6F3, $8AB9ED, $6281CC, $516FB0);
			global.beans -= 10;
		}
	}
	
	if (farmButton.pressed) {
		if (global.beans >= 25) {
			tryingToPlace = oFarmer
			placingColor = choose($DBEBF8, $A5C6F3, $A5C6F3, $A5C6F3, $8AB9ED, $6281CC, $516FB0);
			global.beans -= 25;
		}
	}
	
	if (buxButton.pressed) {
		if (global.beans >= 50) {
			tryingToPlace = oBux
			global.beans -= 50;
		}
	}
}

drawSpriteAtMouse = noone;

var _clicked = mouse_check_button_pressed(mb_left) && hasBeenPlacing;
hasBeenPlacing = false;

var _handled = false;

if (tryingToPlace) {
	hasBeenPlacing = true;	
}

var _clampedMouseX = clamp(mouse_x, 0, room_width);
var _clampedMouseY = clamp(mouse_y, 0, room_height);

switch (tryingToPlace) {
	case oPeasant:
		drawSpriteAtMouse = [[sPeasant, 0, placingColor], [sPeasant, 1]];
	
		if (_clicked) {
			var _inst = instance_create_depth(_clampedMouseX, _clampedMouseY, 0, oPeasant);
			_inst.skinColor = placingColor;
			_handled = true;
		}
		break;
	case oFarmer:
		drawSpriteAtMouse = [[sFarm, 0]]
		
		if (_clicked) {
			var _inst = instance_create_depth(_clampedMouseX, _clampedMouseY, 0, oFarm);
			var _inst = instance_create_depth(_clampedMouseX, _clampedMouseY, 0, oFarmer);
			
			_handled = true;
		}
		break;
		
	case oBux:
		drawSpriteAtMouse = [[sBux, 0]]
		
		if (_clicked) {
			var _inst = instance_create_depth(_clampedMouseX, _clampedMouseY, 0, oBux);
			
			_handled = true;
		}
		break;
}


if (_handled) {
	tryingToPlace = noone;	
}