if (!instance_exists(obj_keyconfig))
{
	if ((-obj_player.key_left2 || keyboard_check_pressed(vk_left)) && optionselected > 0)
		optionselected -= 1;
	if ((obj_player.key_right2 || keyboard_check_pressed(vk_right)) && optionselected < 1)
		optionselected += 1;
}
if (((optionselected == 1 && (obj_player.key_jump || keyboard_check_pressed(vk_enter)))))
{
	obj_modeselect.selected = false;
	global.online = 1
	instance_destroy();
}
if ((obj_player.key_slap2 || keyboard_check_pressed(vk_escape)))
{
	obj_modeselect.selected = false;
	instance_destroy();
}
if (((optionselected == 0 && (obj_player.key_jump || keyboard_check_pressed(vk_enter)))))
{
	obj_modeselect.selected = false;
	global.online = 0
	instance_destroy();
}
