function scr_pizzaball_hit() //gml_Script_scr_pizzaball_hit
{
    x = (hitX + irandom_range(-6, 6))
    y = (hitY + irandom_range(-6, 6))
    hitLag--
    sprite_index = stunfallspr
    if ((hitLag <= 0))
    {
        x = hitX
        y = hitY
        var s = -1
        with (instance_nearest(x, y, obj_player))
            s = tauntstoredstate
        notification_push((16 << 0), [587])
        var p = obj_player1.id
        if ((s == (104 << 0)) || (p.sprite_index == p.spr_machslidestart) || (p.sprite_index == p.spr_machslide) || (p.sprite_index == p.spr_machslideend))
            scr_pizzaball_go_to_thrown((hithsp * 0.5), (hitvsp * 0.5))
        else
            scr_pizzaball_go_to_thrown((hithsp * 1.5), -12)
        global.golfhit++
    }
}

function scr_pizzaball_grabbed() //gml_Script_scr_pizzaball_grabbed
{
    var pl = ((grabbedby == 1) ? obj_player1 : obj_player2)
    with (pl)
    {
        sprite_index = spr_golfidle
        image_index = 0
        state = (148 << 0)
        golfid = other.id
        hsp = 0
        vsp = 0
    }
    player = pl
    state = (148 << 0)
    create_transformation_tip(lang_get_value("golftip"), "golf")
}

function scr_pizzaball_go_to_thrown(argument0, argument1, argument2) //gml_Script_scr_pizzaball_go_to_thrown
{
    if ((argument2 == undefined))
        argument2 = true
    instance_create_unique(156, (obj_screensizer.actual_height + 400), obj_pizzaball_golfhit)
    hitbuffer = 8
    hitspeed = abs(argument0)
    if ((sign(argument0) != 0))
        image_xscale = sign(argument0)
    jumpspeed = abs(argument1)
    if (argument2 && (jumpspeed < 12))
        jumpspeed = 12
    vsp = (-jumpspeed)
    bounced = false
    state = (156 << 0)
    substate = (156 << 0)
}

