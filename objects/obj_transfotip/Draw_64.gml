draw_set_font(lang_get_font("creditsfont"));
draw_set_halign(0);
draw_set_valign(0);
draw_set_alpha(fade);
draw_set_color(c_white);
var xx = SCREEN_WIDTH / 2;
var yy = SCREEN_HEIGHT - 50;
if (global.panic && !instance_exists(obj_ghostcollectibles))
	yy -= 60;
var s = text_size;
xx -= (s[0] / 2);
yy -= s[1];
xx = floor(xx);
yy = floor(yy);
scr_draw_text_arr(xx, yy, text_arr, c_white, fade);
draw_set_alpha(1);
