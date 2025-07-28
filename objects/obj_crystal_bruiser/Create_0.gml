// States
enum EnemyState {
    Idle,
    MoveToPlayer,
    Attacking
}

obstacle_layer = layer_tilemap_get_id("Obstacles");
enemy_state = EnemyState.Idle;
move_speed = 3;
vertical_speed = 0;
is_on_ground = false;
enemy_health = 10;

attack_range = 150;      // Distance to start attacking
detect_range = 600;     // Distance to start pursuing

facing_right = true;    // Used for sprite facing
