function scr_anybutton_pressed(argument0) //gml_Script_scr_anybutton_pressed
{
    var _index = argument0
    if keyboard_check_pressed(vk_anykey)
        return -1;
    else if gamepad_is_connected(_index)
    {
        for (var i = gp_face1; i < 32788; i++)
        {
            if gamepad_button_check_pressed(_index, i)
            {
                if ((i == 32769) && instance_exists(obj_player1))
                {
                    obj_player1.key_jump = true
                    obj_player1.key_jump2 = true
                }
                return _index;
            }
        }
        var _threshold = 0.5
        var _up = (gamepad_axis_value(_index, gp_axislv) < (-_threshold))
        var _right = (gamepad_axis_value(_index, gp_axislh) > _threshold)
        var _left = (gamepad_axis_value(_index, gp_axislh) < (-_threshold))
        var _down = (gamepad_axis_value(_index, gp_axislv) > _threshold)
        if (_up || _right || _left || _down)
            return _index;
    }
    return -2;
}

