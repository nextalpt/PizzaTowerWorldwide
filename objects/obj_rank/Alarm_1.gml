global.levelcomplete = true;
scr_playerreset();
with (obj_player)
{
	targetDoor = "HUB";
	targetRoom = backtohubroom;
	room = backtohubroom;
	x = backtohubstartx;
	y = backtohubstarty;
	state = states.comingoutdoor;
	sprite_index = spr_walkfront;
	image_index = 0;
	image_blend = c_white;
}
global.exitrank = false;
global.leveltorestart = -4;
global.leveltosave = -4;
global.level_minutes = 0;
global.level_seconds = 0;
