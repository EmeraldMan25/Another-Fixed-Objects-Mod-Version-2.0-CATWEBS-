if instance_exists(ID)
{
    x = (ID.x + (image_xscale * 15))
    y = ID.y
    image_xscale = ID.image_xscale
    image_index = ID.image_index
    with (ID)
    {
        if ((state != (125 << 0)))
        {
            ragehitbox = false
            instance_destroy(other)
        }
    }
}
else
    instance_destroy()
