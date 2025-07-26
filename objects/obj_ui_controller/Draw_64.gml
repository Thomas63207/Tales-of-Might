// Bottle position on screen
var bx = 0;
var by = 0;

// Dimensions of liquid area inside the bottle
var liquid_width = 100;
var liquid_height = 90;
var liquid_x = bx + 45; // offset from sprite border
var liquid_y_bottom = by + 175; // bottom of the liquid area
var m_liquid_width = 40;
var m_liquid_height = 108;
var m_liquid_x = bx + 170
var m_liquid_y_bottom = by + 175

if (object_exists(obj_player)) {
// % health remaining (0 to 1)
var health_percent = obj_player.hp / obj_player.max_hp;
var m_percent = obj_player.mp / obj_player.max_mp;

// Height of liquid based on health
var current_liquid_height = liquid_height * health_percent;
var liquid_y_top = liquid_y_bottom - current_liquid_height;

var current_m_liquid_height = m_liquid_height * m_percent;
var m_liquid_y_top = m_liquid_y_bottom - current_m_liquid_height;

draw_sprite(spr_behind_bottle_small, 0, bx, by);

// Draw the red liquid
draw_set_color(make_color_hsv(0, 255, 100));
draw_rectangle(liquid_x, liquid_y_top, liquid_x + liquid_width, liquid_y_bottom, false);

// Draw the sine wave cap
var wave_height = 4;
var wave_width = liquid_width;
var steps = 10;

for (var i = 0; i < steps; i++) {
    var x1 = liquid_x + (i / steps) * wave_width;
    var x2 = liquid_x + ((i + 1) / steps) * wave_width;

    var y1 = liquid_y_top + sin((i * 0.3 + current_time / 200) * 1) * wave_height;
    var y2 = liquid_y_top + sin((i * 0.3 + 1 + current_time / 200) * 1) * wave_height;

    draw_triangle(x1, y1, x2, y2, x1, liquid_y_top, false);
    draw_triangle(x2, y2, x2, liquid_y_top, x1, liquid_y_top, false);
}

// Draw the blue liquid
draw_set_color(make_color_hsv(170, 255, 100));
draw_rectangle(m_liquid_x, m_liquid_y_top, m_liquid_x + m_liquid_width, m_liquid_y_bottom, false);

// Draw the sine wave cap
var m_wave_height = 4;
var m_wave_width = m_liquid_width;
var m_steps = 10;

for (var i = 0; i < steps; i++) {
    var x1 = m_liquid_x + (i / m_steps) * m_wave_width;
    var x2 = m_liquid_x + ((i + 1) / m_steps) * m_wave_width;

    var y1 = m_liquid_y_top + sin((i * 0.3 + current_time / 200) * 1) * m_wave_height;
    var y2 = m_liquid_y_top + sin((i * 0.3 + 1 + current_time / 200) * 1) * m_wave_height;

    draw_triangle(x1, y1, x2, y2, x1, m_liquid_y_top, false);
    draw_triangle(x2, y2, x2, m_liquid_y_top, x1, m_liquid_y_top, false);
}

draw_set_color(make_color_rgb(255, 255, 255));
}

// Draw the potion bottle overtop
draw_sprite(spr_belt_small, 0, bx, by);
