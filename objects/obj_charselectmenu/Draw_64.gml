draw_set_halign(1)
draw_set_valign(0)
draw_sprite_tiled_ext(spr_optionsBG, 2, bg_x, bg_y, 1, 1, c_white, alpha / 2)
shader_set(shd_hit) //janky ass outline
if !taunt
{
	draw_sprite_ext(spr_character, char_index, (SCREEN_WIDTH / 2) + xoffset + 2, (SCREEN_HEIGHT / 2) + yoffset, 2, 2, 0, c_white, alpha)
	draw_sprite_ext(spr_character, char_index, (SCREEN_WIDTH / 2) + xoffset - 2, (SCREEN_HEIGHT / 2) + yoffset, 2, 2, 0, c_white, alpha)
	draw_sprite_ext(spr_character, char_index, (SCREEN_WIDTH / 2) + xoffset, (SCREEN_HEIGHT / 2) + yoffset + 2, 2, 2, 0, c_white, alpha)
	draw_sprite_ext(spr_character, char_index, (SCREEN_WIDTH / 2) + xoffset, (SCREEN_HEIGHT / 2) + yoffset - 2, 2, 2, 0, c_white, alpha)
	
	draw_sprite_ext(spr_character, char_index, (SCREEN_WIDTH / 2) + xoffset + 2, (SCREEN_HEIGHT / 2) + yoffset + 2, 2, 2, 0, c_white, alpha)
	draw_sprite_ext(spr_character, char_index, (SCREEN_WIDTH / 2) + xoffset - 2, (SCREEN_HEIGHT / 2) + yoffset - 2, 2, 2, 0, c_white, alpha)
	draw_sprite_ext(spr_character, char_index, (SCREEN_WIDTH / 2) + xoffset - 2, (SCREEN_HEIGHT / 2) + yoffset + 2, 2, 2, 0, c_white, alpha)
	draw_sprite_ext(spr_character, char_index, (SCREEN_WIDTH / 2) + xoffset + 2, (SCREEN_HEIGHT / 2) + yoffset - 2, 2, 2, 0, c_white, alpha)
}
else
{
	draw_sprite_ext(spr_taunt, taunt_index, (SCREEN_WIDTH / 2) + xoffset + 2, (SCREEN_HEIGHT / 2) + yoffset, 2, 2, 0, c_white, alpha)
	draw_sprite_ext(spr_taunt, taunt_index, (SCREEN_WIDTH / 2) + xoffset - 2, (SCREEN_HEIGHT / 2) + yoffset, 2, 2, 0, c_white, alpha)
	draw_sprite_ext(spr_taunt, taunt_index, (SCREEN_WIDTH / 2) + xoffset, (SCREEN_HEIGHT / 2) + yoffset + 2, 2, 2, 0, c_white, alpha)
	draw_sprite_ext(spr_taunt, taunt_index, (SCREEN_WIDTH / 2) + xoffset, (SCREEN_HEIGHT / 2) + yoffset - 2, 2, 2, 0, c_white, alpha)
	
	draw_sprite_ext(spr_taunt, taunt_index, (SCREEN_WIDTH / 2) + xoffset + 2, (SCREEN_HEIGHT / 2) + yoffset + 2, 2, 2, 0, c_white, alpha)
	draw_sprite_ext(spr_taunt, taunt_index, (SCREEN_WIDTH / 2) + xoffset - 2, (SCREEN_HEIGHT / 2) + yoffset - 2, 2, 2, 0, c_white, alpha)
	draw_sprite_ext(spr_taunt, taunt_index, (SCREEN_WIDTH / 2) + xoffset - 2, (SCREEN_HEIGHT / 2) + yoffset + 2, 2, 2, 0, c_white, alpha)
	draw_sprite_ext(spr_taunt, taunt_index, (SCREEN_WIDTH / 2) + xoffset + 2, (SCREEN_HEIGHT / 2) + yoffset - 2, 2, 2, 0, c_white, alpha)
}
shader_reset()

shader_set(global.Pal_Shader);
pattern_set(global.Base_Pattern_Color, spr_character, char_index, 2, 2, global.palettetexture);
pal_swap_set(spr_palette, paletteselect, false);
if !taunt
	draw_sprite_ext(spr_character, char_index, (SCREEN_WIDTH / 2) + xoffset, (SCREEN_HEIGHT / 2) + yoffset, 2, 2, 0, c_white, alpha)	
else
	draw_sprite_ext(spr_taunt, taunt_index, (SCREEN_WIDTH / 2) + xoffset, (SCREEN_HEIGHT / 2) + yoffset, 2, 2, 0, c_white, alpha)
pattern_reset();
reset_shader_fix();
draw_set_font(global.creditsfont)
draw_text_color(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) + 100, bigtext, c_white, c_white, c_white, c_white, alpha)
draw_set_font(global.usernamefont)
draw_text_color(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) + 150, string_upper(smalltext), c_white, c_white, c_white, c_white, alpha)
shader_set(global.Pal_Shader);
pattern_set(global.Base_Pattern_Color, spr_character, char_index, 2, 2, global.palettetexture);
pal_swap_set(spr_palette, paletteselect, false);
draw_sprite_ext(spr_palettedresserdebris, -1, SCREEN_WIDTH - 200 + clothesoffset, (SCREEN_HEIGHT / 2), 2, 2, 0, c_white, alpha)
pattern_reset();
reset_shader_fix();
if paletteselect > 0
{
	shader_set(global.Pal_Shader);
	pattern_set(global.Base_Pattern_Color, spr_character, char_index, 2, 2, global.palettetexture);
	pal_swap_set(spr_palette, paletteselect - 1, false);
	draw_sprite_ext(spr_palettedresserdebris, -1, SCREEN_WIDTH - 200 + clothesoffset, (SCREEN_HEIGHT / 2) - 110, 1, 1, 0, c_white, alpha)
	pattern_reset();
	reset_shader_fix();
}
if paletteselect < sprite_get_width(spr_palette) - 1
{
	shader_set(global.Pal_Shader);
	pattern_set(global.Base_Pattern_Color, spr_character, char_index, 2, 2, global.palettetexture);
	pal_swap_set(spr_palette, paletteselect + 1, false);
	draw_sprite_ext(spr_palettedresserdebris, -1, SCREEN_WIDTH - 200 + clothesoffset, (SCREEN_HEIGHT / 2) + 110, 1, 1, 0, c_white, alpha)
	pattern_reset();
	reset_shader_fix();
}
if menu_select = 0
{
	off1 = Approach(off1, 0, 3)
	var _c1 = c_white
}
else
{
	off1 = Approach(off1, 25, 3)
	_c1 = c_gray
}
draw_sprite_ext(spr_dressertabs, 0, 0, 0 - off1, 1, 1, 0, _c1, alpha)
if menu_select = 1
{
	off2 = Approach(off2, 0, 3)
	var _c2 = c_white
}
else
{
	off2 = Approach(off2, 25, 3)
	_c2 = c_gray
}
draw_sprite_ext(spr_dressertabs, 1, 150, 0 - off2, 1, 1, 0, _c2, alpha)
if menu_select = 2
{
	off3 = Approach(off3, 0, 3)
	var _c3 = c_white
}
else
{
	off3 = Approach(off3, 25, 3)
	_c3 = c_gray
}
draw_sprite_ext(spr_dressertabs, 2, 300, 0 - off3, 1, 1, 0, _c3, alpha)
if menu_select = 3
{
	off4 = Approach(off4, 0, 3)
	var _c4 = c_white
}
else
{
	off4 = Approach(off4, 25, 3)
	_c4 = c_gray
}
draw_sprite_ext(spr_dressertabs, 3, 450, 0 - off4, 1, 1, 0, _c4, alpha)