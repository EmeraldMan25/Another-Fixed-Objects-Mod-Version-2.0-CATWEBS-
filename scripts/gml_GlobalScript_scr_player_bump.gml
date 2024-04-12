function scr_player_bump() //gml_Script_scr_player_bump
{
    if ((sprite_index != spr_wallsplat))
    {
        movespeed = 0
        mach2 = 0
        var _gus = ((sprite_index == spr_player_ratmountbump) || (sprite_index == spr_lonegustavo_bump))
        start_running = true
        alarm[4] = 14
        if (grounded && (vsp > 0))
            hsp = 0
        var can_end = true
        if ((sprite_index == spr_tumbleend))
            can_end = (!(place_meeting(x, y, obj_pepgoblin_kickhitbox)))
        if ((sprite_index == spr_tumbleend) && (!can_end))
            image_speed = 0
        else
            image_speed = 0.35
        if ((sprite_index == spr_tumbleend) && (floor(image_index) >= 3) && (!grounded))
            image_index = 3
        if ((sprite_index == spr_rockethitwall) && grounded && (vsp > 0))
            image_index = (image_number - 1)
        if ((floor(image_index) == (image_number - 1)) && (sprite_index != spr_player_catched) && (sprite_index != spr_boxxedpep_air) && (!_gus))
        {
            if (!skateboarding)
            {
                if ((sprite_index != spr_rockethitwall) || (grounded && (vsp > 0)))
                    state = (0 << 0)
            }
            else
                state = (104 << 0)
        }
        if (grounded && (vsp > 0) && _gus)
            state = (191 << 0)
        if ((sprite_index != spr_player_catched) && (sprite_index != spr_boxxedpep_air) && (sprite_index != spr_rockethitwall) && (sprite_index != spr_tumbleend) && (sprite_index != spr_hitwall) && (!_gus) && (sprite_index != spr_mach) && (sprite_index != spr_mach4))
            sprite_index = ((!skateboarding) ? spr_bump : spr_clownbump)
    }
    else
    {
        movespeed = 0
        hsp = 0
        vsp = 0
        if ((floor(image_index) == (image_number - 1)))
            state = (0 << 0)
        image_speed = 0.35
    }
    if ((state == (0 << 0)) && isgustavo)
        state = (191 << 0)
}

