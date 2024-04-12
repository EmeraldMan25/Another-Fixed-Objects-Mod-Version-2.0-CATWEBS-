function Approach(argument0, argument1, argument2) //gml_Script_Approach
{
    if ((argument0 < argument1))
    {
        argument0 += argument2
        if ((argument0 > argument1))
            return argument1;
    }
    else
    {
        argument0 -= argument2
        if ((argument0 < argument1))
            return argument1;
    }
    return argument0;
}

function get_milliseconds() //gml_Script_get_milliseconds
{
    return (get_timer() / 1000);
}

function camera_zoom(argument0, argument1) //gml_Script_camera_zoom
{
    with (obj_camera)
    {
        targetzoom = argument0
        targetzoom = clamp(targetzoom, 0, max_zoom)
        if ((argument1 != undefined))
            zoomspd = abs(argument1)
    }
}

function camera_set_zoom(argument0) //gml_Script_camera_set_zoom
{
    with (obj_camera)
        zoom = argument0
}

function try_solid(argument0, argument1, argument2, argument3) //gml_Script_try_solid
{
    var old_x = x
    var old_y = y
    var n = -1
    var i = 0
    while ((i < argument3))
    {
        x += argument0
        y += argument1
        if (!(scr_solid(x, y)))
        {
            n = (i + 1)
            break
        }
        else
            i++
    }
    x = old_x
    y = old_y
    return n;
}

function ledge_bump_vertical(argument0, argument1) //gml_Script_ledge_bump_vertical
{
    var old_x = x
    var old_y = y
    y += (argument1 * 4)
    var dirs = [-1, 1]
    for (var i = 0; i < array_length(dirs); i++)
    {
        var ledge_dir = dirs[i]
        var tx = try_solid(ledge_dir, 0, obj_solid, argument0)
        y = old_y
        if ((tx != -1))
        {
            x -= (tx * ledge_dir)
            y += argument1
            if scr_solid(x, y)
            {
                x = old_x
                y = old_y
                return true;
            }
            return false;
        }
    }
    return true;
}

function ledge_bump(argument0, argument1) //gml_Script_ledge_bump
{
    if ((argument1 == undefined))
        argument1 = 4
    var old_x = x
    var old_y = y
    x += (xscale * argument1)
    var ty = try_solid(0, -1, obj_solid, argument0)
    x = old_x
    if ((ty != -1))
    {
        y -= ty
        x += xscale
        if scr_solid(x, y)
        {
            x = old_x
            y = old_y
            return true;
        }
        with (obj_camera)
            offset_y += ty
        return false;
    }
    return true;
}

function instance_create_unique(argument0, argument1, argument2) //gml_Script_instance_create_unique
{
    if instance_exists(argument2)
        return -4;
    var b = instance_create(argument0, argument1, argument2)
    return b;
}

function get_solid_difference(argument0, argument1, argument2) //gml_Script_get_solid_difference
{
    var old_x = x
    var old_y = y
    var n = 0
    for (var i = 0; i < argument2; i++)
    {
        x += argument0
        y += argument1
        if (!(scr_solid(x, y)))
            n++
    }
    x = old_x
    y = old_y
    return n;
}

function trace() //gml_Script_trace
{
    var _string = ""
    for (var i = 0; i < argument_count; i++)
        _string += string(argument[i])
    show_debug_message(_string)
}

function concat() //gml_Script_concat
{
    var _string = ""
    for (var i = 0; i < argument_count; i++)
        _string += string(argument[i])
    return _string;
}

function embed_value_string(argument0, argument1) //gml_Script_embed_value_string
{
    var str_copy = string_copy(argument0, 1, string_length(argument0))
    for (var i = 0; i < array_length(argument1); i++)
    {
        var b = string(argument1[i])
        str_copy = string_replace(str_copy, "%", b)
    }
    return str_copy;
}

function ds_list_add_unique(argument0) //gml_Script_ds_list_add_unique
{
    if ((argument_count > 1))
    {
        for (var i = 1; i < argument_count; i++)
        {
            var b = argument[i]
            if ((ds_list_find_index(argument0, b) == -1))
                ds_list_add(argument0, b)
        }
    }
}

function point_in_camera(argument0, argument1, argument2) //gml_Script_point_in_camera
{
    var cam_x = camera_get_view_x(argument2)
    var cam_y = camera_get_view_y(argument2)
    var cam_w = camera_get_view_width(argument2)
    var cam_h = camera_get_view_height(argument2)
    return point_in_rectangle(argument0, argument1, cam_x, cam_y, (cam_x + cam_w), (cam_y + cam_h));
}

function point_in_camera_ext(argument0, argument1, argument2, argument3, argument4) //gml_Script_point_in_camera_ext
{
    var cam_x = camera_get_view_x(argument2)
    var cam_y = camera_get_view_y(argument2)
    var cam_w = camera_get_view_width(argument2)
    var cam_h = camera_get_view_height(argument2)
    return point_in_rectangle(argument0, argument1, (cam_x - argument3), (cam_y - argument4), ((cam_x + cam_w) + argument3), ((cam_y + cam_h) + argument4));
}

function bbox_in_camera(argument0, argument1) //gml_Script_bbox_in_camera
{
    if ((argument1 == undefined))
        argument1 = 0
    var cam_x = camera_get_view_x(argument0)
    var cam_y = camera_get_view_y(argument0)
    var cam_w = camera_get_view_width(argument0)
    var cam_h = camera_get_view_height(argument0)
    return ((bbox_left < ((cam_x + cam_w) + argument1)) && (bbox_right > (cam_x - argument1)) && (bbox_top < ((cam_y + cam_h) + argument1)) && (bbox_bottom > (cam_y - argument1)));
}

function instance_nearest_random(argument0, argument1) //gml_Script_instance_nearest_random
{
    var l = instance_furthest(x, y, argument0)
    var list = ds_list_create()
    for (var i = 0; i < instance_number(argument0); i++)
    {
        var b = instance_find(argument0, i)
        var t = distance_to_object(b)
        if ((t <= l))
            ds_list_add(list, b)
    }
    b = undefined
    if ((ds_list_size(list) > 0))
    {
        var n = irandom(argument1)
        if ((ds_list_size(list) < n))
            n = (ds_list_size(list) - 1)
        b = ds_list_find_value(list, (ds_list_size(list) - n))
    }
    ds_list_destroy(list)
    return b;
}

function instance_random(argument0) //gml_Script_instance_random
{
    return instance_find(argument0, irandom((instance_number(argument0) - 1)));
}

function heat_calculate(argument0) //gml_Script_heat_calculate
{
    return argument0;
}

