function cutscene_wait(argument0) //gml_Script_cutscene_wait
{
    timer++
    if ((timer >= argument0))
    {
        timer = 0
        cutscene_end_action()
    }
}

