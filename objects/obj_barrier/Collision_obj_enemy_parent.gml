if (obj_player.mp + other.damage < obj_player.max_mp) {
	obj_player.mp += other.damage;
}
else {
	obj_player.mp = obj_player.max_mp;
}