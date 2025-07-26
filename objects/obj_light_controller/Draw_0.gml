if (!surface_exists(light_surf)) {
    light_surf = surface_create(room_width, room_height);
}

// Set the surface target
surface_set_target(light_surf);
draw_clear(c_black); // Full black overlay

//Draw Lights for all children of the Light Emitter
with (obj_light_emitter) {
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(spr_light, 0, x, y, light_size, light_size, 0, light_color, light_alpha);
}

//Draw Glow for all children of the Light Emitter
with (obj_light_emitter) {
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(spr_light, 0, x, y, glow_size, glow_size, 0, glow_color, glow_alpha);
}

// Reset blend and surface
gpu_set_blendmode(bm_normal);
surface_reset_target();

// Draw the light surface over the screen with the darkness opacity
draw_surface_ext(light_surf, 0, 0, 1, 1, 0, c_white, darkness);
