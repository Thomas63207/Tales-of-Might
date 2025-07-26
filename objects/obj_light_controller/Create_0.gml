light_surf = -1;

// Create the surface for lighting if it doesn't exist
if (!surface_exists(light_surf)) {
    light_surf = surface_create(room_width, room_height);
}

light_color = make_color_rgb(100, 150, 255);
light_size = 1;
light_alpha = 0.6;
glow_alpha = 0.0;
glow_color = c_white;
glow_size = 1;