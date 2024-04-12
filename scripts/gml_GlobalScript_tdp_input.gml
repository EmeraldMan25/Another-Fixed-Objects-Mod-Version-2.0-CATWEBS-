function tdp_input_init() //gml_Script_tdp_input_init
{
    if (!variable_global_exists("input_list"))
    {
        global.input_list = ds_map_create()
        global.input_controller_deadzone = 0.4
        global.input_controller_deadzone_vertical = 0.5
        global.input_controller_deadzone_horizontal = 0.5
        global.input_controller_deadzone_press = 0.5
    }
}

function tdp_input_destroy() //gml_Script_tdp_input_destroy
{
    ds_map_destroy(global.input_list)
}

function tdp_input_add(argument0) //gml_Script_tdp_input_add
{
    ds_map_set(global.input_list, argument0.name, argument0)
}

function tdp_input_update(argument0) //gml_Script_tdp_input_update
{
    if ((argument0 == undefined))
        argument0 = -1
    gamepad_set_axis_deadzone(argument0, global.input_controller_deadzone)
    var key = ds_map_find_first(global.input_list)
    var num = ds_map_size(global.input_list)
    for (var i = 0; i < num; i++)
    {
        ds_map_find_value(global.input_list, key).update(argument0)
        key = ds_map_find_next(global.input_list, key)
    }
}

function tdp_input_get(argument0) //gml_Script_tdp_input_get
{
    return ds_map_find_value(global.input_list, argument0);
}

function tdp_input_ini_read(argument0, argument1) //gml_Script_tdp_input_ini_read
{
    tdp_input_deserialize(argument0, ini_read_string("Input", argument0, tdp_input_serialize(argument1)))
}

function tdp_input_ini_write(argument0) //gml_Script_tdp_input_ini_write
{
    ini_write_string("Input", argument0, tdp_input_serialize(argument0))
}

function tdp_input_serialize(argument0) //gml_Script_tdp_input_serialize
{
    if is_array(argument0)
        return tdp_input_serialize_array(argument0);
    else
        return tdp_input_serialize_key(argument0);
}

function tdp_action(argument0, argument1, argument2) //gml_Script_tdp_action
{
    if ((argument2 == undefined))
        argument2 = 0
    return 
    {
        type: argument0,
        value: argument1,
        joystick_direction: argument2
    };
}

function tdp_input_serialize_key(argument0) //gml_Script_tdp_input_serialize_key
{
    var in = tdp_input_get(argument0)
    return tdp_input_serialize_array(in.actions);
}

function tdp_input_serialize_array(argument0) //gml_Script_tdp_input_serialize_array
{
    var str = ""
    for (var i = 0; i < array_length(argument0); i++)
    {
        var b = argument0[i]
        with (b)
        {
            str += string(type)
            str += ","
            str += string(value)
            str += ","
            if ((type == (2 << 0)))
            {
                str += string(joystick_direction)
                str += ","
            }
        }
    }
    return str;
}

function tdp_input_deserialize(argument0, argument1) //gml_Script_tdp_input_deserialize
{
    var arr = string_split(argument1, ",")
    var in = new tdp_input_key(argument0)
    var i = 0
    while ((i < array_length(arr)))
    {
        if ((arr[i] == ""))
            break
        else
        {
            var type = real(arr[i])
            var value = real(arr[(i + 1)])
            if ((type == (2 << 0)))
            {
                var joystick_direction = real(arr[(i + 2)])
                i++
                array_push(in.actions, new tdp_input_action(type, value, joystick_direction))
            }
            else
                array_push(in.actions, new tdp_input_action(type, value))
            i += 2
        }
    }
    tdp_input_add(in)
    show_debug_message(in)
}

function tdp_get_icons(argument0) //gml_Script_tdp_get_icons
{
    var arr = array_create(0)
    for (var i = 0; i < array_length(argument0.actions); i++)
    {
        var q = tdp_get_icon(argument0.actions[i])
        if ((q != -4))
            array_push(arr, q)
    }
    return arr;
}

function tdp_get_tutorial_icon(argument0) //gml_Script_tdp_get_tutorial_icon
{
    if ((obj_inputAssigner.player_input_device[0] >= 0))
        argument0 += "C"
    var in = tdp_input_get(argument0)
    for (var i = 0; i < array_length(in.actions); i++)
    {
        var q = tdp_get_icon(in.actions[i])
        if ((q != -4))
            return q;
    }
    return -4;
}

function tdp_get_icon(argument0) //gml_Script_tdp_get_icon
{
    switch argument0.type
    {
        case (0 << 0):
            switch argument0.value
            {
                case 16:
                case 161:
                case 160:
                    return 
                    {
                        sprite_index: spr_tutorialkeyspecial,
                        image_index: 0,
                        str: ""
                    };
                case 17:
                case 162:
                case 163:
                    return 
                    {
                        sprite_index: spr_tutorialkeyspecial,
                        image_index: 1,
                        str: ""
                    };
                case 32:
                    return 
                    {
                        sprite_index: spr_tutorialkeyspecial,
                        image_index: 2,
                        str: ""
                    };
                case 38:
                    return 
                    {
                        sprite_index: spr_tutorialkeyspecial,
                        image_index: 3,
                        str: ""
                    };
                case 40:
                    return 
                    {
                        sprite_index: spr_tutorialkeyspecial,
                        image_index: 4,
                        str: ""
                    };
                case 39:
                    return 
                    {
                        sprite_index: spr_tutorialkeyspecial,
                        image_index: 5,
                        str: ""
                    };
                case 37:
                    return 
                    {
                        sprite_index: spr_tutorialkeyspecial,
                        image_index: 6,
                        str: ""
                    };
                case 27:
                    return 
                    {
                        sprite_index: spr_tutorialkeyspecial,
                        image_index: 7,
                        str: ""
                    };
                default:
                    return 
                    {
                        sprite_index: spr_tutorialkey,
                        image_index: 0,
                        str: scr_keyname(argument0.value)
                    };
            }

            break
        case (1 << 0):
            switch argument0.value
            {
                case 32769:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 0,
                        str: ""
                    };
                case 32770:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 1,
                        str: ""
                    };
                case 32771:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 2,
                        str: ""
                    };
                case 32772:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 3,
                        str: ""
                    };
                case 32775:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 4,
                        str: ""
                    };
                case 32776:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 5,
                        str: ""
                    };
                case 32774:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 6,
                        str: ""
                    };
                case 32773:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 7,
                        str: ""
                    };
                case 32779:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 8,
                        str: ""
                    };
                case 32780:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 9,
                        str: ""
                    };
                case 32781:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 10,
                        str: ""
                    };
                case 32784:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 11,
                        str: ""
                    };
                case 32782:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 12,
                        str: ""
                    };
                case 32783:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 13,
                        str: ""
                    };
                case 32778:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 14,
                        str: ""
                    };
                case 32777:
                    return 
                    {
                        sprite_index: global.spr_gamepadbuttons,
                        image_index: 15,
                        str: ""
                    };
            }

            break
        case (2 << 0):
            switch argument0.value
            {
                case 32785:
                    if ((argument0.joystick_direction == -1))
                    {
                        return 
                        {
                            sprite_index: global.spr_joystick,
                            image_index: 0,
                            str: ""
                        };
                    }
                    if ((argument0.joystick_direction == 1))
                    {
                        return 
                        {
                            sprite_index: global.spr_joystick,
                            image_index: 1,
                            str: ""
                        };
                    }
                    break
                case 32786:
                    if ((argument0.joystick_direction == -1))
                    {
                        return 
                        {
                            sprite_index: global.spr_joystick,
                            image_index: 2,
                            str: ""
                        };
                    }
                    if ((argument0.joystick_direction == 1))
                    {
                        return 
                        {
                            sprite_index: global.spr_joystick,
                            image_index: 3,
                            str: ""
                        };
                    }
                    break
                case 32787:
                    if ((argument0.joystick_direction == -1))
                    {
                        return 
                        {
                            sprite_index: global.spr_joystick,
                            image_index: 4,
                            str: ""
                        };
                    }
                    if ((argument0.joystick_direction == 1))
                    {
                        return 
                        {
                            sprite_index: global.spr_joystick,
                            image_index: 5,
                            str: ""
                        };
                    }
                    break
                case 32788:
                    if ((argument0.joystick_direction == -1))
                    {
                        return 
                        {
                            sprite_index: global.spr_joystick,
                            image_index: 6,
                            str: ""
                        };
                    }
                    if ((argument0.joystick_direction == 1))
                    {
                        return 
                        {
                            sprite_index: global.spr_joystick,
                            image_index: 7,
                            str: ""
                        };
                    }
                    break
            }

            break
    }

    return -4;
}

