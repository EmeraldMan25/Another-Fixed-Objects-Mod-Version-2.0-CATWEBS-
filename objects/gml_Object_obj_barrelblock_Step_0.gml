with (obj_player)
{
    if ((state == (113 << 0)) && (place_meeting((x + 1), y, other) || place_meeting((x - 1), y, other)))
        instance_destroy(other)
}
