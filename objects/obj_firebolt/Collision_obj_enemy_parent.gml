if (spell_state = SpellState.Flying) {
	other.hp -= damage;
	sprite_index = spr_firebolt_boom_small;
	image_index = 1;
	death_wait_time = 35;
	spell_state = SpellState.Boom;
}
