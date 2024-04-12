function tdp_text_action_halign(argument0) //gml_Script_tdp_text_action_halign
{
    var b = 
    {
        type: (0 << 0),
        value: argument0
    }

    ds_queue_enqueue(global.tdp_text_queue, b)
}

function tdp_text_action_valign(argument0) //gml_Script_tdp_text_action_valign
{
    var b = 
    {
        type: (1 << 0),
        value: argument0
    }

    ds_queue_enqueue(global.tdp_text_queue, b)
}

function tdp_text_action_font(argument0) //gml_Script_tdp_text_action_font
{
    var b = 
    {
        type: (3 << 0),
        value: argument0
    }

    ds_queue_enqueue(global.tdp_text_queue, b)
}

function tdp_text_action_text(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //gml_Script_tdp_text_action_text
{
    if ((argument3 == undefined))
        argument3 = 16777215
    if ((argument4 == undefined))
        argument4 = 16777215
    if ((argument5 == undefined))
        argument5 = 16777215
    if ((argument6 == undefined))
        argument6 = 16777215
    if ((argument7 == undefined))
        argument7 = 1
    var b = 
    {
        type: (2 << 0),
        x: argument0,
        y: argument1,
        text: argument2,
        c1: argument3,
        c2: argument4,
        c3: argument5,
        c4: argument6,
        image_alpha: argument7
    }

    ds_queue_enqueue(global.tdp_text_queue, b)
}

