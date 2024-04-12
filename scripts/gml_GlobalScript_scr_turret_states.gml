function state_turret_normal() //gml_Script_state_turret_normal
{
    sprite_index = idlespr
    can_fire = true
    var col = collision_line(x, y, targetplayer.x, targetplayer.y, obj_solid, false, true)
    var col2 = collision_line(x, y, targetplayer.x, targetplayer.y, obj_slope, false, true)
    var colX = ((image_xscale > 0) ? (targetplayer.x > x) : (targetplayer.x < x))
    var colY = ((targetplayer.bbox_bottom > bbox_top) && (targetplayer.bbox_top < bbox_bottom))
    if ((col == -4) && (col2 == -4) && colX && colY)
    {
        state = (128 << 0)
        can_fire = true
        charge_buffer = charge_max
        stopfiring = 100
    }
}

function state_turret_charge() //gml_Script_state_turret_charge
{
    sprite_index = shootspr
    if ((charge_buffer > 0))
        charge_buffer--
    else if can_fire
    {
        with (instance_create(x, y, obj_enemybullet))
        {
            image_xscale = other.image_xscale
            vsp = random_range(-1, 1)
        }
        can_fire = false
        alarm[0] = fire_max
    }
    stopfiring--
    if ((stopfiring <= 0))
    {
        state = (0 << 0)
        charge_buffer = charge_max
    }
}

