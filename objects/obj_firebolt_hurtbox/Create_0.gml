owner = noone;
team = "player";
damage = 1;
active = true;

function on_hit(target) {
	owner.sprite_index = spr_firebolt_boom_small;
	owner.image_index = 1;
	owner.death_wait_time = 35;
	active = false;
	owner.spell_state = SpellState.Boom;
}