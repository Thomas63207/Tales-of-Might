if (i_frames == 0 && is_dead == false)
{
	var list = ds_list_create();
	var count = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_enemy_parent, false, false, list, false);
	
	for (var i = 0; i <= count; i++) {
		var inst = list[| i];
		
		if (instance_exists(inst)) {
			var dmg = inst.damage;
			if (dmg <= hp) {
				hp -= dmg;
			}
			else {
				hp -= hp;
			}
			i_frames = 50
		}
	}
}
