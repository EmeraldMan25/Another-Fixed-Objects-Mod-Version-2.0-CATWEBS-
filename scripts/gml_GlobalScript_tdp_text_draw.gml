function tdp_draw_text(argument0, argument1, argument2) //gml_Script_tdp_draw_text
{
    if (!global.tdp_text_enabled)
        draw_text(argument0, argument1, argument2)
    else
    {
        var c = draw_get_color()
        var a = draw_get_alpha()
        tdp_text_action_text(argument0, argument1, argument2, c, c, c, c, a)
    }
}

function tdp_draw_text_color(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //gml_Script_tdp_draw_text_color
{
    if (!global.tdp_text_enabled)
        draw_text_color(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7)
    else
        tdp_text_action_text(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7)
}

function tdp_draw_set_halign(argument0) //gml_Script_tdp_draw_set_halign
{
    draw_set_halign(argument0)
    if global.tdp_text_enabled
        tdp_text_action_halign(argument0)
}

function tdp_draw_set_valign(argument0) //gml_Script_tdp_draw_set_valign
{
    draw_set_valign(argument0)
    if global.tdp_text_enabled
        tdp_text_action_valign(argument0)
}

function tdp_draw_set_font(argument0) //gml_Script_tdp_draw_set_font
{
    draw_set_font(argument0)
    if global.tdp_text_enabled
        tdp_text_action_font(argument0)
}

