team = "enemy";
dir = 1;
damage = 1;
move_speed = 20;
hp = 2;
max_hp = 2;
active = true;
obstacle_layer = layer_tilemap_get_id("Obstacles");

function on_hit(target) {
	active = false;
}