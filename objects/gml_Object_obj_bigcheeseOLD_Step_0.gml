if ((room == rm_editor))
    return;
switch state
{
    case (126 << 0):
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_turn()
        break
    case (134 << 0):
        scr_enemy_walk()
        break
    case (136 << 0):
        scr_enemy_land()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        scr_enemy_stun()
        break
    case (129 << 0):
        scr_pizzagoblin_throw()
        break
    case (4 << 0):
        scr_enemy_grabbed()
        break
    case (154 << 0):
        scr_enemy_pummel()
        break
    case (155 << 0):
        scr_enemy_staggered()
        break
    case (125 << 0):
        scr_enemy_rage()
        break
    case (17 << 0):
        scr_enemy_ghostpossess()
        break
    case (294 << 0):
        scr_enemy_pizzaheadjump()
        break
}

if ((state == (138 << 0)) && (stunned > 100) && (birdcreated == 0))
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if ((state != (138 << 0)))
    birdcreated = 0
if ((flash == 1) && (alarm[2] <= 0))
    alarm[2] = (0.15 * room_speed)
scr_scareenemy()
var player = instance_nearest(x, y, obj_player)
if ((state != (4 << 0)))
    depth = 0
if ((state != (138 << 0)))
    thrown = 0
if ((boundbox == 0))
{
    with (instance_create(x, y, obj_baddiecollisionboxTEST))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
