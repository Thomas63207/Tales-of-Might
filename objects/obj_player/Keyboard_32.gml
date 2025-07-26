if (keyboard_check_pressed(vk_space)) {
	with (obj_rune_line) instance_destroy();
	with (obj_magic_circle) instance_destroy();
	is_drawing = false;
    if (array_length(input_buffer) == array_length(rune_fireball) && mp > 0) {
        var match = true;
        for (var i = 0; i < array_length(rune_fireball); i++) {
            if (input_buffer[i] != rune_fireball[i]) {
                match = false;
                break;
            }
        }

        if (match) {
            // Spawn the projectile
            instance_create_layer(x, y, "instances", obj_firebolt);
			mp--;
        }
    }

    // Clear the input buffer after attempting to cast
    input_buffer = [];
    pending_input = undefined;
	rune_segments = [];
	rune_cursor_index = 4; // Reset to center
	
}
