team = "enemy";
lifespan = 3;
damage = 3;
active = true;

function on_hit(target) {
	active = false;
}