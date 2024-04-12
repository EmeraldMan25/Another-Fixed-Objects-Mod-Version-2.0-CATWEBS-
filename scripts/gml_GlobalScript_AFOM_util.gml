function get_objectString_data(argument0, argument1) //gml_Script_get_objectString_data
{
    var object = argument0
    var jText = argument1
    var startindex = 0
    var endindex = 0
    var bracketsfound = 0
    var pos = string_pos(object, jText)
    while ((bracketsfound < 3))
    {
        if ((string_char_at(jText, pos) == "{") && (bracketsfound < 2))
        {
            bracketsfound++
            if ((bracketsfound == 2))
            {
                startindex = pos
                pos = string_pos(object, jText)
            }
        }
        if ((bracketsfound < 2))
            pos--
        else if ((bracketsfound == 2))
            pos++
        if ((string_char_at(jText, pos) == "}") && (bracketsfound == 2))
        {
            bracketsfound++
            endindex = pos
        }
    }
    var diff = (endindex - startindex)
    var newCheck = string_copy(jText, startindex, diff)
    var newString = string_delete(jText, startindex, diff)
    return [newCheck, newString];
}

