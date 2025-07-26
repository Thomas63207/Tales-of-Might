if (variable_global_exists("particle_sys")) {
    matrix_set(matrix_world, matrix_build_identity()); // Reset world transform
    part_system_drawit(global.particle_sys); // Draw particles in the correct world space
}
