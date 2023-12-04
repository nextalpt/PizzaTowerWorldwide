if (room == rank_room)
	exit;
if (!global.panic || !global.snickchallenge)
	exit;
if (instance_exists(obj_treasure))
	exit;
