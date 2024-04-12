global.__display_gui_args = [0, 0, 0, 0, 0]
function __display_set_gui_size_hook(argument0, argument1) //gml_Script___display_set_gui_size_hook
{
    display_set_gui_size(argument0, argument1)
    array_set(global.__display_gui_args, 0, -1)
    array_set(global.__display_gui_args, 1, argument0)
    array_set(global.__display_gui_args, 2, argument1)
    array_set(global.__display_gui_args, 3, 0)
    array_set(global.__display_gui_args, 4, 0)
}

function __display_set_gui_maximize_hook() //gml_Script___display_set_gui_maximize_hook
{
    array_set(global.__display_gui_args, 0, argument_count)
    for (var i = 0; i < argument_count; i++)
        array_set(global.__display_gui_args, (i + 1), argument[i])
    while ((i < 4))
    {
        array_set(global.__display_gui_args, (i + 1), 0)
        i++
    }
}

function __display_gui_restore() //gml_Script___display_gui_restore
{
    var _args = global.__display_gui_args
    switch _args[0]
    {
        case -1:
            display_set_gui_size(_args[1], _args[2])
            break
        case 0:
            display_set_gui_maximise()
            break
        case 1:
            display_set_gui_maximise(_args[1])
            break
        case 2:
            display_set_gui_maximise(_args[1], _args[2])
            break
        case 3:
            display_set_gui_maximise(_args[1], _args[2], _args[3])
            break
        case 4:
            display_set_gui_maximise(_args[1], _args[2], _args[3], _args[4])
            break
    }

}

