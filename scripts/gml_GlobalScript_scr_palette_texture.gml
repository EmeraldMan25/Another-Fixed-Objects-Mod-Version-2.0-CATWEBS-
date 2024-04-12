function scr_palette_textureOLD() //gml_Script_scr_palette_textureOLD
{
    var cx = camera_get_view_x(view_camera[0])
    var cy = camera_get_view_y(view_camera[0])
    gpu_set_blendenable(false)
    gpu_set_colorwriteenable(false, false, false, true)
    draw_set_alpha(0)
    draw_rectangle(cx, cy, (cx + 960), (cy + 540), false)
    draw_set_alpha(1)
    draw_sprite_ext(sprite, index, _x, _y, _xscale, _yscale, _angle, blend, 1)
    gpu_set_blendenable(true)
    gpu_set_colorwriteenable(true, true, true, true)
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha)
    gpu_set_alphatestenable(true)
    var xs = (sprite_get_width(sprite) / sprite_get_width(global.palettetexture))
    var ys = (sprite_get_height(sprite) / sprite_get_height(global.palettetexture))
    var xx = _x
    var yy = _y
    draw_sprite_ext(global.palettetexture, 0, xx, yy, xs, ys, 0, blend, alpha)
    gpu_set_alphatestenable(false)
    if (!_gui)
        gpu_set_blendmode(bm_normal)
    else
        reset_blendmode()
}

function scr_get_texture_array() //gml_Script_scr_get_texture_array
{
    return [["funny", 4398], ["itchy", 511], ["pizza", 3125], ["stripes", 1806], ["goldemanne", 4065], ["bones", 4322], ["pp", 4293], ["war", 917], ["john", 4315], ["candy", 4546], ["bloodstained", 2999], ["bat", 3635], ["pumpkin", 1988], ["fur", 2047], ["flesh", 4577], ["racer", 699], ["comedian", 656], ["banana", 4035], ["noiseTV", 3629], ["madman", 4488], ["bubbly", 3863], ["welldone", 2633], ["grannykisses", 1930], ["towerguy", 2277]];
}

function scr_get_texture_palette(argument0) //gml_Script_scr_get_texture_palette
{
    var _arr = scr_get_texture_array()
    if ((argument0 != "none"))
    {
        for (var i = 0; i < array_length(_arr); i++)
        {
            if ((_arr[i][0] == argument0))
                return _arr[i][1];
        }
    }
    return -4;
}

function scr_get_texture_name(argument0) //gml_Script_scr_get_texture_name
{
    var _arr = scr_get_texture_array()
    if ((argument0 != -4))
    {
        for (var i = 0; i < array_length(_arr); i++)
        {
            if ((_arr[i][1] == argument0))
                return _arr[i][0];
        }
    }
    return "none";
}

function scr_palette_texture(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) //gml_Script_scr_palette_texture
{
    if ((argument6 == undefined))
        argument6 = 0
    if ((argument7 == undefined))
        argument7 = c_white
    if ((argument8 == undefined))
        argument8 = 1
    if ((argument9 == undefined))
        argument9 = false
    if ((argument10 == undefined))
        argument10 = -4
    if ((argument10 == -4))
        argument10 = global.palettetexture
    if ((argument10 == -4))
        return;
    if ((event_type == 8) && (event_number == 64))
        argument9 = true
    else
        argument9 = false
    if ((shader_current() == global.Pal_Shader))
        pal_swap_set(spr_peppalette, 1, false)
    if (!surface_exists(global.palettesurface))
        global.palettesurface = surface_create(960, 540)
    if (!surface_exists(global.palettesurfaceclip))
        global.palettesurfaceclip = surface_create(960, 540)
    var cx = camera_get_view_x(view_camera[0])
    var cy = camera_get_view_y(view_camera[0])
    if argument9
    {
        cx = 0
        cy = 0
    }
    surface_set_target(global.palettesurfaceclip)
    draw_clear_alpha(c_black, 0)
    draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, false)
    gpu_set_blendmode(bm_subtract)
    draw_sprite_ext(argument0, argument1, (argument2 - cx), (argument3 - cy), argument4, argument5, argument6, c_white, 1)
    if argument9
        reset_blendmode()
    else
        gpu_set_blendmode(bm_normal)
    surface_reset_target()
    surface_set_target(global.palettesurface)
    var sw = sprite_get_width(argument0)
    var sh = sprite_get_height(argument0)
    var xs = (sw / sprite_get_width(argument10))
    var ys = (sh / sprite_get_height(argument10))
    var xo = sprite_get_xoffset(argument0)
    var yo = sprite_get_yoffset(argument0)
    var xx = ((argument2 - cx) - xo)
    var yy = ((argument3 - cy) - yo)
    if ((argument4 < 0))
        xx = (((argument2 - cx) + xo) - sw)
    if ((argument5 < 0))
        yy = (((argument3 - cy) + yo) - sh)
    draw_sprite_ext(argument10, 0, xx, yy, (xs + 4), (ys + 4), 0, argument7, 1)
    gpu_set_blendmode(bm_subtract)
    draw_surface(global.palettesurfaceclip, 0, 0)
    if argument9
        reset_blendmode()
    else
        gpu_set_blendmode(bm_normal)
    surface_reset_target()
    draw_surface_ext(global.palettesurface, cx, cy, 1, 1, 0, c_white, argument8)
}

