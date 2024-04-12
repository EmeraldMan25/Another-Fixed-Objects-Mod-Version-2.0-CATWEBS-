function load_level() //gml_Script_load_level
{
    saved_editor_state = editor_state
    editor_state = (5 << 0)
    save_step = -1
    ds_list_clear(global.current_level.rooms)
}

