function pattern_enable(argument0) //gml_Script_pattern_enable
{
    shader_set_uniform_i(global.Pattern_Enable, argument0)
    shader_set_uniform_i(global.N_Pattern_Enabled, argument0)
}

