function cutscene_dungeon_end() //gml_Script_cutscene_dungeon_end
{
    with (obj_player)
    {
        state = (0 << 0)
        x = backtohubstartx
        y = backtohubstarty
    }
    global.levelcomplete = false
    global.dungeoncutscene = true
    quick_ini_write_real(get_savefile_ini(), "cutscene", "dungeon", true)
    cutscene_end_action()
}

