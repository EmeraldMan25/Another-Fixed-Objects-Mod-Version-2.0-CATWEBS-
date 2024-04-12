function scr_enemy_pummel() //gml_Script_scr_enemy_pummel
{
    var _playerinst = ((grabbedby == 1) ? obj_player1.id : obj_player2.id)
    sprite_index = stunfallspr
    x = (_playerinst.x + (_playerinst.xscale * 16))
    y = _playerinst.y
    image_xscale = sign((_playerinst.x - x))
    with (_playerinst)
    {
        if ((state != (154 << 0)))
        {
            with (other)
            {
                stagger_dir = (-image_xscale)
                state = (155 << 0)
                stagger_buffer = stagger_max
                hsp = 0
            }
            return;
        }
        if ((sprite_index == spr_grab))
        {
            if key_slap2
            {
                if ((other.hp > 0))
                {
                    image_index = 0
                    sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4)
                }
                else
                {
                    sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4)
                    state = (91 << 0)
                    movespeed = 5
                    image_index = 0
                    other.state = (138 << 0)
                    other.grav = 0
                    other.hsp = ((-other.image_xscale) * 25)
                    other.vsp = -2
                }
                other.hp--
                instance_create(x, y, obj_slapstar)
                instance_create(x, y, obj_baddiegibs)
                with (obj_camera)
                {
                    shake_mag = 3
                    shake_mag_acc = (3 / room_speed)
                }
            }
            else if key_slap
            {
                if key_up
                {
                    state = (80 << 0)
                    sprite_index = spr_breakdanceuppercut
                    image_index = 0
                    vsp = -14
                    movespeed = 2
                    instance_create(x, y, obj_highjumpcloud2)
                    instance_create(x, y, obj_slapstar)
                    instance_create(x, y, obj_baddiegibs)
                    with (obj_camera)
                    {
                        shake_mag = 3
                        shake_mag_acc = (3 / room_speed)
                    }
                    with (other)
                    {
                        hp -= 2
                        state = ((hp <= 0) ? (138 << 0) : (155 << 0))
                        if ((state == (155 << 0)))
                        {
                            stunned = 100
                            stuntouchbuffer = 50
                        }
                        hsp = ((-image_xscale) * 8)
                        vsp = -14
                    }
                }
                else if key_down
                {
                    vsp = -4
                    movespeed = 9
                    state = (80 << 0)
                    sprite_index = spr_player_breakdancestart
                    breakdance = 35
                    image_index = 0
                    with (obj_camera)
                    {
                        shake_mag = 3
                        shake_mag_acc = (3 / room_speed)
                    }
                    instance_create(x, y, obj_highjumpcloud2)
                    instance_create(x, y, obj_slapstar)
                    instance_create(x, y, obj_baddiegibs)
                    with (other)
                    {
                        hp -= 2
                        state = ((hp <= 0) ? (138 << 0) : (155 << 0))
                        if ((state == (155 << 0)))
                        {
                            stunned = 100
                            stuntouchbuffer = 50
                        }
                        hsp = ((-image_xscale) * 8)
                        vsp = -14
                    }
                }
            }
        }
    }
}

function scr_enemy_stunTEST() //gml_Script_scr_enemy_stunTEST
{
    sprite_index = stunfallspr
    image_speed = 0.35
    if (place_meeting((x - sign(image_xscale)), y, obj_solid) || grounded)
    {
        if thrown
        {
            if destroyable
                instance_destroy()
        }
        else
        {
            hsp = 0
            grav = 0.5
        }
    }
}

function scr_enemy_staggered() //gml_Script_scr_enemy_staggered
{
    sprite_index = stunfallspr
    if ((stuntouchbuffer > 0))
        stuntouchbuffer--
    if ((stagger_buffer > 0))
    {
        hsp = 0
        stagger_buffer--
    }
    else if ((stagger_buffer == 0))
    {
        vsp = (-stagger_jumpspeed)
        hsp = (stagger_dir * stagger_movespeed)
        stagger_buffer = -1
    }
    else if ((floor(image_index) == (image_number - 1)) && grounded)
    {
        image_index = 0
        sprite_index = walkspr
        state = (134 << 0)
    }
}

