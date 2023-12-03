function scr_player_breakdance() //gml_Script_scr_player_breakdance
{
    if (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend)
    {
        move = (key_left + key_right)
        landAnim = 1
        jumpstop = 0
        image_speed = 0.4
        hsp = movespeed
        if (move != 0)
        {
            dir = move
            movespeed = Approach(movespeed, (move * 4), 0.5)
        }
        else
            movespeed = Approach(movespeed, 0, 0.5)
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_breakdanceuppercut)
            sprite_index = spr_player_breakdanceuppercutend
        if (grounded && vsp > 0 && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))
        {
            if (hsp != 0)
            {
                dir = sign(hsp)
                xscale = dir
            }
            movespeed = abs(movespeed)
            state = (0 << 0)
        }
        if (punch_afterimage > 0)
            punch_afterimage--
        else if (vsp < 0)
        {
            punch_afterimage = 5
            with (create_mach3effect(x, y, sprite_index, image_index, 1))
            {
                image_xscale = other.xscale
                playerid = other.id
                vertical = 1
            }
        }
    }
    else
    {
        switch character
        {
            case "N":
            case "P":
                hsp = (xscale * movespeed)
                move = (key_left + key_right)
                jumpstop = 0
                if (sprite_index == spr_player_breakdancesuper && key_shoot2)
                    movespeed = 14
                if (movespeed > 0 && sprite_index == spr_player_breakdance && grounded)
                    movespeed -= 0.5
                if (movespeed > 0 && sprite_index == spr_player_breakdancesuper)
                    movespeed -= 0.25
                if (place_meeting((x + xscale), y, obj_solid) && (sprite_index == spr_player_breakdancestart || sprite_index == spr_player_breakdance))
                    movespeed = 0
                if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_breakdancestart)
                    sprite_index = spr_player_breakdance
                if (key_shoot2 && move == xscale && sprite_index == spr_player_breakdance)
                {
                    image_index = 0
                    sprite_index = spr_player_buttattackstart
                    movespeed = 16
                    vsp = -5
                    if (!instance_exists(crazyruneffectid))
                    {
                        with (instance_create(x, y, obj_crazyrunothereffect))
                        {
                            playerid = other.object_index
                            other.crazyruneffectid = id
                        }
                    }
                }
                if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_buttattackstart)
                    sprite_index = spr_player_buttattack
                if (grounded && sprite_index == spr_player_buttattack)
                    sprite_index = spr_player_buttattackend
                if (sprite_index == spr_player_buttattackend)
                    movespeed -= 0.25
                if (key_down2 && sprite_index == spr_player_breakdance)
                {
                    sprite_index = spr_player_breakdancesuper
                    movespeed = 12
                }
                if (breakdance > 0)
                    breakdance--
                landAnim = 0
                if (movespeed <= 0 && (sprite_index == spr_player_breakdancesuper || sprite_index == spr_player_buttattackend))
                    state = (0 << 0)
                if (breakdance <= 0 && sprite_index == spr_player_breakdance)
                    state = (0 << 0)
                if (place_meeting((x + xscale), y, obj_solid) && sprite_index == spr_player_breakdancesuper)
                {
                    xscale *= -1
                    instance_create((x + 10), (y + 10), obj_bumpeffect)
                }
                if (sprite_index == spr_player_breakdancesuper)
                    image_speed = (movespeed / 24)
                else
                    image_speed = 0.4
                if (sprite_index == spr_player_buttattack || sprite_index == spr_player_buttattackstart || sprite_index == spr_player_buttattackend)
                {
                    if (key_attack2 && sprite_index != spr_player_buttattackend)
                    {
                        if (movespeed >= 14)
                        {
                            movespeed = 16
                            state = (104 << 0)
                            sprite_index = spr_secondjump1
                        }
                        else if (sprite_index == spr_player_buttattackend)
                        {
                            movespeed = 12
                            state = (121 << 0)
                            sprite_index = spr_mach4
                        }
                        if (scr_solid((x + 1), y) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
                        {
                            grav = 0.5
                            movespeed = 0
                            state = (106 << 0)
                            hsp = -2.5
                            vsp = -3
                            mach2 = 0
                            image_index = 0
                            machslideAnim = 1
                            machhitAnim = 0
                            instance_create((x + 10), (y + 10), obj_bumpeffect)
                        }
                        if (scr_solid((x - 1), y) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
                        {
                            grav = 0.5
                            movespeed = 0
                            state = (106 << 0)
                            hsp = 2.5
                            vsp = -3
                            mach2 = 0
                            image_index = 0
                            machslideAnim = 1
                            machhitAnim = 0
                            instance_create((x - 10), (y + 10), obj_bumpeffect)
                        }
                    }
                    if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 5)
                    {
                        with (instance_create(x, y, obj_dashcloud2))
                            image_xscale = other.xscale
                    }
                    break
                }
        }

    }
}
