if (death_wait_time > 0) {
	death_wait_time--;
}

switch (spell_state) {
	case SpellState.Flying:
		move_and_collide(x_speed, 0, layer_tilemap_get_id("Obstacles"));
		part_emitter_region(psys, emitter, x, x, y, y, 0, ps_distr_linear);
		if (place_meeting(x + 5, y, obstacle_layer) || place_meeting(x - 5, y, obstacle_layer)) {
			sprite_index = spr_firebolt_boom_small;
			image_index = 1;
			death_wait_time = 35;
			spell_state = SpellState.Boom;
		}
		
		break;
		
	case SpellState.Boom:
		part_emitter_interval(psys, emitter, 999, 999, time_source_units_seconds);

		if (round(image_index) == 13) {
			image_speed = 0;
		}
		light.light_size = .5 * (death_wait_time / 60);
		light.glow_size = .5 * (death_wait_time / 60);
		light.glow_alpha = .4 * (death_wait_time / 60);
		light.light_alpha = 1 * (death_wait_time / 60);
		if (death_wait_time == 0) {
			instance_destroy();
			show_debug_message("firebolt destroyed");
		}
		
		break;
}