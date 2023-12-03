bg_x += 0.9
bg_y += 0.9
scr_getinput()
if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > -1 && selected == 0)
    optionselected--
if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 1 && selected == 0)
    optionselected++
if (optionselected == -1)
{
    cooldown = 15
	with obj_player1
	{
		state = states.normal
	}
	if key_jump2
        instance_destroy()
}
ini_open("modconfig.ini")
if (optionselected == 0)
{

    if ((key_left2 || keyboard_check_pressed(vk_right)) && global.smoothcam == 1)
        global.smoothcam = 0
		ini_write_real("config", "smoothcam", 0)
    if (((-key_right2) || keyboard_check_pressed(vk_left)) && global.smoothcam == 0)
        global.smoothcam = 1
		ini_write_real("config", "smoothcam", 1)
    //if key_jump2
    //{
    //    if (global.smoothcam == 0)
    //    {
    //        ini_write_real("config", "smoothcam", 1) //or you can use ini_write_string("section", "string", "value")
    //    }
    //    if (global.smoothcam == 1)
    //    {
    //        ini_write_real("config", "smoothcam", 0) //or you can use ini_write_string("section", "string", "value")
    //    }

    //}

}
