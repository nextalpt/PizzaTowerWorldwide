if (global.freezercutscene == -4)
	global.freezercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "freezer", false);
if (global.freezercutscene)
	instance_destroy();
