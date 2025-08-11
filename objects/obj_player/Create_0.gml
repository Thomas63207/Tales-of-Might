//Movement and Collisions
is_dead = false;
player_speed = 10;
jump_speed = 1.5;
is_on_ground = false;
is_jumping = false;
is_on_wall = false;
jump_timer = 0;
jump_count = 0;
max_jump_count = 1;
_ymovement = 0;
obstacle_layer = layer_tilemap_get_id("Obstacles");
coyote_timer = 0;
coyote_duration = 6;
block_cd = 0;
is_blocking = false;
max_hp = 5;
hp = 5;
max_mp = 10;
mp = 10;
i_frames = 0;


//Rune System
is_drawing = false;
input_buffer = [];
pending_input = undefined;
input_delay = 12;
rune_fireball = ["up", "right", "down", "left"]
grid_spacing = 50;
rune_cursor_index = 4;
rune_segments = [];
rune_grid_offsets = [
[-1,-1], [0,-1], [1,-1],
[-1,0], [0,0], [1,0],
[-1,1], [0,1], [1,1]
];