if (showsprite)
	draw_self();
if (text != -4)
{
	draw_set_halign(1);
	draw_set_valign(1);
	draw_set_font(lang_get_font("creditsfont"));
	draw_text_color(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, text, c_white, c_white, c_white, c_white, text_alpha);
}
