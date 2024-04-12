function scr_player_crouchslide() //gml_Script_scr_player_crouchslide
{
    if (!(place_meeting(x, (y + 1), obj_railparent)))
        hsp = (xscale * movespeed)
    else
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp = ((xscale * movespeed) + (_railinst.movespeed * _railinst.dir))
    }
    move = (key_left + key_right)
    if ((movespeed >= 0) && grounded)
        movespeed -= 0.2
    if ((!key_jump2) && (jumpstop == false) && (vsp < 0.5) && (stompAnim == false))
    {
        vsp /= 20
        jumpstop = true
    }
    if (can_jump && (input_buffer_jump > 0) && (!(scr_solid((x + 27), (y - 32)))) && (!(scr_solid((x - 27), (y - 32)))) && (!(scr_solid(x, (y - 32)))) && (!(scr_solid(x, (y - 16)))))
    {
        input_buffer_jump = 0
        sprite_index = spr_player_jumpdive1
        image_index = 0
        vsp = -11
        with (instance_create(x, y, obj_superdashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if (grounded && ((sprite_index == spr_player_jumpdive1) || (sprite_index == spr_player_jumpdive2)) && (vsp > 0))
    {
        sprite_index = spr_crouchslip
        jumpstop = false
    }
    if ((sprite_index == spr_player_jumpdive1) && (floor(image_index) == (image_number - 1)))
        sprite_index = spr_player_jumpdive2
    mask_index = spr_crouchmask
    if (grounded && key_attack && (!(scr_solid((x + 27), (y - 32)))) && (!(scr_solid((x - 27), (y - 32)))) && (!(scr_solid(x, (y - 32)))) && (!(scr_solid(x, (y - 16)))))
    {
        movespeed = 8
        state = (104 << 0)
        image_index = 0
        sprite_index = spr_rollgetup
    }
    if ((((movespeed <= 5) || (scr_solid((x + 1), y) && (xscale == 1)) || (scr_solid((x - 1), y) && (xscale == -1))) && (!(place_meeting((x + sign(hsp)), y, obj_slope)))) || (movespeed <= 0))
        state = (100 << 0)
    if (scr_solid((x + 1), y) && (xscale == 1) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)))
        state = (100 << 0)
    if (scr_solid((x - 1), y) && (xscale == -1) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)))
        state = (100 << 0)
    if ((!instance_exists(obj_slidecloud)) && grounded && (movespeed > 5))
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale
    }
    image_speed = (movespeed / 24)
}

