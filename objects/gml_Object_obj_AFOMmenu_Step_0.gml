scr_init_input()
if (!(variable_instance_exists(id, "stickpressed_horizontal")))
    variable_instance_set(id, "stickpressed_horizontal", 0)
if (!(variable_instance_exists(id, "stickpressed_vertical")))
    variable_instance_set(id, "stickpressed_vertical", 0)
scr_getinput()
if (!instance_exists(obj_fadeout))
{
    if instance_exists(obj_pause)
    {
        instance_list = obj_pause.instance_list
        sound_list = obj_pause.sound_list
    }
    if (key_up2 && active)
        selected++
    if (key_down2 && active)
        selected--
    selected = clamp(selected, 0, (array_length(modSettings) - 1))
    if (key_jump && active)
    {
        modSettings[selected][0] = (!modSettings[selected][0])
        ini_open(("saves/" + concat("AFOMSavedata", ".ini")))
        ini_write_real("AFOM Settings", modSettings[selected][1], modSettings[selected][0])
        ini_close()
    }
    var _dvc = obj_inputAssigner.player_input_device[0]
    if ((keyboard_check_pressed(vk_control) || gamepad_button_check_pressed(_dvc, gp_select)) && active && (!pressed))
    {
        active = 0
        destroyed = 1
        scr_pause_activate_objects(1)
    }
    if ((keyboard_check_pressed(vk_control) || gamepad_button_check_pressed(_dvc, gp_select)) && (!destroyed))
    {
        active = 1
        pressed = 1
        scr_pause_deactivate_objects(1)
    }
    else if ((keyboard_check_released(vk_control) || gamepad_button_check_released(_dvc, gp_select)) && active)
        pressed = 0
    destroyed = 0
}
