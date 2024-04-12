function lang_sprites_parse(argument0) //gml_Script_lang_sprites_parse
{
    var file = file_text_open_read(concat("lang/graphics/", argument0, ".json"))
    var str = ""
    while (!file_text_eof(file))
    {
        str += file_text_readln(file)
        str += "\n"
    }
    file_text_close(file)
    var json = json_parse(str)
    trace(json)
    ds_map_set(global.lang_sprite_map, argument0, ds_map_create())
    var arr = json.sprites
    for (var i = 0; i < array_length(arr); i++)
    {
        var spr = arr[i]
        ds_map_set(ds_map_find_value(global.lang_sprite_map, argument0), asset_get_index(spr.name), spr)
        var frame_arr = spr.frames
        for (var j = 0; j < array_length(frame_arr); j++)
        {
            var frame = frame_arr[j]
            if (!(variable_struct_exists(frame, "width")))
                frame.width = -1
            if (!(variable_struct_exists(frame, "height")))
                frame.height = -1
            if (!(variable_struct_exists(frame, "x")))
                frame.x = 0
            if (!(variable_struct_exists(frame, "y")))
                frame.y = 0
            if (!(variable_struct_exists(frame, "offset")))
            {
                frame.offset = 
                {
                    x: 0,
                    y: 0
                }

            }
            if ((ds_list_find_index(global.lang_textures_to_load, frame.texture) == -1))
                ds_list_add(global.lang_textures_to_load, frame.texture)
        }
    }
}

function lang_draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) //gml_Script_lang_draw_sprite_ext
{
    var spr = lang_get_sprite(argument0)
    if ((spr != -4))
    {
        argument1 = floor(argument1)
        var frame = spr.frames[argument1]
        var texture = lang_get_texture(frame.texture)
        if ((texture != -4))
        {
            var w = frame.width
            var h = frame.height
            var offset = frame.offset
            if ((w == -1))
                w = sprite_get_width(texture)
            if ((h == -1))
                h = sprite_get_height(texture)
            draw_sprite_part_ext(texture, 0, frame.x, frame.y, w, h, (argument2 - offset.x), (argument3 - offset.y), argument4, argument5, argument7, argument8)
        }
    }
    else
        draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
}

function lang_draw_sprite(argument0, argument1, argument2, argument3) //gml_Script_lang_draw_sprite
{
    var color = draw_get_color()
    var alpha = draw_get_alpha()
    lang_draw_sprite_ext(argument0, argument1, argument2, argument3, 1, 1, 0, color, alpha)
}

function lang_get_sprite(argument0) //gml_Script_lang_get_sprite
{
    if lang_get_value("custom_graphics")
    {
        var g = ds_map_find_value(ds_map_find_value(global.lang_sprite_map, global.lang), argument0)
        if (!is_undefined(g))
            return g;
    }
    return -4;
}

function lang_get_texture(argument0) //gml_Script_lang_get_texture
{
    var g = ds_map_find_value(global.lang_texture_map, argument0)
    if (!is_undefined(g))
        return g;
    return -4;
}

