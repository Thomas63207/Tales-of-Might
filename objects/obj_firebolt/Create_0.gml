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