/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_preloadCustomLevel

System.Exception: Unable to find the var name for anonymous code object gml_Script_preloadCustomLevel
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 647
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_get_roomData

System.Exception: Unable to find the var name for anonymous code object gml_Script_get_roomData
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 647
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_prepareCustomLevel

System.Exception: Unable to find the var name for anonymous code object gml_Script_prepareCustomLevel
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 647
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_levelMemory_reset

System.Exception: Unable to find the var name for anonymous code object gml_Script_levelMemory_reset
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 647
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_instanceManager_reset

System.Exception: Unable to find the var name for anonymous code object gml_Script_instanceManager_reset
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 647
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_data_compatibility

System.Exception: Unable to find the var name for anonymous code object gml_Script_data_compatibility
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 647
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_SplitString

System.Exception: Unable to find the var name for anonymous code object gml_Script_SplitString
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 647
*/
if fadein
{
    fadealpha = Approach(fadealpha, 1, 0.03)
    if ((fadealpha >= 1))
    {
        if (!instance_exists(obj_player1))
            instance_activate_object(obj_player1)
        else
        {
            fadein = 0
            pos_player = 0
            obj_player1.targetRoom = obj_player1.backtohubroom
            obj_player2.targetRoom = obj_player1.backtohubroom
            if (!is_string(obj_player1.backtohubroom))
                room_goto(obj_player1.backtohubroom)
            else
            {
                if ((global.hubLevel != ""))
                    gml_Script_preloadCustomLevel(global.hubLevel)
                gml_Script_prepareCustomLevel(gml_Script_get_roomData(obj_player1.backtohubroom), obj_player1.backtohubroom)
            }
        }
    }
}
else
{
    if (!pos_player)
    {
        if (!instance_exists(obj_player1))
            instance_activate_object(obj_player1)
        else
        {
            pos_player = 1
            obj_player1.x = obj_player1.backtohubstartx
            obj_player1.y = (obj_player1.backtohubstarty - (obj_screensizer.actual_height * 2))
            obj_player1.state = (290 << 0)
            obj_player1.sprite_index = spr_player_slipbanan1
            obj_player1.image_index = 10
        }
    }
    fadealpha = Approach(fadealpha, 0, 0.03)
    if ((fadealpha <= 0))
        instance_destroy()
}
