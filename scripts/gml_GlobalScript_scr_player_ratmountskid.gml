function scr_player_ratmountskid() //gml_Script_scr_player_ratmountskid
{
    hsp = (xscale * (-movespeed))
    movespeed = Approach(movespeed, 0, 0.8)
    if brick
        sprite_index = spr_ratmount_skid
    else
        sprite_index = spr_lonegustavo_skid
    gustavodash = 0
    ratmount_movespeed = 8
    image_speed = 0.4
    if ((abs(movespeed) <= 0) || (abs(hsp) <= 0))
    {
        movespeed = 0
        state = (191 << 0)
    }
    if ((input_buffer_jump > 0) && can_jump && (sprite_index != spr_player_ratmountswallow))
    {
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
        fmod_event_one_shot_3d("event:/sfx/pep/jump", x, y)
        if brick
            sprite_index = spr_player_ratmountjump
        else if ((ratmount_movespeed >= 12))
            sprite_index = spr_lonegustavo_dashjump
        else
            sprite_index = spr_player_ratmountgroundpound
        image_index = 0
        if ((state != (191 << 0)))
            xscale *= -1
        input_buffer_jump = 0
        movespeed = hsp
        jumpAnim = true
        state = (192 << 0)
        vsp = -11
        jumpstop = false
    }
    if ((((input_buffer_slap > 0) && key_up) || key_shoot2) && brick)
    {
        input_buffer_slap = 0
        ratmount_kickbrick()
        movespeed = (-movespeed)
        hsp = movespeed
        ratmount_movespeed = 8
    }
    if ((input_buffer_slap > 0) && (!key_up))
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        input_buffer_slap = 0
        if ((brick == true))
        {
            with (instance_create(x, y, obj_brickcomeback))
                wait = true
        }
        brick = false
        movespeed = (-movespeed)
        ratmountpunchtimer = 25
        gustavohitwall = false
        state = (259 << 0)
        image_index = 0
        if ((move != 0))
            xscale = move
        movespeed = (xscale * 12)
        sprite_index = spr_lonegustavo_punch
    }
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
}

