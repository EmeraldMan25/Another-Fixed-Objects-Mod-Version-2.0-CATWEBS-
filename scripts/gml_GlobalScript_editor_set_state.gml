function editor_set_state(argument0) //gml_Script_editor_set_state
{
    with (obj_editor)
    {
        self.ds_map_find_value(editor_states, argument0)()
        editor_state = argument0
    }
}

