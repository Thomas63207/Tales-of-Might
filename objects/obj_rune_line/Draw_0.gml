var dx = x2 - x1;
var dy = y2 - y1;
var len = point_distance(x1, y1, x2, y2);
var angle = point_direction(x1, y1, x2, y2);

// Set drawing color/blend if you want glowing
gpu_set_blendmode(bm_add);
draw_sprite_ext(
    sprite_index,
    image_index,
    x1, y1,
    len / sprite_width,  // x-scale stretches the sprite to the line length
    1,                   // y-scale stays the same
    angle,
    image_blend,
    image_alpha
);
gpu_set_blendmode(bm_normal);
