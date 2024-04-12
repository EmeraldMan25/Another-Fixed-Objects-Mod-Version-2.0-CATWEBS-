function doisebg_start() //gml_Script_doisebg_start
{
    if ((event_type == 8) && (event_number == 0) && instance_exists(obj_player1))
    {
        shader_set(global.Pal_Shader)
        if ((!obj_player1.ispeppino) || global.swapmode)
            pal_swap_set(spr_noiseboss_palette, 1, false)
        else
            pal_swap_set(spr_noiseboss_palette, 2, false)
    }
}

function doisebg_end() //gml_Script_doisebg_end
{
    if ((event_type == 8) && (event_number == 0) && instance_exists(obj_player1))
        shader_reset()
}

function doisebg_set_layer(argument0) //gml_Script_doisebg_set_layer
{
    var lay = layer_get_id(argument0)
    layer_script_begin(lay, gml_Script_doisebg_start)
    layer_script_end(lay, gml_Script_doisebg_end)
}

