if (room == rm_editor)
	exit;
if global.blockstyle = 1
{
	if (ds_list_find_index(global.saveroom, id) == -1)
	{
		with (instance_create(x + 32, y + 32, obj_sausageman_dead))
			sprite_index = spr_bigdoughblockdead;
		scr_sleep(5);
		fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
		ds_list_add(global.saveroom, id);
	}
}
if (ds_list_find_index(global.saveroom, id) == -1) and global.blockstyle = 0
{
	repeat (2)
	{
		with (create_debris(x + random_range(0, sprite_width), y + random_range(0, sprite_height), spr_bigdebris, true))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
			image_speed = 0.35;
		}
	}
	with (instance_create(x + random_range(0, sprite_width), y + random_range(0, sprite_height), obj_parryeffect))
	{
		sprite_index = spr_deadjohnsmoke;
		image_speed = 0.35;
	}
	scr_sleep(5);
	tile_layer_delete_at(1, x, y);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	ds_list_add(global.saveroom, id);
	notification_push(notifs.block_break, [room]);
}

instance_destroy(solid_inst);
