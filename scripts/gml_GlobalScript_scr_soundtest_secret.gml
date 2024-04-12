function scr_soundtest_secret() //gml_Script_scr_soundtest_secret
{
    targetRoom = tower_soundtestlevel
    soundtest = true
    var found = false
    ini_open_from_string(obj_savesystem.ini_str)
    var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"]
    var i = 0
    while ((i < array_length(lvl)))
    {
        var b = lvl[i]
        if ((ini_read_real("Secret", b, 0) < 3))
        {
            found = true
            break
        }
        else
            i++
    }
    if ((ini_read_string("Game", "finalrank", "none") == "none"))
        found = true
    ini_close()
    if found
        instance_destroy()
    if global.panic
        instance_destroy()
}

