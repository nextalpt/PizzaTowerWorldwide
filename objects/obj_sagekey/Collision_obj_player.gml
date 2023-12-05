if (room == rm_editor)
	exit;
if (global.sage_key_inv)
	exit;
with (other)
{
	if (state != states.bombpep && state != states.gotoplayer && state != states.ghost && state != states.knightpep && state != states.cheeseball && state != states.boxxedpep && state != states.cheesepep && state != states.knightpepattack && state != states.knightpepslopes && state != states.hurt && state != states.knightpepbump)
	{
		instance_destroy(other);
		global.sage_key_inv = true;
		key_particles = true;
		alarm[7] = 30;
		fmod_event_one_shot("event:/sfx/misc/collecttoppin");
		state = states.keyget;
		image_index = 0;
		keysound = false;
		global.combotime = 60;
	}
	ini_open_from_string(obj_savesystem.ini_str);
	ini_write_real("modded", "sagekey", true);
	obj_savesystem.ini_str = ini_close();
}
