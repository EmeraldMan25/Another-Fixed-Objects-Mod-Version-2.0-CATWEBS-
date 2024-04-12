function scr_checkanystick(argument0, argument1) //gml_Script_scr_checkanystick
{
    if ((argument1 == undefined))
        argument1 = 0.5
    if ((gamepad_axis_value(argument0, gp_axislh) > argument1) || (gamepad_axis_value(argument0, gp_axislh) < (-argument1)))
        return true;
    if ((gamepad_axis_value(argument0, gp_axislv) > argument1) || (gamepad_axis_value(argument0, gp_axislv) < (-argument1)))
        return true;
    if ((gamepad_axis_value(argument0, gp_axisrh) > argument1) || (gamepad_axis_value(argument0, gp_axisrh) < (-argument1)))
        return true;
    if ((gamepad_axis_value(argument0, gp_axisrv) > argument1) || (gamepad_axis_value(argument0, gp_axisrv) < (-argument1)))
        return true;
}

function scr_check_menu_key(argument0) //gml_Script_scr_check_menu_key
{
    return ((global.key_start != argument0) && (global.key_slap != argument0) && (global.key_taunt != argument0));
}

function scr_check_menu_repeats(argument0, argument1, argument2) //gml_Script_scr_check_menu_repeats
{
    if ((!argument2) && (argument1 == 27) && ((argument0 == "menu_back") || (argument0 == "menu_start")))
        return true;
    var query = []
    for (var i = 0; i < array_length(input); i++)
    {
        var in = input[i]
        if ((in[0] != "menu_quit") && (in[0] != argument0) && (string_copy(input[i][0], 0, 4) == "menu"))
            array_push(query, concat(input[i][0], (argument2 ? "C" : "")))
    }
    for (i = 0; i < array_length(query); i++)
    {
        in = tdp_input_get(query[i])
        if (!argument2)
        {
            if in.has_value((0 << 0), argument1)
                return false;
        }
        else if is_array(argument1)
        {
            if in.has_value((2 << 0), argument1[0], argument1[1])
                return false;
        }
        else if in.has_value((1 << 0), argument1)
            return false;
    }
    return true;
}

function scr_checkanygamepad(argument0) //gml_Script_scr_checkanygamepad
{
    if gamepad_button_check_pressed(argument0, gp_face1)
        return 32769;
    else if gamepad_button_check_pressed(argument0, gp_face2)
        return 32770;
    else if gamepad_button_check_pressed(argument0, gp_face3)
        return 32771;
    else if gamepad_button_check_pressed(argument0, gp_face4)
        return 32772;
    else if gamepad_button_check_pressed(argument0, gp_shoulderl)
        return 32773;
    else if gamepad_button_check_pressed(argument0, gp_shoulderlb)
        return 32775;
    else if gamepad_button_check_pressed(argument0, gp_shoulderr)
        return 32774;
    else if gamepad_button_check_pressed(argument0, gp_shoulderrb)
        return 32776;
    else if gamepad_button_check_pressed(argument0, gp_select)
        return 32777;
    else if gamepad_button_check_pressed(argument0, gp_start)
        return 32778;
    else if gamepad_button_check_pressed(argument0, gp_stickl)
        return 32779;
    else if gamepad_button_check_pressed(argument0, gp_stickr)
        return 32780;
    else if gamepad_button_check_pressed(argument0, gp_padu)
        return 32781;
    else if gamepad_button_check_pressed(argument0, gp_padd)
        return 32782;
    else if gamepad_button_check_pressed(argument0, gp_padl)
        return 32783;
    else if gamepad_button_check_pressed(argument0, gp_padr)
        return 32784;
    else if gamepad_button_check_pressed(argument0, gp_axislh)
        return 32785;
    else if gamepad_button_check_pressed(argument0, gp_axislv)
        return 32786;
    else if gamepad_button_check_pressed(argument0, gp_axisrh)
        return 32787;
    else if gamepad_button_check_pressed(argument0, gp_axisrv)
        return 32788;
    return -4;
}

function scr_check_joysticks(argument0) //gml_Script_scr_check_joysticks
{
    if ((gamepad_axis_value(argument0, gp_axislh) > 0.5))
        return [32785, 1];
    if ((gamepad_axis_value(argument0, gp_axislh) < -0.5))
        return [32785, -1];
    if ((gamepad_axis_value(argument0, gp_axislv) > 0.5))
        return [32786, 1];
    if ((gamepad_axis_value(argument0, gp_axislv) < -0.5))
        return [32786, -1];
    if ((gamepad_axis_value(argument0, gp_axisrh) > 0.5))
        return [32787, 1];
    if ((gamepad_axis_value(argument0, gp_axisrh) < -0.5))
        return [32787, -1];
    if ((gamepad_axis_value(argument0, gp_axisrv) > 0.5))
        return [32788, 1];
    if ((gamepad_axis_value(argument0, gp_axisrv) < -0.5))
        return [32788, -1];
    return -4;
}

