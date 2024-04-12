if (!trapped)
{
    if ((comeback == true) && (obj_player1.state != (259 << 0)) && (obj_player1.sprite_index != spr_lonegustavo_hurt) && (obj_player1.state != (197 << 0)))
    {
        other.brick = true
        if ((other.state != (260 << 0)) && (other.state != (84 << 0)) && (other.state != (106 << 0)) && (other.state != (196 << 0)))
        {
            if (!other.grounded)
                other.sprite_index = spr_player_ratmountfall
            else
                other.sprite_index = spr_player_ratmountidle
        }
        if ((other.state == (192 << 0)))
        {
            other.sprite_index = spr_player_ratmountfall
            other.jumpAnim = false
        }
        else if ((other.state == (106 << 0)))
            other.sprite_index = spr_player_ratmountbump
        instance_create(other.x, other.y, obj_genericpoofeffect)
        instance_destroy()
    }
}
else if ((other.state == (259 << 0)) && (baddieID == noone))
{
    fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
    vsp = -6
    hsp = (other.xscale * 8)
    trapped = false
    wait = true
    comeback = false
    alarm[0] = 30
}
