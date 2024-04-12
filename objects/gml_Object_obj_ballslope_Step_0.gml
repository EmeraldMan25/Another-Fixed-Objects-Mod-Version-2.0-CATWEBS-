if place_meeting(x, (y - 8), obj_player1)
{
    with (obj_player1)
    {
        if ((sprite_index == spr_crouch))
        {
            xscale = sign((-other.image_xscale))
            sprite_index = spr_tumblestart
            state = (5 << 0)
            invincipep = 1
        }
    }
}
if place_meeting(x, (y - 8), obj_player2)
{
    with (obj_player2)
    {
        if ((sprite_index == spr_crouch))
        {
            xscale = sign((-other.image_xscale))
            sprite_index = spr_tumblestart
            state = (5 << 0)
            invincipep = 1
        }
    }
}
