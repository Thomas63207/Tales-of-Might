function register_input(dir) {
    if (advance_rune_cursor(dir)) {
        array_push(input_buffer, dir);
		create_rune_line();
    }

    pending_input = undefined;
}
