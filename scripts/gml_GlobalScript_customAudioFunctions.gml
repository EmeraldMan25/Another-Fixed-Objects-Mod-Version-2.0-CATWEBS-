/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_SplitString

System.Exception: Unable to find the var name for anonymous code object gml_Script_SplitString
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 647
*/
function new_audioPlayer(argument0) //gml_Script_new_audioPlayer
{
    var fst = 0
    var noise = 0
    if audioName_isFmod(argument0)
    {
        if ((string_pos(".", argument0) != 0))
        {
            var sep = gml_Script_SplitString(argument0, ".")
            argument0 = sep[0]
            if ((string_count("N", sep[1]) == 1))
            {
                noise = 1
                var pos = string_pos("N", sep[1])
                sep[1] = string_delete(sep[1], pos, 1)
            }
            if ((sep[1] != ""))
                fst = real(sep[1])
        }
    }
    var aStruct = struct_new([["audioName", argument0], ["audioAsset", _audio(argument0)], ["audio_isPlaying", 0], ["audio_doesLoop", 0], ["audioPlayback", -1], ["gain", 1], ["gain_target", 1], ["gain_speed", 1], ["gain_transition", 0], ["emitter", audio_emitter_create()], ["isFmod", 0], ["fmodState", fst], ["fmodNoise", noise], ["fmodPlayback", -4], ["fmodTime", 0]])
    array_push(global.audioPlayers, aStruct)
    return aStruct;
}

function audioAsset_isLoopNormal(argument0) //gml_Script_audioAsset_isLoopNormal
{
    var audioAss = argument0
    if ((audioAss.loopPoints[0] == 0) && (audioAss.loopPoints[1] == -1))
        return 1;
    return 0;
}

function audioName_isFmod(argument0) //gml_Script_audioName_isFmod
{
    return (string_pos("event:", argument0) != 0);
}

function audioPlayer_play(argument0, argument1, argument2) //gml_Script_audioPlayer_play
{
    var audioStruct = argument0
    if audioName_isFmod(argument0)
    {
        audioPlayer_playFmod(argument0, argument1)
        return;
    }
    var audioAss = audioStruct.audioAsset
    var normalLoop = audioAsset_isLoopNormal(audioAss)
    if is_undefined(argument2)
        argument2 = 1
    audio_emitter_falloff(audioStruct.emitter, 10, 300, 1)
    var gain = ((global.option_master_volume * global.option_music_volume) * argument2)
    struct_set(audioStruct, [["audioPlayback", audio_play_sound_on(audioStruct.emitter, _sound(audioStruct.audioName), (normalLoop && argument1), 1, gain)], ["audio_doesLoop", argument1], ["audio_isPlaying", 1], ["gain", gain]])
}

function audioPlayer_playFmod(argument0, argument1) //gml_Script_audioPlayer_playFmod
{
    var aStruct = argument0
    struct_set(aStruct, [["isFmod", 1], ["fmodPlayback", fmod_event_create_instance(aStruct.audioName)], ["audio_isPlaying", 1]])
    fmod_event_instance_set_parameter(aStruct.fmodPlayback, "state", aStruct.fmodState, 0)
    fmod_event_instance_set_parameter(aStruct.fmodPlayback, "hub", aStruct.fmodState, 0)
    fmod_event_instance_set_parameter(aStruct.fmodPlayback, "isnoise", aStruct.fmodNoise, 0)
    fmod_event_instance_play(aStruct.fmodPlayback)
}

function audioPlayer_stop(argument0) //gml_Script_audioPlayer_stop
{
    var audioStruct = argument0
    if ((audioStruct.audioPlayback != -1))
    {
        audio_stop_sound(audioStruct.audioPlayback)
        audioStruct.audioPlayback = -1
    }
    struct_set(audioStruct, [["audio_isPlaying", 0]])
    if ((audioStruct.fmodPlayback != -4))
    {
        fmod_event_instance_stop(audioStruct.fmodPlayback, 1)
        audioStruct.fmodPlayback = -4
    }
}

function audioPlayer_pause(argument0, argument1) //gml_Script_audioPlayer_pause
{
    var audioStruct = argument0
    if ((audioStruct.audioPlayback != -1))
    {
        struct_set(audioStruct, [["audio_isPlaying", (!argument1)]])
        if (!argument1)
            audio_pause_sound(audioStruct.audioPlayback)
        else
            audio_resume_sound(audioStruct.audioPlayback)
    }
    if ((audioStruct.fmodPlayback != -1))
    {
        struct_set(audioStruct, [["audio_isPlaying", (!argument1)]])
        fmod_event_instance_set_paused(audioStruct.audioPlayback, (!argument1))
    }
}

function audioPlayer_destroy(argument0) //gml_Script_audioPlayer_destroy
{
    var audioStruct = argument0
    audioPlayer_stop(argument0)
    for (var i = 0; i < array_length(global.audioPlayers); i++)
    {
        if ((global.audioPlayers[i] == argument0))
            array_delete(global.audioPlayers, i, 1)
    }
}

function audioPlayer_fade(argument0, argument1, argument2) //gml_Script_audioPlayer_fade
{
    var audioStruct = argument0
    if ((audioStruct.audioPlayback != -1))
        struct_set(audioStruct, [["gain_target", argument1], ["gain_speed", ((abs((audioStruct.gain - argument1)) / (argument2 / 1000)) / 60)], ["gain_transition", 1]])
    if ((audioStruct.fmodPlayback != -4))
    {
        if ((argument1 <= 0))
            fmod_event_instance_stop(audioStruct.fmodPlayback, 0)
        else if (!fmod_event_instance_is_playing(audioStruct.fmodPlayback))
        {
            fmod_event_instance_play(audioStruct.fmodPlayback)
            fmod_event_instance_set_timeline_pos(audioStruct.fmodPlayback, audioStruct.fmodTime)
        }
    }
}

function customSong_add(argument0, argument1) //gml_Script_customSong_add
{
    var ap = new_audioPlayer(argument0)
    struct_set(global.songsPlaying, [[argument0, ap]])
    audioPlayer_play(ap, 1, argument1)
}

function customSong_switch(argument0, argument1) //gml_Script_customSong_switch
{
    with (obj_customAudio)
    {
        var sp = global.songsPlaying
        var songName = argument0
        if is_undefined(argument1)
            argument1 = 100
        var songs = variable_struct_get_names(global.songsPlaying)
        if ((array_length(songs) == 0))
            customSong_add(songName)
        else
        {
            if (!(variable_struct_exists(sp, argument0)))
                customSong_add(argument0, 0)
            array_push(songs, argument0)
            for (var i = 0; i < array_length(songs); i++)
            {
                if variable_struct_exists(sp, songName)
                {
                    var vol = 0
                    if ((songs[i] == argument0))
                        vol = 1
                    var as = struct_get(sp, songs[i])
                    audioPlayer_fade(as, vol, argument1)
                    if ((global.levelName == global.hubLevel))
                    {
                        if as.isFmod
                            fmod_event_instance_set_timeline_pos(as.fmodPlayback, carryTime)
                        else
                            audio_sound_set_track_position(as.audioPlayback, (carryTime / 1000))
                    }
                }
            }
        }
    }
}

function customSong_destroy(argument0) //gml_Script_customSong_destroy
{
    var s = struct_get(global.songsPlaying, argument0)
    audioPlayer_destroy(s)
    variable_struct_remove(global.songsPlaying, argument0)
}

function customSong_destroy_all() //gml_Script_customSong_destroy_all
{
    var songs = variable_struct_get_names(global.songsPlaying)
    for (var i = 0; i < array_length(songs); i++)
        customSong_destroy(songs[i])
}

function customSong_fadeout_all() //gml_Script_customSong_fadeout_all
{
    var songs = variable_struct_get_names(global.songsPlaying)
    for (var i = 0; i < array_length(songs); i++)
    {
        var as = struct_get(global.songsPlaying, songs[i])
        audioPlayer_fade(as, 0, 1500)
    }
}

function customSong_handle_pause(argument0) //gml_Script_customSong_handle_pause
{
    var songs = variable_struct_get_names(global.songsPlaying)
    for (var i = 0; i < array_length(songs); i++)
    {
        var s = struct_get(global.songsPlaying, songs[i])
        audioPlayer_pause(s, (!argument0))
    }
}

