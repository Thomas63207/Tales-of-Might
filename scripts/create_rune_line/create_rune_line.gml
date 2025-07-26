function create_rune_line()
{
    var points = [];

    for (var i = 0; i < 9; i++) {
        var offset = rune_grid_offsets[i];
        var px = x + offset[0] * grid_spacing;
        var py = y + offset[1] * grid_spacing - 120;
        points[i] = [px, py];
    }

	if (array_length(rune_segments) > 0) {
		var seg = rune_segments[array_length(rune_segments) - 1];
    
	 var p1 = points[seg.from];
		var p2 = points[seg.to];
		var line = instance_create_layer(0, 0, "FX", obj_rune_line);
		line.x1 = p1[0];
		line.y1 = p1[1];
		line.x2 = p2[0];
		line.y2 = p2[1];
		line.owner = id;
		line.offset1 = [p1[0] - x, p1[1] - y];
		line.offset2 = [p2[0] - x, p2[1] - y];
	}
}
