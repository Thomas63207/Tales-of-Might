if (obj_player.image_xscale = 1)
{
	x_speed = 20;
}
else
{
	x_speed = -20;
	image_xscale = -1;
}

obstacle_layer = layer_tilemap_get_id("Obstacles");

light_color = c_blue;
light_size = .5;
light_alpha = 1;
glow_alpha = 0.4;
glow_color = c_orange;
glow_size = .5;

//particles
//particles
psys = part_system_create(ps_sparks);
part_system_depth(psys, 498);

// Create a new emitter within the existing particle system
emitter = part_emitter_create(psys);

part_emitter_interval(psys, emitter, 0, 0.1, time_source_units_seconds);
part_type_gravity(1, 0.01, 90);
part_type_direction(1, 150, 210, 0, 0);
part_emitter_region(psys, emitter, x, x, y, y, 0, ps_distr_linear);
part_emitter_stream(psys, emitter, 1, 1);
