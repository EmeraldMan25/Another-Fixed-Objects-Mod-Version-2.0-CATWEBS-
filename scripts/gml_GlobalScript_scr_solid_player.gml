function scr_solid_player(argument0, argument1) //gml_Script_scr_solid_player
{
    var old_x = x
    var old_y = y
    x = argument0
    y = argument1
    ds_list_clear(global.instancelist)
    var num = instance_place_list(x, y, obj_solid, global.instancelist, false)
    var _collided = false
    var i = 0
    while ((i < num))
    {
        var b = ds_list_find_value(global.instancelist, i)
        if instance_exists(b)
        {
            switch b.object_index
            {
                case obj_ghostwall:
                    if ((state != (16 << 0)))
                        _collided = true
                    break
                case obj_mach3solid:
                    if ((state != (121 << 0)) && ((state != (105 << 0)) || (sprite_index != spr_mach3boost)) && ((state != (61 << 0)) || (tauntstoredstate != (121 << 0))))
                        _collided = true
                    break
                default:
                    _collided = true
            }

            var par = object_get_parent(b.object_index)
            if (((state == (108 << 0)) || (state == (198 << 0)) || (state == (197 << 0))) && (vsp >= 0) && ((par == 596) || (par == 597) || (par == 68) || (par == 793) || (par == 786)))
            {
                _collided = false
                instance_destroy(b)
            }
        }
        if _collided
            break
        else
            i++
    }
    ds_list_clear(global.instancelist)
    if _collided
    {
        x = old_x
        y = old_y
        return true;
    }
    if ((y > old_y) && (state != (93 << 0)) && place_meeting(x, y, obj_platform))
    {
        ds_list_clear(global.instancelist)
        num = instance_place_list(x, y, obj_platform, global.instancelist, false)
        _collided = false
        for (i = 0; i < num; i++)
        {
            b = ds_list_find_value(global.instancelist, i)
            if ((!(place_meeting(x, old_y, b))) && place_meeting(x, y, b))
                _collided = true
        }
        ds_list_clear(global.instancelist)
        if _collided
        {
            x = old_x
            y = old_y
            return true;
        }
    }
    if ((y > old_y) && (state == (78 << 0)) && (!(place_meeting(x, old_y, obj_grindrail))) && place_meeting(x, y, obj_grindrail))
    {
        x = old_x
        y = old_y
        return true;
    }
    if check_slope_player(573)
    {
        x = old_x
        y = old_y
        return true;
    }
    if ((state == (78 << 0)) && check_slope_player(4))
    {
        x = old_x
        y = old_y
        return true;
    }
    x = old_x
    y = old_y
    return false;
}

function check_slope_player(argument0) //gml_Script_check_slope_player
{
    var slope = instance_place(x, y, argument0)
    if slope
    {
        with (slope)
        {
            var object_side = 0
            var slope_start = 0
            var slope_end = 0
            if ((image_xscale > 0))
            {
                object_side = other.bbox_right
                slope_start = bbox_bottom
                slope_end = bbox_top
            }
            else
            {
                object_side = other.bbox_left
                slope_start = bbox_top
                slope_end = bbox_bottom
            }
            var m = ((sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left))
            slope = (slope_start - round((m * (object_side - bbox_left))))
            if ((other.bbox_bottom >= slope))
                return true;
        }
    }
    return false;
}

