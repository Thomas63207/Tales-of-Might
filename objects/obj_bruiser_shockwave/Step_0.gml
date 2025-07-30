if (dir == -1)
{
	move_and_collide(move_speed, 0, obstacle_layer);

	// Check for edge or wall to the right
	if ((!place_meeting(x + (image_xscale * 50), y + 10, obstacle_layer)) ||
		(place_meeting(x + 10, y, obstacle_layer)))
	{
		instance_destroy();
	}
}
else // moving left
{
	move_and_collide(-move_speed, 0, obstacle_layer);

	// Check for edge or wall to the left
	if ((!place_meeting(x + (image_xscale * 50), y + 10, obstacle_layer)) ||
		(place_meeting(x - 10, y, obstacle_layer)))
	{
		instance_destroy();
	}
}
