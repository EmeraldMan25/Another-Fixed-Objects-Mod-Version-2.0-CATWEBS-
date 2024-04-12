function scr_pepperman_init_sounds() //gml_Script_scr_pepperman_init_sounds
{
    snd_shoulderbash = fmod_event_create_instance("event:/sfx/pepperman/shoulderbash")
    snd_groundpound = fmod_event_create_instance("event:/sfx/pepperman/groundpound")
}

function destroy_sounds(argument0) //gml_Script_destroy_sounds
{
    for (var i = 0; i < array_length(argument0); i++)
    {
        var b = argument0[i]
        fmod_event_instance_stop(b, true)
        fmod_event_instance_release(b)
    }
}

function scr_pepperman_destroy_sounds() //gml_Script_scr_pepperman_destroy_sounds
{
    destroy_sounds([snd_shoulderbash, snd_groundpound])
}

function scr_pepperman_sounds() //gml_Script_scr_pepperman_sounds
{
    if ((state == (153 << 0)))
    {
        if (!fmod_event_instance_is_playing(snd_shoulderbash))
            fmod_event_instance_play(snd_shoulderbash)
        fmod_event_instance_set_3d_attributes(snd_shoulderbash, x, y)
    }
    else
        fmod_event_instance_stop(snd_shoulderbash, true)
    if ((state == (122 << 0)))
    {
        if (!fmod_event_instance_is_playing(snd_groundpound))
            fmod_event_instance_play(snd_groundpound)
        fmod_event_instance_set_3d_attributes(snd_groundpound, x, y)
    }
    else if ((state != (108 << 0)) && (state != (122 << 0)))
        fmod_event_instance_stop(snd_groundpound, true)
    if ((state == (268 << 0)))
        shrinkstate = Approach(shrinkstate, 1, 0.05)
    else
        shrinkstate = Approach(shrinkstate, 0, 0.05)
    with (obj_music)
    {
        if ((music != noone))
            fmod_event_instance_set_parameter(music.event, "state", other.shrinkstate, true)
    }
}

function scr_pepperman_spawn_knight() //gml_Script_scr_pepperman_spawn_knight
{
    if ((knightdir == -1))
    {
        with (instance_create((room_width + 10), 416, obj_peppermanGIANTbowlingball))
            image_xscale = -1
    }
    if ((knightdir == 1))
    {
        with (instance_create(-10, 416, obj_peppermanGIANTbowlingball))
            image_xscale = 1
    }
    knightdir *= -1
}

function scr_pepperman_shuffle_adds() //gml_Script_scr_pepperman_shuffle_adds
{
    if ((bowlingballcount <= 0))
    {
        if (throwknight && (!instance_exists(obj_peppermanbowlingball)) && (!instance_exists(obj_peppermanbowlingballspawner)))
        {
            bowlingballcount = MAX_bowlingballcount
            throwknight = (!throwknight)
            scr_pepperman_spawn_knight()
        }
        else if ((!throwknight) && (!instance_exists(obj_peppermanGIANTbowlingball)))
        {
            bowlingballcount = MAX_bowlingballcount
            throwknight = (!throwknight)
            with (instance_create(x, y, obj_peppermanbowlingballspawner))
                balls = 1
        }
    }
}

function scr_pepperman_arenaintro() //gml_Script_scr_pepperman_arenaintro
{
    if (!skipintro)
    {
        image_speed = 0.35
        with (obj_player)
        {
            state = (146 << 0)
            image_speed = 0.35
            hsp = 0
            movespeed = 0
            flash = false
            x = roomstartx
            xscale = (-other.image_xscale)
            if ((other.sprite_index == spr_pepperman_intro1))
            {
                if ispeppino
                    sprite_index = spr_player_gnomecutscene1
                else
                    sprite_index = spr_playerN_bosscutscene1
            }
            if ((floor(image_index) == (image_number - 1)))
            {
                if ((sprite_index == spr_player_gnomecutscene2) || (sprite_index == spr_playerN_bosscutscene2) || (sprite_index == spr_playerN_bosscutscene3))
                    image_index = (image_number - 1)
                else if ((sprite_index == spr_player_gnomecutscene3))
                    sprite_index = spr_player_gnomecutscene4
                else if ((sprite_index == spr_noise_vulnerable1))
                    sprite_index = spr_noise_vulnerable1loop
            }
        }
        if ((introbuffer > 0))
        {
            introbuffer--
            if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_pepperman_intro2))
                image_index = (image_number - 1)
        }
        else if ((sprite_index == spr_pepperman_intro1))
        {
            sprite_index = spr_pepperman_intro2
            image_index = 0
            introbuffer = 70
            with (obj_player)
            {
                image_index = 0
                if ispeppino
                    sprite_index = spr_player_gnomecutscene2
                else
                    sprite_index = spr_playerN_bosscutscene2
            }
        }
        else if ((sprite_index == spr_pepperman_intro2))
        {
            sprite_index = spr_pepperman_intro3
            image_index = 0
            fmod_event_one_shot_3d("event:/sfx/voice/peppermanlaugh", x, y)
            with (obj_player1)
            {
                if ispeppino
                {
                    fmod_event_one_shot("event:/sfx/pep/screamboss")
                    sprite_index = spr_player_gnomecutscene3
                    image_index = 0
                }
                else
                {
                    sprite_index = spr_playerN_bosscutscene3
                    image_index = 0
                }
            }
        }
        else if ((floor(image_index) == (image_number - 1)))
        {
            switch sprite_index
            {
                case spr_pepperman_intro3:
                    sprite_index = spr_pepperman_intro3loop
                    introbuffer = 130
                    break
                case spr_pepperman_intro3loop:
                    sprite_index = spr_pepperman_intro3end
                    break
                case spr_pepperman_intro3end:
                    state = (134 << 0)
                    spotlightID.expand = true
                    with (obj_player1)
                    {
                        if ispeppino
                        {
                            sprite_index = spr_player_screamtransition
                            image_index = 0
                            image_speed = 0.35
                        }
                        landAnim = false
                        tauntstoredstate = (0 << 0)
                        state = (293 << 0)
                    }
                    break
            }

        }
    }
    else
        scr_boss_genericintro(spr_pepperman_idle)
}

function scr_pepperman_walk() //gml_Script_scr_pepperman_walk
{
    if grounded
        hsp = Approach(hsp, 0, 0.25)
    if (grounded && (vsp > 0) && (sprite_index == spr_pepperman_scared) && (flickertime > 2))
    {
        hsp = Approach(hsp, 0, 0.5)
        create_particle(x, y, (12 << 0))
        vsp = -5
        touchedground = true
    }
    if ((cooldown > 0) && (flickertime <= 0) && (obj_player1.state != (293 << 0)))
        cooldown--
    if ((flickertime > 0))
        sprite_index = spr_pepperman_scared
    else if grounded
    {
        if ((phase == 2))
            sprite_index = spr_pepperman_sour
        else
            sprite_index = spr_pepperman_idle
    }
    woosh = false
    if (!pizzahead)
    {
        var shoulder = ((wastedhits < 4) || ((wastedhits >= 8) && (wastedhits < 10)))
        var stomp = ((wastedhits < 8) || (wastedhits >= 10))
    }
    else
    {
        shoulder = ((elitehit == 3) || (elitehit == 4))
        stomp = (elitehit < 3)
    }
    if (shoulder && (cooldown == 0))
    {
        state = (153 << 0)
        attackspeed = 0
        turned = false
        sprite_index = spr_pepperman_shoulderstart
        image_index = 0
        if ((x != targetplayer.x))
            image_xscale = sign((targetplayer.x - x))
    }
    else if (stomp && (cooldown == 0))
    {
        fmod_event_one_shot_3d("event:/sfx/fakepep/jump", x, y)
        create_particle(x, y, (5 << 0))
        state = (92 << 0)
        landbuffer2 = 10
        if ((x != targetplayer.x))
            image_xscale = sign((targetplayer.x - x))
        else
            image_xscale = ((x > (room_width / 2)) ? -1 : 1)
        hsp = (image_xscale * 15)
        vsp = -16
        sprite_index = spr_pepperman_jump
        image_index = 0
    }
}

function pepperman_nearestspot() //gml_Script_pepperman_nearestspot
{
    if ((elitehit > 1))
    {
        if instance_exists(obj_pepper_marbleblock)
            targetspot = instance_nearest(x, y, obj_pepper_marbleblock).parentID
        if ((targetspot == oldtargetspot))
        {
            do
            {
                targetspot = instance_nearest_random(obj_pepper_groundpoundspot, 3)
            } until ((targetspot != oldtargetspot) && (targetspot != undefined));
        }
    }
    else
        targetspot = instance_nearest(obj_player1.x, obj_player1.y, obj_pepper_groundpoundspot)
    state = (92 << 0)
    jump_speed = floor((distance_to_object(targetspot) * 0.04))
    if ((jump_speed < 20))
        jump_speed = 20
    jump_speed += floor((wastedhits / 2))
    calculate_jump_velocity((targetspot.x + 16), ((targetspot.y + 16) - 200), jump_speed, grav)
    if ((hsp > -2) && (hsp < 2))
        vsp = (-jump_speed)
    trace(hsp, " ", vsp)
    sprite_index = spr_pepperman_jump
    image_index = 0
}

function scr_pepperman_jump() //gml_Script_scr_pepperman_jump
{
    if ((hsp != 0))
        image_xscale = sign(hsp)
    if ((phase == 2))
        cooldown = 80
    else
        cooldown = 40
    targetspot = obj_player1.id
    if (((x >= (targetspot.x - 32)) && (x <= (targetspot.x + 32)) && (y < (targetspot.y - 48))) || ((image_xscale > 0) && (x > (targetspot.x + 100))) || ((image_xscale < 0) && (x < (targetspot.x - 100))) || (vsp > 2))
    {
        state = (122 << 0)
        sprite_index = spr_pepperman_groundpoundstart
        image_index = 0
        vsp = 11
        hsp = 0
        grounded = false
    }
    if ((sprite_index == spr_pepperman_jump) && (floor(image_index) == (image_number - 1)))
        sprite_index = spr_pepperman_fall
}

function scr_pepperman_freefallprep() //gml_Script_scr_pepperman_freefallprep
{
    hsp = 0
    vsp = 0
    image_speed = 0.35
    if ((floor(image_index) == (image_number - 1)))
    {
        state = (108 << 0)
        sprite_index = spr_pepperman_groundpound
        grounded = false
        vsp = 10
    }
}

function scr_pepperman_freefall() //gml_Script_scr_pepperman_freefall
{
    hsp = Approach(hsp, (sign((targetspot.x - x)) * 5), 0.2)
    if ((hsp != 0))
        image_xscale = sign(hsp)
    if ((vsp >= 2))
    {
        if ((wastedhits < 6))
            vsp += 1
        else
            vsp += 2
    }
    if grounded
    {
        create_particle(x, y, (14 << 0))
        if (!pizzahead)
            var _land = (wastedhits < 6)
        else
            _land = (elitehit == 2)
        if _land
        {
            fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
            state = (111 << 0)
            sprite_index = spr_pepperman_groundpoundland
            image_index = 0
            landbuffer = 100
            if ((bowlingballcount > 0))
                bowlingballcount--
            if (!pizzahead)
            {
                if ((phase == 1))
                {
                    if ((wastedhits == 5) && (bowlingballcount <= 0))
                    {
                        bowlingballcount = MAX_bowlingballcount
                        with (instance_create(x, y, obj_peppermanbowlingballspawner))
                            balls = 1
                    }
                }
                if ((phase == 2))
                    scr_pepperman_shuffle_adds()
            }
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (5 / room_speed)
            }
        }
        else
        {
            if ((bowlingballcount > 0))
                bowlingballcount--
            if ((GIANTbowlingballcount > 0))
                GIANTbowlingballcount--
            if (!pizzahead)
            {
                if ((phase == 1))
                {
                    if ((wastedhits == 7) && (bowlingballcount <= 0))
                    {
                        bowlingballcount = MAX_bowlingballcount
                        with (instance_create(x, y, obj_peppermanbowlingballspawner))
                            balls = 2
                    }
                }
                if ((phase == 2))
                    scr_pepperman_shuffle_adds()
            }
            fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
            fmod_event_one_shot_3d("event:/sfx/pepperman/groundpoundjump", x, y)
            if ((x != targetplayer.x))
                image_xscale = sign((targetplayer.x - x))
            state = (133 << 0)
            sprite_index = spr_pepperman_groundpoundland
            image_index = 0
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (5 / room_speed)
            }
        }
    }
}

function scr_pepperman_rolling() //gml_Script_scr_pepperman_rolling
{
    if ((sprite_index != spr_pepperman_groundpoundland))
    {
        image_speed = 0.35
        sprite_index = spr_pepperman_rolling
        hsp = (image_xscale * 10)
        if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_destructibles))))
        {
            instance_create((x + (image_xscale * 20)), y, obj_bangeffect)
            image_xscale *= -1
            vsp = -10
            fmod_event_one_shot_3d("event:/sfx/pepperman/groundpoundbump", x, y)
        }
        if (grounded && (vsp > 0))
        {
            state = (134 << 0)
            sprite_index = spr_pepperman_move
            hsp = (image_xscale * 5)
        }
    }
    else
    {
        hsp = 0
        vsp = 0
        image_speed = 0.4
        if ((floor(image_index) >= 3))
        {
            sprite_index = spr_pepperman_rolling
            vsp = -17
        }
    }
}

function scr_pepperman_freefallland() //gml_Script_scr_pepperman_freefallland
{
    hsp = 0
    image_speed = 0.35
    if ((landbuffer > 0))
    {
        image_index = 0
        landbuffer--
    }
    else
    {
        image_speed = 0.35
        if ((floor(image_index) == (image_number - 1)))
            state = (134 << 0)
    }
}

function scr_pepperman_shoulderbash() //gml_Script_scr_pepperman_shoulderbash
{
    image_speed = abs((attackspeed / 8))
    if ((image_speed < 0.2))
        image_speed = 0.2
    if ((phase == 2))
        cooldown = 80
    else
        cooldown = 40
    var a_treshold = 8
    if (!pizzahead)
        var _turn = (wastedhits >= 2)
    else
        _turn = (elitehit == 3)
    if (_turn && (!turned))
    {
        var ix = sign((targetplayer.x - x))
        if ((ix != image_xscale))
        {
            fmod_event_one_shot_3d("event:/sfx/pepperman/turn", x, y)
            state = (161 << 0)
            sprite_index = spr_pepperman_shoulderturn
            image_index = 0
            image_speed = 0.35
            turned = true
            attackspeed = 10
        }
    }
    if ((attackspeed >= a_treshold))
    {
        hsp = (image_xscale * attackspeed)
        if ((woosh == false) && (phase == 2))
        {
            with (instance_create(x, y, obj_crazyrunothereffect))
                image_xscale = other.image_xscale
            with (instance_create(x, y, obj_superdashcloud))
                image_xscale = other.image_xscale
            woosh = true
        }
        if (place_meeting((x + image_xscale), y, obj_solid) && (!(place_meeting((x + image_xscale), y, obj_slope))) && (!(place_meeting((x + image_xscale), y, obj_destructibles))))
        {
            fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
            fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
            state = (138 << 0)
            hsp = ((-image_xscale) * 5)
            vsp = -8
            stunned = 220
            sprite_index = spr_pepperman_shoulderhurtstart
            image_index = 0
            image_speed = 0.35
            if ((bowlingballcount > 0))
                bowlingballcount--
            if ((GIANTbowlingballcount > 0))
                GIANTbowlingballcount--
            if (!pizzahead)
            {
                if ((phase == 1))
                {
                    if ((wastedhits == 3) && (bowlingballcount <= 0))
                    {
                        bowlingballcount = MAX_bowlingballcount
                        with (instance_create(x, y, obj_peppermanbowlingballspawner))
                            balls = 1
                    }
                }
                if ((phase == 2))
                    scr_pepperman_shuffle_adds()
            }
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (5 / room_speed)
            }
            repeat (4)
                create_debris(x, y, spr_slapstar)
            instance_create((x + 10), (y + 10), obj_bumpeffect)
        }
    }
    else
        hsp = ((-image_xscale) * 1)
    if ((attackspeed < 20))
    {
        if ((phase == 2))
            attackspeed += 0.5
        else
            attackspeed += 0.25
    }
    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_pepperman_shoulderstart))
        sprite_index = spr_pepperman_shoulderloop
}

function scr_pepperman_do_contemplate() //gml_Script_scr_pepperman_do_contemplate
{
    if ((wastedhits >= 8))
    {
        var b = false
        with (obj_pepper_marbleblock)
        {
            if ((other.wastedhits == number) && (hp <= 0) && (!instance_exists(other.marbleblockID)) && (distance_to_object(other) < 100))
            {
                b = true
                other.marbleblockID = id
                if ((x != other.x))
                    other.image_xscale = sign((x - other.x))
                contemplated = true
            }
        }
        if b
        {
            if ((state != (267 << 0)))
                fmod_event_one_shot_3d("event:/sfx/voice/peppermansnicker", x, y)
            state = (267 << 0)
            animbuffer = 80
            hsp = 0
            vsp = 0
            sprite_index = spr_pepperman_contemplate
        }
    }
}

function scr_pepperman_contemplate() //gml_Script_scr_pepperman_contemplate
{
    hsp = 0
    image_speed = 0.35
}

function scr_pepperman_shoulderturn() //gml_Script_scr_pepperman_shoulderturn
{
    if ((sprite_index != spr_pepperman_shoulderturn))
        attackspeed = Approach(attackspeed, 0, 0.5)
    else
        attackspeed = Approach(attackspeed, 0, 0.1)
    hsp = (image_xscale * attackspeed)
    if ((sprite_index == spr_pepperman_shoulderturn) && (floor(image_index) == (image_number - 1)))
        sprite_index = spr_pepperman_shoulderturnloop
    if ((attackspeed <= 0) && (sprite_index == spr_pepperman_shoulderturnloop) && (floor(image_index) == (image_number - 1)))
    {
        if ((phase == 2))
        {
            attackspeed = 24
            with (instance_create(x, y, obj_crazyrunothereffect))
                image_xscale = other.image_xscale
        }
        else
            attackspeed = 12
        state = (153 << 0)
        sprite_index = spr_pepperman_shoulderloop
        image_xscale *= -1
    }
}

function scr_pepperman_mini() //gml_Script_scr_pepperman_mini
{
    image_speed = 0.35
    if ((minibuffer > 0))
        minibuffer--
    switch ministate
    {
        case (8 << 0):
            hsp = 0
            vsp = 0
            if ((floor(image_index) == (image_number - 1)))
            {
                if ((sprite_index == spr_pepperman_ministart))
                {
                    ministate = (0 << 0)
                    sprite_index = spr_pepperman_miniidle
                }
                else if ((sprite_index == spr_pepperman_miniend))
                {
                    state = (134 << 0)
                    sprite_index = spr_pepperman_idle
                }
            }
            break
        case (0 << 0):
            move = 0
            if ((distance_to_object(targetplayer) < 250))
                move = sign((x - targetplayer.x))
            hsp = Approach(hsp, (move * 8), 0.5)
            if ((hsp != 0))
            {
                image_xscale = sign(hsp)
                sprite_index = spr_pepperman_minimove
            }
            else
                sprite_index = spr_pepperman_miniidle
            if (!grounded)
            {
                ministate = (92 << 0)
                attackspeed = abs(hsp)
                sprite_index = spr_pepperman_minifall
            }
            else if ((minibuffer > 0))
            {
                if (place_meeting((x + (image_xscale * 18)), y, obj_solid) && (distance_to_object(targetplayer) < 100))
                {
                    ministate = (92 << 0)
                    vsp = -15
                    if ((targetplayer.x != x))
                        image_xscale = sign((targetplayer.x - x))
                    sprite_index = spr_pepperman_minijump
                    image_index = 0
                    fmod_event_one_shot_3d("event:/sfx/fakepep/jump", x, y)
                    attackspeed = 10
                    create_particle(x, y, (5 << 0))
                }
            }
            if ((minibuffer <= 0))
            {
                ministate = (8 << 0)
                sprite_index = spr_pepperman_miniend
                image_index = 0
                vsp = 0
                hsp = 0
            }
            break
        case (92 << 0):
            hsp = (image_xscale * attackspeed)
            if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_pepperman_minijump))
                sprite_index = spr_pepperman_minifall
            if (grounded && (vsp > 0))
                ministate = (0 << 0)
            break
    }

}

function scr_pepperman_phase1hurt() //gml_Script_scr_pepperman_phase1hurt
{
    sprite_index = spr_pepperman_hurtplayer
    image_speed = 0.35
    scr_boss_phase1hurt(function() //gml_Script_anon_scr_pepperman_phase1hurt_gml_GlobalScript_scr_pepperman_17881_scr_pepperman_phase1hurt_gml_GlobalScript_scr_pepperman
    {
    }
)
}

