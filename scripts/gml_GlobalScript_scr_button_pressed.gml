function scr_button_pressed(argument0) //gml_Script_scr_button_pressed
{
    if (keyboard_check_pressed(vk_return) || keyboard_check_pressed(global.key_jump) || keyboard_check_pressed(global.key_jumpN))
        return -1;
    else if gamepad_is_connected(argument0)
    {
        if (gamepad_button_check_pressed(argument0, gp_face1) || gamepad_button_check_pressed(argument0, gp_start))
            return argument0;
    }
    return -2;
}

