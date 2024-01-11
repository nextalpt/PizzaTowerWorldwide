with (obj_player)
	state = states.titlescreen;
	if (!showtext && (keyboard_check_pressed(vk_anykey) || scr_checkanygamepad(obj_inputAssigner.player_input_device[0]) != -4))
	{
		showtext = true;
		alarm[0] = 120;
	}
	else if (showtext && (keyboard_check_pressed(global.key_slap) || gamepad_button_check_pressed(obj_inputAssigner.player_input_device[0], global.key_slapC)))
	{
		video_close();
		room_goto(Mainmenu);
		exit;
	}
