draw_set_font(global.bigfont)
draw_sprite_tiled(bg_ball, 2, bg_x, bg_y)
if (optionselected == -1)
    draw_text_colour(64, 25, "EXIT", c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(64, 25, "EXIT", c_white, c_white, c_white, c_white, 0.5)
if (optionselected == 1)
    draw_text_colour(480, 25, "HEAT METER", c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(480, 25, "HEAT METER", c_white, c_white, c_white, c_white, 0.5)
