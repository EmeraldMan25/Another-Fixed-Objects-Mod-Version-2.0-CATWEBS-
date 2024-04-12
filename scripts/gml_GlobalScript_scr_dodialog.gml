function do_dialog(argument0) //gml_Script_do_dialog
{
    with (instance_create(x, y, obj_dialogcontroller))
    {
        npcID = other.id
        dialog = argument0
        dialogsprite = dialog[0][1]
        currenttext = scr_calculate_text(dialog[0][0])
        dialogheight = scr_calculate_height(currenttext)
    }
    with (obj_player)
    {
        if ((state == (17 << 0)))
        {
            visible = true
            with (possessID)
            {
                state = (138 << 0)
                stunned = 50
            }
        }
        sprite_index = spr_idle
        image_speed = 0.35
        state = (146 << 0)
        hsp = 0
        vsp = 0
        movespeed = 0
    }
}

function npc_do_dialog() //gml_Script_npc_do_dialog
{
    do_dialog(dialog)
}

function vigilante_add_battle() //gml_Script_vigilante_add_battle
{
    if ((global.vigilantecutscene1 == -4) || (!global.vigilantecutscene1))
    {
        global.vigilantecutscene1 = true
        quick_ini_write_real(get_savefile_ini(), "cutscene", "vigilante1", true)
    }
}

function do_dialog_cutscene(argument0, argument1, argument2) //gml_Script_do_dialog_cutscene
{
    if ((argument1 == undefined))
        argument1 = 0
    if ((argument2 == undefined))
        argument2 = 0
    with (instance_create(argument1, argument2, obj_cutscene_handler))
    {
        scene_info = argument0
        for (var i = 0; i < array_length(scene_info); i++)
            scene_info[i][0] = method(id, scene_info[i][0])
    }
}

