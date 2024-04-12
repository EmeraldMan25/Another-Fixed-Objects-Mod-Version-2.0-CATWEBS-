if ((state == (0 << 0)))
{
    with (other)
    {
        fmod_event_one_shot("event:/sfx/misc/bosskey")
        state = (46 << 0)
        sprite_index = spr_gottreasure
    }
    state = (46 << 0)
    x = other.x
    y = (other.y - 50)
    if (!instance_exists(obj_bosscontroller))
        alarm[0] = 150
    depth = -20
    with (obj_bosscontroller)
    {
        state = (98 << 0)
        with (obj_hpeffect)
            spd = 16
    }
    ini_open_from_string(obj_savesystem.ini_str)
    ini_write_real(save, "bosskey", true)
    obj_savesystem.ini_str = ini_close()
}
