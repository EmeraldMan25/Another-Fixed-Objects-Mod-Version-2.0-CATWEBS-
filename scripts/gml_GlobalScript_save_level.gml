function save_level() //gml_Script_save_level
{
    with (obj_editor)
    {
        saved_editor_state = editor_state
        editor_state = (4 << 0)
        save_step = -1
    }
}

