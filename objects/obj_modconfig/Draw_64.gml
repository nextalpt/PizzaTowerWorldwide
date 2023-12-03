draw_set_font(global.smallfont)
//draw_sprite_tiled(bg_ball, 2, bg_x, bg_y)
draw_sprite_tiled_ext(spr_electricwall, 0, bg_x, bg_y, 1, 1, c_white, 0.5)
draw_set_halign(fa_left)
draw_sprite_ext(spr_border, 0, 384, 64, 5.333333, 3.333333, 0, c_white, 1)
if (optionselected == -1)
    draw_text_colour(25, 25, "EXIT", c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(25, 25, "EXIT", c_white, c_white, c_white, c_white, 0.5)
if (optionselected == 0)
    draw_text_colour(25, 50, "SMOOTH CAMERA", c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(25, 50, "SMOOTH CAMERA", c_white, c_white, c_white, c_white, 0.5)
if (global.smoothcam == 1)
    draw_text_colour(300, 50, "ON", c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(300, 50, "OFF", c_white, c_white, c_white, c_white, 0.5)

if (optionselected == 1)
    draw_text_colour(25, 75, "SLOPE ANGLING", c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(25, 75, "SLOPE ANGLING", c_white, c_white, c_white, c_white, 0.5)
if (global.slopeangle == 1)
    draw_text_colour(300, 75, "ON", c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(300, 75, "OFF", c_white, c_white, c_white, c_white, 0.5)

