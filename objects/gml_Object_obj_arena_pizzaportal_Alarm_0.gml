if ((stored_id != noone))
{
    instance_activate_object(stored_id)
    if instance_exists(stored_id)
        create_particle(stored_id.x, stored_id.y, (9 << 0), 0)
}
sprite_index = spr_pizzaportal_disappear
image_speed = 0.35
image_index = 0
