function scr_shotgunshoot() //gml_Script_scr_shotgunshoot
{
    if (!ispeppino)
    {
        input_buffer_shoot = 0
        if ((state != (69 << 0)))
        {
            notification_push((44 << 0), [room])
            minigunshot = 8
            if grounded
                movespeed = 0
        }
        else
            minigunshot = 2
        minigunbuffer = 0
        state = (69 << 0)
        return;
    }
    input_buffer_shoot = 0
    fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
    with (instance_create(x, y, obj_pistoleffect))
        image_xscale = other.xscale
    sprite_index = spr_shotgunshoot
    state = (69 << 0)
    if grounded
        movespeed = 0
    jumpAnim = true
    image_index = 0
    with (instance_create((x + (xscale * 46)), (y + 6), obj_shotgunblast))
    {
        image_xscale = other.xscale
        with (bulletID)
            image_xscale = other.image_xscale
    }
}

