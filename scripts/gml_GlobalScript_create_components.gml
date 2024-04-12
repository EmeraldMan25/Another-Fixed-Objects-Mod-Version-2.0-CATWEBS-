function create_components(argument0, argument1) //gml_Script_create_components
{
    with (obj_editor)
    {
        var q = ds_map_find_value(component_map, argument0)
        if (!is_undefined(q))
        {
            for (var i = 0; i < array_length(q); i++)
            {
                var b = q[i]
                switch b.type
                {
                    case "resize":
                        with (instance_create(x, y, obj_resizecomponent))
                        {
                            dock = component_get_dock(b.dock)
                            snap = b.snap
                            lock = b.lock
                            inst = argument1
                            if variable_struct_exists(b, "clamp_lock")
                            {
                                if variable_struct_exists(b.clamp_lock, "x")
                                    xclamp = b.clamp_lock.x
                                if variable_struct_exists(b.clamp_lock, "y")
                                    yclamp = b.clamp_lock.y
                            }
                        }
                        break
                    case "mirror":
                        with (instance_create(x, y, obj_buttoncomponent))
                        {
                            inst = argument1
                            on_left_click = function() //gml_Script_anon_create_components_gml_GlobalScript_create_components_797_create_components_gml_GlobalScript_create_components
                            {
                                with (inst)
                                {
                                    image_xscale *= -1
                                    var oldx = x
                                    var oldy = y
                                    clamp_to_room(global.current_level.current_room)
                                    if ((oldx != x) || (oldy != y))
                                        command_add(new MoveObjectCMD(id, x, y, oldx, oldy))
                                    command_add(new ResizeCMD(id, image_xscale, image_yscale, (-image_xscale), image_yscale))
                                }
                            }

                        }
                        break
                }

            }
        }
    }
}

function component_get_dock(argument0) //gml_Script_component_get_dock
{
    switch argument0
    {
        case "BottomRight":
            return (5 << 0);
        case "Bottom":
            return (7 << 0);
        case "BottomLeft":
            return (2 << 0);
        case "TopRight":
            return (3 << 0);
        case "Top":
            return (6 << 0);
        case "TopLeft":
            return (0 << 0);
        case "Right":
            return (4 << 0);
        case "Left":
            return (1 << 0);
    }

    return -4;
}

