if ((ds_list_find_index(global.saveroom, id) == -1))
{
    instance_create(x, y, obj_bangeffect)
    if (!is_array(content))
    {
        if is_string(content)
            content = asset_get_index(content)
        with (instance_create(x, y, content))
        {
            if ((other.content == obj_pizzaslice))
                hsp = 2
        }
        with (instance_create(x, y, content))
        {
            if ((other.content == obj_pizzaslice))
                hsp = -2
        }
    }
    else if is_array(content)
    {
        if is_string(content[0])
            content[0] = asset_get_index(content[0])
        with (instance_create(x, y, content[0]))
        {
            for (i = 1; i < array_length(other.content); i++)
            {
                var structname = variable_struct_get_names(-2.content[i])
                var storedstruct = struct_get(-2.content[i], structname[0])
                if ((string_count("spr", structname[0]) != 0))
                    storedstruct = _spr(storedstruct)
                variable_instance_set(id, structname[0], storedstruct)
            }
        }
    }
    repeat (6)
    {
        with (instance_create(x, y, obj_debris))
        {
            vsp = -5
            sprite_index = other.debrisspr
        }
    }
    ds_list_add(global.saveroom, id)
    scr_soundeffect(104, 106)
}
