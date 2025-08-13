// States
enum FlyerState {
    Idle,
    MoveToPlayer,
    Attacking,
	Death
}

obstacle_layer = layer_tilemap_get_id("Obstacles");
enemy_state = FlyerState.Idle;
move_speed = 2;
vertical_speed = 0;
is_on_ground = false;
hp = 10;
max_hp = 10;
attack_range = 150;
detect_range = 1000;
facing_right = true;
damage = 0;
did_attack = false;
