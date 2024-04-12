switch state
{
    case (0 << 0):
        hsp = 0
        vsp = 0
        break
    case (135 << 0):
        var num = instance_place_list(x, ((y + vsp) + 1), obj_destructibles, global.instancelist, false)
        for (var i = 0; i < num; i++)
            instance_destroy(ds_list_find_value(global.instancelist, i))
        ds_list_clear(global.instancelist)
        instance_destroy(instance_place(x, ((y + vsp) + 1), obj_metalblock))
        scr_collide()
        if grounded
        {
            fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
            create_particle(x, y, (12 << 0))
            state = (92 << 0)
            with (obj_camera)
            {
                shake_mag = 5
                shake_mag_acc = (3 / room_speed)
            }
        }
        break
    case (92 << 0):
        y = Approach(y, ystart, 2)
        if ((y == ystart))
            state = (0 << 0)
        break
}

if ((state == (92 << 0)) && (alarm[0] == -1))
    alarm[0] = 10
else if ((state != (92 << 0)))
    image_alpha = 1
if ((!(place_meeting(x, y, obj_trapghost))) && (!(place_meeting(xstart, ystart, obj_trapghost))))
    sprite_index = spr_kingghost_anchor
