// === Death check (optional) ===
if (enemy_health <= 0) {
    instance_destroy();
}

// === Ground Check ===
if (place_meeting(x, y + 1, obstacle_layer)) {
    is_on_ground = true;
    vertical_speed = 0;
} else {
    is_on_ground = false;
}

// === Apply Gravity ===
if (!is_on_ground && vertical_speed < 50) {
    vertical_speed += 1; // Same gravity as turtle
}

// === Face Player ===
if (instance_exists(obj_player)) {
    if (obj_player.x > x) {
        facing_right = true;
        image_xscale = -1;
		part_type_direction(1, 100, 180, 0, 0);
    } else {
        facing_right = false;
        image_xscale = 1;
		part_type_direction(1, 0, 80, 0, 0);
    }

    var dist_to_player = abs(obj_player.x - x);

    // === State Machine ===
    switch (enemy_state) {
        case EnemyState.Idle:
			move_and_collide(0, vertical_speed, obstacle_layer);
			image_speed = 0;
            if (dist_to_player <= detect_range) {
                sprite_index = spr_crystal_bruiser_walk_small;
				image_speed = 1;
				part_emitter_interval(psys, emitter, 0, 0.2, time_source_units_seconds);
				enemy_state = EnemyState.MoveToPlayer;
            }
            break;

        case EnemyState.MoveToPlayer:
            var dir = sign(obj_player.x - x);
            move_and_collide(dir * move_speed, 0, obstacle_layer);
			move_and_collide(0, vertical_speed, obstacle_layer);
			part_emitter_region(psys, emitter, x + (165 * image_xscale), x + (165 * image_xscale), y + 85, y + 85, 0, ps_distr_linear);
			
            if (dist_to_player <= attack_range) {
                sprite_index = spr_crystal_bruiser_slam_small;
                image_speed = 1;
                image_index = 0;
				part_emitter_interval(psys, emitter, 999, 999, time_source_units_seconds);
				enemy_state = EnemyState.Attacking;
            }
			else if (dist_to_player >= detect_range) {
				part_emitter_interval(psys, emitter, 999, 999, time_source_units_seconds);
				enemy_state = EnemyState.Idle;
			}
            break;

        case EnemyState.Attacking:
            // During attack, still apply vertical movement
            move_and_collide(0, vertical_speed, obstacle_layer);
			
			if (round(image_index) == 25) {
				show_debug_message("frame 25 is being recognized");
				instance_create_layer(x - (150 * image_xscale), y + 85, "FX", obj_bruiser_hurtbox)
			}

            if (image_index >= image_number - 1) {
                if (dist_to_player > attack_range) {
					sprite_index = spr_crystal_bruiser_walk_small;
					part_emitter_interval(psys, emitter, 0, 0.2, time_source_units_seconds);
                    enemy_state = EnemyState.MoveToPlayer;
                } else {
                    image_index = 0; // Repeat attack
                }
            }
            break;
    }
} else {
    // Always apply gravity even if player is gone
    //move_and_collide(0, vertical_speed, obstacle_layer);
}

