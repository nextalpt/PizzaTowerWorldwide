draw_sprite_tiled(spr_finalrankBG, bg_index, bg_x, bg_y);
draw_self();
if (brown)
{
	shader_set(shd_rank);
	draw_set_alpha(brownfade);
	draw_sprite_tiled(spr_finalrankBG, bg_index, bg_x, bg_y);
	draw_self();
	reset_shader_fix();
	draw_set_alpha(1);
}
draw_set_font(lang_get_font("bigfont"));
draw_set_halign(0);
draw_set_valign(0);
for (var i = 0; i < array_length(text); i++)
{
	var b = text[i];
	if (b[0])
		draw_text_color(48, 48 + (32 * i), b[1], c_white, c_white, c_white, c_white, 1);
}
draw_set_alpha(fade);
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
draw_set_alpha(1);
if (state == 2)
{
	draw_set_font(global.combofont);
	draw_set_halign(1);
	draw_set_valign(1);
	var _x = (SCREEN_WIDTH / 2) - 17;
	draw_sprite(spr_towerstatusmenu, 0, _x, SCREEN_HEIGHT / 2);
	draw_text_color(_x + 8, (SCREEN_HEIGHT / 2) + 10, floor(percvisual), c_white, c_white, c_white, c_white, 1);
}
