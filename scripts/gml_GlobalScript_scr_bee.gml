function scr_bee_chase() //gml_Script_scr_bee_chase
{
    var spd = 4
    chase_angle = angle_rotate(chase_angle, point_direction(x, y, target_x, target_y), 3)
    x += lengthdir_x(spd, chase_angle)
    y += lengthdir_y(spd, chase_angle)
    if ((fallback_buffer > 0))
        fallback_buffer--
    if ((fallback_buffer <= 0) || distance_to_pos(x, y, target_x, target_y, (spd * 2), (spd * 2)))
        state = (126 << 0)
}

function scr_bee_idle() //gml_Script_scr_bee_idle
{
    if ((ds_stack_size(path) > LAG_STEPS))
    {
        var b = ds_stack_pop(path)
        target_x = b.x
        target_y = b.y
        state = (141 << 0)
        fallback_buffer = 80
    }
}

function scr_bee_bee() //gml_Script_scr_bee_bee
{
    switch substate
    {
        case (257 << 0):
            var dir = point_direction(x, y, playerid.x, playerid.y)
            x += lengthdir_x((playerid.movespeed - 1), dir)
            y += lengthdir_y((playerid.movespeed - 1), dir)
            if ((bee_buffer > 0))
                bee_buffer--
            else
            {
                substate = (258 << 0)
                bee_buffer = 60
                var _yy = ((y > (room_height / 2)) ? -1 : 1)
                chase_angle = point_direction(x, y, (x - playerid.xscale), (y + _yy))
            }
            break
        case (258 << 0):
            var spd = 6
            x += lengthdir_x(spd, chase_angle)
            y += lengthdir_y(spd, chase_angle)
            if ((bee_buffer > 0))
                bee_buffer--
            else
                state = (126 << 0)
            break
    }

}

function scr_bee_hurt() //gml_Script_scr_bee_hurt
{
    x = (hitX + irandom_range(-1, 1))
    y = (hitY + irandom_range(-1, 1))
    if ((inv_timer > 0))
        inv_timer--
    else
    {
        ds_stack_clear(path)
        state = (126 << 0)
    }
}

function create_bee_path() //gml_Script_create_bee_path
{
    return 
    {
        x: obj_player1.x,
        y: obj_player1.y
    };
}

