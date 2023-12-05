if (room == rm_editor || room == custom_lvl_room)
	exit;
if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy();
if (ini_read_real("modded", "sagekey", true))
	instance_destroy()