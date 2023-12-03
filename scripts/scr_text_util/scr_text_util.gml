enum textkey
{
	up,
	left,
	right,
	down,
	forwards,
	backwards,
	grab,
	mach,
	jump,
	shoot,
	taunt,
	groundpound, // gamepad only
	superjump // gamepad only
}
enum texteffect
{
	normal,
	shake,
	updown
}
enum texttype
{
	normal, // just draws the text
	icon, // draws tutorial keys
	array // does scr_draw_text_arr within itself
}

// functions
function create_transformation_tip(str, save_entry = noone)
{
	ini_open_from_string(obj_savesystem.ini_str);
	if (save_entry != -4 && ini_read_real("Tip", save_entry, false))
	{
		ini_close();
		exit;
	}
	instance_destroy(obj_transfotip);
	var b = -4;
	with (instance_create(0, 0, obj_transfotip))
	{
		text = str;
		b = id;
	}
	if (save_entry != -4)
		ini_write_real("Tip", save_entry, true);
	obj_savesystem.ini_str = ini_close();
	return b;
}

function scr_compile_icon_text(text, pos = 1, return_array = false)
{
	var arr = [];
	var len = string_length(text);
	var newline = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
	var char_x = 0;
	var char_y = 0;
	
	for (var saved_pos = 1; pos <= len; pos += 1)
	{
		var start = pos;
		var char = string_ord_at(text, pos);
		switch char
		{
			case ord("\n"):
				char_y += newline;
				char_x = 0;
				break;
			
			case ord("{"):
				var effect = string_copy(text, pos, 3);
				var te = texteffect.shake;
				pos += 3;
				var n = scr_compile_icon_text(text, pos, true);
				switch (effect)
				{
					case "{s}":
						te = texteffect.shake;
						break;
					case "{u}":
						te = texteffect.updown;
						break;
				}
				array_push(arr, [char_x, char_y, texttype.array, te, n[0]]); // probably. originally 2
				pos = n[1];
				char_x = n[2];
				char_y = n[3];
				break;
			
			case ord("["):
				var button = string_copy(text, pos, 3);
				var t = texttype.icon;
				
				var b = textkey.up;
				switch (button)
				{
					case "[D]":
						b = textkey.down;
						break;
					case "[U]":
						b = textkey.up;
						break;
					case "[M]":
						b = textkey.mach;
						break;
					case "[J]":
						b = textkey.jump;
						break;
					case "[G]":
						b = textkey.grab;
						break;
					case "[F]":
						b = textkey.forwards;
						break;
					case "[B]":
						b = textkey.backwards;
						break;
					case "[L]":
						b = textkey.left;
						break;
					case "[R]":
						b = textkey.right;
						break;
					case "[S]":
						b = textkey.shoot;
						break;
					case "[T]":
						b = textkey.taunt;
						break;
					case "[g]":
						b = textkey.groundpound;
						break;
					case "[s]":
						b = textkey.superjump;
						break;
				}
				array_push(arr, [char_x, char_y, t, b]);
				char_x += 32;
				pos += 2;
				break;
			
			case ord("/"):
				if (return_array)
				{
					saved_pos = pos;
					pos = len + 1;
				}
				break;
			
			default:
				while ((pos + 1) <= len)
				{
					char = string_ord_at(text, pos + 1);
					if (char != ord("[") && char != ord("\n") && char != ord("{") && char != ord("/"))
						pos += 1;
					else
						break;
				}
				n = string_copy(text, start, (pos - start) + 1);
				array_push(arr, [char_x, char_y, texttype.normal, n]); // probably. originally 0
				char_x += string_width(n);
				break;
		}
	}
	if (return_array)
		return [arr, saved_pos, char_x, char_y];
	return arr;
}

function scr_text_arr_size(array)
{
	var w = 0;
	var newline = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
	var h = newline;
	for (var i = 0; i < array_length(array); i++)
	{
		var b = array[i];
		var cx = b[0];
		var cy = b[1];
		var t = b[2];
		var val = b[3];
		
		switch (t)
		{
			case texttype.icon:
				if ((cx + 32) > w)
					w += 32;
				break;
			
			case texttype.array:
				var val2 = b[4];
				var q = scr_text_arr_size(val2);
				if ((cy + q[1]) > h)
					h += (q[1] - newline);
				else if ((cx + q[0]) > w)
					w += q[0];
				break;
			
			case texttype.normal:
				if (cy > h)
					h += newline;
				else
				{
					var sw = string_width(val);
					if ((cx + sw) > w)
						w += string_width(val);
				}
				break;
		}
	}
	return [w, h];
}
function scr_draw_granny_texture(x, y, xscale, yscale, tex_x, tex_y, sprite = spr_pizzagrannytexture, bubble_sprite = spr_tutorialbubble)
{
	var w = sprite_get_width(bubble_sprite) * xscale;
	var h = sprite_get_height(bubble_sprite) * yscale;
	
	if (!surface_exists(surfclip))
		surfclip = surface_create(w, h);
	if (!surface_exists(surffinal))
		surffinal = surface_create(w, h);
	
	// draw dialog box
	surface_set_target(surfclip);
	draw_clear_alpha(0, 0);
	draw_rectangle_color(0, 0, w, h, c_white, c_white, c_white, c_white, false);
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(bubble_sprite, 0, 0, 0, xscale, yscale, 0, c_white, 1);
	reset_blendmode();
	surface_reset_target();
	
	// draw the looping texture
	surface_set_target(surffinal);
	draw_sprite_tiled(sprite, 0, tex_x, tex_y);
	gpu_set_blendmode(3);
	draw_surface(surfclip, 0, 0);
	reset_blendmode();
	surface_reset_target();
	
	// draw everything
	draw_surface(surffinal, x, y);
}

function scr_draw_text_arr(x, y, text_arr, color = c_white, alpha = 1, effect = texteffect.normal, option_struct = noone)
{
	if text_arr == noone
		exit;
	
	for (var i = 0; i < array_length(text_arr); i++)
	{
		var b = text_arr[i];
		var cx = x + b[0];
		var cy = y + b[1];
		var t = b[2];
		var val = b[3];
		
		switch t
		{
			case texttype.icon:
				var spr = -4;
				var ix = 0;
				var txt = -4;
				
				if obj_inputAssigner.player_input_device[0] >= 0
				{
					spr = spr_tutorialgamepad;
					switch val
					{
						case textkey.down:
							ix = scr_get_gamepadicon(global.key_downC);
							break;
						case textkey.up:
							ix = scr_get_gamepadicon(global.key_upC);
							break;
						case textkey.mach:
							ix = scr_get_gamepadicon(global.key_attackC);
							break;
						case textkey.jump:
							ix = scr_get_gamepadicon(global.key_jumpC);
							break;
						case textkey.grab:
							ix = scr_get_gamepadicon(global.key_slapC);
							break;
						case textkey.forwards:
							if (instance_exists(obj_player1) && obj_player1.xscale > 0)
								ix = scr_get_gamepadicon(global.key_rightC);
							else
								ix = scr_get_gamepadicon(global.key_leftC);
							break;
						case textkey.backwards:
							if (instance_exists(obj_player1) && obj_player1.xscale > 0)
								ix = scr_get_gamepadicon(global.key_leftC);
							else
								ix = scr_get_gamepadicon(global.key_rightC);
							break;
						case textkey.left:
							ix = scr_get_gamepadicon(global.key_leftC);
							break;
						case textkey.right:
							ix = scr_get_gamepadicon(global.key_rightC);
							break;
						case textkey.shoot:
							ix = scr_get_gamepadicon(global.key_shootC);
							break;
						case textkey.taunt:
							ix = scr_get_gamepadicon(global.key_tauntC);
							break;
						case textkey.groundpound:
							if global.gamepad_groundpound
								ix = scr_get_gamepadicon(global.key_downC);
							else
								ix = scr_get_gamepadicon(global.key_groundpoundC);
							break;
						case textkey.superjump:
							if global.gamepad_superjump
								ix = scr_get_gamepadicon(global.key_upC);
							else
								ix = scr_get_gamepadicon(global.key_superjumpC);
							break;
					}
				}
				else
				{
					spr = spr_tutorialkey;
					ix = 0;
					
					var arr = noone;
					switch val
					{
						case textkey.down:
							arr = scr_get_tutorial_key(global.key_down);
							break;
						case textkey.up:
							arr = scr_get_tutorial_key(global.key_up);
							break;
						case textkey.mach:
							arr = scr_get_tutorial_key(global.key_attack);
							break;
						case textkey.jump:
							arr = scr_get_tutorial_key(global.key_jump);
							break;
						case textkey.grab:
							arr = scr_get_tutorial_key(global.key_slap);
							break;
						case textkey.forwards:
							if (instance_exists(obj_player1) && obj_player1.xscale > 0)
								arr = scr_get_tutorial_key(global.key_right);
							else
								arr = scr_get_tutorial_key(global.key_left);
							break;
						case textkey.backwards:
							if (instance_exists(obj_player1) && obj_player1.xscale > 0)
								arr = scr_get_tutorial_key(global.key_left);
							else
								arr = scr_get_tutorial_key(global.key_right);
							break;
						case textkey.left:
							arr = scr_get_tutorial_key(global.key_left);
							break;
						case textkey.right:
							arr = scr_get_tutorial_key(global.key_right);
							break;
						case textkey.shoot:
							arr = scr_get_tutorial_key(global.key_shoot);
							break;
						case textkey.taunt:
							arr = scr_get_tutorial_key(global.key_taunt);
							break;
						case textkey.groundpound:
                            arr = scr_get_tutorial_key(global.key_down);
                            break;
                        case textkey.superjump:
                            arr = scr_get_tutorial_key(global.key_up);
                            break;
					}
					if arr != noone
					{
						spr = arr[0];
						ix = arr[1];
						txt = arr[2];
					}
				}
				
				if effect != texteffect.normal
				{
					switch effect
					{
						case texteffect.shake:
							cx += irandom_range(-2, 2);
							cy += irandom_range(-2, 2);
							break;
						
						case texteffect.updown:
							var o = 1;
							if (option_struct != -4)
								o = option_struct.offset;
							var d = ((i % 2) == 0) ? -1 : 1;
							var _dir = floor(Wave(-1, 1, 0.1, 0));
							cy += (_dir * d * o);
							break;
					}
				}
				
				if spr != -4
				{
					if ix != -4
						draw_sprite(spr, ix, cx, cy);
					if txt != -4
					{
						var f = draw_get_font();
						draw_set_halign(1);
						draw_set_valign(1);
						draw_set_font(global.tutorialfont);
						draw_text_color(cx + 16, cy + 14, txt, c_black, c_black, c_black, c_black, alpha);
						draw_set_font(f);
						draw_set_halign(0);
						draw_set_valign(0);
					}
				}
				break;
			
			case texttype.array:
				var val2 = b[4];
				scr_draw_text_arr(cx, cy, val2, color, alpha, val);
				break;
			
			case texttype.normal:
				if effect == texteffect.normal
					draw_text_color(cx, cy, val, color, color, color, color, alpha);
				else
				{
					var x2 = 0;
					switch effect
					{
						case texteffect.shake:
							for (var j = 1; j <= string_length(val); j++)
							{
								var q = string_char_at(val, j);
								var s1 = irandom_range(-1, 1);
								var s2 = irandom_range(-1, 1);
								draw_text_color(cx + x2 + s1, cy + s2, q, color, color, color, color, alpha);
								x2 += string_width(q);
							}
							break;
						
						case texteffect.updown:
							for (j = 1; j <= string_length(val); j++)
							{
								q = string_char_at(val, j);
								var s = 0;
								o = 1;
								if (option_struct != -4)
									o = option_struct.offset;
								d = ((j % 2) == 0) ? -1 : 1;
								_dir = floor(Wave(-1, 1, 0.1, 0));
								s += (_dir * d * o);
								draw_text_color(cx + x2, cy + s, q, color, color, color, color, alpha);
								x2 += string_width(q);
							}
							break;
					}
				}
				break;
		}
	}
}
