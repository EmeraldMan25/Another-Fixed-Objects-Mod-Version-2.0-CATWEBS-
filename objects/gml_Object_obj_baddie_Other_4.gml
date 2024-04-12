var _destroyed = 0
while place_meeting(x, y, obj_solid)
    y--
if ((ds_list_find_index(global.baddieroom, id) != -1))
{
    _destroyed = 1
    instance_destroy()
}
if ((escape == 1) && (!_destroyed))
{
    if ((escapespawnID == -4))
    {
        with (instance_create(x, y, obj_escapespawn))
        {
            baddieID = other.id
            other.escapespawnID = id
        }
        instance_deactivate_object(id)
    }
}
if (elite && (object_index != obj_robot))
{
    hp += 1
    elitehp = hp
}
if ((object_index == obj_cheeseslime) && snotty)
{
    if ((global.panic == 1))
    {
        ds_list_add(global.baddieroom, id)
        instance_destroy()
    }
    important = 1
    ini_open_from_string(obj_savesystem.ini_str)
    if ini_read_real("Game", "snotty", 0)
    {
        ds_list_add(global.baddieroom, id)
        instance_destroy()
        instance_create(x, y, obj_snotty)
    }
    ini_close()
}
