/*draw_set_font(global.usernamefont)
//draw_sprite_tiled(bg_ball, 2, bg_x, bg_y)
draw_sprite_tiled_ext(spr_electricwall, 0, bg_x, bg_y, 1, 1, c_white, 0.5)
draw_sprite_tiled_ext(spr_optionsBG, 1, bg_x, bg_y, 1, 1, c_white, 0.3)
draw_set_halign(fa_left)
draw_sprite_ext(spr_border, 0, 384, 64, 5.333333, 3.333333, 0, c_white, 1)
draw_sprite(optionimg, sped, 640, 288)
 draw_text_color(273, 386, infor, c_white, c_white, c_white, c_white, 1)
 draw_set_font(global.usernamefont)
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
if (optionselected == 3)
    draw_text_colour(25, 125, "Remix", c_white, c_white, c_white, c_white, 1)
elsefor (var i = 0; i < condition; ++i) {
	    // code here
	}
    draw_text_colour(25, 125, "Remix", c_white, c_white, c_white, c_white, 0.5)
if (optionselected == 3)
{
	if (global.remix == 1)
	    draw_text_colour(300, 125, "On", c_white, c_white, c_white, c_white, 1)
	else if (global.remix == 0)
	    draw_text_colour(300, 125, "Off", c_white, c_white, c_white, c_white, 1)
}
else
{
	if (global.remix == 1)
	    draw_text_colour(300, 125, "On", c_white, c_white, c_white, c_white, 0.5)
	else if (global.remix == 0)
	    draw_text_colour(300, 125, "Off", c_white, c_white, c_white, c_white, 0.5)
}*/
draw_set_font(global.usernamefont);
draw_sprite_tiled_ext(spr_electricwall, 0, bg_x--, bg_y--, 1, 1, c_white, 0.5)
draw_sprite_tiled_ext(spr_optionsBG, 1, bg_x--, bg_y--, 1, 1, c_white, 0.3)
draw_text_color(273, 386, infor, c_white, c_white, c_white, c_white, 1)
var gety = 25
for (var i = 0; i < array_length(menu_arr); ++i) {
	var txtalpha = (selected == i) ? 1 : 0.5;
	draw_text_color(25, gety,  menu_arr[i][0], c_white, c_white, c_white, c_white, txtalpha)
	var swtch = (menu_arr[i][1] == 1) ? "On" : "Off"
	if menu_arr[i][1] != "none" 
		draw_text(300, gety, menu_arr[i][1])
	gety += 25
}