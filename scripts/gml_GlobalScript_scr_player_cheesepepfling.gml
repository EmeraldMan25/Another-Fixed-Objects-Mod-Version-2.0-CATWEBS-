function scr_player_cheesepepfling() //gml_Script_scr_player_cheesepepfling
{
    hsp = 0
    sprite_index = spr_cheesepepintro
    if ((fling < 30))
        fling += 0.2
    if (!key_attack)
    {
        if ((fling > 0.5))
        {
            movespeed = fling
            hsp = (movespeed * xscale)
            vsp = -6
            state = (28 << 0)
            sprite_index = spr_cheesepepjumpstart
            image_index = 0
        }
        else
        {
            state = (24 << 0)
            sprite_index = spr_cheesepepintro
            image_index = 0
        }
    }
}

