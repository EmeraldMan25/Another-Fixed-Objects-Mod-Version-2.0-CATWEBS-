function scr_get_languages() //gml_Script_scr_get_languages
{
    global.lang_map = ds_map_create()
    global.lang_sprite_map = ds_map_create()
    global.lang_texture_map = ds_map_create()
    global.lang_to_load = ds_queue_create()
    global.lang = "en"
    var arr = []
    for (var file = file_find_first("lang/*.txt", 0); file != ""; file = file_find_next())
    {
        if ((file != "english.txt"))
            array_push(arr, file)
    }
    file_find_close()
    for (var i = 0; i < array_length(arr); i++)
        ds_queue_enqueue(global.lang_to_load, arr[i])
    global.credits_arr = scr_lang_get_credits()
    global.noisecredits_arr = scr_lang_get_noise_credits()
    global.lang_textures_to_load = ds_list_create()
    lang_parse_file("english.txt")
}

function lang_parse_file(argument0) //gml_Script_lang_parse_file
{
    var fo = file_text_open_read(("lang/" + argument0))
    var str = ""
    while (!file_text_eof(fo))
    {
        str += file_text_readln(fo)
        str += "\n"
    }
    file_text_close(fo)
    var key = lang_parse(str)
    if lang_get_value_raw(key, "custom_graphics")
        lang_sprites_parse(key)
}

function scr_lang_get_file_arr(argument0) //gml_Script_scr_lang_get_file_arr
{
    var fo = file_text_open_read(argument0)
    var arr = array_create(0)
    while (!file_text_eof(fo))
    {
        array_push(arr, file_text_read_string(fo))
        file_text_readln(fo)
    }
    file_text_close(fo)
    return arr;
}

function scr_lang_get_credits() //gml_Script_scr_lang_get_credits
{
    return scr_lang_get_file_arr("credits.txt");
}

function scr_lang_get_noise_credits() //gml_Script_scr_lang_get_noise_credits
{
    var arr = scr_lang_get_file_arr("noisecredits.txt")
    var credits = array_create(0)
    for (var i = 0; i < array_length(arr); i++)
    {
        var _name = arr[i++]
        var _heads = array_create(0)
        var _head = arr[i++]
        while ((_head != ""))
        {
            array_push(_heads, (real(_head) - 1))
            if ((i >= array_length(arr)))
                break
            else
                _head = arr[i++]
        }
        i--
        array_push(credits, 
        {
            name: _name,
            heads: _heads
        }
)
    }
    return credits;
}

function lang_get_value_raw(argument0, argument1) //gml_Script_lang_get_value_raw
{
    var n = ds_map_find_value(ds_map_find_value(global.lang_map, argument0), argument1)
    if is_undefined(n)
        n = ds_map_find_value(ds_map_find_value(global.lang_map, "en"), argument1)
    if is_undefined(n)
    {
        n = ""
        instance_create_unique(0, 0, obj_langerror)
        with (obj_langerror)
            text = concat("Error: Could not find lang value \"", argument1, "\"\nPlease restore your english.txt file")
    }
    return n;
}

function lang_get_value(argument0) //gml_Script_lang_get_value
{
    return lang_get_value_raw(global.lang, argument0);
}

function lang_get_value_newline(argument0) //gml_Script_lang_get_value_newline
{
    return string_replace_all(lang_get_value(argument0), "\\n", "\n");
}

function lang_parse(argument0) //gml_Script_lang_parse
{
    var list = ds_list_create()
    lang_lexer(list, argument0)
    var map = lang_exec(list)
    var lang = ds_map_find_value(map, "lang")
    ds_map_set(global.lang_map, lang, map)
    ds_list_destroy(list)
    return lang;
}

function lang_lexer(argument0, argument1) //gml_Script_lang_lexer
{
    var len = string_length(argument1)
    var pos = 1
    while ((pos <= len))
    {
        var start = pos
        var char = string_ord_at(argument1, pos)
        pos += 1
        switch char
        {
            case 32:
            case 9:
            case 13:
            case 10:
                break
            case 35:
                while ((pos <= len))
                {
                    char = string_ord_at(argument1, pos)
                    if ((char == 13) || (char == 10))
                        break
                    else
                        pos += 1
                }
                break
            case 61:
                ds_list_add(argument0, [(0 << 0), start])
                break
            case 34:
                while ((pos <= len))
                {
                    char = string_ord_at(argument1, pos)
                    if ((char != 34) || (string_ord_at(argument1, (pos - 1)) == 92))
                        pos += 1
                    else
                        break
                }
                if ((pos <= len))
                {
                    var val = string_copy(argument1, (start + 1), ((pos - start) - 1))
                    string_replace_all(val, "\\\"", "\"")
                    ds_list_add(argument0, [(2 << 0), start, val])
                    pos += 1
                }
                else
                    return;
                break
            default:
                if lang_get_identifier(char, false)
                {
                    while ((pos <= len))
                    {
                        char = string_ord_at(argument1, pos)
                        if lang_get_identifier(char, true)
                            pos += 1
                        else
                            break
                    }
                    var name = string_copy(argument1, start, (pos - start))
                    switch name
                    {
                        case "false":
                            ds_list_add(argument0, [(3 << 0), start, false])
                            break
                        case "noone":
                            ds_list_add(argument0, [(3 << 0), start, -4])
                            break
                        case "true":
                            ds_list_add(argument0, [(3 << 0), start, true])
                            break
                        default:
                            ds_list_add(argument0, [(1 << 0), start, name])
                    }

                }
                break
        }

    }
    ds_list_add(argument0, [(4 << 0), (len + 1)])
}

function lang_get_identifier(argument0, argument1) //gml_Script_lang_get_identifier
{
    if argument1
        return ((argument0 == 95) || ((argument0 >= 97) && (argument0 <= 122)) || ((argument0 >= 65) && (argument0 <= 90)) || ((argument0 >= 48) && (argument0 <= 57)));
    else
        return ((argument0 == 95) || ((argument0 >= 97) && (argument0 <= 122)) || ((argument0 >= 65) && (argument0 <= 90)));
}

function lang_exec(argument0) //gml_Script_lang_exec
{
    var map = ds_map_create()
    var len = ds_list_size(argument0)
    var pos = 0
    while ((pos < len))
    {
        var q = ds_list_find_value(argument0, pos++)
        switch q[0]
        {
            case (0 << 0):
                var ident = array_get(ds_list_find_value(argument0, (pos - 2)), 2)
                var val = array_get(ds_list_find_value(argument0, pos++), 2)
                ds_map_set(map, ident, val)
                break
        }

    }
    return map;
}

function lang_get_custom_font(argument0, argument1) //gml_Script_lang_get_custom_font
{
    var _dir = concat(argument0, "_dir")
    var _ttf = ds_map_find_value(argument1, "use_ttf")
    if ((!is_undefined(_ttf)) && _ttf)
    {
        if (!(is_undefined(ds_map_find_value(argument1, _dir))))
        {
            var font_size = ds_map_find_value(argument1, concat(argument0, "_size"))
            font_size = real(font_size)
            return font_add(concat("lang/", ds_map_find_value(argument1, _dir)), font_size, false, false, 32, 127);
        }
    }
    else if (!(is_undefined(ds_map_find_value(argument1, _dir))))
    {
        var font_map = ds_map_find_value(argument1, concat(argument0, "_map"))
        font_size = string_length(font_map)
        var font_sep = ds_map_find_value(argument1, concat(argument0, "_sep"))
        font_sep = real(font_sep)
        var font_xorig = 0
        var font_yorig = 0
        var spr = sprite_add(concat("lang/", ds_map_find_value(argument1, _dir)), font_size, false, false, font_xorig, font_yorig)
        return font_add_sprite_ext(spr, font_map, false, font_sep);
    }
    return lang_get_font(argument0);
}

function lang_get_font(argument0) //gml_Script_lang_get_font
{
    var n = ds_map_find_value(global.font_map, lang_get_value(argument0))
    if (!is_undefined(n))
        return n;
    return ds_map_find_value(global.font_map, concat(argument0, "_en"));
}

