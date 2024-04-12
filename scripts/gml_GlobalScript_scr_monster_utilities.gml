function scr_monster_deactivate(argument0) //gml_Script_scr_monster_deactivate
{
    if ((argument0 == undefined))
        argument0 = true
    with (obj_monster)
    {
        x = xstart
        y = ystart
        xscale = 1
        yscale = 1
        if ((grav < 0))
            grav *= -1
        state = (217 << 0)
        event_perform(ev_other, ev_room_start)
    }
    with (obj_objecticontracker)
    {
        if ((sprite_index == spr_monsteralert))
            instance_destroy()
    }
    with (obj_monstergate)
    {
        active = false
        instance_activate_object(solidID)
        y = ystart
    }
    with (obj_pineapplemonsterzone)
        shot = false
    with (obj_camerapatrol)
    {
        alarm[5] = -1
        patrolfound = false
    }
    with (obj_patroller)
    {
        alarm[5] = -1
        patrolfound = false
    }
    with (obj_baddiespawner)
        instance_destroy(baddieid, false)
    if instance_exists(obj_ghostcollectibles)
    {
        instance_destroy(obj_patroller)
        instance_destroy(obj_camerapatrol)
    }
    fmod_event_instance_stop(global.snd_alarm, true)
    if argument0
        scr_monster_stop_music()
}

function scr_monster_stop_music() //gml_Script_scr_monster_stop_music
{
    with (obj_music)
    {
        if fmod_event_instance_is_playing(kidspartychaseID)
        {
            fmod_event_instance_stop(kidspartychaseID, false)
            if ((music != noone))
            {
                fmod_event_instance_set_paused(music.event, savedmusicpause)
                fmod_event_instance_set_paused(music.event_secret, savedsecretpause)
            }
            fmod_event_instance_set_paused(pillarmusicID, savedpillarpause)
            fmod_event_instance_set_paused(panicmusicID, savedpanicpause)
        }
    }
}

function scr_monster_activate() //gml_Script_scr_monster_activate
{
    if (!instance_exists(obj_ghostcollectibles))
        notification_push((30 << 0), [room, object_index])
    with (obj_monster)
    {
        if ((state == (217 << 0)))
        {
            state = (218 << 0)
            with (instance_create(x, y, obj_objecticontracker))
            {
                objectID = other.id
                sprite_index = spr_monsteralert
                image_speed = 0.18
            }
        }
    }
    with (obj_monstergate)
    {
        if (!active)
        {
            active = true
            instance_deactivate_object(solidID)
            image_speed = 0.35
        }
    }
    instance_create_unique(0, 0, obj_kidspartybg)
    with (obj_music)
    {
        if ((!global.panic) && (!instance_exists(obj_ghostcollectibles)) && (!fmod_event_instance_is_playing(kidspartychaseID)))
        {
            fmod_event_instance_play(kidspartychaseID)
            if ((music != noone))
            {
                savedmusicpause = fmod_event_instance_get_paused(music.event)
                savedsecretpause = fmod_event_instance_get_paused(music.event_secret)
                fmod_event_instance_set_paused(music.event, true)
                fmod_event_instance_set_paused(music.event_secret, true)
            }
            savedpillarpause = fmod_event_instance_get_paused(pillarmusicID)
            savedpanicpause = fmod_event_instance_get_paused(panicmusicID)
            fmod_event_instance_set_paused(pillarmusicID, true)
            fmod_event_instance_set_paused(panicmusicID, true)
        }
    }
}

function get_triangle_points(argument0, argument1, argument2, argument3, argument4) //gml_Script_get_triangle_points
{
    var x2 = (argument0 + lengthdir_x(argument3, (argument2 - argument4)))
    var y2 = (argument1 + lengthdir_y(argument3, (argument2 - argument4)))
    var x3 = (argument0 + lengthdir_x(argument3, (argument2 + argument4)))
    var y3 = (argument1 + lengthdir_y(argument3, (argument2 + argument4)))
    return [x2, y2, x3, y3];
}

function scr_monster_detect(argument0, argument1, argument2) //gml_Script_scr_monster_detect
{
    var _dir = ((image_xscale > 0) ? (argument2.x > x) : (argument2.x < x))
    if (_dir && (argument2.x < (x + argument0)) && (argument2.x > (x - argument0)) && (argument2.y < (y + argument1)) && (argument2.y > (y - argument1)))
    {
        var detect = false
        if ((argument2.y > (y - 200)))
        {
            with (argument2)
            {
                if ((state != (100 << 0)) || ((!(scr_solid(x, (y - 24)))) && (!(place_meeting(x, (y - 24), obj_platform)))))
                    detect = true
            }
        }
        if detect
            return true;
    }
    return false;
}

function scr_puppet_detect() //gml_Script_scr_puppet_detect
{
    with (obj_player)
    {
        if (((object_index != obj_player2) || global.coop) && (!(place_meeting(x, y, obj_puppetsafezone))))
            return id;
    }
    return -4;
}

function scr_puppet_appear(argument0) //gml_Script_scr_puppet_appear
{
    var _xdir = 96
    var i = 0
    while collision_line(argument0.x, argument0.y, (argument0.x + (_xdir * argument0.xscale)), argument0.y, obj_solid, false, true)
    {
        _xdir--
        i++
        if ((i > room_width))
        {
            x = argument0.x
            break
        }
    }
    x = (argument0.x + (abs(_xdir) * argument0.xscale))
    y = argument0.y
    state = (220 << 0)
    substate = (135 << 0)
    playerid = argument0
    while place_meeting(x, y, obj_solid)
    {
        x += ((argument0.x > x) ? 1 : -1)
        i++
        if ((i > room_width))
        {
            x = argument0.x
            break
        }
    }
    var _col = collision_line(x, y, x, (y - room_height), obj_solid, true, false)
    if ((_col != -4))
    {
        while (!(place_meeting(x, (y - 1), obj_solid)))
            y--
    }
}

function scr_monsterinvestigate(argument0, argument1, argument2) //gml_Script_scr_monsterinvestigate
{
    targetplayer = instance_nearest(x, y, obj_player)
    image_speed = 0.35
    switch investigatestate
    {
        case 0:
        case 1:
            sprite_index = argument1
            hsp = (image_xscale * argument0)
            if (place_meeting((x + sign(hsp)), y, obj_monstersolid) && ((!(place_meeting((x + sign(hsp)), y, obj_monsterslope))) || place_meeting((x + sign(hsp)), (y - 4), obj_solid)))
            {
                investigatestate++
                image_xscale *= -1
            }
            if ((investigatestate == 1))
            {
                if (((image_xscale > 0) && (x > (room_width / 2))) || ((image_xscale < 0) && (x < (room_width / 2))))
                {
                    investigatestate = 2
                    waitbuffer = 100
                }
            }
            break
        case 2:
            sprite_index = argument2
            hsp = 0
            if ((waitbuffer > 0))
                waitbuffer--
            else
            {
                state = (219 << 0)
                image_xscale *= -1
                instance_create(x, y, obj_patroller)
            }
            break
    }

    if scr_monster_detect(300, room_height, targetplayer)
        state = (220 << 0)
}

function scr_monster_detect_audio() //gml_Script_scr_monster_detect_audio
{
    if scr_monster_audio_check()
    {
        if (!(point_in_camera(x, y, view_camera[0])))
        {
            state = (221 << 0)
            investigatestate = 0
        }
        else
        {
            targetplayer = instance_nearest(x, y, obj_player)
            if ((object_index == obj_blobmonster))
            {
                state = (135 << 0)
                gravdir *= -1
                chase = false
            }
            else
                state = (220 << 0)
        }
    }
}

function scr_monster_audio_check() //gml_Script_scr_monster_audio_check
{
}

