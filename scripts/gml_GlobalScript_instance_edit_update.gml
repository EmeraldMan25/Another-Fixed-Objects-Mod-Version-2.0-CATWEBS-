function object_apply_values(argument0) //gml_Script_object_apply_values
{
    sprite_index = asset_get_index(argument0.sprite_index)
    snap_tile_val = argument0.snap_tile_val
    xoffset = argument0.xoffset
    yoffset = argument0.yoffset
}

function instance_edit_update() //gml_Script_instance_edit_update
{
    var pos = editor_get_world_pos()
    var xx = pos[0]
    var yy = pos[1]
    switch instance_state
    {
        case (0 << 0):
            if key_delete
            {
                with (instance_place(xx, yy, obj_editorobject))
                {
                    var cmd = new DeleteObject(id)
                    command_add(cmd)
                }
            }
            else if (key_place && point_in_rectangle(xx, yy, current_room.x, current_room.y, (current_room.x + current_room.width), (current_room.y + current_room.height)))
            {
                if ((!(editor_is_cursor_on_ui(obj_editorcursor.x, obj_editorcursor.y))) && (!(place_meeting(xx, yy, obj_component))))
                {
                    if ((!instance_exists(selected_instance)) || (!(place_meeting(xx, yy, obj_editorobject))))
                    {
                        var o = selected_object
                        var inst = noone
                        with (selected_instance)
                            selected = false
                        with (instance_create_depth((snap_tile(xx, o.snap_tile_val) + o.xoffset), (snap_tile(yy, o.snap_tile_val) + o.yoffset), 0, obj_editorobject))
                        {
                            object_apply_values(o)
                            object = asset_get_index(o.object_index)
                            ID = o.ID
                            inst = id
                            selected = true
                            with (global.current_level.current_room)
                                array_push(instances, other.id)
                            create_components(ID, id)
                        }
                        selected_instance = inst
                        command_add(new PlaceObject(inst))
                    }
                    else
                    {
                        with (selected_instance)
                            selected = false
                        with (instance_place(xx, yy, obj_editorobject))
                        {
                            selected = true
                            if ((other.selected_instance != id))
                                create_components(ID, id)
                            other.selected_instance = id
                            with (other)
                            {
                                instance_oldx = other.x
                                instance_oldy = other.y
                                instance_state = (1 << 0)
                                instance_xoffset = (other.x - xx)
                                instance_yoffset = (other.y - yy)
                            }
                        }
                    }
                }
            }
            break
        case (1 << 0):
            with (selected_instance)
            {
                x = (xx + other.instance_xoffset)
                y = (yy + other.instance_yoffset)
                var ch = other.current_room.height
                if ((ch == obj_screensizer.ideal_height))
                    ch += 4
                ch += other.current_room.y
                x = clamp(x, other.current_room.x, (other.current_room.x + other.current_room.width))
                y = clamp(y, other.current_room.y, ch)
            }
            if key_place_released
            {
                with (selected_instance)
                {
                    move_snap(snap_tile_val, snap_tile_val)
                    x += xoffset
                    y += yoffset
                    clamp_to_room(other.current_room)
                    if ((x != other.instance_oldx) || (y != other.instance_oldy))
                        command_add(new MoveObjectCMD(id, x, y, other.instance_oldx, other.instance_oldy))
                }
                instance_state = (0 << 0)
            }
            break
    }

}

