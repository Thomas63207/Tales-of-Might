if (object_exists(obj_player))
{
	x = obj_player.x;
	y = obj_player.y;
}

if (lifespan > 0) {
	lifespan--;
}
else {
	instance_destroy();
}