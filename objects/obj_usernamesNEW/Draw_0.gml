draw_set_font(lang_get_font("smallfont"));
draw_set_halign(playerid.x);
draw_set_valign(playerid.y - 50);
draw_set_color(c_white);
draw_text(playerid.x, playerid.y - 50, global.username);
