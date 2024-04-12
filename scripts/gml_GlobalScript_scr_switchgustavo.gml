function scr_switchgustavo(argument0, argument1) //gml_Script_scr_switchgustavo
{
    if ((argument0 == undefined))
        argument0 = true
    if ((argument1 == undefined))
        argument1 = false
    with (obj_player1)
    {
        if ispeppino
        {
            ratmount_movespeed = 8
            gustavodash = 0
            isgustavo = true
            if argument0
            {
                visible = true
                state = (191 << 0)
                sprite_index = spr_player_ratmountidle
                jumpAnim = false
            }
            brick = true
            fmod_event_instance_release(snd_voiceok)
            snd_voiceok = fmod_event_create_instance("event:/sfx/voice/gusok")
        }
        else
        {
            isgustavo = false
            noisecrusher = true
            if argument0
            {
                visible = true
                jumpAnim = false
                state = (0 << 0)
                sprite_index = spr_idle
                if ((room == street_jail) && (!argument1))
                {
                    actor_buffer = 40
                    sprite_index = spr_playerN_glovesstart
                    image_index = 0
                    state = (293 << 0)
                }
            }
        }
    }
    with (obj_swapmodefollow)
    {
        isgustavo = true
        self.get_character_spr()
    }
}

function scr_switchpeppino(argument0) //gml_Script_scr_switchpeppino
{
    if ((argument0 == undefined))
        argument0 = true
    with (obj_player1)
    {
        if ispeppino
        {
            gustavodash = 0
            ratmount_movespeed = 8
            isgustavo = false
            brick = false
            fmod_event_instance_release(snd_voiceok)
            snd_voiceok = fmod_event_create_instance("event:/sfx/voice/ok")
            if argument0
            {
                visible = true
                state = (0 << 0)
                jumpAnim = false
                sprite_index = spr_player_idle
            }
        }
        else
        {
            isgustavo = false
            noisecrusher = false
            if argument0
            {
                jumpAnim = false
                sprite_index = spr_idle
                visible = true
                state = (0 << 0)
            }
        }
    }
    with (obj_swapmodefollow)
    {
        isgustavo = false
        self.get_character_spr()
    }
}

