if (obj_player.image_xscale = 1)
{
	x_speed = 20;
}
else
{
	x_speed = -20;
	image_xscale = -1;
}

enum SpellState {
	Flying,
	Boom
	}
	
spell_state = SpellState.Flying;

death_wait_time = 0;

obstacle_layer = layer_tilemap_get_id("Obstacles");

// Light Values
light_color = c_blue;
light_size = .5;
light_alpha = 1;
glow_alpha = 0.4;
glow_color = c_orange;
glow_size = .5;

//particles
psys = part_system_create(ps_sparks);
part_system_depth(psys, 498);

emitter = part_emitter_create(psys);

part_emitter_interval(psys, emitter, 0, 0.1, time_source_units_seconds);
part_type_gravity(1, 0.01, 90);
part_type_direction(1, 150, 210, 0, 0);
part_emitter_region(psys, emitter, x, x, y, y, 0, ps_distr_linear);
part_emitter_stream(psys, emitter, 1, 1);

function on_hit(target) {
	sprite_index = spr_firebolt_boom_small;
	image_index = 1;
	death_wait_time = 35;
	active = false;
	spell_state = SpellState.Boom;
}

hurtbox = instance_create_layer(x, y, "Instances", obj_firebolt_hurtbox);
hurtbox.owner = id;