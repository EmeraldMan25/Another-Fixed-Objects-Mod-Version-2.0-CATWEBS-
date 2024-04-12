if active
{
    if (place_meeting(x, (y - 1), other) && (other.vsp > 1) && (other.state != (113 << 0)) && (other.state != (116 << 0)) && (other.state != (114 << 0)) && (other.state != (115 << 0)))
    {
        with (other)
        {
            instance_create(x, y, obj_genericpoofeffect)
            movespeed = hsp
            state = (113 << 0)
            image_index = 0
            create_transformation_tip(lang_get_value("barreltip"), "barrel")
        }
        active = false
        alarm[0] = 150
    }
}
