function scr_piggyblock_destroy() //gml_Script_scr_piggyblock_destroy
{
    if bbox_in_camera(view_camera[0])
    {
        with (other)
        {
            if (instakillmove && (place_meeting((x + 1), y, other) || place_meeting((x - 1), y, other) || place_meeting(x, (y + 1), other) || place_meeting(x, (y - 1), other)))
                instance_destroy(other)
        }
    }
}

function scr_ratblock_destroy() //gml_Script_scr_ratblock_destroy
{
    if place_meeting(x, y, obj_canonexplosion)
    {
        with (instance_place(x, y, obj_canonexplosion))
        {
            instance_destroy(other)
            if baddie
                notification_push((34 << 0), [room])
        }
    }
    if bbox_in_camera(view_camera[0])
    {
        with (obj_player)
        {
            if (((other.sprite_index == spr_rattumbleblock) || (other.sprite_index == spr_rattumbleblock_big)) && (sprite_index == spr_tumble) && (place_meeting((x + 1), y, other) || place_meeting((x - 1), y, other)))
                instance_destroy(other)
            if ((state != (11 << 0)) && (state != (52 << 0)) && ((!scr_transformationcheck()) || (state == (113 << 0))) && (place_meeting((x + 1), y, other) || place_meeting((x - 1), y, other) || place_meeting(x, (y + 1), other) || place_meeting(x, (y - 1), other)))
            {
                switch state
                {
                    case (113 << 0):
                        if (!(place_meeting(x, (y - 12), other)))
                            instance_destroy(other)
                        break
                    case (34 << 0):
                        vsp = -6
                        if (!ispeppino)
                        {
                            sprite_index = spr_playerN_boxxedhit
                            image_index = 0
                        }
                        instance_destroy(other)
                        break
                    case (51 << 0):
                        if ((sprite_index != spr_bombpepend) && (sprite_index != spr_bombpepintro))
                        {
                            instance_create(x, y, obj_bombexplosion)
                            instance_destroy(other)
                            GamepadSetVibration(0, 1, 1, 0.9)
                            hurted = true
                            vsp = -4
                            image_index = 0
                            sprite_index = spr_bombpepend
                            state = (51 << 0)
                            bombpeptimer = 0
                        }
                        break
                    case (186 << 0):
                    case (150 << 0):
                    case (146 << 0):
                    case (33 << 0):
                    case (11 << 0):
                    case (14 << 0):
                    case (12 << 0):
                    case (35 << 0):
                    case (47 << 0):
                    case (49 << 0):
                        break
                    case (5 << 0):
                        if ((other.sprite_index == spr_rattumbleblock) || (other.sprite_index == spr_rattumbleblock_big))
                            instance_destroy(other)
                        break
                    default:
                        if ((other.sprite_index != spr_rattumbleblock) && (other.sprite_index != spr_rattumbleblock_big))
                            instance_destroy(other)
                }

            }
        }
    }
}

