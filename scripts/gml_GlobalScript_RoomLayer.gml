function room_layer_add(argument0) //gml_Script_room_layer_add
{
    with (obj_itemlist)
    {
        if ((ID == argument0))
        {
            if ((global.current_level.current_room == noone))
                return;
            var arr = global.current_level.current_room.backgrounds
            if ((argument0 == obj_doisedead))
                arr = global.current_level.current_room.tiles
            var lowest_depth = -100
            if ((array_length(arr) > 0))
            {
                for (var i = 0; i < array_length(arr); i++)
                {
                    var b = arr[i]
                    if ((b.depth > lowest_depth))
                        lowest_depth = b.depth
                }
            }
            else
                lowest_depth = 0
            var _layer = new RoomLayer()
            _layer.depth = (lowest_depth + 1)
            if ((_layer.depth == 0))
                _layer.depth++
            if ((argument0 == obj_doisedead))
                _layer.layer_type = (1 << 0)
            array_push(arr, _layer)
            dirty = true
        }
    }
}

function room_layer_delete(argument0) //gml_Script_room_layer_delete
{
    with (obj_itemlist)
    {
        if ((ID == argument0) && (selected_item != -4))
        {
            if ((global.current_level.current_room == noone))
                return;
            var arr = global.current_level.current_room.backgrounds
            if ((argument0 == obj_doisedead))
                arr = global.current_level.current_room.tiles
            var i = 0
            while ((i < array_length(arr)))
            {
                var b = arr[i]
                if ((b.depth == ds_list_find_value(items, selected_item).depth))
                {
                    array_delete(arr, i, 1)
                    b = undefined
                    break
                }
                else
                    i++
            }
            dirty = true
        }
    }
}

function room_layer_move_up(argument0) //gml_Script_room_layer_move_up
{
    with (obj_itemlist)
    {
        if ((ID == argument0) && (selected_item != -4))
        {
            var _room = global.current_level.current_room
            if ((_room == noone))
                return;
            var _arr = _room.backgrounds
            if ((argument0 == obj_doisedead))
                _arr = _room.tiles
            var i = 0
            while ((i < array_length(_arr)))
            {
                var b = _arr[i]
                if ((b.depth == ds_list_find_value(items, selected_item).depth))
                {
                    b.move_up(_arr)
                    search_depth = b.depth
                    break
                }
                else
                    i++
            }
            dirty = true
        }
    }
}

function room_layer_move_down(argument0) //gml_Script_room_layer_move_down
{
    if ((global.current_level.current_room == noone))
        return;
    with (obj_itemlist)
    {
        if ((ID == argument0) && (selected_item != -4))
        {
            var _room = global.current_level.current_room
            var _arr = _room.backgrounds
            if ((argument0 == obj_doisedead))
                _arr = _room.tiles
            var i = 0
            while ((i < array_length(_arr)))
            {
                var b = _arr[i]
                if ((b.depth == ds_list_find_value(items, selected_item).depth))
                {
                    b.move_down(_arr)
                    search_depth = b.depth
                    break
                }
                else
                    i++
            }
            dirty = true
        }
    }
}

function room_layer_item_dirty(argument0) //gml_Script_room_layer_item_dirty
{
    if ((global.current_level.current_room == noone))
        return;
    ds_list_clear(items)
    var _arr = array_create(0)
    with (global.current_level.current_room)
    {
        for (var i = 0; i < array_length(argument0); i++)
        {
            var b = argument0[i]
            var _name = ""
            switch b.layer_type
            {
                case (1 << 0):
                    _name = "Tile "
                    if ((b.depth < 0))
                        _name = "Tile FG "
                    break
                case (0 << 0):
                    _name = "Background "
                    if ((b.depth < 0))
                        _name = "Foreground "
                    break
            }

            _name += string(abs(b.depth))
            array_push(_arr, 
            {
                name: _name,
                depth: b.depth
            }
)
        }
    }
    array_sort(_arr, function(argument0, argument1) //gml_Script_anon_room_layer_item_dirty_gml_GlobalScript_RoomLayer_3264_room_layer_item_dirty_gml_GlobalScript_RoomLayer
    {
        return (argument0.depth - argument1.depth);
    }
)
    for (i = 0; i < array_length(_arr); i++)
    {
        ds_list_add(items, _arr[i])
        if ((ds_list_find_value(items, i).depth == search_depth))
            selected_item = i
    }
}

function RoomLayer() constructor //gml_Script_RoomLayer
{
    static move_up = function(argument0) //gml_Script_anon_RoomLayer_gml_GlobalScript_RoomLayer_3633_RoomLayer_gml_GlobalScript_RoomLayer
    {
        if ((argument0 == undefined))
            argument0 = noone
        var old_depth = depth
        depth--
        if ((depth == 0))
            depth--
        if ((argument0 != noone))
        {
            var i = 0
            while ((i < array_length(argument0)))
            {
                var b = argument0[i]
                if ((b != self))
                {
                    if ((sign(depth) == sign(old_depth)))
                    {
                        if ((b.depth == depth))
                        {
                            b.move_down()
                            break
                        }
                        else
                            i++
                    }
                    else
                    {
                        if ((sign(b.depth) == sign(old_depth)))
                            b.move_up()
                        else if ((sign(b.depth) == sign(depth)))
                            b.move_up()
                        i++
                    }
                }
                else
                    i++
            }
        }
    }

    static move_down = function(argument0) //gml_Script_anon_RoomLayer_gml_GlobalScript_RoomLayer_4198_RoomLayer_gml_GlobalScript_RoomLayer
    {
        if ((argument0 == undefined))
            argument0 = noone
        var old_depth = depth
        depth++
        if ((depth == 0))
            depth++
        if ((argument0 != noone))
        {
            var i = 0
            while ((i < array_length(argument0)))
            {
                var b = argument0[i]
                if ((b != self))
                {
                    if ((sign(depth) == sign(old_depth)))
                    {
                        if ((b.depth == depth))
                        {
                            b.move_up()
                            break
                        }
                        else
                            i++
                    }
                    else
                    {
                        if ((sign(b.depth) == sign(old_depth)))
                            b.move_down()
                        else if ((sign(b.depth) == sign(depth)))
                            b.move_down()
                        i++
                    }
                }
                else
                    i++
            }
        }
    }

    static draw = function(argument0) //gml_Script_anon_RoomLayer_gml_GlobalScript_RoomLayer_4755_RoomLayer_gml_GlobalScript_RoomLayer
    {
        switch layer_type
        {
            case (0 << 0):
                draw_sprite_repeat(sprite_index, image_index, argument0.x, argument0.y, argument0.width, argument0.height)
                break
        }

    }

    layer_type = (0 << 0)
    sprite_index = -4
    image_index = 0
    depth = 1
}

