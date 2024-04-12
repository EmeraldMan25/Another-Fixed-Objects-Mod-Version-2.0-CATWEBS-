var p = other.id
with (other)
{
    if ((state != (265 << 0)) && (state != (84 << 0)) && (state != (61 << 0)) && (other.cooldown == 0))
    {
        if obj_player1.ispeppino
            create_transformation_tip(lang_get_value("antigravtip"), "antigrav")
        else
            create_transformation_tip(lang_get_value("antigravtipN"), "antigravN")
        if ((state == (184 << 0)) || (state == (185 << 0)))
        {
            with (instance_create(x, (y + 12), obj_rocketdead))
            {
                hsp = (p.xscale * 6)
                vsp = 5
                image_xscale = sign(hsp)
            }
        }
        target_vsp = 0
        state = (265 << 0)
        vsp = 0
        if ((ds_list_find_index(global.saveroom, other.id) == -1))
        {
            ds_list_add(global.saveroom, other.id)
            notification_push((71 << 0), [global.leveltosave])
        }
        fmod_event_one_shot("event:/sfx/antigrav/start")
        fmod_event_one_shot_3d("event:/sfx/misc/bubblestation", x, y)
        with (obj_antigravbubble)
        {
            if ((playerid == other.id))
                instance_destroy()
        }
        other.cooldown = 50
        with (instance_create(x, y, obj_antigravbubble))
            playerid = other.id
        other.image_index = 0
        other.sprite_index = spr_antigrav_activate
    }
}
