// Always draw the player sprite
draw_self();

// Only show the rune drawing system if the player has started a pattern
if (array_length(input_buffer) > 0) {
	
	//Create Magic Circle
	if (is_drawing == false) {
		instance_create_layer(x, y - 120, "Instances", obj_magic_circle);
		is_drawing = true;
	}

    // Calculate the 3x3 grid points
    var points = [];

    for (var i = 0; i < 9; i++) {
        var offset = rune_grid_offsets[i];
        var px = x + offset[0] * grid_spacing;
        var py = y + offset[1] * grid_spacing - 120;
        points[i] = [px, py];

        draw_circle(px, py, 4, false); // Draw small node
    }

}
