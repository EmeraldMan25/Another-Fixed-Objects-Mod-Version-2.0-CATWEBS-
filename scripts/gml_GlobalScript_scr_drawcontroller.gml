function get_dark(argument0, argument1, argument2, argument3, argument4) //gml_Script_get_dark
{
    if ((argument2 == undefined))
        argument2 = false
    if ((argument3 == undefined))
        argument3 = 0
    if ((argument4 == undefined))
        argument4 = 0
    if argument1
    {
        if ((room == boss_vigilante))
            argument0 = make_color_rgb(247, 109, 22)
        var d = (room_width * room_height)
        var b = d
        var bb = b
        with (obj_lightsource)
        {
            if ((object_index != obj_lightsource_attach) || instance_exists(objectID))
            {
                if (!argument2)
                    var dis = distance_to_object(other)
                else
                    dis = distance_between_points(x, y, argument3, argument4)
                if ((dis < d))
                {
                    bb = (dis / distance)
                    if ((bb < b))
                    {
                        b = bb
                        d = dis
                    }
                }
            }
        }
        var t = ((b + 0.4) * 255)
        var a = ((1 - obj_drawcontroller.dark_alpha) * 255)
        a -= 102
        t = clamp(t, 0, 255)
        a = clamp(a, 0, 255)
        var r = ((color_get_red(argument0) - t) + a)
        var g = ((color_get_green(argument0) - t) + a)
        b = ((color_get_blue(argument0) - t) + a)
        if ((r < 0))
            r = 0
        if ((g < obj_noisecredit))
            g = obj_noisecredit
        if ((b < c_black))
            b = c_black
        return make_color_rgb(r, g, b);
    }
    else
        return image_blend;
}

function enemy_is_superslam(argument0) //gml_Script_enemy_is_superslam
{
    with (argument0)
    {
        if ((state == (4 << 0)))
        {
            var g = ((grabbedby == 1) ? obj_player1.id : obj_player2.id)
            if ((g.state == (76 << 0)) || ((g.state == (61 << 0)) && (g.tauntstoredstate == (76 << 0))))
                return true;
        }
    }
    return false;
}

function enemy_is_swingding(argument0) //gml_Script_enemy_is_swingding
{
    with (argument0)
    {
        if ((state == (4 << 0)))
        {
            var g = ((grabbedby == 1) ? obj_player1.id : obj_player2.id)
            if (((g.state == (79 << 0)) || ((g.state == (61 << 0)) && (g.tauntstoredstate == (79 << 0)))) && (g.sprite_index == g.spr_swingding))
                return true;
        }
    }
    return false;
}

function draw_enemy(argument0, argument1, argument2) //gml_Script_draw_enemy
{
    if ((argument2 == undefined))
        argument2 = 16777215
    if ((object_index == obj_swapplayergrabbable))
    {
        shader_set(global.Pal_Shader)
        var b = get_dark(image_blend, obj_drawcontroller.use_dark)
        pal_swap_set(spr_palette, paletteselect, false)
        pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, patterntexture)
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, image_alpha)
        pattern_reset()
        shader_reset()
        return;
    }
    var _stun = 0
    if (((state == (138 << 0)) && (thrown == false) && (object_index != obj_peppinoclone)) || (state == (294 << 0)) || ((state == (262 << 0)) && (sprite_index == stunfallspr)))
        _stun = 25
    if ((state == (294 << 0)) && (object_index == obj_gustavograbbable))
        _stun = 0
    if (visible && (object_index != obj_pizzaball) && (object_index != obj_fakesanta) && bbox_in_camera(view_camera[0], 32))
    {
        var c = image_blend
        if elite
            c = 65535
        if elitegrab
            c = 32768
        if ((argument2 != 16777215))
            c = argument2
        b = get_dark(c, obj_drawcontroller.use_dark)
        if ((object_index == obj_peppinoclone))
        {
            shader_set(global.Pal_Shader)
            pal_swap_set(spr_peppalette, 1, false)
        }
        else if (usepalette && argument1)
        {
            shader_set(global.Pal_Shader)
            pal_swap_set(spr_peppalette, 0)
            if (!global.swapmode)
            {
                if (((object_index == obj_fakepepboss) || (object_index == obj_gustavograbbable)) && obj_player1.ispeppino)
                    pattern_set(global.Base_Pattern_Color, sprite_index, image_index, (image_xscale * xscale), (image_yscale * yscale), global.palettetexture)
            }
            else if ((object_index == obj_fakepepboss) || (object_index == obj_gustavograbbable))
            {
                var palinfo = get_pep_palette_info()
                pattern_set(global.Base_Pattern_Color, sprite_index, image_index, (image_xscale * xscale), (image_yscale * yscale), palinfo.patterntexture)
            }
            pal_swap_set(spr_palette, paletteselect, false)
        }
        var _ys = 1
        if ((state == (4 << 0)))
        {
            if enemy_is_superslam(id)
            {
                _stun += 18
                _ys = -1
            }
        }
        draw_sprite_ext(sprite_index, image_index, x, (y + _stun), (xscale * image_xscale), (yscale * _ys), angle, b, image_alpha)
        if argument0
        {
            if ((hp > maxhp))
                maxhp = hp
            draw_healthbar((x - 16), (y - 50), (x + 16), (y - 45), ((hp / maxhp) * 100), c_black, c_red, c_red, 0, true, true)
        }
        if ((object_index == obj_fakepepboss))
        {
            if miniflash
            {
                pal_swap_set(spr_peppalette, 14, false)
                draw_sprite_ext(sprite_index, image_index, x, (y + _stun), (xscale * image_xscale), (yscale * _ys), angle, b, image_alpha)
            }
        }
        if ((object_index == obj_peppinoclone) || (usepalette && argument1))
        {
            pattern_reset()
            shader_reset()
        }
        if ((object_index == obj_hamkuff))
        {
            if ((state == (206 << 0)) && instance_exists(playerid))
            {
                var x1 = (x + (6 * image_xscale))
                var y1 = (y + 29)
                if ((sprite_index == spr_hamkuff_chain2))
                {
                    x1 = (x + (15 * image_xscale))
                    y1 = (y + 33)
                }
                var dis = point_distance(x1, y1, playerid.x, playerid.y)
                var w = 24
                var len = (dis div w)
                var dir = point_direction(x1, y1, playerid.x, (playerid.y + 16))
                var xx = lengthdir_x(w, dir)
                var yy = lengthdir_y(w, dir)
                for (var i = 0; i < len; i++)
                    draw_sprite_ext(spr_hamkuff_sausage, -1, (x1 + (xx * i)), (y1 + (yy * i)), 1, 1, dir, b, 1)
            }
        }
    }
}

function draw_superslam_enemy() //gml_Script_draw_superslam_enemy
{
    if ((state == (76 << 0)) && (floor(image_index) >= 5) && (floor(image_index) <= 7) && instance_exists(baddiegrabbedID))
    {
        with (baddiegrabbedID)
            draw_enemy(global.kungfu, true)
    }
}

function draw_player() //gml_Script_draw_player
{
    if instance_exists(obj_swapgusfightball)
    {
        var _use_dark = other.use_dark
        with (obj_swapgusfightball)
        {
            var b = get_dark(image_blend, _use_dark)
            var _info = [[sprite_index, get_pep_palette_info()], [1753, get_noise_palette_info()]]
            for (var i = 0; i < array_length(_info); i++)
            {
                var sprite = _info[i][0]
                var pal = _info[i][1]
                pattern_set(global.Base_Pattern_Color, sprite, image_index, image_xscale, image_yscale, pal.patterntexture)
                pal_swap_set(pal.spr_palette, pal.paletteselect, false)
                draw_sprite_ext(sprite, image_index, x, y, image_xscale, image_yscale, image_angle, b, image_alpha)
            }
            pattern_reset()
        }
        return;
    }
    if ((!ispeppino) && (state == (209 << 0)))
        return;
    b = get_dark(image_blend, other.use_dark)
    var pattern = global.palettetexture
    var ps = paletteselect
    var spr = spr_palette
    var _sprite_index = sprite_index
    var _image_index = image_index
    if ((pistolanim != -4))
    {
        _sprite_index = pistolanim
        _image_index = pistolindex
    }
    if (ispeppino && (room == boss_noise) && ((sprite_index == spr_playerN_doiseintro1) || (sprite_index == spr_playerN_doiseintro2) || (sprite_index == spr_playerN_doiseintro3)))
    {
        var info = get_noise_palette_info()
        pattern = info.patterntexture
        ps = info.paletteselect
        spr = info.spr_palette
    }
    if ((object_index == obj_player1))
        pattern_set(global.Base_Pattern_Color, _sprite_index, _image_index, (xscale * scale_xs), (yscale * scale_ys), pattern)
    if isgustavo
        spr = spr_ratmountpalette
    if ((!ispeppino) && instance_exists(obj_pizzaface_thunderdark))
        spr = spr_noisepalette_rage
    pal_swap_set(spr, ps, false)
    draw_sprite_ext(_sprite_index, _image_index, x, y, (xscale * scale_xs), (yscale * scale_ys), angle, b, image_alpha)
    if (global.noisejetpack && (ispeppino || noisepizzapepper))
    {
        pal_swap_set(spr_palette, 2, false)
        draw_sprite_ext(_sprite_index, _image_index, x, y, (xscale * scale_xs), (yscale * scale_ys), angle, b, image_alpha)
    }
    draw_superslam_enemy()
    if global.pistol
    {
        pal_swap_set(spr_peppalette, 0, false)
        if ((pistolcharge >= 4))
            draw_sprite(spr_revolvercharge, pistolcharge, x, (y - 70))
    }
    pattern_reset()
}

