draw_set_font(global.moneyfont);
draw_set_halign(0);
draw_set_valign(1);
draw_set_alpha(image_alpha);
var c = 255;
draw_set_color(c);
draw_text(x, y + obj_camera.hud_posY, number);
draw_set_alpha(1);
draw_set_color(c_white);
