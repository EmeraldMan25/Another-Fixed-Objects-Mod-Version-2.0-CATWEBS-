var _temp_local_var_2, _temp_local_var_3;
function DeleteObject(argument0) constructor //gml_Script_DeleteObject
{
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script_Command)
    var _temp_local_var_3 = Command()
    static execute = function() //gml_Script_anon_DeleteObject_gml_GlobalScript_DeleteObject_110_DeleteObject_gml_GlobalScript_DeleteObject
    {
        deleted = true
        instance_deactivate_object(inst)
    }

    static undo = function() //gml_Script_anon_DeleteObject_gml_GlobalScript_DeleteObject_202_DeleteObject_gml_GlobalScript_DeleteObject
    {
        deleted = false
        instance_activate_object(inst)
    }

    static destroy = function() //gml_Script_anon_DeleteObject_gml_GlobalScript_DeleteObject_296_DeleteObject_gml_GlobalScript_DeleteObject
    {
        if deleted
            instance_destroy(inst)
    }

    inst = argument0
    deleted = false
}

