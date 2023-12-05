if (place_meeting(x, y, obj_player))
	visited = true;
if (!(ds_list_find_index(global.saveroom, id) == -1))
	sprite_index = spr_doorkeyopen;
if (ini_read_real("modded", "sagedoor", true))
	sprite_index = spr_doorkeyopen;