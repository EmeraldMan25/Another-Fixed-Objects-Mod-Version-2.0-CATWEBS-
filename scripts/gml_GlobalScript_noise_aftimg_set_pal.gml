function noise_aftimg_set_pal(argument0, argument1, argument2) //gml_Script_noise_aftimg_set_pal
{
    if ((argument2 == undefined))
        argument2 = 5
    var tex = sprite_get_texture(argument0, 0)
    var UVs = sprite_get_uvs(argument0, 0)
    texture_set_stage(global.N_Pal_Texture, tex)
    texture_set_interpolation_ext(global.N_Pal_Texture, 0)
    var texel_x = texture_get_texel_width(tex)
    var texel_y = texture_get_texel_height(tex)
    var texel_hx = (texel_x * 0.5)
    var texel_hy = (texel_y * 0.5)
    shader_set_uniform_f(global.N_Texel_Size, texel_x, texel_y)
    shader_set_uniform_f(global.N_Pal_UVs, (UVs[0] + texel_hx), (UVs[1] + texel_hy), (UVs[2] + texel_hx), (UVs[3] + texel_hy))
    shader_set_uniform_f(global.N_Pal_Index, argument1)
    shader_set_uniform_f(global.N_Pal_Y, argument2)
}

