function scr_pistolshoot(argument0, argument1) //gml_Script_scr_pistolshoot
{
    if ((argument1 == undefined))
        argument1 = false
    if (!ispeppino)
    {
        scr_bombshoot()
        return;
    }
    if ((!argument1) && pistolchargeshooting)
        return;
    if (((pistolcooldown <= 0) && (state == argument0) && (state != (106 << 0)) && (instance_number(obj_pistolbullet) < 3)) || (pistolchargeshooting == true))
    {
        input_buffer_shoot = 0
        pistolanim = spr_pistolshot
        pistolindex = 0
        pistolcooldown = 10
        machslideAnim = false
        landAnim = false
        jumpAnim = false
        crouchslideAnim = false
        crouchAnim = false
        stompAnim = false
        if ((argument0 == (121 << 0)) || (argument0 == (104 << 0)))
            state = (0 << 0)
        windingAnim = 0
        with (instance_create((x + (xscale * 35)), y, obj_parryeffect))
        {
            if (argument1 && other.pistolchargeshooting)
                sprite_index = spr_giantpistoleffect
            else
                sprite_index = spr_player_pistoleffect
            image_xscale = other.xscale
            image_speed = 0.4
        }
        if (argument1 && pistolchargeshooting)
            fmod_event_one_shot_3d("event:/sfx/pep/revolverBIGshot", (x + (xscale * 20)), y)
        else
            fmod_event_one_shot_3d("event:/sfx/pep/pistolshot", (x + (xscale * 20)), y)
        with (instance_create((x + (xscale * 20)), y, obj_pistolbullet))
        {
            image_xscale = other.xscale
            if (argument1 && other.pistolchargeshooting)
            {
                GamepadSetVibration(0, 1, 1, 0.8)
                sprite_index = spr_peppinobulletGIANT
                x += 25
            }
            else
                GamepadSetVibration(0, 0.3, 0.3, 0.6)
        }
    }
}

