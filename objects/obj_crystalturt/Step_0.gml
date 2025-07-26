// If waiting to turn, count down timer
// Death check
if (enemy_health <= 0)
{
	instance_destroy();
}

if (turn_timer > 0)
{
	turn_timer--;

	if (turn_timer <= 0 && queued_turn)
	{
		move_right = !move_right;
		image_xscale = move_right ? 1 : -1;
		queued_turn = false;
	}

	return; // Pause all movement while turning
}

// Ground check
if (place_meeting(x, y + 1, obstacle_layer))
{
	is_on_ground = true;
	vertical_speed = 0;
}
else
{
	is_on_ground = false;
}

// Apply gravity
if (!is_on_ground && vertical_speed < 50)
{
	vertical_speed += 1;
}

// Movement and turning
var move_speed = 3;

if (move_right)
{
	move_and_collide(move_speed, vertical_speed, obstacle_layer);

	// Check for edge or wall to the right
	if ((is_on_ground && !place_meeting(x + (image_xscale * 50), y + 1, obstacle_layer)) ||
		(is_on_ground && place_meeting(x + 10, y, obstacle_layer)))
	{
		turn_timer = room_speed / 2;
		queued_turn = true;
	}
}
else // moving left
{
	move_and_collide(-move_speed, vertical_speed, obstacle_layer);

	// Check for edge or wall to the left
	if ((is_on_ground && !place_meeting(x + (image_xscale * 50), y + 1, obstacle_layer)) ||
		(is_on_ground && place_meeting(x - 10, y, obstacle_layer)))
	{
		turn_timer = room_speed / 2;
		queued_turn = true;
	}
}
