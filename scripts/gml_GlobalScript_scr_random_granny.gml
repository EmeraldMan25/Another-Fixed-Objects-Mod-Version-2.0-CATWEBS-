function scr_random_granny() //gml_Script_scr_random_granny
{
    var count = instance_number(obj_tutorialbook)
    var n = irandom((count - 1))
    var b = -4
    var found = false
    while (!found)
    {
        with (instance_find(obj_tutorialbook, n))
        {
            if showgranny
            {
                found = true
                b = id
            }
        }
        n = irandom((count - 1))
    }
    with (obj_tutorialbook)
    {
        if ((id != b) && showgranny)
            instance_destroy()
    }
}

function lang_get_value_granny(argument0) //gml_Script_lang_get_value_granny
{
    lang_name = argument0
    return lang_get_value(argument0);
}

