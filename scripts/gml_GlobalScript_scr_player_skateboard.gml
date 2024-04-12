function scr_player_skateboard() //gml_Script_scr_player_skateboard
{
    machhitAnim = false
    crouchslideAnim = true
    if ((movespeed < 3))
        movespeed = 3
    hsp = (xscale * movespeed)
    fmod_event_instance_set_3d_attributes(sfxsound, x, y)
    if grounded
    {
        sprite_index = spr_player_skateboard
        image_speed = 0.35
    }
    if (key_jump && grounded)
    {
        vsp = -6
        sprite_index = spr_mach2jump
        image_speed = 0.35
        y -= 20
        scr_fmod_soundeffect(jumpsnd, x, y)
        with (instance_create((x + hsp), (y + 20), obj_skateboardOLD))
        {
            xscale = other.xscale
            hsp = other.hsp
            vsp = -5
        }
    }
    if (scr_solid((x + 1), y) && (xscale == 1))
    {
        machhitAnim = false
        state = (106 << 0)
        hsp = -2.5
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create((x + 10), (y + 10), obj_bumpeffect)
        instance_create(x, (y + 10), obj_skateboarddebris1)
        instance_create(x, (y + 10), obj_skateboarddebris2)
        fmod_event_instance_stop(sfxsound, 1)
        fmod_event_instance_release(sfxsound)
        scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
        ds_list_add(global.saveroom, skateboardID)
    }
    else if (scr_solid((x - 1), y) && (xscale == -1))
    {
        machhitAnim = false
        state = (106 << 0)
        hsp = 2.5
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create((x - 10), (y + 10), obj_bumpeffect)
        instance_create(x, (y + 10), obj_skateboarddebris1)
        instance_create(x, (y + 10), obj_skateboarddebris2)
        fmod_event_instance_stop(sfxsound, 1)
        fmod_event_instance_release(sfxsound)
        scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
        ds_list_add(global.saveroom, skateboardID)
    }
}

