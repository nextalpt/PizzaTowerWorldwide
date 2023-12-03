function scr_hurtplayer(player)
{
	var _obj = object_index;
	var _other = id;
	var _savedstate = player.state;
	var _hurt = false;
	
	with (player)
	{
		if (global.failcutscene)
		{
		}
		else if (state == states.ratmounthurt || state == states.supergrab || state == states.pizzaface_phase2transition || state == states.parry || instance_exists(obj_vigilante_duelintro) || state == states.taxi || state == states.spaceshuttle || state == states.tube || state == states.debugstate || state == states.golf || state == states.slipbanan)
		{
		}
		else if (global.noisejetpack == 1)
		{
		}
		else if (holycross > 0 || invtime > 0)
		{
		}
		else if (sprite_index == spr_player_jetpackstart2)
		{
		}
		else if ((state == states.backbreaker && (parrytimer > 0 || instance_exists(obj_parryhitbox) || sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4 || sprite_index == spr_player_ratmountsupertaunt)) || state == states.chainsaw || state == states.phase1hurt || state == states.actor || instance_exists(obj_bossdark))
		{
			if (state == states.backbreaker)
				trace(parrytimer);
		}
		else if (global.kungfu)
		{
			if (state == states.blockstance)
			{
				if (sprite_index != spr_player_airattackstart)
				{
					instance_create(x, y, obj_parryeffect);
					image_index = 0;
				}
				sprite_index = spr_player_airattackstart;
				hsp = -xscale * 2;
			}
			else if (state != states.thrown && state != states.hit && !hurted)
			{
				instance_create(x, y, obj_parryeffect);
				repeat (5)
				{
					with (create_debris(x, y, spr_slapstar))
						vsp = irandom_range(-6, -11);
				}
				hitLag = 3;
				hitxscale = (x != other.x) ? sign(other.x - x) : -other.image_xscale;
				state = states.hit;
				hitstunned = 50;
				hurted = true;
				alarm[7] = hitstunned + 30;
				hithsp = 12;
				hitvsp = -5;
				hitX = x;
				hitY = y;
				sprite_index = spr_hurt;
				if (global.hp > 1)
				{
					global.hp--;
					with (obj_camera)
						healthshaketime = 60;
				}
				else
				{
					with (obj_music)
						arena = false;
					global.kungfu = false;
					if (!instance_exists(obj_fadeout))
					{
						with (obj_player)
							targetRoom = lastroom;
						instance_create(x, y, obj_fadeout);
					}
				}
			}
		}
		else if (isgustavo)
		{
			if (!hurted)
			{
				if (x != other.x)
					xscale = sign(other.x - x);
				if (irandom(100) <= 50)
					fmod_event_one_shot_3d("event:/sfx/voice/gushurt", x, y);
				state = states.ratmounthurt;
				movespeed = 6;
				vsp = -9;
				flash = true;
				fmod_event_one_shot_3d("event:/sfx/pep/hurt", x, y);
				alarm[8] = 100;
				alarm[5] = 2;
				alarm[7] = 150;
				hurted = true;
				instance_create(x, y, obj_spikehurteffect);
				_hurt = true;
			}
		}
		else if (state == states.shotgundash)
		{
		}
		else if ((state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes || state == states.knightpepbump) && cutscene == 0)
		{
		}
		else if (state == states.ghost)
		{
		}
		else if (state == states.ghostpossess)
		{
			if (instance_exists(possessID) && object_get_parent(possessID) == obj_baddie)
			{
				state = states.ghost;
				with (obj_baddie)
				{
					if (is_controllable && state == states.ghostpossess && playerid == other.id)
						instance_destroy();
				}
			}
		}
		else if (state == states.slipnslide)
		{
		}
		else if (state == states.trickjump)
		{
		}
		else if (state == states.chainsawbump)
		{
		}
		else if (state == states.bombpep && hurted == 0)
		{
		}
		else if (state == states.rideweenie)
		{
		}
		else if (state == states.slipnslide)
		{
		}
		else if (pizzashield == 1)
		{
			pizzashield = false;
			with (instance_create(x, y, obj_sausageman_dead))
				sprite_index = spr_pizzashield_collectible;
			hsp = -xscale * 4;
			vsp = -5;
			state = states.bump;
			sprite_index = spr_bump;
			invhurt_buffer = 120;
			alarm[8] = 60;
			alarm[7] = 120;
			hurted = true;
			fmod_event_one_shot_3d("event:/sfx/pep/hurt", x, y);
		}
		else if (state != states.hurt && state != states.ratmounthurt && state != states.grabbed && (hurted == 0 || state == states.cheesepep || state == states.cheesepepstickside || state == states.cheesepepstickup) && cutscene == 0)
		{
			if (state == states.animatronic)
			{
				with (create_debris(x, y, spr_animatronicdebris))
					image_index = 0;
				with (create_debris(x, y, spr_animatronicdebris))
					image_index = 1;
				with (create_debris(x, y, spr_animatronicdebris))
					image_index = 2;
			}
			if (state == states.barrel || state == states.barrelclimbwall || state == states.barreljump || state == states.barrelslide)
			{
				repeat (4)
					create_debris(x, y, spr_barreldebris);
			}
			var _old_xscale = xscale;
			if (x != other.x)
				xscale = sign(other.x - x);
			if (state == states.mort || state == states.morthook || state == states.mortjump || state == states.mortattack)
			{
				fmod_event_one_shot_3d("event:/sfx/mort/mortdead", x, y);
				create_debris(x, y - 40, spr_mortdead);
			}
			if (instance_exists(obj_hardmode))
				global.heatmeter_count = (global.heatmeter_threshold - 1) * global.heatmeter_threshold_count;
			_hurt = true;
			pistolanim = -4;
			if (character == "V")
				global.playerhealth -= 25;
			if (global.kungfu)
			{
				if (global.hp > 1)
				{
					global.hp--;
					with (obj_camera)
						healthshaketime = 60;
				}
				else
				{
					with (obj_music)
						arena = false;
					global.kungfu = false;
					if (!instance_exists(obj_fadeout))
					{
						with (obj_player)
							targetRoom = lastroom;
						instance_create(x, y, obj_fadeout);
					}
				}
			}
			if (state == states.grabbed)
			{
				if (object_index == obj_player1)
					y = obj_player2.y;
				else
					y = obj_player1.y;
			}
			if (state == states.trashroll || state == states.trashjump)
				create_debris(x, y, spr_player_trashlid);
			scr_sleep(100);
			fmod_event_one_shot_3d("event:/sfx/pep/hurt", x, y);
			if (irandom(100) <= 50)
				fmod_event_instance_play(snd_voicehurt);
			instance_create(x, y, obj_bangeffect);
			alarm[8] = 100;
			alarm[7] = 150;
			hurted = true;
			if (xscale == -_old_xscale)
				sprite_index = spr_hurtjump;
			else
				sprite_index = spr_hurt;
			movespeed = 8;
			vsp = -14;
			timeuntilhpback = 300;
			pistolanim = -4;
			instance_create(x, y, obj_spikehurteffect);
			state = states.hurt;
			image_index = 0;
			flash = true;
			repeat (5)
				instance_create(x, y, obj_hurtstars);
		}
		if (_hurt)
		{
			notification_push(notifs.hurt_player, [player.id, _savedstate, _obj]);
			
			global.combotime -= 25;
			global.style -= 25;
			global.hurtcounter += 1;
			global.player_damage += 1;
			if (!isgustavo)
				global.peppino_damage += 1;
			else
				global.gustavo_damage += 1;
			var damage_n = global.peppino_damage;
			if (isgustavo)
				damage_n = global.gustavo_damage;
			if (!isgustavo)
				tv_do_expression(spr_tv_exprhurt);
			else
				tv_do_expression(spr_tv_hurtG);
			if (damage_n == 10)
				tv_do_expression(spr_tv_exprhurt1);
			else if (damage_n == 20)
				tv_do_expression(spr_tv_exprhurt2);
			else if (damage_n == 30)
				tv_do_expression(spr_tv_exprhurt3);
			else if (damage_n == 40)
				tv_do_expression(spr_tv_exprhurt4);
			else if (damage_n == 50)
				tv_do_expression(spr_tv_exprhurt5);
			else if (damage_n == 60)
				tv_do_expression(spr_tv_exprhurt6);
			else if (damage_n == 70)
				tv_do_expression(spr_tv_exprhurt7);
			else if (damage_n == 80)
				tv_do_expression(spr_tv_exprhurt8);
			else if (damage_n == 90)
				tv_do_expression(spr_tv_exprhurt9);
			else if (damage_n == 100)
				tv_do_expression(spr_tv_exprhurt10);
			if (obj_tv.expressionsprite != spr_tv_exprhurt && obj_tv.expressionsprite != spr_tv_hurtG)
			{
				instance_destroy(obj_transfotip);
				var txt = lang_get_value("peppinohurt");
				if (isgustavo)
					txt = lang_get_value("gustavohurt");
				txt = embed_value_string(txt, [damage_n]);
				create_transformation_tip(txt);
			}
			var loseamount = 50 * (global.stylethreshold + 1);
			if (instance_exists(obj_bosscontroller))
				loseamount = 0;
			if (!global.pizzadelivery)
			{
				if (!instance_exists(obj_bosscontroller) && global.collect > 0)
				{
					with (instance_create(121, 60, obj_negativenumber))
						number = concat("-", loseamount);
				}
				global.collect -= loseamount;
				if (global.collect <= 0)
					global.collect = 0;
				if (global.collect != 0)
				{
					if (character == "P" || character == "V")
					{
						repeat (10)
						{
							with (instance_create(x, y, obj_pizzaloss))
								sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect);
						}
					}
					else
					{
						repeat (10)
							instance_create(x, y, obj_pizzaloss);
					}
				}
			}
			with (obj_bosscontroller)
			{
				if (!instance_exists(obj_hpeffect))
				{
					if (!global.boss_invincible)
					{
						var n = 1;
						if (room == boss_fakepephallway)
							n = 2;
						repeat (n)
						{
							var pos = scr_bosscontroller_get_health_pos(player_hp, player_rowmax, player_columnmax, player_maxhp, player_hp_x, player_hp_y, player_xpad, player_ypad);
							if (pos != undefined)
								scr_bosscontroller_particle_hp(spr_bossfight_playerhp, irandom(sprite_get_number(spr_bossfight_playerhp) - 1), pos[0], pos[1], 1, spr_peppalette, obj_player1.paletteselect, global.palettetexture);
							global.bossplayerhurt = true;
							player_hp--;
						}
					}
				}
				else
				{
					var d = instance_find(obj_hpeffect, instance_number(obj_hpeffect) - 1);
					scr_bosscontroller_particle_hp(spr_bossfight_playerhp, irandom(sprite_get_number(spr_bossfight_playerhp) - 1), d.x, d.y, (d.x > (room_width / 2)) ? -1 : 1, spr_peppalette, obj_player1.paletteselect, global.palettetexture);
					instance_destroy(d);
				}
			}
		}
	}
}
