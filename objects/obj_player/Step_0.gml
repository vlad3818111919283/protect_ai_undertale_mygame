// --- Ввод ---
var _right = keyboard_check(ord("D")) || keyboard_check(vk_right);
var _left  = keyboard_check(ord("A")) || keyboard_check(vk_left);
var _up    = keyboard_check(ord("W")) || keyboard_check(vk_up);
var _down  = keyboard_check(ord("S")) || keyboard_check(vk_down);

// --- Скорость ---
var _hsp = (_right - _left) * spd;
var _vsp = (_down - _up) * spd;

// --- Движение с коллизией ---
if (_hsp != 0) {
    if (!place_meeting(x + _hsp, y, obj_wall)) {
        x += _hsp;
    }
}
if (_vsp != 0) {
    if (!place_meeting(x, y + _vsp, obj_wall)) {
        y += _vsp;
    }
}

// --- Анимация ---
if (_hsp != 0 || _vsp != 0) {
    if (_hsp > 0) sprite_index = spr_frisk_run_right;
    else if (_hsp < 0) sprite_index = spr_frisk_run_left;
    else if (_vsp > 0) sprite_index = spr_frisk_run_down;
    else if (_vsp < 0) sprite_index = spr_frisk_run_up;
    image_speed = 1;
} else {
    if (sprite_index == spr_frisk_run_right) sprite_index = spr_frisk_idle_right;
    else if (sprite_index == spr_frisk_run_left) sprite_index = spr_frisk_idle_left;
    else if (sprite_index == spr_frisk_run_down) sprite_index = spr_frisk_idle_down;
    else if (sprite_index == spr_frisk_run_up) sprite_index = spr_frisk_idle_up;
    image_speed = 0;
    image_index = 0;
}