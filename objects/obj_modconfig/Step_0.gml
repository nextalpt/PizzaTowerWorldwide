bg_x += 0.9
bg_y += 0.9
scr_getinput()
if (cooldown > 0)
    cooldown--
if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > -1 && selected == 0)
    optionselected--
if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 0 && selected == 0)
    optionselected++
if (optionselected == -1)
{
    if (key_jump2 && cooldown == 0)
    {
        instance_destroy()
        obj_player.state = states.normal
    }
}
if (key_slap2 && cooldown == 0)
{
    instance_destroy()
    obj_player.state = states.normal
}
/*
if instance_exists(obj_modconfig)
    visible = false
else
    visible = true
