function fakepep_set_attack(argument0, argument1, argument2, argument3, argument4) //gml_Script_fakepep_set_attack
{
    if ((argument3 != 0) && (argument4 == 0))
        argument4 = argument3
    attack_list[argument0][argument1] = 
    {
        attack: argument2,
        cooldown: argument3,
        deformed_timer: argument4
    }

}

function fakepep_clamp(argument0, argument1) //gml_Script_fakepep_clamp
{
    if ((argument0 >= array_length(attacklist)))
        argument0 = (array_length(attacklist) - 1)
    if ((argument1 >= array_length(attacklist[argument0])))
        argument1 = (array_length(attacklist[argument0]) - 1)
    return 
    {
        phase: argument0,
        hit: argument1
    };
}

function fakepep_get_attack(argument0, argument1) //gml_Script_fakepep_get_attack
{
    return attack_list[argument0][argument1];
}

function fakepep_start_projectiles(argument0, argument1) //gml_Script_fakepep_start_projectiles
{
    projectile_list[argument0][argument1] = array_create(0)
}

function fakepep_add_projectile(argument0, argument1, argument2) //gml_Script_fakepep_add_projectile
{
    array_push(projectile_list[argument0][argument1], argument2)
}

function fakepep_get_projectile(argument0, argument1, argument2) //gml_Script_fakepep_get_projectile
{
    return projectile_list[argument0][argument1][argument2];
}

function fakepep_add_grabclone(argument0, argument1, argument2, argument3) //gml_Script_fakepep_add_grabclone
{
    fakepep_add_projectile(argument0, argument1, 
    {
        attack: (0 << 0),
        cooldown: argument3,
        direction: argument2
    }
)
}

function fakepep_add_bodyslamclone(argument0, argument1, argument2, argument3) //gml_Script_fakepep_add_bodyslamclone
{
    fakepep_add_projectile(argument0, argument1, 
    {
        attack: (1 << 0),
        cooldown: argument3,
        direction: argument2
    }
)
}

function fakepep_add_machclone(argument0, argument1, argument2, argument3, argument4) //gml_Script_fakepep_add_machclone
{
    fakepep_add_projectile(argument0, argument1, 
    {
        attack: (2 << 0),
        cooldown: argument3,
        direction: argument2,
        bodyslam: argument4
    }
)
}

function fakepep_add_superjumpclones(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) //gml_Script_fakepep_add_superjumpclones
{
    if ((argument7 == undefined))
        argument7 = 100
    if ((argument8 == undefined))
        argument8 = 850
    if ((argument9 == undefined))
        argument9 = 402
    if ((argument2 == -1))
        argument5 = (argument4 - argument5)
    fakepep_add_projectile(argument0, argument1, 
    {
        attack: (3 << 0),
        cooldown: argument6,
        direction: argument2,
        timer: argument3,
        size: argument4,
        emptyspot: argument5,
        x1: argument7,
        x2: argument8,
        y: argument9
    }
)
}

function fakepep_add_flailingclone(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //gml_Script_fakepep_add_flailingclone
{
    if ((argument4 == undefined))
        argument4 = 100
    if ((argument5 == undefined))
        argument5 = 850
    if ((argument6 == undefined))
        argument6 = 402
    fakepep_add_projectile(argument0, argument1, 
    {
        attack: (4 << 0),
        cooldown: argument3,
        direction: argument2,
        x1: argument4,
        x2: argument5,
        y: argument6
    }
)
}

function fakepep_add_tauntclones(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //gml_Script_fakepep_add_tauntclones
{
    if ((argument5 == undefined))
        argument5 = 125
    if ((argument6 == undefined))
        argument6 = 825
    if ((argument7 == undefined))
        argument7 = 402
    fakepep_add_projectile(argument0, argument1, 
    {
        attack: (5 << 0),
        cooldown: argument4,
        vsp1: argument2,
        vsp2: argument3,
        x1: argument5,
        x2: argument6,
        y: argument7
    }
)
}

function scr_fakepep_init_sounds() //gml_Script_scr_fakepep_init_sounds
{
    snd_bodyslam = fmod_event_create_instance("event:/sfx/fakepep/bodyslam")
    snd_mach = fmod_event_create_instance("event:/sfx/fakepep/mach")
    snd_superjump = fmod_event_create_instance("event:/sfx/fakepep/superjump")
    snd_grab = fmod_event_create_instance("event:/sfx/fakepep/grab")
    snd_headoff = fmod_event_create_instance("event:/sfx/fakepep/headoff")
    snd_flailing = fmod_event_create_instance("event:/sfx/fakepep/flailing")
}

function scr_fakepep_destroy_sounds() //gml_Script_scr_fakepep_destroy_sounds
{
    destroy_sounds([snd_bodyslam, snd_mach, snd_superjump, snd_grab, snd_headoff, snd_flailing])
}

function scr_fakepep_update_sounds() //gml_Script_scr_fakepep_update_sounds
{
    fmod_event_instance_set_3d_attributes(snd_grab, x, y)
    if ((state == (108 << 0)) || (state == (92 << 0)))
    {
        if (!fmod_event_instance_is_playing(snd_bodyslam))
            fmod_event_instance_play(snd_bodyslam)
        fmod_event_instance_set_3d_attributes(snd_bodyslam, x, y)
    }
    else
        fmod_event_instance_stop(snd_bodyslam, false)
    if ((state == (104 << 0)))
    {
        if (!fmod_event_instance_is_playing(snd_mach))
            fmod_event_instance_play(snd_mach)
        fmod_event_instance_set_3d_attributes(snd_mach, x, y)
    }
    else
        fmod_event_instance_stop(snd_mach, false)
    if (((state == (99 << 0)) || (state == (97 << 0))) && (sprite_index != spr_fakepeppino_idle))
    {
        if (!fmod_event_instance_is_playing(snd_superjump))
            fmod_event_instance_play(snd_superjump)
        var s = 0
        if ((state == (99 << 0)))
            s = 0
        else
            s = 1
        fmod_event_instance_set_parameter(snd_superjump, "state", s, true)
        fmod_event_instance_set_3d_attributes(snd_superjump, x, y)
    }
    else if (fmod_event_instance_is_playing(snd_superjump) && (fmod_event_instance_get_parameter(snd_superjump, "state") < 1))
        fmod_event_instance_stop(snd_superjump, false)
    if ((sprite_index == spr_fakepeppino_throwhead) && (floor(image_index) >= 6))
    {
        if ((!fmod_event_instance_is_playing(snd_headoff)) && (floor(image_index) < 13))
            fmod_event_instance_play(snd_headoff)
        s = 0
        if ((floor(image_index) >= 13))
            s = 1
        fmod_event_instance_set_parameter(snd_headoff, "state", s, true)
        fmod_event_instance_set_3d_attributes(snd_headoff, x, y)
    }
    else
        fmod_event_instance_stop(snd_headoff, false)
    if ((sprite_index == spr_fakepeppino_flailing))
    {
        if (!fmod_event_instance_is_playing(snd_flailing))
            fmod_event_instance_play(snd_flailing)
        fmod_event_instance_set_3d_attributes(snd_flailing, x, y)
    }
    else
        fmod_event_instance_stop(snd_flailing, false)
}

function scr_fakepepboss_do_projectiles(argument0, argument1) //gml_Script_scr_fakepepboss_do_projectiles
{
    if pizzahead
        return;
    var t = targetplayer
    if ((currentprojectile >= array_length(projectile_list[argument0][argument1])))
        currentprojectile = 0
    var currp = currentprojectile
    var _attack = fakepep_get_projectile(argument0, argument1, currentprojectile)
    currentprojectile += 1
    deformed_cooldown = _attack.cooldown
    switch _attack.attack
    {
        case (0 << 0):
        case (1 << 0):
            with (instance_create(x, y, obj_fakepepclone))
            {
                attack = _attack
                x = (t.x + (attack.direction * irandom_range(50, 120)))
                if place_meeting(x, y, obj_solid)
                    x = t.x
                y = t.y
                if ((t.x != x))
                    image_xscale = sign((t.x - x))
                x = clamp(x, 100, (room_width - 100))
                while (!(place_meeting(x, (y + 1), obj_solid)))
                {
                    y++
                    if place_meeting(x, y, obj_solid)
                    {
                        y--
                        break
                    }
                }
            }
            break
        case (2 << 0):
            var yy = 402
            var xx = x
            if ((_attack.direction == 1))
                xx = 94
            else
                xx = 862
            with (instance_create(xx, yy, obj_fakepepclone))
            {
                attack = _attack
                image_xscale = _attack.direction
            }
            break
        case (3 << 0):
            if (!instance_exists(obj_fakepepspawner))
            {
                with (instance_create(0, 0, obj_fakepepspawner))
                {
                    attack = _attack
                    spawnbuffer = attack.timer
                    spawn = 0
                    xplus = (abs((attack.x2 - attack.x1)) / attack.size)
                }
            }
            else
            {
                currentprojectile = currp
                deformed_cooldown = 0
            }
            break
        case (4 << 0):
            xx = _attack.x1
            if ((_attack.direction == -1))
                xx = _attack.x2
            with (instance_create(xx, _attack.y, obj_fakepepclone))
            {
                attack = _attack
                image_xscale = attack.direction
                if ((other.object_index == obj_fakepepboss) && ((other.deformed_timer - attack.cooldown) <= 0) && (other.phase == 1))
                    throwing = true
                if ((other.phase == 2))
                {
                    if ((other.wastedhits == 4))
                        throwing = true
                    else
                        throwing = false
                }
            }
            break
        case (5 << 0):
            with (instance_create(_attack.x1, _attack.y, obj_fakepepclone))
            {
                attack = _attack
                image_xscale = 1
            }
            with (instance_create(_attack.x2, _attack.y, obj_fakepepclone))
            {
                attack = _attack
                image_xscale = -1
            }
            break
    }

}

function scr_fakepepboss_arenaintro() //gml_Script_scr_fakepepboss_arenaintro
{
    if (!skipintro)
    {
        image_speed = 0.35
        with (obj_player)
        {
            hsp = 0
            movespeed = 0
            flash = false
            x = roomstartx
            state = (146 << 0)
            image_speed = 0.35
            xscale = (-other.image_xscale)
            if ((other.sprite_index == spr_fakepeppino_intro1))
            {
                if ispeppino
                    sprite_index = spr_player_gnomecutscene1
                else
                    sprite_index = spr_playerN_bosscutscene1
            }
            if ((floor(image_index) == (image_number - 1)))
            {
                if ((sprite_index == spr_player_gnomecutscene2))
                    image_index = (image_number - 1)
                else if ((sprite_index == spr_player_gnomecutscene3))
                    sprite_index = spr_player_gnomecutscene4
                else if ((sprite_index == spr_noise_vulnerable1))
                    sprite_index = spr_noise_vulnerable1loop
                else if ((sprite_index == spr_noise_intro1))
                    sprite_index = spr_noise_intro2
                else if ((sprite_index == spr_noise_intro2))
                    image_index = 7
                else if ((sprite_index == spr_playerN_bosscutscene2) || (sprite_index == spr_playerN_bosscutscene3))
                    image_index = (image_number - 1)
            }
        }
        if ((floor(image_index) == (image_number - 1)))
        {
            if ((sprite_index == spr_fakepeppino_intro1) || (sprite_index == spr_fakepeppino_intro2))
                image_index = (image_number - 1)
            else if ((sprite_index == spr_fakepeppino_intro3))
                image_index = (image_number - 4)
        }
        if ((introbuffer > 0))
            introbuffer--
        else if ((sprite_index == spr_fakepeppino_intro1))
        {
            sprite_index = spr_fakepeppino_intro2
            image_index = 0
            introbuffer = 70
            with (obj_player)
            {
                if ispeppino
                {
                    sprite_index = spr_player_gnomecutscene2
                    image_index = 0
                }
                else
                {
                    sprite_index = spr_playerN_bosscutscene2
                    image_index = 0
                }
            }
        }
        else if ((sprite_index == spr_fakepeppino_intro2))
        {
            sprite_index = spr_fakepeppino_intro3
            fmod_event_one_shot("event:/sfx/voice/fakepepscream")
            image_index = 0
            introbuffer = 130
            with (obj_player)
            {
                if ispeppino
                {
                    fmod_event_one_shot("event:/sfx/pep/screamboss")
                    sprite_index = spr_player_gnomecutscene3
                    image_index = 0
                }
                else
                {
                    sprite_index = spr_noise_intro1
                    image_index = 0
                }
            }
        }
        else if ((sprite_index == spr_fakepeppino_intro3))
        {
            sprite_index = spr_fakepeppino_intro4
            image_index = 0
            introbuffer = 0
        }
        else if ((sprite_index == spr_fakepeppino_intro4) && (floor(image_index) == (image_number - 1)))
        {
            state = (134 << 0)
            spotlightID.expand = true
            with (instance_create(x, y, obj_grabmarker))
                ID = other.id
            with (obj_player)
            {
                if ispeppino
                {
                    sprite_index = spr_player_screamtransition
                    image_index = 0
                    image_speed = 0.35
                }
                else
                {
                    sprite_index = spr_noise_intro3
                    image_index = 0
                    image_speed = 0.35
                }
                landAnim = false
                tauntstoredstate = (0 << 0)
                state = (293 << 0)
            }
        }
    }
    else
        scr_boss_genericintro(spr_fakepeppino_idle)
}

function scr_fakepepboss_walk() //gml_Script_scr_fakepepboss_walk
{
    if ((phase == 2) && ((flickertime > 0) || (!grounded)))
    {
        if grounded
            hsp = Approach(hsp, 0, 0.25)
        if (grounded && (vsp > 0) && (flickertime > 2))
        {
            hsp = Approach(hsp, 0, 0.5)
            create_particle(x, y, (12 << 0))
            vsp = -5
            touchedground = true
        }
        cooldown = 0
        sprite_index = spr_fakepeppino_flicker
        return;
    }
    if formed
    {
        image_speed = 0.35
        var ix = sign((targetplayer.x - x))
        hsp = Approach(hsp, (ix * 8), 0.3)
        if ((hsp != 0))
        {
            image_xscale = sign(hsp)
            sprite_index = spr_fakepeppino_walk
        }
        else
            sprite_index = spr_fakepeppino_idle
        if ((cooldown > 0))
            cooldown--
        else if (grounded && (vsp > 0))
        {
            var attack = fakepep_get_attack((phase - 1), wastedhits)
            switch attack.attack
            {
                case (0 << 0):
                    if ((abs((x - targetplayer.x)) <= 330))
                    {
                        fmod_event_instance_play(snd_grab)
                        state = (276 << 0)
                        if ((ix != 0))
                            image_xscale = ix
                        sprite_index = spr_fakepeppino_grabdashstart
                        grabstart = 10
                        image_index = 0
                        hsp = 0
                        attackspeed = 12
                        cooldown = attack.cooldown
                    }
                    break
                case (1 << 0):
                    if ((ix != 0))
                        image_xscale = ix
                    sprite_index = spr_fakepeppino_bodyslamstart
                    image_index = 0
                    state = (92 << 0)
                    cooldown = attack.cooldown
                    break
                case (2 << 0):
                    if ((ix != 0))
                        image_xscale = ix
                    attackspeed = 0
                    state = (104 << 0)
                    machdir = 0
                    machcooldown = 220
                    cooldown = attack.cooldown
                    break
                case (3 << 0):
                    if ((ix != 0))
                        image_xscale = ix
                    attackspeed = 0
                    hsp = 0
                    superjumpdir = 0
                    superjumpbounce = 3
                    cooldown = attack.cooldown
                    state = (99 << 0)
                    sprite_index = spr_fakepeppino_superjumpstart
                    image_index = 0
                    break
                case (4 << 0):
                    if ((ix != 0))
                        image_xscale = ix
                    attackspeed = 0
                    hsp = 0
                    state = (74 << 0)
                    sprite_index = spr_fakepeppino_throwhead
                    image_index = 0
                    cooldown = attack.cooldown
                    break
                case (5 << 0):
                    fmod_event_one_shot_3d("event:/sfx/fakepep/jump", x, y)
                    create_particle(x, y, (4 << 0))
                    state = (84 << 0)
                    taunted = false
                    sprite_index = spr_fakepeppino_jump
                    image_index = 0
                    vsp = -15
                    cooldown = attack.cooldown
                    hsp = 0
                    break
                case (6 << 0):
                    sprite_index = spr_fakepeppino_vulnerable
                    state = (138 << 0)
                    stunned = 5000
                    if ((ix != 0))
                        image_xscale = ix
                    break
            }

        }
    }
    else if ((!formed) && grounded)
    {
        fmod_event_one_shot_3d("event:/sfx/fakepep/deform", x, y)
        state = (275 << 0)
        sprite_index = spr_fakepeppino_deform
        image_index = 0
    }
}

function scr_fakepepboss_deformed() //gml_Script_scr_fakepepboss_deformed
{
    image_speed = 0.35
    hsp = 0
    vsp = 0
    var t = targetplayer
    if ((sprite_index == spr_fakepeppino_deform) && (floor(image_index) == (image_number - 1)))
        image_index = (image_number - 1)
    if ((floor(image_index) < (image_number - 1)) && ((floor(image_index) div 5) == 0))
        create_debris((x + irandom_range(-20, 20)), (y + 43), spr_fakepepdebris)
    if ((deformed_timer > 0))
        deformed_timer--
    if ((deformed_cooldown > 0))
        deformed_cooldown--
    else if ((deformed_timer > 0))
        scr_fakepepboss_do_projectiles((phase - 1), (wastedhits - 1))
    else if ((!instance_exists(obj_fakepepclone)) && (!instance_exists(obj_fakepepspawner)))
    {
        instance_destroy(obj_fakepephead)
        if ((sprite_index != spr_fakepeppino_reform))
        {
            fmod_event_one_shot_3d("event:/sfx/fakepep/reform", x, y)
            x = irandom_range(101, (room_width - 101))
            while (!(place_meeting(x, (y + 1), obj_solid)))
            {
                y++
                if place_meeting(x, y, obj_solid)
                {
                    y--
                    break
                }
            }
            subhp = maxsubhp
            sprite_index = spr_fakepeppino_reform
            image_index = 0
            formed = true
        }
        else if ((floor(image_index) == (image_number - 1)))
        {
            state = (134 << 0)
            sprite_index = spr_fakepeppino_idle
        }
    }
}

function scr_fakepepboss_staggered() //gml_Script_scr_fakepepboss_staggered
{
    hsp = Approach(hsp, 0, 0.25)
    cooldown = 0
    if (!instance_exists(dashcloudid))
    {
        with (instance_create(x, y, obj_dashcloud2))
        {
            image_xscale = (-other.xscale)
            other.dashcloudid = id
        }
    }
    if ((floor(image_index) == (image_number - 1)))
        image_speed = 0
    if ((floor(image_index) == (image_number - 1)) && (hsp == 0))
        state = (134 << 0)
}

function scr_fakepepboss_grabdash() //gml_Script_scr_fakepepboss_grabdash
{
    if ((grabstart > 0))
    {
        hsp += ((-image_xscale) * 1)
        grabstart--
        if ((grabstart <= 0))
        {
            sprite_index = spr_fakepeppino_grabdash
            image_index = 0
        }
    }
    else
    {
        hsp = (image_xscale * attackspeed)
        if ((floor(image_index) == (image_number - 1)))
            state = (134 << 0)
        with (instance_place(x, y, obj_player))
        {
            if ((!hurted) && (state != (277 << 0)) && (state != (91 << 0)) && (state != (146 << 0)) && (state != (262 << 0)))
            {
                other.state = (277 << 0)
                other.playerID = id
                other.sprite_index = spr_fakepeppino_grabattack
                other.image_index = 0
                invtime = 0
                state = (277 << 0)
                sprite_index = spr_hurt
            }
        }
    }
}

function scr_fakepepboss_grabthrow() //gml_Script_scr_fakepepboss_grabthrow
{
    with (playerID)
    {
        x = (other.x + (other.image_xscale * 20))
        y = other.y
    }
    hsp = Approach(hsp, 0, 1)
    if ((floor(image_index) >= 4) && (playerID != noone))
    {
        playerID.invtime = 0
        with (playerID)
        {
            if place_meeting(x, y, obj_solid)
            {
                x = other.x
                y = other.y
            }
        }
        scr_hurtplayer(playerID)
        with (playerID)
        {
            sprite_index = spr_hurt
            xscale = (-other.image_xscale)
        }
        playerID = -4
    }
    if ((floor(image_index) == (image_number - 1)))
    {
        state = (134 << 0)
        cooldown = 150
    }
}

function scr_fakepepboss_jump() //gml_Script_scr_fakepepboss_jump
{
    if ((sprite_index == spr_fakepeppino_bodyslamstart))
    {
        hsp = 0
        vsp = 0
        if ((x != targetplayer.x))
            image_xscale = sign((targetplayer.x - x))
        if ((floor(image_index) == (image_number - 1)))
        {
            sprite_index = spr_fakepeppino_bodyslamjump
            attackspeed = 8
            vsp = -18
            create_particle(x, y, (4 << 0))
        }
    }
    else
    {
        if ((sprite_index == spr_fakepeppino_bodyslamjump) && (floor(image_index) == (image_number - 1)))
            image_index = (image_number - 3)
        hsp = (image_xscale * attackspeed)
        if ((vsp > 0))
        {
            state = (108 << 0)
            sprite_index = spr_fakepeppino_bodyslamfall
            image_index = 0
            bodyslamlandbuffer = 0
        }
    }
}

function scr_fakepepboss_freefall() //gml_Script_scr_fakepepboss_freefall
{
    if ((sprite_index == spr_fakepeppino_bodyslamfall) && (floor(image_index) == (image_number - 1)))
        image_index = (image_number - 4)
    if ((object_index == obj_fakepepclone) && bodyslam && (vsp > 2))
        vsp += 0.5
    if ((sprite_index != spr_fakepeppino_bodyslamland) && (!bodyslam))
    {
        var t = sign((targetplayer.x - x))
        hsp = Approach(hsp, (t * 4), 0.5)
        if ((hsp != 0))
            image_xscale = sign(hsp)
    }
    if (grounded && (vsp > 0) && (sprite_index != spr_fakepeppino_bodyslamland))
    {
        fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
        create_particle(x, y, (12 << 0))
        sprite_index = spr_fakepeppino_bodyslamland
        image_index = 0
        bodyslamlandbuffer = 20
        hsp = 0
    }
    if ((bodyslamlandbuffer > 0))
        bodyslamlandbuffer--
    if ((sprite_index == spr_fakepeppino_bodyslamland) && (bodyslamlandbuffer <= 0))
        state = (134 << 0)
}

function scr_fakepepboss_mach2() //gml_Script_scr_fakepepboss_mach2
{
    if ((machcooldown > 0))
    {
        machcooldown--
        if ((attackspeed < 24))
            attackspeed += 0.25
    }
    else if ((machdir == 0))
    {
        if ((attackspeed > 0))
            attackspeed -= 0.25
        else
            state = (134 << 0)
    }
    else if ((attackspeed < 8))
        attackspeed = 8
    image_speed = (abs(attackspeed) / 10)
    if ((image_speed > 0.5))
        image_speed = 0.5
    else if ((image_speed < 0.2))
        image_speed = 0.2
    switch machdir
    {
        case 0:
            sprite_index = spr_fakepeppino_mach
            hsp = (image_xscale * attackspeed)
            if ((attackspeed > 3) && place_meeting((x + sign(hsp)), y, obj_solid))
            {
                machdir = 1
                sprite_index = spr_fakepeppino_machwall
            }
            break
        case 1:
            sprite_index = spr_fakepeppino_machwall
            if ((attackspeed < 6))
                attackspeed = 6
            hsp = 0
            vsp = (-attackspeed)
            if place_meeting(x, (y - 1), obj_solid)
            {
                machdir = 2
                image_xscale *= -1
                sprite_index = spr_fakepeppino_machceiling
            }
            break
        case 2:
            sprite_index = spr_fakepeppino_machceiling
            hsp = (image_xscale * attackspeed)
            vsp = 0
            if (!bodyslam)
            {
                if place_meeting((x + sign(hsp)), y, obj_solid)
                {
                    sprite_index = spr_fakepeppino_machwalldown
                    machdir = 3
                }
            }
            else if (((image_xscale > 0) && (x >= targetplayer.x)) || ((image_xscale < 0) && (x <= targetplayer.x)))
            {
                state = (108 << 0)
                sprite_index = spr_fakepeppino_bodyslamfall
                bodyslamlandbuffer = 0
                hsp = 0
            }
            break
        case 3:
            sprite_index = spr_fakepeppino_machwalldown
            if ((attackspeed < 6))
                attackspeed = 6
            hsp = 0
            vsp = attackspeed
            if place_meeting(x, (y + 1), obj_solid)
            {
                sprite_index = spr_fakepeppino_mach
                machdir = 0
                image_xscale *= -1
            }
            break
    }

}

function scr_fakepepboss_Sjumpprep() //gml_Script_scr_fakepepboss_Sjumpprep
{
    hsp = 0
    vsp = 0
    if ((floor(image_index) == (image_number - 1)))
    {
        state = (97 << 0)
        var h = 11
        var v = 22
        steppybuffer = 0
        piledrivereffect = 0
        sjumpbuffer = 0
        switch superjumpdir
        {
            case 0:
                hithsp = (image_xscale * h)
                hitvsp = (-v)
                break
            case 1:
                hithsp = (image_xscale * h)
                hitvsp = v
                break
        }

        if ((hitvsp < 0))
            sprite_index = spr_fakepeppino_superjump
        else if ((hitvsp > 0))
            sprite_index = spr_fakepeppino_superjumpdown
    }
}

function scr_fakepepboss_Sjump() //gml_Script_scr_fakepepboss_Sjump
{
    hsp = hithsp
    vsp = hitvsp
    var yy = 75
    if ((hitvsp > 0))
        yy = 180
    if ((steppybuffer > 0))
        steppybuffer--
    else
    {
        create_particle((x + irandom_range(-25, 25)), (y + irandom_range(-10, 35)), (1 << 0), 0)
        steppybuffer = 8
    }
    if ((sjumpbuffer > 0))
        sjumpbuffer--
    else
    {
        sjumpbuffer = 8
        with (create_red_afterimage(x, y, sprite_index, image_index, image_xscale))
            alpha = 1
    }
    if ((piledrivereffect > 0))
        piledrivereffect--
    else
    {
        with (instance_create(x, y, obj_parryeffect))
        {
            sprite_index = spr_piledrivereffect
            if ((other.hitvsp < 0))
                image_yscale = -1
        }
        piledrivereffect = 15
    }
    if place_meeting((x + sign(hsp)), y, obj_solid)
    {
        hithsp *= -1
        image_xscale *= -1
    }
    else if place_meeting(x, (y + (sign(vsp) * yy)), obj_solid)
    {
        while (!(place_meeting(x, (y + sign(vsp)), obj_solid)))
            y += sign(vsp)
        while place_meeting(x, y, obj_solid)
            y -= sign(vsp)
        if ((superjumpbounce > 0) || (superjumpdir == 0))
        {
            superjumpbounce--
            superjumpdir = (!superjumpdir)
            state = (99 << 0)
            if ((hitvsp > 0))
            {
                sprite_index = spr_fakepeppino_superjumpstart
                repeat (10)
                    create_debris((x + irandom_range(-25, 25)), (y + 43), spr_fakepepdebris)
                with (instance_create(x, (y + 30), obj_explosioneffect))
                {
                    sprite_index = spr_fakepepsplasheffect
                    image_speed = 0.35
                    depth = -20
                }
            }
            else if ((hitvsp < 0))
            {
                sprite_index = spr_fakepeppino_superjumpdownstart
                repeat (10)
                    create_debris((x + irandom_range(-25, 25)), y, spr_fakepepdebris)
                with (instance_create(x, (y + 20), obj_explosioneffect))
                {
                    sprite_index = spr_fakepepsplasheffect
                    image_speed = 0.35
                    image_yscale = -1
                    depth = -20
                }
            }
            if ((x != targetplayer.x))
                image_xscale = sign((targetplayer.x - x))
            image_index = 7
        }
        else
        {
            sprite_index = spr_fakepeppino_idle
            state = (134 << 0)
        }
    }
}

function scr_fakepepboss_throwing() //gml_Script_scr_fakepepboss_throwing
{
    if ((sprite_index == spr_fakepeppino_throwhead))
    {
        if ((floor(image_index) == (image_number - 1)))
        {
            image_index = (image_number - 1)
            var b = false
            with (headID)
            {
                if ((!thrown) && grounded && (vsp > 0))
                    b = true
            }
            if b
            {
                sprite_index = spr_fakepeppino_flailing
                attackspeed = 0
            }
        }
        else
        {
            if ((floor(image_index) < 32) && (x != targetplayer.x))
                image_xscale = sign((targetplayer.x - x))
            if ((floor(image_index) >= 32) && (!instance_exists(headID)))
            {
                fmod_event_one_shot_3d("event:/sfx/fakepep/headthrow", x, y)
                with (instance_create(x, (y - 20), obj_fakepephead))
                {
                    other.headID = id
                    thrown = true
                    image_xscale = other.image_xscale
                    hithsp = (image_xscale * 15)
                }
            }
        }
    }
    else if ((sprite_index == spr_fakepeppino_flailing))
    {
        if ((attackspeed < 20))
            attackspeed += 0.5
        hsp = (image_xscale * attackspeed)
        with (headID)
        {
            if (((other.image_xscale > 0) && (other.x > x)) || ((other.image_xscale < 0) && (other.x < x)))
            {
                instance_destroy()
                other.sprite_index = spr_fakepeppino_gethead
                other.image_index = 0
                other.hsp = 0
            }
        }
    }
    else if ((sprite_index == spr_fakepeppino_gethead) && (floor(image_index) == (image_number - 1)))
        state = (134 << 0)
}

function scr_fakepepboss_backbreaker() //gml_Script_scr_fakepepboss_backbreaker
{
    if ((sprite_index == spr_fakepeppino_jump) && (floor(image_index) == (image_number - 1)))
        sprite_index = spr_fakepeppino_fall
    if ((vsp > 0) && (sprite_index == spr_fakepeppino_fall) && (!taunted))
    {
        taunted = true
        sprite_index = choose(spr_fakepeppino_supertaunt1, spr_fakepeppino_supertaunt2, spr_fakepeppino_supertaunt3)
        image_index = 0
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = (5 / room_speed)
        }
        fmod_event_one_shot_3d("event:/sfx/fakepep/taunt", x, y)
        instance_create(x, y, obj_baddietaunteffect)
        with (instance_create(x, y, obj_fakepeptauntspawner))
        {
            if ((other.object_index != obj_fakepepboss))
            {
                if ((image_xscale == 1))
                    dir = 3
                if ((image_xscale == -1))
                    dir = 1
                singleshot = true
            }
        }
    }
    if ((sprite_index == spr_fakepeppino_supertaunt1) || (sprite_index == spr_fakepeppino_supertaunt2) || (sprite_index == spr_fakepeppino_supertaunt3))
    {
        vsp = 0
        if ((floor(image_index) == (image_number - 1)))
            sprite_index = spr_fakepeppino_fall
    }
    if (grounded && (vsp > 0))
        state = (134 << 0)
}

