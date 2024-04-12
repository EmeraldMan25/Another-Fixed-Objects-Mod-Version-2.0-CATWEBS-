function totem_empty(argument0) //gml_Script_totem_empty
{
    with (argument0)
    {
        for (var i = 0; i < array_length(cheeseID); i++)
        {
            if ((cheeseID[i] == noone))
                return true;
        }
        return false;
    }
}

function totem_add(argument0, argument1) //gml_Script_totem_add
{
    with (argument0)
    {
        for (var i = 0; i < array_length(cheeseID); i++)
        {
            if ((cheeseID[i] == noone))
            {
                cheeseID[i] = argument1
                return true;
            }
        }
        return false;
    }
}

function totem_clear(argument0) //gml_Script_totem_clear
{
    with (argument0)
    {
        for (var i = 0; i < array_length(cheeseID); i++)
        {
            if ((cheeseID[i] != noone) && ((!instance_exists(cheeseID[i])) || (cheeseID[i].state != (188 << 0))))
            {
                if instance_exists(cheeseID[i])
                    cheeseID[i].totemID = -4
                cheeseID[i] = noone
            }
        }
    }
}

function totem_count(argument0) //gml_Script_totem_count
{
    var c = 0
    with (argument0)
    {
        for (var i = 0; i < array_length(cheeseID); i++)
        {
            if ((cheeseID[i] != -4))
                c++
        }
        return c;
    }
}

