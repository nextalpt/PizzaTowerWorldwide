state++;
if (state == 1)
{
	alarm[0] = 100;
	GamepadSetVibration(0, 1, 1, 0.9);
	instance_destroy(obj_kidspartybg);
	instance_destroy(obj_bazooka);
	with (obj_player1)
		state = states.actor;
	scr_monster_deactivate(false);
}
else if (state == 2)
{
	sprite_index = spr_tvstatic;
	image_index = sprite_get_number(spr_tvstatic) - 1;
	image_speed = 0;
	with (obj_player)
	{
		if (check_player_coop())
		{
			state = states.animatronic;
			x = roomstartx;
			y = roomstarty;
		}
	}
	warbg_stop();
	scr_monster_deactivate();
}
