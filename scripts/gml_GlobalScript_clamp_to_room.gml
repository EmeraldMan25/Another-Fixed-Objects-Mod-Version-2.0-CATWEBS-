function clamp_to_room(argument0) //gml_Script_clamp_to_room
{
    while ((bbox_top < argument0.y))
        y++
    while ((bbox_bottom > (argument0.y + argument0.height)))
        y--
    while ((bbox_left < argument0.x))
        x++
    while ((bbox_right > (argument0.x + argument0.width)))
        x--
}

