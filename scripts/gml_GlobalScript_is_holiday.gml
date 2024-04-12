function is_holiday(argument0) //gml_Script_is_holiday
{
    if ((global.holiday != argument0))
        return false;
    var found = false
    for (var i = 0; i < 3; i++)
    {
        if ((global.game[i].judgement != "none") || (global.gameN[i].judgement != "none"))
        {
            found = true
            return true;
        }
    }
    return false;
}

