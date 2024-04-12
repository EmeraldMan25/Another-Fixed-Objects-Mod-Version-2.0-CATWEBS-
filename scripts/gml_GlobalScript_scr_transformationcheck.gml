function scr_transformationcheck() //gml_Script_scr_transformationcheck
{
    if ((state != (146 << 0)) && (state != (150 << 0)))
    {
        for (var i = 0; i < array_length(transformation); i++)
        {
            if ((state == transformation[i]))
                return false;
        }
    }
    return true;
}

