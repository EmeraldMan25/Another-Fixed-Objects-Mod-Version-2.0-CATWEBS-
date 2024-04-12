function cutscene_change_room(argument0) //gml_Script_cutscene_change_room
{
    with (obj_player)
        targetRoom = argument0
    instance_create(x, y, obj_fadeout)
    if ((room == argument0))
        cutscene_end_action()
}

