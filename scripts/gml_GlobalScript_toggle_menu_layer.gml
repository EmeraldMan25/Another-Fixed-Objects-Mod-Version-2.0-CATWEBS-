function toggle_menu_layer(argument0) //gml_Script_toggle_menu_layer
{
    with (obj_uiparent)
    {
        if ((menu_layer == argument0))
            active = true
        else
            active = false
    }
}

