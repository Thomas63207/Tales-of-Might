global.particle_sys = part_system_create();
part_system_depth(global.particle_sys, 498); // So it's drawn above the game layer

// Blue magic floaty bit
global.pt_magic = part_type_create();
part_type_shape(global.pt_magic, pt_shape_circle);
part_type_size(global.pt_magic, 1, 1, 0, 0);
part_type_color1(global.pt_magic, make_color_rgb(100, 150, 255));
part_type_alpha3(global.pt_magic, 0.6, 0.3, 0);
part_type_speed(global.pt_magic, 0.2, 0.5, 0, 0);
part_type_direction(global.pt_magic, 260, 280, 0, 20); // Upwards-ish
part_type_gravity(global.pt_magic, -0.01, 270); // Float gently upward
part_type_life(global.pt_magic, 60, 90);

// Create a reusable emitter
global.magic_emitter = part_emitter_create(global.particle_sys);

// Set up default region for the emitter (can be overridden later)
part_emitter_region(
    global.particle_sys,
    global.magic_emitter,
    0, 0, 0, 0,     // x1, x2, y1, y2
    ps_shape_rectangle, // Shape
    ps_distr_linear // Distribution
);