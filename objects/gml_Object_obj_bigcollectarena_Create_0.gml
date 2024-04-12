switch obj_player1.character
{
    case "P":
    case "V":
    case "M":
        spr_collect1 = spr_pizzacollect1
        spr_collect2 = spr_pizzacollect2
        spr_collect3 = spr_pizzacollect3
        spr_collect4 = spr_pizzacollect4
        spr_collect5 = spr_pizzacollect5
        break
    case "N":
        spr_collect1 = spr_pizzacollect1halloween
        spr_collect2 = spr_pizzacollect2halloween
        spr_collect3 = spr_pizzacollect3halloween
        spr_collect4 = spr_pizzacollect2halloween
        spr_collect5 = spr_pizzacollect1halloween
        break
    case "S":
        spr_collect1 = spr_snickcollectible2
        spr_collect2 = spr_snickcollectible2
        spr_collect3 = spr_snickcollectible2
        spr_collect4 = spr_snickcollectible2
        spr_collect5 = spr_snickcollectible2
        break
}

sprite_index = choose(spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5)
image_speed = 0.35
depth = 11
value = 100
