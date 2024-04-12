function toggle_panel(argument0) //gml_Script_toggle_panel
{
    var _closed = false
    with (obj_panel)
    {
        if ((ID == argument0) && (state == (1 << 0)))
            _closed = true
    }
    if _closed
    {
        with (obj_panel)
        {
            if ((ID == argument0))
                state = (0 << 0)
            else if ((ID != noone))
                state = (1 << 0)
        }
    }
    else
    {
        with (obj_panel)
        {
            if ((ID != noone))
                state = (1 << 0)
        }
    }
}

