if active
{
    var w = 0
    var h = 0
    var pad = 16
    var yy = 0
    for (var i = 0; i < array_length(modSettings); i++)
    {
        var txt = modSettings[i][1]
        if ((string_width(txt) > w))
            w = string_width(txt)
        h += string_height(txt)
    }
    w += pad
    h += pad
    yy = ((global.screenheight / 2) + (h / 2))
    draw_sprite(bg_pinball2, 0, 0, 0)
    yy -= (pad / 2)
    draw_set_valign(fa_bottom)
    draw_set_halign(fa_center)
    for (i = 0; i < array_length(modSettings); i++)
    {
        var c = ((selected == i) ? c_white : c_gray)
        txt = ((modSettings[i][1] + ": ") + string(modSettings[i][0]))
        draw_text_color(480, yy, txt, c, c, c, c, 1)
        yy -= string_height(txt)
    }
}
