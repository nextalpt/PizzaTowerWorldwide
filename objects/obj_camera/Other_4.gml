x = obj_player1.x;
y = obj_player1.y;
with (obj_camera)
{
	shake_mag = 0;
	shake_mag_acc = 0;
}
if (global.coop)
	camera_zoom(1, 100);
camera_set_view_angle(view_camera[0], (rotate)) 