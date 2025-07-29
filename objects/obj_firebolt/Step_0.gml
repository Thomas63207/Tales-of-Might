move_and_collide(x_speed, 0, layer_tilemap_get_id("Obstacles"));
part_emitter_region(psys, emitter, x, x, y, y, 0, ps_distr_linear);

if (place_meeting(x + 5, y, obstacle_layer) || place_meeting(x - 5, y, obstacle_layer))
{
	instance_destroy();
}