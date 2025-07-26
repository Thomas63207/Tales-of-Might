x = obj_player.x;
y = obj_player.y - 120;

if (image_index >= image_number - 1) {
    image_index = image_number - 1; // stay on last frame
    image_speed = 0; // freeze animation
}

if (light_size < 1) {
	light_size += 0.1;
}

if (glow_size < 1.3) {
	glow_size += 0.1;
}