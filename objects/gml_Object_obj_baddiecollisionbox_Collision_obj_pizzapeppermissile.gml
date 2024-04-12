if (instance_exists(baddieID) && (other.target == baddieID) && (baddieID.invtime == 0) && (baddieID.state != (4 << 0)) && (!baddieID.invincible) && baddieID.instantkillable)
{
    baddieID.invtime = 15
    fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
    if (!baddieID.important)
    {
        global.style += (5 + global.combo)
        global.combotime = 60
        global.heattime = 60
    }
    var lag = 2
    baddieID.hitLag = lag
    baddieID.hitX = baddieID.x
    baddieID.hitY = baddieID.y
    baddieID.mach3destroy = true
    baddieID.hp -= 1
    instance_create(baddieID.x, baddieID.y, obj_parryeffect)
    baddieID.alarm[3] = 3
    baddieID.state = (137 << 0)
    if ((baddieID.x != other.x))
        baddieID.image_xscale = sign((other.x - baddieID.x))
    else
        baddieID.image_xscale = (-other.image_xscale)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    baddieID.invtime = 30
    baddieID.hitvsp = -4
    baddieID.hithsp = ((-baddieID.image_xscale) * 22)
    with (other)
    {
        repeat (3)
            instance_create(x, y, obj_firemouthflame)
        instance_destroy()
    }
}
