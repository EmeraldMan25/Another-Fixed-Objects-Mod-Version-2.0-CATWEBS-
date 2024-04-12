function scr_destroy_destructibles(argument0, argument1) //gml_Script_scr_destroy_destructibles
{
    if (!(place_meeting((x + argument0), (y + argument1), obj_destructibles)))
        return;
    var _num = instance_place_list((x + argument0), (y + argument1), obj_destructibles, global.instancelist, false)
    var _destroy = false
    if ((_num > 0))
    {
        for (var i = 0; i < ds_list_size(global.instancelist); i++)
        {
            var inst = ds_list_find_value(global.instancelist, i)
            if ((inst.object_index != obj_hungrypillar) || (object_index != obj_swapplayergrabbable))
                instance_destroy(inst)
            else
                _destroy = true
        }
        ds_list_clear(global.instancelist)
    }
    if _destroy
        instance_destroy()
}

