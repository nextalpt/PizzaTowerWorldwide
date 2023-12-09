draw_set_font(global.usernamefont)
//draw_sprite_tiled(bg_ball, 2, bg_x, bg_y)
draw_sprite_tiled_ext(spr_electricwall, 0, bg_x, bg_y, 1, 1, c_white, 0.5)
draw_set_halign(fa_left)
draw_sprite_ext(spr_border, 0, 384, 64, 5.333333, 3.333333, 0, c_white, 1)
draw_sprite(optionimg, sped, 640, 288)
if (optionselected == -1)
    draw_text_colour(25, 25, "Exit", c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(25, 25, "Exit", c_white, c_white, c_white, c_white, 0.5)
if (optionselected == 0)
    draw_text_colour(25, 50, "Smooth Camera", c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(25, 50, "Smooth Camera", c_white, c_white, c_white, c_white, 0.5)
if (global.smoothcam == 1)
    draw_text_colour(300, 50, "On", c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(300, 50, "Off", c_white, c_white, c_white, c_white, 0.5)

if (optionselected == 1)
    draw_text_colour(25, 75, "Slope Angling", c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(25, 75, "Slope Angling", c_white, c_white, c_white, c_white, 0.5)
if (global.slopeangle == 1)
    draw_text_colour(300, 75, "On", c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(300, 75, "Off", c_white, c_white, c_white, c_white, 0.5)
if (optionselected == 2)
    draw_text_colour(25, 100, "Block Style", c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(25, 100, "Block Style", c_white, c_white, c_white, c_white, 0.5)
if (optionselected == 2)
{
	if (global.blockstyle == 1)
	    draw_text_colour(300, 100, "New", c_white, c_white, c_white, c_white, 1)
	else if (global.blockstyle == 0)
	    draw_text_colour(300, 100, "Old", c_white, c_white, c_white, c_white, 1)
}
else
{
	if (global.blockstyle == 1)
	    draw_text_colour(300, 100, "New", c_white, c_white, c_white, c_white, 0.5)
	else if (global.blockstyle == 0)
	    draw_text_colour(300, 100, "Old", c_white, c_white, c_white, c_white, 0.5)
}