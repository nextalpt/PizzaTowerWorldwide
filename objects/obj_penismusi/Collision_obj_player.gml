with other
{
	if (key_up2 && grounded && state != states.actor)
	{
		instance_create_unique(x, y, obj_charselectmenu)
		state = states.actor
		sprite_index = spr_idle
		movespeed = 0
		hsp = 0
		vsp = 0
	}
}
