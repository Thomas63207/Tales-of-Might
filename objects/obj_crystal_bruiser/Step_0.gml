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
    } else {
        facing_right = false;
        image_xscale = 1;
    }

    var dist_to_player = abs(obj_player.x - x);

    // === State Machine ===
    switch (enemy_state) {
        case EnemyState.Idle:
			move_and_collide(0, vertical_speed, obstacle_layer);
            if (dist_to_player <= detect_range) {
                enemy_state = EnemyState.MoveToPlayer;
                sprite_index = spr_crystal_bruiser_walk_small;
				image_speed = 0;
            }
            break;

        case EnemyState.MoveToPlayer:
            var dir = sign(obj_player.x - x);
            move_and_collide(dir * move_speed, vertical_speed, obstacle_layer);

            if (dist_to_player <= attack_range) {
                enemy_state = EnemyState.Attacking;
                sprite_index = spr_crystal_bruiser_slam_small;
                image_speed = 1;
                image_index = 0;
            }
            break;

        case EnemyState.Attacking:
            // During attack, still apply vertical movement
            move_and_collide(0, vertical_speed, obstacle_layer);

            if (image_index >= image_number - 1) {
                if (dist_to_player > attack_range) {
                    enemy_state = EnemyState.MoveToPlayer;
                    sprite_index = spr_crystal_bruiser_walk_small;
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

show_debug_message(is_on_ground);
show_debug_message(vertical_speed);
show_debug_message(enemy_state);