function cutscene_forest_end() //gml_Script_cutscene_forest_end
{
    with (obj_player)
    {
        state = (0 << 0)
        x = backtohubstartx
        y = backtohubstarty
    }
    global.levelcomplete = false
    global.forestcutscene = true
    global.levelcompletename = -4
    quick_ini_write_real(get_savefile_ini(), "cutscene", "forest", true)
    cutscene_end_action()
}

function cutscene_beach_end() //gml_Script_cutscene_beach_end
{
    with (obj_player)
    {
        state = (0 << 0)
        x = backtohubstartx
        y = backtohubstarty
    }
    global.levelcomplete = false
    global.beachcutscene = true
    global.levelcompletename = -4
    quick_ini_write_real(get_savefile_ini(), "cutscene", "beach", true)
    cutscene_end_action()
}

function cutscene_sewer_end() //gml_Script_cutscene_sewer_end
{
    with (obj_player)
    {
        state = (0 << 0)
        x = backtohubstartx
        y = backtohubstarty
    }
    global.levelcomplete = false
    global.sewercutscene = true
    global.levelcompletename = -4
    quick_ini_write_real(get_savefile_ini(), "cutscene", "sewer", true)
    cutscene_end_action()
}

