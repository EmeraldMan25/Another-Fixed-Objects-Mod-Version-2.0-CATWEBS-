function scr_get_timer_string(argument0, argument1, argument2) //gml_Script_scr_get_timer_string
{
    if ((argument2 == undefined))
        argument2 = false
    if ((argument1 < 10))
    {
        argument1 = string_format(argument1, 1, 3)
        argument1 = ("0" + argument1)
    }
    else
        argument1 = string_format(argument1, 2, 3)
    if argument2
    {
        var h = 0
        while ((argument0 > 59))
        {
            argument0 -= 60
            h++
        }
        if ((h < 10))
            h = concat("0", h)
        else
            h = string(h)
    }
    if ((argument0 < 10))
        argument0 = concat("0", argument0)
    else
        argument0 = concat(argument0)
    if argument2
        return concat(h, ":", argument0, ":", argument1);
    return concat(argument0, ":", argument1);
}

