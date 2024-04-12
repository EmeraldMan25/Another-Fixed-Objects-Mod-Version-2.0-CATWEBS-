function scr_player_addslopemomentum(argument0, argument1) //gml_Script_scr_player_addslopemomentum
{
    with (instance_place(x, (y + 1), obj_slope))
    {
        if ((sign(image_xscale) == (-sign(other.xscale))))
        {
            if ((abs(image_yscale) < abs(image_xscale)))
                other.movespeed += argument0
            else
                other.movespeed += argument1
        }
    }
}

function scr_pizzaball_addslopemomentum(argument0, argument1) //gml_Script_scr_pizzaball_addslopemomentum
{
    with (instance_place(x, (y + 1), obj_slope))
    {
        if ((sign(image_xscale) == (-sign(other.image_xscale))))
        {
            if ((abs(image_yscale) < abs(image_xscale)))
                other.slopespeed += argument0
            else
                other.slopespeed += argument1
        }
        else if ((abs(image_yscale) < abs(image_xscale)))
            other.slopespeed -= argument0
        else
            other.slopespeed -= argument1
    }
    if ((slopespeed < 0))
        slopespeed = 0
    if ((slopespeed > 10))
        slopespeed = 10
    if ((movespeed < 1))
        slopespeed = 0
}

