move_and_collide(x_speed, 0, layer_tilemap_get_id("Obstacles"));

if (place_meeting(x + 5, y, obstacle_layer) || place_meeting(x - 5, y, obstacle_layer))
{
	instance_destroy();
}