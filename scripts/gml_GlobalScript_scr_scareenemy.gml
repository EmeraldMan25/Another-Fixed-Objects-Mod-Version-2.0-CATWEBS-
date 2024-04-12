function scr_scareenemy() //gml_Script_scr_scareenemy
{
    var player = instance_nearest(x, y, obj_player)
    if ((state != (4 << 0)) && (state != (138 << 0)) && (state != (137 << 0)) && (state != (266 << 0)))
    {
        if ((player.x > (x - 400)) && (player.x < (x + 400)) && (y <= (player.y + 90)) && (y >= (player.y - 130)) && (((player.xscale > 0) && (x >= player.x)) || ((player.xscale < 0) && (x <= player.x))))
        {
            if ((sprite_index != scaredspr) && (state != (126 << 0)) && (state != (138 << 0)) && (state != (155 << 0)) && ((player.state == (41 << 0)) || (player.ratmount_movespeed == 12) || (player.state == (121 << 0)) || (player.state == (31 << 0)) || (player.state == (184 << 0)) || (player.state == (20 << 0)) || (player.state == (38 << 0)) || ((player.state == (79 << 0)) && (player.swingdingdash <= 0) && (player.sprite_index == player.spr_swingding))))
            {
                if ((collision_line(x, y, player.x, player.y, obj_solid, false, true) == -4))
                {
                    state = (126 << 0)
                    sprite_index = scaredspr
                    if ((x != player.x))
                        image_xscale = (-(sign((x - player.x))))
                    scaredbuffer = 100
                    if ((irandom(100) <= 5))
                        fmod_event_one_shot_3d("event:/sfx/voice/enemyrarescream", x, y)
                    if ((vsp < 0))
                        vsp = 0
                    if grounded
                        vsp = -3
                }
            }
        }
    }
}

