if obj_player1.ispeppino
    draw_self()
else
{
    shader_set(global.Pal_Shader)
    pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
    pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false)
    draw_self()
    pattern_reset()
    shader_reset()
}
