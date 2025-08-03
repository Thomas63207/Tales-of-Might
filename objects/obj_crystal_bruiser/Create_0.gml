// States
enum EnemyState {
    Idle,
    MoveToPlayer,
    Attacking,
	Death
}

obstacle_layer = layer_tilemap_get_id("Obstacles");
enemy_state = EnemyState.Idle;
move_speed = 2;
vertical_speed = 0;
is_on_ground = false;
hp = 10;
max_hp = 10;
attack_range = 150;
detect_range = 1000;
facing_right = true;
damage = 0;

//particles
psys = part_system_create(ps_sparks);
part_system_depth(psys, 498);

// Create a new emitter within the existing particle system
emitter = part_emitter_create(psys);

part_emitter_interval(psys, emitter, 0, 0.2, time_source_units_seconds);
part_emitter_region(psys, emitter, x + (80 * image_xscale), x + (79 * image_xscale), y, y - 1, 0, ps_distr_linear);
part_emitter_stream(psys, emitter, 1, 1);
