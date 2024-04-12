function scr_fmod_soundeffect(argument0, argument1, argument2) //gml_Script_scr_fmod_soundeffect
{
    fmod_event_instance_set_3d_attributes(argument0, argument1, argument2)
    fmod_event_instance_play(argument0)
}

