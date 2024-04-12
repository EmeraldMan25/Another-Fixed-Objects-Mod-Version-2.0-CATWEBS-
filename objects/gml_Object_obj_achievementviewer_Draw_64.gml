if ((alpha > 0))
{
    var text = concat(texttitle, "\n", textdesc)
    draw_set_font(textfont)
    draw_set_halign(fa_center)
    draw_set_valign(fa_bottom)
    tdp_draw_text_color((obj_screensizer.actual_width / 2), (obj_screensizer.actual_height - 16), text, 16777215, 16777215, 16777215, 16777215, alpha)
    tdp_text_commit(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height)
}
