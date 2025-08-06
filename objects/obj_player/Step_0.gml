//if a movement key is pressed, toggle walking animation
if (keyboard_check(ord("A")) || keyboard_check(ord("D")) || keyboard_check(ord("W")))
{
	sprite_index = Spr_might_small_walk;
}
else
{
	sprite_index = Spr_might_small_idle;
}

//if player is moving downard and is about to touch a tile, eliminate vertical momentum and set is_jumping to false
if (place_meeting(x, y-2, obstacle_layer) && _ymovement < 0)
{
	_ymovement = 0;
	is_jumping = false;
}

//if on ground and not moving up, toggle "is_on_ground," set vertical movement to 0 and reset jump count to 0
if (place_meeting(x, y+10, obstacle_layer) && _ymovement >= 0)
{
	is_on_ground = true;
	_ymovement = 0;
	jump_count = 0;
}
else if (_ymovement < 4) 
{
	is_on_ground = false;
	if (is_on_ground == false && _ymovement < 10) // if in the air and not already at max velocity
	{
		_ymovement += 0.2 ; // increase downward velocity
	}
}

// ───── INPUT ─────
var _right = keyboard_check(ord("D"));
var _left  = keyboard_check(ord("A"));
var _xmovement = _right - _left;
var _jump_pressed  = keyboard_check_pressed(ord("W"));
var _jump_held     = keyboard_check(ord("W"));
var _jump_released = keyboard_check_released(ord("W"));

// ───── ANIMATION ─────
if (_xmovement != 0) {
    sprite_index = Spr_might_small_walk;
} else {
    sprite_index = Spr_might_small_idle;
}

// ───── GROUND + CEILING COLLISION ─────
if (place_meeting(x, y - 2, obstacle_layer) && _ymovement < 0) {
    _ymovement = 0; // hit ceiling
    is_jumping = false;
}

if (place_meeting(x, y + 1, obstacle_layer) && _ymovement >= 0) {
    is_on_ground = true;
    _ymovement = 0;
    jump_count = 0;
	coyote_timer = coyote_duration;
} else {
    is_on_ground = false;
	
	if (coyote_timer > 0) coyote_timer--;
}


// ───── GRAVITY ─────
if (!is_on_ground) {
    if (_ymovement < 10) {
        _ymovement += 0.05;
    }
}

// ───── JUMPING ─────
if (_jump_pressed) {
    var can_jump = false;

    if (is_on_ground || coyote_timer > 0) {
        can_jump = true;
    } else if (jump_count < max_jump_count) {
        can_jump = true;
        jump_count++;
    }

    if (can_jump) {
        is_jumping = true;
        jump_timer = 10;
        _ymovement = -jump_speed;
		coyote_timer = 0;
    }
}

// ───── VARIABLE JUMP HEIGHT ─────
if (jump_timer > 0) {
    jump_timer--;
} else {
    is_jumping = false;
}

if (is_jumping && _jump_held) {
    _ymovement = -jump_speed;
} else if (_jump_released) {
    is_jumping = false;
}

// ───── COOLDOWNS / DEATH ─────
if (block_cd > 0) block_cd--;
if (i_frames > 0) i_frames--;

if (hp <= 0) {
    obj_dead.x = x;
    obj_dead.y = y;
    obj_dead.visible = true;
	is_dead = true;
    //instance_destroy();
}

// ───── MOVEMENT ─────
if (is_dead == false) {
	move_and_collide(_xmovement * player_speed, _ymovement * player_speed, obstacle_layer);
}

//-----------------------------------------------
//Start of Rune Drawing System

// Input Buffer
// Diagonals
if (keyboard_check_pressed(vk_up) && keyboard_check(vk_right) || 
    keyboard_check_pressed(vk_right) && keyboard_check(vk_up)) {
		if (is_dead == false) {
			register_input("up-right");
		}
    exit;
}
if (keyboard_check_pressed(vk_up) && keyboard_check(vk_left) || 
    keyboard_check_pressed(vk_left) && keyboard_check(vk_up)) {
		if (is_dead == false) {
			register_input("up-left");
		}
    exit;
}
if (keyboard_check_pressed(vk_down) && keyboard_check(vk_right) || 
    keyboard_check_pressed(vk_right) && keyboard_check(vk_down)) {
		if (is_dead == false) {
			register_input("down-right");
		}
    exit;
}
if (keyboard_check_pressed(vk_down) && keyboard_check(vk_left) || 
    keyboard_check_pressed(vk_left) && keyboard_check(vk_down)) {
		if (is_dead == false) {
			register_input("down-left");
		}
    exit;
}

// Start tracking a solo input if nothing is pending
if (is_undefined(pending_input)) {
    if (keyboard_check_pressed(vk_up)) {
        pending_input = { direction: "up", time_remaining: input_delay, has_fired: false };
    } else if (keyboard_check_pressed(vk_down)) {
        pending_input = { direction: "down", time_remaining: input_delay, has_fired: false };
    } else if (keyboard_check_pressed(vk_left)) {
        pending_input = { direction: "left", time_remaining: input_delay, has_fired: false };
    } else if (keyboard_check_pressed(vk_right)) {
        pending_input = { direction: "right", time_remaining: input_delay, has_fired: false };
    }
}

if (!is_undefined(pending_input)) {
    pending_input.time_remaining -= 1;

    // CANCEL if the key is no longer held
    var still_holding = false;
    switch (pending_input.direction) {
        case "up":    still_holding = keyboard_check(vk_up); break;
        case "down":  still_holding = keyboard_check(vk_down); break;
        case "left":  still_holding = keyboard_check(vk_left); break;
        case "right": still_holding = keyboard_check(vk_right); break;
    }

	if (!still_holding && !pending_input.has_fired && is_dead == false) {
		register_input(pending_input.direction);
	}


    // Otherwise: input resolves as usual
    else if (pending_input.time_remaining <= 0 && !pending_input.has_fired && is_dead == false) {
        register_input(pending_input.direction);
    }
}

//Rune Grid
function advance_rune_cursor(dir)
{
	var old_index = rune_cursor_index;
    var new_index = old_index;

    switch (dir) {
        case "up":    new_index -= 3; break;
        case "down":  new_index += 3; break;
        case "left":
            if (old_index mod 3 != 0) new_index -= 1;
			else return false;
            break;
        case "right":
            if (old_index mod 3 != 2) new_index += 1;
			else return false;
            break;
        case "up-left":
            if (old_index mod 3 != 0) new_index -= 4;
			else return false;
            break;
        case "up-right":
            if (old_index mod 3 != 2) new_index -= 2;
			else return false;
            break;
        case "down-left":
            if (old_index mod 3 != 0) new_index += 2;
			else return false;
            break;
        case "down-right":
            if (old_index mod 3 != 2) new_index += 4;
			else return false;
            break;
    }

    if (new_index >= 0 && new_index < 9) {
        array_push(rune_segments, {from: old_index, to: new_index});
        rune_cursor_index = new_index;
		return true;
    }
}	




// DEBUG: Print current buffer contents
var debug_string = "Input Buffer: ";
for (var i = 0; i < array_length(input_buffer); i++) {
    debug_string += input_buffer[i];
    if (i < array_length(input_buffer) - 1) {
        debug_string += ", ";
    }
}
show_debug_message(debug_string);

