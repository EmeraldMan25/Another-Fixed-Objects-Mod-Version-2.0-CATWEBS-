function screen_apply_size_delayed() //gml_Script_screen_apply_size_delayed
{
    with (obj_screensizer)
        alarm[2] = 1
}

function screen_apply_size() //gml_Script_screen_apply_size
{
    with (obj_screensizer)
    {
        if ((global.option_resolution == 0) && (global.option_scale_mode == 1))
            global.option_resolution = 1
        if ((gameframe_get_fullscreen() == 0))
            gameframe_restore()
        var w = get_resolution_width(global.option_resolution, aspect_ratio)
        var h = get_resolution_height(global.option_resolution, aspect_ratio)
        trace("Setting Window Size: ", w, ", ", h)
        window_set_size(w, h)
        alarm[0] = 2
    }
}

function screen_apply_vsync() //gml_Script_screen_apply_vsync
{
    if ((room != Loadiingroom))
    {
        trace("Applying VSync: ", global.option_vsync)
        display_reset(0, global.option_vsync)
    }
}

function screen_option_apply_fullscreen(argument0) //gml_Script_screen_option_apply_fullscreen
{
    var opt = global.option_fullscreen
    global.option_fullscreen = argument0
    screen_apply_fullscreen(argument0)
    with (instance_create(0, 0, obj_screenconfirm))
    {
        savedoption = opt
        section = "Option"
        key = "fullscreen"
        varname = "option_fullscreen"
        depth = (obj_option.depth - 1)
    }
}

function screen_apply_fullscreen(argument0) //gml_Script_screen_apply_fullscreen
{
    if ((argument0 == c_black))
    {
        gameframe_set_fullscreen(0)
        obj_screensizer.alarm[2] = 1
    }
    else if ((argument0 == 0x000001))
        gameframe_set_fullscreen(1)
    else if ((argument0 == 0x000002))
        gameframe_set_fullscreen(2)
}

function surface_safe_set_target(argument0) //gml_Script_surface_safe_set_target
{
    surface_reset_target()
    surface_set_target(argument0)
}

function set_gui_target(argument0) //gml_Script_set_gui_target
{
    while ((surface_get_target() != -1) && (surface_get_target() != application_surface))
        surface_reset_target()
    surface_set_target(argument0)
}

function surface_safe_reset_target() //gml_Script_surface_safe_reset_target
{
    if ((surface_get_target() != -1) && (surface_get_target() != application_surface))
        surface_reset_target()
}

function reset_gui_target() //gml_Script_reset_gui_target
{
    while ((surface_get_target() != -1) && (surface_get_target() != application_surface))
        surface_reset_target()
    with (obj_screensizer)
    {
        if (!surface_exists(gui_surf))
            return;
        surface_set_target(gui_surf)
    }
}

function reset_blendmode() //gml_Script_reset_blendmode
{
    gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha)
}

function reset_shader_fix() //gml_Script_reset_shader_fix
{
    if ((shader_current() != -1))
        shader_reset()
    shader_set(shd_alphafix)
}

function window_to_gui_x(argument0) //gml_Script_window_to_gui_x
{
    var _win_pos = (argument0 / window_get_width())
    return (display_get_gui_width() * _win_pos);
}

function window_to_gui_y(argument0) //gml_Script_window_to_gui_y
{
    var _win_pos = (argument0 / window_get_height())
    return (display_get_gui_height() * _win_pos);
}

function window_to_gui_xscale(argument0) //gml_Script_window_to_gui_xscale
{
    return ((argument0 * display_get_gui_width()) / window_get_width());
}

function window_to_gui_yscale(argument0) //gml_Script_window_to_gui_yscale
{
    return ((argument0 * display_get_gui_height()) / window_get_height());
}

function get_resolution_width(argument0, argument1) //gml_Script_get_resolution_width
{
    if ((argument1 == undefined))
        argument1 = (0 << 0)
    if ((argument0 < c_black) || (argument0 >= array_length(global.resolutions[argument1])))
        return get_resolution_width(1, argument1);
    return global.resolutions[argument1][argument0][0];
}

function get_resolution_height(argument0, argument1) //gml_Script_get_resolution_height
{
    if ((argument1 == undefined))
        argument1 = (0 << 0)
    if ((argument0 < c_black) || (argument0 >= array_length(global.resolutions[argument1])))
        return get_resolution_height(1, argument1);
    return global.resolutions[argument1][argument0][1];
}

function get_resolution(argument0, argument1) //gml_Script_get_resolution
{
    if ((argument1 == undefined))
        argument1 = (0 << 0)
    if ((argument0 < c_black) || (argument0 >= array_length(global.resolutions[argument1])))
        return -4;
    return global.resolutions[argument1][argument0];
}

function screen_clear(argument0) //gml_Script_screen_clear
{
    if ((argument0 == undefined))
        argument0 = 0
    draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, argument0, argument0, argument0, argument0, false)
}

function get_options() //gml_Script_get_options
{
    ini_open("saveData.ini")
    global.option_fullscreen = ini_read_real("Option", "fullscreen", 1)
    global.option_resolution = ini_read_real("Option", "resolution", 1)
    global.option_master_volume = ini_read_real("Option", "master_volume", 1)
    global.option_music_volume = ini_read_real("Option", "music_volume", 0.85)
    global.option_sfx_volume = ini_read_real("Option", "sfx_volume", 1)
    global.option_vibration = ini_read_real("Option", "vibration", 1)
    global.option_scale_mode = ini_read_real("Option", "scale_mode", 0)
    global.option_hud = ini_read_real("Option", "hud", 1)
    global.option_lang = ini_read_string("Option", "lang", "en")
    global.option_timer = ini_read_real("Option", "timer", 0)
    global.option_speedrun_timer = ini_read_real("Option", "speedrun_timer", 0)
    global.option_timer_type = ini_read_real("Option", "timer_type", 0)
    global.option_unfocus_mute = ini_read_real("Option", "unfocus_mute", 0)
    global.option_texfilter = ini_read_real("Option", "texfilter", 1)
    global.option_vsync = ini_read_real("Option", "vsync", 0)
    global.option_screenshake = ini_read_real("Option", "screenshake", 1)
    global.lang = global.option_lang
    if (1 && steam_utils_is_steam_running_on_steam_deck())
    {
        global.option_fullscreen = 1
        global.option_resolution = 1
    }
    ini_close()
    screen_apply_fullscreen(global.option_fullscreen)
    obj_screensizer.start_sound = false
}

