enum tvprompt
{
	normal,
	trigger,
	transfo
}
global.remix = 0

image_speed = 0.1;
chose = false;
message = "";
showtext = false;
tvprompts_list = ds_list_create();
state = states.normal;
promptxstart = 641;
promptx = promptxstart;
prompt = "";
promptspd = 1;
prompt_buffer = 0;
prompt_max = 150;
promptsurface = surface_create(290, 102);
visualcombo = 0;
tv_bg_index = 0;
tv_trans = 0;
tv_cooldown = 0;
tv_x = SCREEN_WIDTH - 115;
tv_y = 80;
targetgolf = -4;
special_prompts = -4;
hud_posx = 0;
hud_posY = 0;
combo_state = 0;
combo_posX = 0;
combo_vsp = 0;
combo_posY = 0;
combofill_x = 0;
combofill_y = 0;
combofill_index = 0;
noisemax = 6;
noisebuffer = noisemax;
expressionsprite = -4;
expressionbuffer = 0;
golfsurf = -4;
tvsprite = spr_tv_idle;
sprite_index = spr_tv_off;
bubbleindex = 0;
bubblespr = -4;
idleanim = 180;	
noisesprite = spr_noiseHUD_idle;
xi = 500;
yi = 600;
imageindexstore = 0;
once = false;
global.hurtcounter = 0;
global.hurtmilestone = 3;
alpha = 1;
shownranka = false;
shownrankb = false;
shownrankc = false;
collect_shake = 0;
global.srank = 0;
global.arank = 0;
global.brank = 0;
global.crank = 0;
character = "PEPPINO";
chunkmax = 0;
timer_xplus = -153;
timer_yplus = -76;
timer_xstart = (SCREEN_WIDTH / 2) + timer_xplus;
timer_ystart = SCREEN_HEIGHT + timer_yplus;
timer_x = timer_xstart;
timer_y = timer_ystart + 212;
timer_tower = false;
pizzaface_sprite = spr_timer_pizzaface1;
pizzaface_index = 0;
johnface_sprite = spr_timer_johnface;
johnface_index = 0;
hand_sprite = spr_timer_hand1;
hand_index = 0;
bar_surface = -4;
barfill_x = 0;
showtime_buffer = 0;
parrallaxnumber = 1
scr_hub_bg_init(parrallaxnumber, 1)
bgsprite = spr_gate_tutorialBG