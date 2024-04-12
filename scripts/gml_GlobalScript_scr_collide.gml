var _temp_local_var_1, _temp_local_var_2, _temp_local_var_19, _temp_local_var_29;
function scr_collide() //gml_Script_scr_collide
{
    grounded = false
    with (instance_place(x, (y + 2), obj_movingplatform))
    {
        with (other)
        {
            if (!(place_meeting(x, (y - (3 + abs(other.v_velocity))), other)))
            {
                platformid = other.id
                hsp_carry = other.hsp
                if ((abs(other.vsp) > 2))
                    vsp_carry = other.vsp
            }
        }
    }
    var vsp_final = (vsp + vsp_carry)
    vsp_carry = 0
    var target_y = round((y + vsp_final))
    var bbox_size_y = (bbox_bottom - bbox_top)
    var t = (abs((target_y - y)) / bbox_size_y)
    var sv = sign(vsp_final)
    var i = 0
    while ((i < t))
    {
        if (!(scr_solid(x, (y + (bbox_size_y * sv)))))
        {
            y += (bbox_size_y * sv)
            if (((vsp_final > 0) && (y >= target_y)) || ((vsp_final < 0) && (y <= target_y)))
            {
                y = target_y
                break
            }
            else
                i++
        }
        else
        {
            var _temp_local_var_29 = abs((target_y - y))
            if ((abs((target_y - y)) <= 0))
            {
            }
            else
            {
                while (true)
                {
                    if (!(scr_solid(x, (y + sv))))
                    {
                        y += sv
                        var _temp_local_var_29 = (abs((target_y - y)) - 1)
                        if (abs((target_y - y)) - 1)
                            continue
                        break
                    }
                    else
                        vsp = 0
                }
            }
            break
        }
    }
    var hsp_final = (hsp + hsp_carry)
    hsp_carry = 0
    var target_x = round((x + hsp_final))
    var bbox_size_x = (bbox_right - bbox_left)
    t = (abs((target_x - x)) / bbox_size_x)
    var sh = sign(hsp_final)
    var down = scr_solid(x, (y + 1))
    i = 0
    while ((i < t))
    {
        if ((!(scr_solid((x + (bbox_size_x * sh)), y))) && (down == scr_solid((x + (bbox_size_x * sh)), (y + 1))))
        {
            x += (bbox_size_x * sh)
            if (((hsp_final > 0) && (x >= target_x)) || ((hsp_final < 0) && (x <= target_x)))
            {
                x = target_x
                break
            }
            else
                i++
        }
        else
        {
            var _temp_local_var_19 = abs((target_x - x))
            if ((abs((target_x - x)) <= 0))
            {
            }
            else
            {
                while (true)
                {
                    var k = 1
                    if ((k <= 3))
                    {
                        if (scr_solid((x + sh), y) && (!(scr_solid((x + sh), (y - k)))))
                            y -= k
                        if ((!(scr_solid((x + sh), y))) && (!(scr_solid((x + sh), (y + 1)))) && scr_solid((x + sh), (y + (k + 1))))
                            y += k
                        k++
                        break
                    }
                    if (!(scr_solid((x + sh), y)))
                    {
                        x += sh
                        var _temp_local_var_19 = (abs((target_x - x)) - 1)
                        if (abs((target_x - x)) - 1)
                            continue
                        break
                    }
                    else
                        hsp = 0
                }
            }
            i++
        }
    }
    if ((vsp < 10))
        vsp += grav
    if ((platformid != noone))
    {
        if ((vsp < 0) || (!instance_exists(platformid)) || (!(place_meeting(x, ((y + 12) + (abs(platformid.v_velocity) * 2)), platformid))))
        {
            platformid = noone
            y = floor(y)
        }
        else
        {
            grounded = true
            vsp = grav
            if ((platformid.vsp > 0))
                vsp = abs(platformid.v_velocity)
            y = (platformid.y - 46)
            if (!(place_meeting(x, (y + 1), platformid)))
            {
                i = 0
                while (!(place_meeting(x, (y + 1), platformid)))
                {
                    y++
                    if ((i > abs(sprite_height)))
                        break
                }
            }
            if ((platformid.v_velocity != 0))
            {
                if scr_solid(x, y)
                {
                    i = 0
                    while scr_solid(x, y)
                    {
                        y--
                        if ((i > 32))
                            break
                        else
                            i++
                    }
                }
                if scr_solid(x, y)
                {
                    i = 0
                    while scr_solid(x, y)
                    {
                        y++
                        if ((i > 64))
                            break
                        else
                            i++
                    }
                }
            }
        }
    }
    grounded |= scr_solid(x, (y + 1))
    grounded |= ((!(place_meeting(x, y, obj_platform))) && place_meeting(x, (y + 1), obj_platform))
    if ((platformid != noone) || (place_meeting(x, (y + 1), obj_movingplatform) && (!(place_meeting(x, (y - 2), obj_movingplatform)))))
        grounded = true
}

