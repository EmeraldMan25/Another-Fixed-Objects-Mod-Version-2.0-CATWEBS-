function EditorRoom(argument0, argument1) constructor //gml_Script_EditorRoom
{
    x = argument0
    y = argument1
    var _size = 0
    if ((global.current_level != noone))
        _size = ds_list_size(global.current_level.rooms)
    name = concat("Room ", _size)
    instances = array_create(0)
    backgrounds = array_create(0)
    tiles = array_create(0)
    width = obj_screensizer.ideal_width
    height = obj_screensizer.ideal_height
}

