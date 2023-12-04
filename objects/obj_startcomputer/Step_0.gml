drawing = place_meeting(x, y, obj_player);
if (!pizza && (highscore > 0 || (boss && hats > 0)) && bbox_in_camera(view_camera[0], 0) && distance_to_object(obj_player) < 150)
{
	pizza = true;
	if (!boss)
	{
		with (instance_create(x, y - SCREEN_HEIGHT, obj_startgate_pizza))
		{
			y_to = other.y - 125;
			highscore = [];
			highscorepos = 0;
			var s = string(other.highscore);
			for (var i = 1; i <= string_length(s); i++)
			{
				var c = string_char_at(s, i);
				array_push(highscore, [c, 0, 0]);
			}
			switch (other.rank)
			{
				case "p":
					rank_index = 5;
					sprite_index = spr_gatepizza_5;
					break;
				case "s":
					rank_index = 4;
					sprite_index = spr_gatepizza_5;
					break;
				case "a":
					rank_index = 3;
					sprite_index = spr_gatepizza_4;
					break;
				case "b":
					rank_index = 2;
					sprite_index = spr_gatepizza_3;
					break;
				case "c":
					rank_index = 1;
					sprite_index = spr_gatepizza_2;
					break;
				default:
					rank_index = 0;
					sprite_index = spr_gatepizza_1;
					break;
			}
		}
	}
	else
	{
		with (instance_create(x, y - 125, obj_startgate_hats))
		{
			ini_open_from_string(obj_savesystem.ini_str);
			hats = ini_read_real("Hats", other.level, 0);
			extrahats = ini_read_real("Extrahats", other.level, 0);
			switch (other.rank)
			{
				case "p":
					rank_index = 5;
					break;
				case "s":
					rank_index = 4;
					break;
				case "a":
					rank_index = 3;
					break;
				case "b":
					rank_index = 2;
					break;
				case "c":
					rank_index = 1;
					break;
				default:
					rank_index = 0;
					break;
			}
			ini_close();
		}
	}
}