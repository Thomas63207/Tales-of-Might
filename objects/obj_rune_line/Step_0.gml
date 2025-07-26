if (!instance_exists(owner)) {
    instance_destroy();
    exit;
}

px = owner.x;
py = owner.y;

x1 = px + offset1[0];
y1 = py + offset1[1];
x2 = px + offset2[0];
y2 = py + offset2[1];

// Calculate min and max bounds with padding for region
var pad = 2;

var min_x = min(x1, x2) - pad;
var max_x = max(x1, x2) + pad;
var min_y = min(y1, y2) - pad;
var max_y = max(y1, y2) + pad;

// Update the emitter region each step so particles spawn along the rune line area
part_emitter_region(psys, emitter,
    min_x, max_x,
    min_y, max_y,
    ps_shape_rectangle, ps_distr_linear
);

stream_timer++;

if (stream_timer >= stream_interval) {
    part_emitter_burst(psys, emitter, 0, 1); // spawn 1 particle
    stream_timer = 0;
    stream_interval = irandom_range(1, 30); // randomize next interval
}
