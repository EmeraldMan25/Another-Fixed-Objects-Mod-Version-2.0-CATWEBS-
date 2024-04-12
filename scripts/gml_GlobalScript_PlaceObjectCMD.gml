var _temp_local_var_2, _temp_local_var_3;
function PlaceObject(argument0) constructor //gml_Script_PlaceObject
{
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script_Command)
    var _temp_local_var_3 = Command()
    static execute = function() //gml_Script_anon_PlaceObject_gml_GlobalScript_PlaceObjectCMD_108_PlaceObject_gml_GlobalScript_PlaceObjectCMD
    {
        placed = true
        instance_activate_object(inst)
        inst.xscale = 1.5
        inst.yscale = 1.5
    }

    static undo = function() //gml_Script_anon_PlaceObject_gml_GlobalScript_PlaceObjectCMD_244_PlaceObject_gml_GlobalScript_PlaceObjectCMD
    {
        placed = false
        instance_deactivate_object(inst)
    }

    static destroy = function() //gml_Script_anon_PlaceObject_gml_GlobalScript_PlaceObjectCMD_339_PlaceObject_gml_GlobalScript_PlaceObjectCMD
    {
        if (!placed)
        {
            instance_destroy(inst)
            with (global.current_level.current_room)
            {
                var i = 0
                while ((i < array_length(instances)))
                {
                    if ((instances[i] == other.inst))
                    {
                        array_delete(instances, i, 1)
                        break
                    }
                    else
                        i++
                }
            }
        }
    }

    inst = argument0
    placed = false
}

