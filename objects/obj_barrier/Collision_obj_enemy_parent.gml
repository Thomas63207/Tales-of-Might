if (obj_player.i_frames == 0)
{
	obj_player.i_frames = 50;
	if(obj_player.mp < obj_player.max_mp) {
		obj_player.mp++;
	}
}