var _item = argument0;

switch (_item.object_index) {
	case oCoffeeBean:
		global.beans++;
		instance_destroy(_item);
		break;
}
