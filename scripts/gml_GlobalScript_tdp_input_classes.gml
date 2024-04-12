function tdp_input_key(argument0, argument1) constructor //gml_Script_tdp_input_key
{
    if ((argument1 == undefined))
        argument1 = -4
    static update = function(argument0) //gml_Script_anon_tdp_input_key_gml_GlobalScript_tdp_input_classes_316_tdp_input_key_gml_GlobalScript_tdp_input_classes
    {
        if ((argument0 == undefined))
            argument0 = -1
        pressed = false
        held = false
        released = false
        axis_value = 0
        for (var i = 0; i < array_length(actions); i++)
        {
            var b = actions[i]
            b.update(argument0)
            if b.pressed
                pressed = true
            if b.held
                held = true
            if b.released
                released = true
            actions[i] = b
        }
    }

    static has_value = function(argument0, argument1, argument2) //gml_Script_anon_tdp_input_key_gml_GlobalScript_tdp_input_classes_696_tdp_input_key_gml_GlobalScript_tdp_input_classes
    {
        if ((argument2 == undefined))
            argument2 = 0
        for (var i = 0; i < array_length(actions); i++)
        {
            var b = actions[i]
            if ((b.type == argument0) && (b.value == argument1))
            {
                if ((argument0 != (2 << 0)) || (b.joystick_direction == argument2))
                    return true;
            }
        }
        return false;
    }

    static is_empty = function() //gml_Script_anon_tdp_input_key_gml_GlobalScript_tdp_input_classes_1034_tdp_input_key_gml_GlobalScript_tdp_input_classes
    {
        return (array_length(actions) <= 0);
    }

    name = argument0
    pressed = false
    held = false
    released = false
    axis_value = 0
    if ((argument1 == -4))
        actions = array_create(0)
    else
        actions = argument1
}

function tdp_input_action(argument0, argument1, argument2) constructor //gml_Script_tdp_input_action
{
    if ((argument2 == undefined))
        argument2 = 0
    static update = function(argument0) //gml_Script_anon_tdp_input_action_gml_GlobalScript_tdp_input_classes_1897_tdp_input_action_gml_GlobalScript_tdp_input_classes
    {
        if ((argument0 == undefined))
            argument0 = -1
        switch type
        {
            case (0 << 0):
                if is_array(value)
                {
                    var last_held = held
                    axis_value = (keyboard_check(value[1]) - keyboard_check(value[0]))
                    pressed = ((keyboard_check_pressed(value[1]) - keyboard_check_pressed(value[0])) != 0)
                    held = (axis_value != 0)
                    released = ((axis_value == 0) && last_held)
                }
                else
                {
                    pressed = keyboard_check_pressed(value)
                    held = keyboard_check(value)
                    released = keyboard_check_released(value)
                }
                break
            case (1 << 0):
                if is_array(value)
                {
                    last_held = held
                    axis_value = (gamepad_button_check(argument0, value[1]) - gamepad_button_check(argument0, value[0]))
                    pressed = ((gamepad_button_check_pressed(argument0, value[1]) - gamepad_button_check_pressed(argument0, value[0])) != 0)
                    held = (axis_value != 0)
                    released = ((axis_value == 0) && last_held)
                }
                else
                {
                    pressed = gamepad_button_check_pressed(argument0, value)
                    held = gamepad_button_check(argument0, value)
                    released = gamepad_button_check_released(argument0, value)
                }
                break
            case (2 << 0):
                var _pindex = 0
                if instance_exists(obj_inputAssigner)
                {
                    _pindex = obj_inputAssigner.player_index
                    if ((argument0 != obj_inputAssigner.player_input_device[_pindex]))
                        _pindex = (!_pindex)
                }
                last_held = held
                if (!custom_deadzone)
                {
                    var pdz = global.input_controller_deadzone_press
                    var hdz = global.input_controller_deadzone_horizontal
                    var vdz = global.input_controller_deadzone_vertical
                }
                else
                {
                    pdz = variable_global_get(custom_deadzone_press)
                    hdz = variable_global_get(custom_deadzone_horizontal)
                    hdz = variable_global_get(custom_deadzone_vertical)
                }
                switch value
                {
                    case gp_axislh:
                    case gp_axisrh:
                        var dz = hdz
                        break
                    case gp_axislv:
                    case gp_axisrv:
                        dz = vdz
                        break
                }

                axis_value = gamepad_axis_value(argument0, value)
                if ((joystick_direction == 0))
                {
                    var press_check = ((axis_value > pdz) || (axis_value < (-pdz)))
                    pressed = (press_check && (!stickpressed[_pindex]))
                    held = ((axis_value > dz) || (axis_value < (-dz)))
                    released = ((axis_value > (-dz)) && (axis_value < dz) && last_held)
                }
                else if ((joystick_direction == 1))
                {
                    press_check = (axis_value > pdz)
                    pressed = (press_check && (!stickpressed[_pindex]))
                    held = (axis_value > dz)
                    released = ((!held) && last_held)
                }
                else if ((joystick_direction == -1))
                {
                    press_check = (axis_value < (-pdz))
                    pressed = (press_check && (!stickpressed[_pindex]))
                    held = (axis_value < (-dz))
                    released = ((!held) && last_held)
                }
                if press_check
                    stickpressed[_pindex] = true
                else
                    stickpressed[_pindex] = false
                break
        }

    }

    type = argument0
    value = argument1
    has_axis_value = false
    axis_value = 0
    if ((type == (2 << 0)))
    {
        has_axis_value = true
        custom_deadzone = false
        joystick_direction = argument2
        custom_deadzone_press = "input_controller_deadzone_press"
        custom_deadzone_vertical = "input_controller_deadzone_vertical"
        custom_deadzone_horizontal = "input_controller_deadzone_deadzone"
        custom_deadzone_side = "input_controller_deadzone_side"
        axis_value = 0
        stickpressed[0] = false
        stickpressed[1] = false
    }
    if is_array(value)
    {
        has_axis_value = true
        axis_value = 0
    }
    pressed = false
    held = false
    released = false
}

