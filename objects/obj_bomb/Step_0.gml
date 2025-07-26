if y_speed < 30
{
	y_speed += 1;
}

move_and_collide(x_speed, y_speed, obstacle_layer);

if place_meeting(x, y + 5, obstacle_layer)
{
	x_speed = 0;
	instance_destroy();
}