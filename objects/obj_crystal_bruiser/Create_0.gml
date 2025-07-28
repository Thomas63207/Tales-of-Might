// States
enum EnemyState {
    Idle,
    MoveToPlayer,
    Attacking
}

obstacle_layer = layer_tilemap_get_id("Obstacles");
enemy_state = EnemyState.Idle;
move_speed = 2;
vertical_speed = 0;
is_on_ground = false;
enemy_health = 10;

attack_range = 60;      // Distance to start attacking
detect_range = 200;     // Distance to start pursuing

facing_right = true;    // Used for sprite facing
