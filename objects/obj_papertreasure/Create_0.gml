event_inherited();
got_func = function()
{
	if (global.papercutscene == -4 || !global.papercutscene)
	{
		global.papercutscene = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "paper", true);
	}
};
if (global.papercutscene == -4)
	global.papercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "paper", false);
if (global.papercutscene)
	instance_destroy();
