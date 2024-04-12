function scr_enemy_hit() //gml_Script_scr_enemy_hit
{
    x = (hitX + random_range(-6, 6))
    y = (hitY + random_range(-6, 6))
    hitLag--
    sprite_index = stunfallspr
    if ((object_index == obj_pepperman) || (object_index == obj_vigilanteboss) || (object_index == obj_noiseboss) || (object_index == obj_pf_fakepep) || (object_index == obj_fakepepboss) || (object_index == obj_pizzafaceboss) || (object_index == obj_pizzafaceboss_p3))
    {
        if (player_instakillmove && pizzahead && (object_index != obj_gustavograbbable))
        {
            obj_player1.baddiegrabbedID = id
            scr_boss_grabbed()
            return;
        }
    }
    if ((hitLag <= 0))
    {
        x = hitX
        y = hitY
        var _player = -4
        if ((grabbedby == 1))
            _player = obj_player1.id
        else if ((grabbedby == 2))
            _player = obj_player2.id
        var _state = obj_player.state
        if ((_state == (61 << 0)))
            _state = obj_player.tauntstoredstate
        if (((object_index == obj_pepperman) || (object_index == obj_vigilanteboss) || (object_index == obj_noiseboss) || (object_index == obj_pf_fakepep) || (object_index == obj_fakepepboss) || (object_index == obj_pizzafaceboss) || (object_index == obj_pizzafaceboss_p3)) && override_throw)
        {
            thrown = true
            override_throw = false
        }
        else if ((_state == (104 << 0)) || (_state == (5 << 0)) || ((_state == (105 << 0)) && (obj_player.sprite_index != obj_player.spr_mach3boost) && (obj_player.sprite_index != spr_player_machslideboost3fall)) || (sprite_index == spr_player_ratmountattack) || (sprite_index == spr_lonegustavo_dash))
            thrown = false
        else
            thrown = true
        vsp = hitvsp
        hsp = hithsp
        global.hit += 1
        if ((other.object_index == obj_pizzaball))
            global.golfhit += 1
        if thrown
            global.combotime = 60
        global.heattime = 60
        alarm[1] = 5
        var _hp = 0
        if (((global.attackstyle == 3) || (global.attackstyle == 0)) && (!global.kungfu))
            _hp = -1
        if ((((!elite) && ((hp <= _hp) || mach3destroy)) || (elite && ((elitehit <= 0) || mach3destroy))) && (object_get_parent(object_index) != 21) && (object_index != obj_pizzafaceboss) && destroyable && (!mach2))
        {
            instance_destroy()
            instance_create(x, y, obj_genericpoofeffect)
        }
        stunned = 200
        state = (138 << 0)
        if ((object_index == obj_pepperman) || (object_index == obj_vigilanteboss) || (object_index == obj_noiseboss) || (object_index == obj_pf_fakepep) || (object_index == obj_fakepepboss) || (object_index == obj_pizzafaceboss) || (object_index == obj_pizzafaceboss_p3))
        {
            if ((obj_player.tauntstoredstate != (80 << 0)) && (obj_player.tauntstoredstate != (108 << 0)) && (obj_player.tauntstoredstate != (76 << 0)))
            {
                linethrown = true
                var f = 15
                if ((obj_player.tauntstoredstate == (121 << 0)))
                    f = 25
                if ((abs(hithsp) > abs(hitvsp)))
                {
                    if ((abs(hithsp) < f))
                        hithsp = (sign(hithsp) * f)
                }
                else if ((abs(hitvsp) < f))
                    hitvsp = (sign(hitvsp) * f)
            }
            else if (!pizzahead)
            {
                hithsp = (22 * (-image_xscale))
                hitvsp = -7
                hsp = hithsp
                vsp = hitvsp
                flash = false
                state = (138 << 0)
                thrown = true
                linethrown = false
            }
            if ((_state == (104 << 0)) || (_state == (5 << 0)))
                stunned *= 5
        }
        if mach2
            thrown = false
        mach2 = false
    }
}

