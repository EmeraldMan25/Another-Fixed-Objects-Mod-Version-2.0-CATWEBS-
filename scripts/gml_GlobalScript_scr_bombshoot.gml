function scr_bombshoot(argument0) //gml_Script_scr_bombshoot
{
    if ((pistolcooldown <= 0) && (state != (168 << 0)) && (state != (80 << 0)) && (instance_number(obj_playerbomb) < 2))
    {
        movespeed = (-movespeed)
        input_buffer_shoot = 0
        image_index = 0
        sprite_index = spr_playerN_noisebombkick
        fmod_event_one_shot_3d("event:/sfx/playerN/bombthrow", x, y)
        savedgrounded = grounded
        state = (168 << 0)
        pistolcooldown = 50
        machslideAnim = false
        landAnim = false
        jumpAnim = false
        crouchslideAnim = false
        crouchAnim = false
        stompAnim = false
        windingAnim = 0
        bombthrow = false
        jumpstop = true
        if ((argument0 == (104 << 0)) || (argument0 == (121 << 0)))
            state = (0 << 0)
    }
}

function scr_bomb_do_boss_phase2(argument0) //gml_Script_scr_bomb_do_boss_phase2
{
    with (argument0)
    {
        fmod_event_one_shot("event:/sfx/misc/blackoutpunch")
        instance_create_unique(0, 0, obj_blackoutline)
        instance_create_unique(0, 0, obj_superattackeffect)
        state = (273 << 0)
        hsp = 0
        vsp = 0
        buildup = 100
    }
}

