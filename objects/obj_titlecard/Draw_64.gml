if (start)
{
	draw_sprite(titlecard_sprite, titlecard_index, 0, 0);
	var s = 1;
	draw_sprite(title_sprite, title_index, 32 + irandom_range(-s, s), irandom_range(-s, s));
}
if (!instance_exists(obj_fadeout))
	draw_set_alpha(fadealpha);
else
	draw_set_alpha(obj_fadeout.fadealpha);
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
draw_set_alpha(1);
