if ((drop == false))
{
    instance_create(x, y, obj_stompeffect)
    other.image_index = 0
    other.state = (59 << 0)
    other.sprite_index = other.spr_stunned
    vsp = -5
    hsp = 3
    with (obj_camera)
    {
        shake_mag = 10
        shake_mag_acc = (30 / room_speed)
    }
    drop = true
}
