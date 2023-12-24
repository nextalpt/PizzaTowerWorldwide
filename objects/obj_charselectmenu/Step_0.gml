scr_getinput()
obj_player.state = states.actor
obj_player.movespeed = 0
obj_player.hsp = 0
obj_player.vsp = 0
yoffset = Approach(yoffset, 0, 2)
if !fadeout
	alpha = Approach(alpha, 1, 0.1)
else
	alpha = Approach(alpha, 0, 0.1)
if fadeout && alpha = 0
	instance_destroy()
bg_x ++
bg_y ++
if !taunt
	char_index += 0.35
else
{
	eff_index += 0.5
	if eff_index >= 9
		draw_taunt = false
}
bigtext = lang_get_value(concat("char_", char_string))
smalltext = lang_get_value(concat("char_", char_string, "desc"))
if key_jump && !ready && !taunt
	ready = true
if !ready
{
	if key_taunt2
	{
		taunt = true
		taunt_index = irandom_range(0, (sprite_get_number(spr_taunt) - 1))
		fmod_event_one_shot_3d(snd_taunt, x, y)
		alarm[1] = 20
		eff_index = 0
		draw_taunt = true
	}
	if -key_left2 && menu_select > 0
	{
		menu_select--
		fmod_event_one_shot("event:/sfx/ui/angelmove")
		//xoffset = -24
	}
	if key_right2 && menu_select < 3
	{
		menu_select ++
		fmod_event_one_shot("event:/sfx/ui/angelmove")
		//xoffset = 24
	}
	if character_selected = 0
	{
		spr_character = spr_player_panic
		spr_selected = spr_player_hurt
		spr_taunt = spr_player_taunt
		spr_palette = spr_peppalette
		bigtext = "Peppino Spaghetti"
		smalltext = "A PORTLY ITALIAN CHEF TRYING TO KEEP HIS SHOP IN BUSINESS"
		snd_selected = "event:/sfx/misc/collectpizza"
		snd_taunt = "event:/sfx/pep/taunt"
	}
	if character_selected = 1
	{
		spr_character = spr_playerN_panicidle
		spr_selected = spr_playerN_hurt
		spr_taunt = spr_playerN_taunt
		spr_palette = spr_noisepalette
		bigtext = "The Noise"
		smalltext = "A MISCHEVIOUS GREMLIN LOOKING TO CAUSE TROBLE WHENEVER HE CAN"
		snd_selected = "event:/sfx/misc/collectpizza"
		snd_taunt = "event:/sfx/pep/noisetaunt"
	}
	if character_selected = 2
	{
		spr_character = spr_playerN_pogofall
		spr_selected = spr_playerN_hurt
		spr_taunt = spr_playerN_taunt
		spr_palette = spr_noisepalette
		bigtext = "Pogo Noise"
		smalltext = "THE SAME THING BUT WITH A POGO STICK (WOWIE!)"
		snd_selected = "event:/sfx/misc/collectpizza"
		snd_taunt = "event:/sfx/pep/noisetaunt"
	}
	if character_selected = 3
	{
		spr_character = spr_playerV_panic
		spr_selected = spr_playerV_hurt
		spr_taunt = spr_playerV_taunt
		spr_palette = spr_vigipalette
		bigtext = "The Vigilante"
		smalltext = "THE TOUGH SHERIFF OF THE WESTERN DISTRICT"
		snd_selected = "event:/sfx/misc/collectpizza"
		snd_taunt = "event:/sfx/pep/taunt"
	}
	if character_selected = 4
	{
		spr_character = spr_playerG_idle
		spr_selected = spr_playerG_move
		spr_taunt = spr_playerG_idle
		spr_palette = spr_gegginopalette
		bigtext = "Geggino Gawgeronii"
		smalltext = "A WEIRD GUY FROM NORWAY WITH A GRILLED CHEESE RESTAURANT"
		snd_selected = "event:/sfx/misc/collectpizza"
		snd_taunt = "event:/sfx/pep/taunt"
	}
	if menu_select = 0
	{
		xoffset = lerp(xoffset, 0, 0.1)
		clothesoffset = lerp(clothesoffset, 500, 0.1)
		if key_down2 && character_selected < 4
		{
			character_selected++
			fmod_event_one_shot("event:/sfx/ui/angelmove")
			char_index = 0
			yoffset = 24
		}
		if key_up2 && character_selected > 0
		{
			character_selected--
			fmod_event_one_shot("event:/sfx/ui/angelmove")
			char_index = 0
			yoffset = -24
		}
	}
	if menu_select = 1
	{
		xoffset = lerp(xoffset, -200, 0.1)
		clothesoffset = lerp(clothesoffset, 0, 0.1)
		if key_down2 && paletteselect < sprite_get_width(spr_palette) - 1
		{
			paletteselect++
			fmod_event_one_shot("event:/sfx/ui/angelmove")
		}
		if key_up2 && paletteselect > 0
		{
			paletteselect--
			fmod_event_one_shot("event:/sfx/ui/angelmove")
		}
	}
}
if ready && !donecharswitch
{
	donecharswitch = true
	spr_character = spr_selected
	char_index = 0
	alarm[0] = 50
	with obj_player
	{
		fmod_event_one_shot_3d(obj_charselectmenu.snd_selected, x, y)
		instance_create(obj_player.x, obj_player.y, obj_genericpoofeffect)
		with (instance_create(x, y, obj_sausageman_dead))
		{
			fmod_event_one_shot_3d("event:/sfx/misc/clotheswitch", x, y);
			hsp = irandom_range(-5, 5);
			vsp = -irandom_range(6, 11);
			usepalette = true;
			sprite_index = obj_player.spr_deathend;
			spr_palette = spr_ratmountpalette;
			paletteselect = other.paletteselect;
			oldpalettetexture = global.palettetexture;
		}
		switch obj_charselectmenu.character_selected
		{
			case 0:
				character = "P"
				ispeppino = 1
				scr_characterspr()
				paletteselect = obj_charselectmenu.paletteselect
				sprite_index = spr_idle
				break
			case 1:
				character = "P"
				ispeppino = 0
				scr_characterspr()
				paletteselect = obj_charselectmenu.paletteselect
				sprite_index = spr_idle
				break
			case 2:
				character = "N"
				ispeppino = 0
				scr_characterspr()
				paletteselect = obj_charselectmenu.paletteselect
				sprite_index = spr_idle
				break
			case 3:
				character = "V"
				ispeppino = 0
				scr_characterspr()
				paletteselect = obj_charselectmenu.paletteselect
				sprite_index = spr_idle
				break
			case 4:
				character = "G"
				ispeppino = 0
				scr_characterspr()
				paletteselect = obj_charselectmenu.paletteselect
				sprite_index = spr_idle
				break
		}
	}
}
