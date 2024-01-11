video_open("gamedata/ohmyworldwide.mp4");
instance_destroy(obj_pigtotal);
draw_set_font(lang_get_font("creditsfont"));
draw_set_halign(0);
draw_set_valign(0);
text = scr_compile_icon_text(lang_get_value("menu_skip"));
showtext = false;
skipbuffer = 0;
startbuffer = false;
with (obj_player)
	state = states.titlescreen;
displayVideo = false;