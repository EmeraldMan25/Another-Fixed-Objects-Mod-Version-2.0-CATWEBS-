var _temp_local_var_2, _temp_local_var_3;
function ResizeCMD(argument0, argument1, argument2, argument3, argument4) constructor //gml_Script_ResizeCMD
{
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script_Command)
    var _temp_local_var_3 = Command()
    static execute = function() //gml_Script_anon_ResizeCMD_gml_GlobalScript_ResizeCMD_222_ResizeCMD_gml_GlobalScript_ResizeCMD
    {
        with (inst)
        {
            image_xscale = other.xscale
            image_yscale = other.yscale
        }
    }

    static undo = function() //gml_Script_anon_ResizeCMD_gml_GlobalScript_ResizeCMD_346_ResizeCMD_gml_GlobalScript_ResizeCMD
    {
        with (inst)
        {
            image_xscale = other.oldxscale
            image_yscale = other.oldyscale
        }
    }

    inst = argument0
    xscale = argument1
    yscale = argument2
    oldxscale = argument3
    oldyscale = argument4
}

