if (lock)
	exit;
if (followid != -4 && !instance_exists(obj_player1))
	exit;
playerid = obj_player1.id;
if (playerid.state != states.ladder && playerid.state != states.door && playerid.state != states.comingoutdoor)
{
	if (space < maxspace && dir == -1)
		space += spaceaccel;
	if (space > -maxspace && dir == 1)
		space -= spaceaccel;
}
else
	space = Approach(space, 0, spaceaccel);
if (dir != playerid.xscale)
	dir = playerid.xscale;
if (followid != -4 && !instance_exists(followid))
	followid = -4;
var tx = round(xoffset * space);
var xx = (followid == -4) ? playerid.x : followid.x;
var yy = (followid == -4) ? playerid.y : followid.y;
var msk = (followid == -4) ? playerid.mask_index : followid.mask_index;
var ixs = (followid == -4) ? playerid.xscale : followid.image_xscale;
ds_queue_enqueue(followqueue, xx + tx);
ds_queue_enqueue(followqueue, yy);
ds_queue_enqueue(followqueue, msk);
ds_queue_enqueue(followqueue, ixs);
if (ds_queue_size(followqueue) > (LAG_STEPS * 2))
{
	var _x = ds_queue_dequeue(followqueue);
	var _y = ds_queue_dequeue(followqueue);
	if (!use_collision)
	{
		if (interp < 1)
		{
			x = lerp(x, _x, interp);
			y = lerp(y, _y, interp);
			interp = Approach(interp, 1, 0.01);
		}
		else
		{
			x = _x;
			y = _y;
		}
	}
	mask_index = ds_queue_dequeue(followqueue);
	image_xscale = ds_queue_dequeue(followqueue);
	lastplayerposx = _x;
	lastplayerposy = _y;
}
image_xscale = playerid.xscale * playerid.scale_xs;
image_yscale = playerid.yscale * playerid.scale_ys;
