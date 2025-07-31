if (part_system_exists(psys)) {
    part_system_destroy(psys);
	part_emitter_destroy(psys, emitter);
}
