if (!global.option_hud || (instance_exists(obj_debugcontroller) && !obj_debugcontroller.showhud))
	exit;
draw_set_font(global.smallnumber_fnt);
draw_set_halign(1);
var c = negative ? global.smallnumber_color2 : global.smallnumber_color1;
draw_set_color(c);
if (!flash)
	draw_text(x, y, number);
