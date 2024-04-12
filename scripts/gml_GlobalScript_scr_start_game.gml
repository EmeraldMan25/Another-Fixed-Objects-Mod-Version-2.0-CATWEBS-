function scr_start_game(argument0, argument1) //gml_Script_scr_start_game
{
    if ((argument1 == undefined))
        argument1 = true
    instance_create(x, y, obj_fadeout)
    with (obj_player)
    {
        targetRoom = hub_loadingscreen
        targetDoor = "A"
    }
    with (obj_savesystem)
        ispeppino = argument1
    global.currentsavefile = argument0
    gamesave_async_load()
}

