// === Death check ===
if (hp <= 0) {
	sprite_index = spr_crystal_bruiser_death_small;
	image_speed = 1;
	part_emitter_interval(psys, emitter, 999, 999, time_source_units_seconds);
    enemy_state = FlyerState.Death;
}

// === Vertical Speed ===
if (y < obj_player.y - 100) {
	vertical_speed = 2;
}
else if (y > obj_player.y - 300) {
	vertical_speed = -2;
}

// === Face Player ===
if (instance_exists(obj_player)) {
    if (obj_player.x > x && hp > 0) {
        facing_right = true;
        image_xscale = -1;
		part_type_direction(1, 100, 180, 0, 0);
    } else if (hp > 0) {
        facing_right = false;
        image_xscale = 1;
		part_type_direction(1, 0, 80, 0, 0);
    }

    var dist_to_player = abs(obj_player.x - x);

    // === State Machine ===
    switch (enemy_state) {
        case FlyerState.Idle:
			move_and_collide(0, vertical_speed, obstacle_layer);
            if (dist_to_player <= detect_range) {
                sprite_index = spr_crystal_flyer_fly_small;
				image_speed = 1;
				enemy_state = FlyerState.MoveToPlayer;
            }
            break;

        case FlyerState.MoveToPlayer:
            var dir = sign(obj_player.x - x);
            move_and_collide(dir * move_speed, 0, obstacle_layer);
			move_and_collide(0, vertical_speed, obstacle_layer);
			
            if (dist_to_player <= attack_range) {
                sprite_index = spr_crystal_flyer_attack_small;
                image_speed = 1;
                image_index = 0;
				enemy_state = FlyerState.Attacking;
            }
			else if (dist_to_player >= detect_range) {
				enemy_state = FlyerState.Idle;
			}
            break;

        case FlyerState.Attacking:
            // During attack, still apply vertical movement
            move_and_collide(0, vertical_speed, obstacle_layer);
			
			if (round(image_index) == 25 && did_attack == false) {
				instance_create_layer(x - (150 * image_xscale), y + 85, "Instances", obj_bruiser_hurtbox);
				var shockwave = instance_create_layer(x - (150 * image_xscale), y + 100, "Instances", obj_bruiser_shockwave);
				shockwave.dir = image_xscale;
				did_attack = true;
			}

            if (image_index >= image_number - 1) {
                if (dist_to_player > attack_range) {
					sprite_index = spr_crystal_flyer_fly_small;
					did_attack = false;
                    enemy_state = FlyerState.MoveToPlayer;
                } else {
                    image_index = 0; // Repeat attack
					did_attack = false;
                }
            }
            break;
			
		case FlyerState.Death:
			if (round(image_index) == 13) {
				image_speed = 0;
			}
    }
}