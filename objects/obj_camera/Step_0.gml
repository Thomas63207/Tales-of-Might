//if (follow != noone)
if (instance_exists(follow))
{
	if ((follow.x + camera_width - 500 < room_width) && (follow.x + 500 > camera_width))
	{
		xto = follow.x;
	}
}

//if (follow != noone)
if (instance_exists(follow))
{
	if  (follow.y + camera_height - 300 < room_height)
	{
		yto = follow.y;
	}
}

x += (xto - x)/25;
y += (yto - y)/20;