draw_set_font(lang_get_font("usernamefont"));
draw_set_halign(1);
draw_set_color(global.username_color);
draw_text(playerid.x, playerid.y - 50, global.username);
draw_set_halign(0);
draw_set_color(c_white)

if global.laps > 0
{
	draw_set_font(global.usernamefont);
	draw_set_halign(1);
	draw_set_color(c_purple);
	draw_text(playerid.x - 10, playerid.y - 75, "LAP");
	draw_text(playerid.x + 20, playerid.y - 75, global.laps);
	draw_set_halign(0);
	draw_set_color(c_white)
}