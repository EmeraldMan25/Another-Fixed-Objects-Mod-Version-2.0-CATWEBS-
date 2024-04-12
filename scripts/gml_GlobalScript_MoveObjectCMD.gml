var _temp_local_var_2, _temp_local_var_3;
function MoveObjectCMD(argument0, argument1, argument2, argument3, argument4) constructor //gml_Script_MoveObjectCMD
{
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script_Command)
    var _temp_local_var_3 = Command()
    static execute = function() //gml_Script_anon_MoveObjectCMD_gml_GlobalScript_MoveObjectCMD_166_MoveObjectCMD_gml_GlobalScript_MoveObjectCMD
    {
        with (inst)
        {
            x = other.x
            y = other.y
        }
    }

    static undo = function() //gml_Script_anon_MoveObjectCMD_gml_GlobalScript_MoveObjectCMD_258_MoveObjectCMD_gml_GlobalScript_MoveObjectCMD
    {
        with (inst)
        {
            x = other.oldx
            y = other.oldy
        }
    }

    inst = argument0
    x = argument1
    y = argument2
    oldx = argument3
    oldy = argument4
}

