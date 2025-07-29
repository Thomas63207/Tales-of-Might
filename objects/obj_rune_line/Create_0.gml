image_blend = c_white;
light_color = c_orange;
light_size = 1;
light_alpha = 0.6;
glow_alpha = 0.1;
glow_color = c_blue;
stream_interval = irandom_range(1, 30);
stream_timer = 0;

// No need for setup_done anymore

psys = part_system_create(ps_rune);
part_system_depth(psys, 498);

// Create a new emitter within the existing particle system
emitter = part_emitter_create(psys);