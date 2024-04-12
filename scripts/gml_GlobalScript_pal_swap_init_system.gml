function pal_swap_init_system() //gml_Script_pal_swap_init_system
{
}

function pal_swap_init_system_fix() //gml_Script_pal_swap_init_system_fix
{
    global.Pal_Shader = argument[0]
    global.Pal_Texel_Size = shader_get_uniform(argument[0], "texel_size")
    global.Pal_UVs = shader_get_uniform(argument[0], "palette_UVs")
    global.Pal_Index = shader_get_uniform(argument[0], "palette_index")
    global.Pal_Texture = shader_get_sampler_index(argument[0], "palette_texture")
    if ((argument_count > 1) && argument[1])
        global.Pal_Map = ds_map_create()
    global.Pattern_Texture_Indexed = -4
    global.Base_Pattern_Color = [1, 2]
    global.Pattern_Texture = shader_get_sampler_index(argument[0], "pattern_texture")
    global.Pattern_Enable = shader_get_uniform(argument[0], "pattern_enabled")
    global.Pattern_Tex_Data = shader_get_uniform(argument[0], "pattern_tex_data")
    global.Pattern_UVs = shader_get_uniform(argument[0], "pattern_UVs")
    global.Pattern_Spr_UVs = shader_get_uniform(argument[0], "sprite_UVs")
    global.Pattern_Spr_Tex_Data = shader_get_uniform(argument[0], "sprite_tex_data")
    global.Pattern_Spr_Scale = shader_get_uniform(argument[0], "sprite_scale")
    global.Pattern_Color_Array = shader_get_uniform(argument[0], "color_array")
    global.Pattern_Solid_Color = shader_get_uniform(argument[0], "pattern_solid_color")
    global.N_Pal_Texture = shader_get_sampler_index(shd_noise_afterimage, "palette_texture")
    global.N_Texel_Size = shader_get_uniform(shd_noise_afterimage, "texel_size")
    global.N_Pal_UVs = shader_get_uniform(shd_noise_afterimage, "palette_UVs")
    global.N_Pal_Index = shader_get_uniform(shd_noise_afterimage, "palette_index")
    global.N_Pal_Y = shader_get_uniform(shd_noise_afterimage, "palette_y")
    global.N_Pattern_Tex = shader_get_sampler_index(shd_noise_afterimage, "pattern_texture")
    global.N_Pattern_Enabled = shader_get_uniform(shd_noise_afterimage, "pattern_enabled")
    global.N_Pattern_UVs = shader_get_uniform(shd_noise_afterimage, "pattern_UVs")
}

