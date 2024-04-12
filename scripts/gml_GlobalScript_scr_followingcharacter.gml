function following_character_init() //gml_Script_following_character_init
{
    xoffset = 25
    yoffset = 2
    LAG_STEPS = 20
    followqueue = ds_queue_create()
    instakilled = false
    dir = obj_player1.xscale
    space = 0
    maxspace = 1
    spaceaccel = 0.2
    lastplayerposx = obj_player1.x
    lastplayerposy = obj_player1.y
    hsp = 0
    vsp = 0
    hsp_carry = 0
    vsp_carry = 0
    platformid = noone
    grav = 0.5
    grounded = false
    use_collision = false
    interp = 0.05
    lock = false
    depth = -6
}

function following_character_delete() //gml_Script_following_character_delete
{
    var p = ds_list_find_index(global.followerlist, id)
    if ((p != -1))
    {
        ds_list_delete(global.followerlist, p)
        var _id = id
        with (obj_followcharacter)
        {
            if ((id != _id))
            {
                pos = ds_list_find_index(global.followerlist, id)
                followid = ((pos > 0) ? ds_list_find_value(global.followerlist, (pos - 1)) : -4)
            }
        }
    }
}

function following_character_calculate() //gml_Script_following_character_calculate
{
    with (obj_followcharacter)
    {
        pos = ds_list_find_index(global.followerlist, id)
        followid = ((pos > 0) ? ds_list_find_value(global.followerlist, (pos - 1)) : -4)
    }
}

function following_add_to_front() //gml_Script_following_add_to_front
{
    var i = 0
    while ((ds_list_find_index(global.followerlist, id) != -1))
    {
        ds_list_delete(global.followerlist, ds_list_find_index(global.followerlist, id))
        i++
        if ((i > 50))
            break
    }
    ds_list_insert(global.followerlist, 0, id)
    pos = ds_list_find_index(global.followerlist, id)
    followid = ((pos > 0) ? ds_list_find_value(global.followerlist, (pos - 1)) : -4)
    following_character_calculate()
}

function farmer_rearrange() //gml_Script_farmer_rearrange
{
    with (obj_farmer1follow)
    {
        if ((farmerpos == obj_player1.farmerpos))
            following_add_to_front()
    }
}

function following_has_follower(argument0) //gml_Script_following_has_follower
{
    for (var i = 0; i < ds_list_size(global.followerlist); i++)
    {
        var b = ds_list_find_value(global.followerlist, i)
        if (instance_exists(b) && (b.object_index == argument0))
            return true;
    }
    return false;
}

function following_count(argument0) //gml_Script_following_count
{
    var n = 0
    for (var i = 0; i < ds_list_size(global.followerlist); i++)
    {
        var b = ds_list_find_value(global.followerlist, i)
        if (instance_exists(b) && (b.object_index == argument0))
            n++
    }
    return n;
}

function following_moonwalk_fix() //gml_Script_following_moonwalk_fix
{
    if (!instance_exists(playerid))
        return;
    if ((playerid.object_index != obj_player1))
        return;
    if ((playerid.state == (306 << 0)) && (playerid.hsp != 0))
        image_xscale = (sign(playerid.hsp) * playerid.scale_xs)
}

