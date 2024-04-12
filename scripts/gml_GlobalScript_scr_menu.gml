function menu_goto(argument0) //gml_Script_menu_goto
{
    menu = 0
    var i = 0
    while ((i < array_length(menus)))
    {
        var b = menus[i]
        if ((b.menu_id == argument0))
        {
            menu = i
            break
        }
        else
            i++
    }
    optionselected = 0
}

function create_menu_fixed(argument0, argument1, argument2, argument3, argument4) //gml_Script_create_menu_fixed
{
    if ((argument4 == undefined))
        argument4 = (0 << 0)
    return 
    {
        menu_id: argument0,
        type: (0 << 0),
        anchor: argument1,
        xpad: argument2,
        ypad: argument3,
        backmenu: argument4,
        options: []
    };
}

function add_option_press(argument0, argument1, argument2, argument3) //gml_Script_add_option_press
{
    var b = 
    {
        option_id: argument1,
        type: (2 << 0),
        func: argument3,
        name: argument2,
        localization: true
    }

    array_push(argument0.options, b)
    return b;
}

function add_option_toggle(argument0, argument1, argument2, argument3) //gml_Script_add_option_toggle
{
    if ((argument3 == undefined))
        argument3 = -4
    var b = 
    {
        option_id: argument1,
        type: (0 << 0),
        value: false,
        name: argument2,
        on_changed: argument3
    }

    array_push(argument0.options, b)
    return b;
}

function add_option_multiple(argument0, argument1, argument2, argument3, argument4) //gml_Script_add_option_multiple
{
    if ((argument4 == undefined))
        argument4 = -4
    var b = 
    {
        option_id: argument1,
        type: (1 << 0),
        values: argument3,
        value: 0,
        name: argument2,
        on_changed: argument4
    }

    array_push(argument0.options, b)
    return b;
}

function create_option_value(argument0, argument1, argument2) //gml_Script_create_option_value
{
    if ((argument2 == undefined))
        argument2 = true
    return 
    {
        name: argument0,
        value: argument1,
        localization: argument2
    };
}

function add_option_slide(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_add_option_slide
{
    if ((argument3 == undefined))
        argument3 = -4
    if ((argument4 == undefined))
        argument4 = -4
    if ((argument5 == undefined))
        argument5 = -4
    var b = 
    {
        option_id: argument1,
        type: (3 << 0),
        value: 100,
        moved: false,
        name: argument2,
        on_changed: argument4,
        on_move: argument3,
        slidecount: 0,
        moving: false,
        sound: -4
    }

    if ((argument5 != -4))
        b.sound = fmod_event_create_instance(argument5)
    array_push(argument0.options, b)
    return b;
}

