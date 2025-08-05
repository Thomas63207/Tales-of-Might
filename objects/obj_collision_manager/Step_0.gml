with (obj_hurtbox_parent) {
    var hurtbox = id;

    var target_list = ds_list_create();

    // Target selection logic
    switch (team) {
        case "enemy":
            // Hurtboxes from enemies hit the player or barrier
            collision_rectangle_list(
                bbox_left, bbox_top, bbox_right, bbox_bottom,
                obj_player_parent, false, false,
                target_list, false
            );
            break;

        case "player":
            // Player attacks only hit enemies
            collision_rectangle_list(
                bbox_left, bbox_top, bbox_right, bbox_bottom,
                obj_enemy_parent, false, false,
                target_list, false
            );
            break;
    }

    // Apply collisions
    for (var i = 0; i < ds_list_size(target_list); i++) {
		if (!active) break;
		
        var target = target_list[| i];

        if (!instance_exists(target)) continue;

        // Barrier check (for enemy hurtboxes only)
        if (team == "enemy" && active == true && instance_exists(obj_barrier) && place_meeting(target.x, target.y, obj_barrier)) {
            obj_player.mp = min(obj_player.mp + hurtbox.damage, obj_player.max_mp);
			on_hit(target);
			show_debug_message("Collision manager adding dmg to mp. Hurtbox ID: " + string(hurtbox.id));
            continue;
        }

        // i-frame check or other custom logic
        if (team == "enemy" && active == true && target.i_frames <= 0) {
            target.hp -= hurtbox.damage;
            target.i_frames = 30;
			on_hit(target);
        }
        else if (team == "player" && active == true) {
            target.hp -= hurtbox.damage;
			on_hit(target);
        }
    }
	
    ds_list_destroy(target_list);
}