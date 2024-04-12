function cutscene_title_start() //gml_Script_cutscene_title_start
{
    with (obj_player1)
        state = (146 << 0)
    cutscene_end_action()
}

function cutscene_title_middle() //gml_Script_cutscene_title_middle
{
    var finish = false
    with (obj_title)
    {
        collide = true
        if grounded
            finish = true
    }
    if finish
        cutscene_end_action()
}

function cutscene_title_end() //gml_Script_cutscene_title_end
{
    with (obj_player1)
        sprite_index = spr_idle
    if obj_inputAssigner.device_selected[0]
    {
        with (obj_player1)
            state = (0 << 0)
        cutscene_end_action()
    }
    else
    {
        with (obj_inputAssigner)
            press_start = true
    }
}

