var _percent = (obj_player.hp / obj_player.max_hp) * 100;
draw_healthbar(x, y, x+100, y+10, _percent, c_black, c_red, c_lime, 0, true, true);