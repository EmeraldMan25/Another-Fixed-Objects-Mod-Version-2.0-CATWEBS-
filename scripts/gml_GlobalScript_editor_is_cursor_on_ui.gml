function editor_is_cursor_on_ui(argument0, argument1) //gml_Script_editor_is_cursor_on_ui
{
    var num = instance_place_list(argument0, argument1, obj_uiparent, global.instancelist, false)
    var found = false
    for (var i = 0; i < num; i++)
    {
        with (ds_list_find_value(global.instancelist, i))
        {
            if active
                found = true
        }
    }
    ds_list_clear(global.instancelist)
    return found;
}

