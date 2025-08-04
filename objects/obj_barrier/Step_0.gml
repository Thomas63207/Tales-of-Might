if (object_exists(obj_player))
{
	x = obj_player.x;
	y = obj_player.y;
}

if (lifespan > 0) {
	lifespan--;
}
else {
	instance_destroy();
}

if (!blocked)
{
	show_debug_message("blocked was false so creating list");
	var list = ds_list_create();
	var count = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_enemy_parent, false, false, list, false);
	
	if (count > 0) {
		for (var i = 0; i <= count; i++) {
			var inst = list[| i];
			show_debug_message(inst);
		
			if (instance_exists(inst)) {
				var dmg = inst.damage;
				show_debug_message("instance exists. dealing damage");
				if (obj_player.mp + dmg < obj_player.max_mp) {
					obj_player.mp += dmg;
				}
				else {
					obj_player.mp = obj_player.max_mp;
				}
			}
		}
		blocked = true;
	}
}