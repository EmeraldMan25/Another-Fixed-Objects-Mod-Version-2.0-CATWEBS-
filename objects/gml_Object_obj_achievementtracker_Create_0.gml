if ((instance_number(object_index) > 1))
{
    instance_destroy()
    return;
}
global.steam_achievements = ds_map_create()
ds_map_set(global.steam_achievements, "entrance1", "ACH_ENTRANCE_1")
ds_map_set(global.steam_achievements, "entrance2", "ACH_ENTRANCE_2")
ds_map_set(global.steam_achievements, "entrance3", "ACH_ENTRANCE_3")
ds_map_set(global.steam_achievements, "medieval1", "ACH_MEDIEVAL_1")
ds_map_set(global.steam_achievements, "medieval2", "ACH_MEDIEVAL_2")
ds_map_set(global.steam_achievements, "medieval3", "ACH_MEDIEVAL_3")
ds_map_set(global.steam_achievements, "ruin1", "ACH_RUIN_1")
ds_map_set(global.steam_achievements, "ruin2", "ACH_RUIN_2")
ds_map_set(global.steam_achievements, "ruin3", "ACH_RUIN_3")
ds_map_set(global.steam_achievements, "dungeon1", "ACH_DUNGEON_1")
ds_map_set(global.steam_achievements, "dungeon2", "ACH_DUNGEON_2")
ds_map_set(global.steam_achievements, "dungeon3", "ACH_DUNGEON_3")
ds_map_set(global.steam_achievements, "badland1", "ACH_BADLAND_1")
ds_map_set(global.steam_achievements, "badland2", "ACH_BADLAND_2")
ds_map_set(global.steam_achievements, "badland3", "ACH_BADLAND_3")
ds_map_set(global.steam_achievements, "graveyard1", "ACH_GRAVEYARD_1")
ds_map_set(global.steam_achievements, "graveyard2", "ACH_GRAVEYARD_2")
ds_map_set(global.steam_achievements, "graveyard3", "ACH_GRAVEYARD_3")
ds_map_set(global.steam_achievements, "farm1", "ACH_FARM_1")
ds_map_set(global.steam_achievements, "farm2", "ACH_FARM_2")
ds_map_set(global.steam_achievements, "farm3", "ACH_FARM_3")
ds_map_set(global.steam_achievements, "saloon1", "ACH_SALOON_1")
ds_map_set(global.steam_achievements, "saloon2", "ACH_SALOON_2")
ds_map_set(global.steam_achievements, "saloon3", "ACH_SALOON_3")
ds_map_set(global.steam_achievements, "plage1", "ACH_BEACH_1")
ds_map_set(global.steam_achievements, "plage2", "ACH_BEACH_2")
ds_map_set(global.steam_achievements, "plage3", "ACH_BEACH_3")
ds_map_set(global.steam_achievements, "forest1", "ACH_FOREST_1")
ds_map_set(global.steam_achievements, "forest2", "ACH_FOREST_2")
ds_map_set(global.steam_achievements, "forest3", "ACH_FOREST_3")
ds_map_set(global.steam_achievements, "space1", "ACH_SPACE_1")
ds_map_set(global.steam_achievements, "space2", "ACH_SPACE_2")
ds_map_set(global.steam_achievements, "space3", "ACH_SPACE_3")
ds_map_set(global.steam_achievements, "minigolf1", "ACH_GOLF_1")
ds_map_set(global.steam_achievements, "minigolf2", "ACH_GOLF_2")
ds_map_set(global.steam_achievements, "minigolf3", "ACH_GOLF_3")
ds_map_set(global.steam_achievements, "street1", "ACH_STREET_1")
ds_map_set(global.steam_achievements, "street2", "ACH_STREET_2")
ds_map_set(global.steam_achievements, "street3", "ACH_STREET_3")
ds_map_set(global.steam_achievements, "sewer1", "ACH_SEWER_1")
ds_map_set(global.steam_achievements, "sewer2", "ACH_SEWER_2")
ds_map_set(global.steam_achievements, "sewer3", "ACH_SEWER_3")
ds_map_set(global.steam_achievements, "industrial1", "ACH_INDUSTRIAL_1")
ds_map_set(global.steam_achievements, "industrial2", "ACH_INDUSTRIAL_2")
ds_map_set(global.steam_achievements, "industrial3", "ACH_INDUSTRIAL_3")
ds_map_set(global.steam_achievements, "freezer1", "ACH_FREEZER_1")
ds_map_set(global.steam_achievements, "freezer2", "ACH_FREEZER_2")
ds_map_set(global.steam_achievements, "freezer3", "ACH_FREEZER_3")
ds_map_set(global.steam_achievements, "chateau1", "ACH_CHATEAU_1")
ds_map_set(global.steam_achievements, "chateau2", "ACH_CHATEAU_2")
ds_map_set(global.steam_achievements, "chateau3", "ACH_CHATEAU_3")
ds_map_set(global.steam_achievements, "kidsparty1", "ACH_KIDSPARTY_1")
ds_map_set(global.steam_achievements, "kidsparty2", "ACH_KIDSPARTY_2")
ds_map_set(global.steam_achievements, "kidsparty3", "ACH_KIDSPARTY_3")
ds_map_set(global.steam_achievements, "war1", "ACH_WAR_1")
ds_map_set(global.steam_achievements, "war2", "ACH_WAR_2")
ds_map_set(global.steam_achievements, "war3", "ACH_WAR_3")
ds_map_set(global.steam_achievements, "pepperman", "ACH_BOSS_1")
ds_map_set(global.steam_achievements, "vigilante", "ACH_BOSS_2")
ds_map_set(global.steam_achievements, "noise", "ACH_BOSS_3")
ds_map_set(global.steam_achievements, "fakepep", "ACH_BOSS_4")
ds_map_set(global.steam_achievements, "pizzaface", "ACH_BOSS_5")
ds_map_set(global.steam_achievements, "sranks1", "ACH_SRANK_1")
ds_map_set(global.steam_achievements, "sranks2", "ACH_SRANK_2")
ds_map_set(global.steam_achievements, "sranks3", "ACH_SRANK_3")
ds_map_set(global.steam_achievements, "sranks4", "ACH_SRANK_4")
ds_map_set(global.steam_achievements, "sranks5", "ACH_SRANK_5")
ds_map_set(global.steam_achievements, "pranks1", "ACH_PRANK_1")
ds_map_set(global.steam_achievements, "pranks2", "ACH_PRANK_2")
ds_map_set(global.steam_achievements, "pranks3", "ACH_PRANK_3")
ds_map_set(global.steam_achievements, "pranks4", "ACH_PRANK_4")
ds_map_set(global.steam_achievements, "pranks5", "ACH_PRANK_5")
ds_map_set(global.steam_achievements, "halloween1", "ACH_HALLOWEEN_1")
ds_map_set(global.steam_achievements, "halloween2", "ACH_HALLOWEEN_2")
achievements_update = []
achievements_notify = []
notify_queue = ds_queue_create()
unlock_queue = ds_queue_create()
ispeppino = true
add_rank_achievements(1, "s", spr_achievement_srank, 0, ["entrance", "medieval", "ruin", "dungeon"])
add_rank_achievements(2, "s", spr_achievement_srank, 1, ["badland", "graveyard", "saloon", "farm"])
add_rank_achievements(3, "s", spr_achievement_srank, 2, ["plage", "forest", "space", "minigolf"])
add_rank_achievements(4, "s", spr_achievement_srank, 3, ["street", "sewer", "industrial", "freezer"])
add_rank_achievements(5, "s", spr_achievement_srank, 4, ["chateau", "kidsparty", "war"])
add_rank_achievements(1, "p", spr_achievement_prank, 0, ["entrance", "medieval", "ruin", "dungeon"])
add_rank_achievements(2, "p", spr_achievement_prank, 1, ["badland", "graveyard", "saloon", "farm"])
add_rank_achievements(3, "p", spr_achievement_prank, 2, ["plage", "forest", "space", "minigolf"])
add_rank_achievements(4, "p", spr_achievement_prank, 3, ["street", "sewer", "industrial", "freezer"])
add_rank_achievements(5, "p", spr_achievement_prank, 4, ["chateau", "kidsparty", "war"])
add_boss_achievements("pepperman", boss_pepperman, spr_achievement_bosses, 0)
add_boss_achievements("vigilante", boss_vigilante, spr_achievement_bosses, 1)
add_boss_achievements("noise", boss_noise, spr_achievement_bosses, 2)
add_boss_achievements("fakepep", boss_fakepep, spr_achievement_bosses, 3)
add_boss_achievements("pizzaface", boss_pizzafacehub, spr_achievement_bosses, 4)
add_achievement_notify("pal_unfunny", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_6258_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (51 << 0)) && (arr[0] >= obj_credits))
        palette_unlock(name, "unfunny", 3)
}
, false, "Palettes", "unfunny")
add_achievement_notify("pal_mooney", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_6566_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    if global.swapmode
        return;
    var type = argument0[0]
    if ((type == (58 << 0)))
        palette_unlock(name, "mooney", 15)
}
, false, "Palettes", "mooney")
add_achievement_notify("pal_sage", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_6960_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    if ((type == (5 << 0)))
    {
        var _found = false
        ini_open_from_string(obj_savesystem.ini_str)
        var lvl = ["entrance", "medieval", "ruin", "dungeon"]
        var i = 0
        while ((i < array_length(lvl)))
        {
            if ((ini_read_real("Highscore", lvl[i], 0) == 0))
            {
                _found = true
                break
            }
            else
                i++
        }
        ini_close()
        if ((!_found) && (global.file_minutes < 60))
            palette_unlock(name, "sage", 5)
    }
}
, false, "Palettes", "sage")
add_achievement_notify("pal_money", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_7727_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    if ((type == (5 << 0)))
    {
        var _money = 0
        ini_open_from_string(obj_savesystem.ini_str)
        var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon"]
        for (var i = 0; i < array_length(lvl); i++)
        {
            for (var j = 0; j < 5; j++)
            {
                if ((ini_read_real("Toppin", concat(lvl[i], (j + 1)), false) == true))
                    _money += 10
            }
        }
        _money -= ini_read_real("w1stick", "reduction", 0)
        _money -= ini_read_real("w2stick", "reduction", 0)
        ini_close()
        if ((_money >= 300))
            palette_unlock(name, "money", 4)
    }
}
, false, "Palettes", "money")
add_achievement_notify("pal_blood", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_8621_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    if ((type == (5 << 0)))
    {
        ini_open_from_string(obj_savesystem.ini_str)
        var _count = ini_read_real("Game", "enemies", 0)
        ini_close()
        if ((_count >= obj_cheesedragonshadow))
            palette_unlock(name, "blood", 6)
    }
}
, false, "Palettes", "blood")
add_achievement_notify("pal_tv", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_9079_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    if ((type == (5 << 0)))
    {
        ini_open_from_string(obj_savesystem.ini_str)
        var _found = false
        var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"]
        var map = ds_map_create()
        ds_map_set(map, "p", 5)
        ds_map_set(map, "s", 4)
        ds_map_set(map, "a", 3)
        ds_map_set(map, "b", 2)
        ds_map_set(map, "c", 1)
        ds_map_set(map, "d", 0)
        for (var i = 0; i < array_length(lvl); i++)
        {
            var rank = ini_read_string("Ranks", lvl[i], "d")
            if ((ds_map_find_value(map, rank) < ds_map_find_value(map, "p")))
                _found = true
        }
        ds_map_destroy(map)
        ini_close()
        if (!_found)
            palette_unlock(name, "tv", 7)
    }
}
, false, "Palettes", "tv")
add_achievement_notify("pal_dark", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_10157_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (52 << 0)) && ((arr[0] == "pepperman") || (arr[0] == "vigilante") || (arr[0] == "noise") || (arr[0] == "fakepep") || (arr[0] == "pizzaface")))
    {
        ini_open_from_string(obj_savesystem.ini_str)
        var _found = false
        var ach = ["pepperman", "vigilante", "noise", "fakepep", "pizzaface"]
        for (var i = 0; i < array_length(ach); i++)
        {
            if ((ini_read_real("achievements", ach[i], false) == false))
                _found = true
        }
        ini_close()
        if (!_found)
            palette_unlock(name, "dark", 8)
    }
}
, false, "Palettes", "dark")
add_achievement_notify("pal_shitty", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_11028_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    if ((type == (53 << 0)))
        palette_unlock(name, "shitty", 9)
}
, false, "Palettes", "shitty")
add_achievement_notify("pal_golden", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_11363_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    if ((type == (5 << 0)))
    {
        ini_open_from_string(obj_savesystem.ini_str)
        var _found = false
        var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"]
        var map = ds_map_create()
        ds_map_set(map, "p", 5)
        ds_map_set(map, "s", 4)
        ds_map_set(map, "a", 3)
        ds_map_set(map, "b", 2)
        ds_map_set(map, "c", 1)
        ds_map_set(map, "d", 0)
        for (var i = 0; i < array_length(lvl); i++)
        {
            var rank = ini_read_string("Ranks", lvl[i], "d")
            if ((ds_map_find_value(map, rank) < ds_map_find_value(map, "s")))
                _found = true
        }
        ds_map_destroy(map)
        ini_close()
        if (!_found)
            palette_unlock(name, "golden", 10)
    }
}
, false, "Palettes", "golden")
add_achievement_notify("pal_garish", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_12438_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("garish_count", 0, true, false)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_12516_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    if ((type == (55 << 0)))
    {
        achievement_get_variable("garish_count").value = (achievement_get_variable("garish_count").value + 1)
        if ((achievement_get_variable("garish_count").value >= 50))
            palette_unlock(name, "garish", 11)
    }
}
, false, "Palettes", "garish")
add_achievement_notify("pal_funny", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_12986_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (51 << 0)) && (arr[0] >= obj_ufobullet) && (arr[0] < obj_credits))
        palette_unlock(name, "funny", 12, spr_peppattern1)
}
, false, "Palettes", "funny")
add_achievement_notify("pal_itchy", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_13386_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    var arr = argument0[1]
    if ((global.leveltosave == "street") && (type == (7 << 0)) && (arr[2] == obj_grandpa))
        palette_unlock(name, "itchy", 12, spr_peppattern2)
}
, false, "Palettes", "itchy")
add_achievement_notify("pal_pizza", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_13800_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    if ((type == (54 << 0)))
        palette_unlock(name, "pizza", 12, spr_peppattern3)
}
, false, "Palettes", "pizza")
add_achievement_notify("pal_stripes", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_14126_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("stripes_count", 0, true, false)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_14205_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    if ((type == (35 << 0)))
    {
        achievement_get_variable("stripes_count").value = (achievement_get_variable("stripes_count").value + 1)
        if ((achievement_get_variable("stripes_count").value >= 30))
            palette_unlock(name, "stripes", 12, spr_peppattern4)
    }
}
, false, "Palettes", "stripes")
add_achievement_notify("pal_goldemanne", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_14691_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    if ((type == (52 << 0)))
    {
        var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"]
        var ach = ["pepperman", "vigilante", "noise", "fakepep", "pizzaface", "sranks1", "sranks2", "sranks3", "sranks4", "sranks5"]
        for (var i = 0; i < array_length(lvl); i++)
        {
            var b = lvl[i]
            for (var j = 0; j < 3; j++)
                array_push(ach, concat(b, (j + 1)))
        }
        var _found = false
        ini_open_from_string(obj_savesystem.ini_str)
        i = 0
        while ((i < array_length(ach)))
        {
            if ((ini_read_real("achievements", ach[i], false) == false))
            {
                _found = true
                break
            }
            else
                i++
        }
        ini_close()
        if (!_found)
            palette_unlock(name, "goldemanne", 12, spr_peppattern5)
    }
}
, false, "Palettes", "goldemanne")
add_achievement_notify("pal_badbones", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_15938_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("badbones_count", 0, true, false)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_16018_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    if ((type == (7 << 0)))
    {
        achievement_get_variable("badbones_count").value = (achievement_get_variable("badbones_count").value + 1)
        if ((achievement_get_variable("badbones_count").value >= 50))
            palette_unlock(name, "bones", 12, spr_peppattern6)
    }
}
, false, "Palettes", "bones")
add_achievement_notify("pal_pp", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_16463_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    if ((type == (54 << 0)))
    {
        ini_open_from_string(obj_savesystem.ini_str_options)
        var n = ini_read_real("Game", "beaten", 0)
        n++
        ini_write_real("Game", "beaten", n)
        gamesave_async_save_options()
        obj_savesystem.ini_str_options = ini_close()
        if ((n >= obj_hardmode))
            palette_unlock(name, "pp", 12, spr_peppattern7)
    }
}
, false, "Palettes", "pp")
add_achievement_notify("pal_war", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_17054_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (5 << 0)) && (arr[0] == "war"))
    {
        ini_open_from_string(obj_savesystem.ini_str)
        var n = ini_read_real("Attempts", "war", 0)
        ini_close()
        if ((n <= obj_doisedead))
            palette_unlock(name, "war", 12, spr_peppattern8)
    }
}
, false, "Palettes", "war")
add_achievement_notify("pal_john", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_17602_gml_Object_obj_achievementtracker_Create_0
{
    if (!obj_achievementtracker.ispeppino)
        return;
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (56 << 0)) && (global.file_minutes < 135))
        palette_unlock(name, "john", 12, spr_peppattern9)
}
, false, "Palettes", "john")
var pats = [["candy", 5, 4546], ["bloodstained", 10, 2999], ["bat", 15, 3635], ["pumpkin", 20, 1988], ["fur", 25, 2047], ["flesh", 30, 4577]]
for (var i = 0; i < array_length(pats); i++)
{
    var pat = pats[i]
    var p = add_achievement_notify(concat("pal_", pat[0]), -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_18289_gml_Object_obj_achievementtracker_Create_0
    {
        var type = argument0[0]
        var arr = argument0[1]
        if ((type == (60 << 0)) && (arr[0] >= pattern[1]))
            palette_unlock(name, pattern[0], 12, pattern[2])
    }
, false, "Palettes", pat[0])
    if ((!is_undefined(p)) && (!p.unlocked))
        p.pattern = pat
}
add_achievement_update("pal_boise", 1, function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_18792_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("boise_prevstate", (0 << 0))
    achievement_add_variable("boise_count", 0)
}
, function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_18918_gml_Object_obj_achievementtracker_Create_0
{
    if obj_achievementtracker.ispeppino
        return;
    var _state = achievement_get_variable("boise_prevstate")
    var _count = achievement_get_variable("boise_count")
    if ((obj_player1.state != _state.value) && (obj_player1.state != (61 << 0)))
    {
        if ((obj_player1.state == (198 << 0)))
            _count.value += 0.5
        else if ((_count.value > 0) && ((obj_player1.sprite_index == spr_playerN_sidewayspin) || (obj_player1.sprite_index == spr_playerN_sidewayspinend)))
            _count.value += 0.5
        if ((_count.value >= 3))
            palette_unlock(name, "boise", 3, -4, false)
        _state.value = obj_player1.state
    }
    if (obj_player1.grounded || ((obj_player1.state != (198 << 0)) && (obj_player1.state != (61 << 0)) && (obj_player1.sprite_index != spr_playerN_sidewayspin) && (obj_player1.sprite_index != spr_playerN_sidewayspinend)))
        _count.value = 0
}
, false, "Palettes", "boise")
add_achievement_notify("pal_roise", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_19947_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("roise_count", 0)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_20011_gml_Object_obj_achievementtracker_Create_0
{
    if obj_achievementtracker.ispeppino
        return;
    var type = argument0[0]
    var arr = argument0[1]
    var count = achievement_get_variable("roise_count")
    if ((type == (64 << 0)))
        count.value = 0
    else if ((type == (2 << 0)) && ((obj_player1.sprite_index == spr_playerN_divebomb) || (obj_player1.sprite_index == spr_playerN_divebombfall) || (obj_player1.sprite_index == spr_playerN_divebombland)))
    {
        count.value++
        if ((count.value >= 4))
            palette_unlock(name, "roise", 4, -4, false)
    }
}
, false, "Palettes", "roise")
add_achievement_notify("pal_poise", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_20704_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("poise_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_20781_gml_Object_obj_achievementtracker_Create_0
{
    if obj_achievementtracker.ispeppino
        return;
    var type = argument0[0]
    var arr = argument0[1]
    var count = achievement_get_variable("poise_count")
    if ((type == (65 << 0)))
        count.value++
    else if ((type == (5 << 0)) && (global.rank == "p") && (count.value >= 10))
        palette_unlock(name, "poise", 5, -4, false)
}
, false, "Palettes", "poise")
add_achievement_notify("pal_reverse", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_21295_gml_Object_obj_achievementtracker_Create_0
{
    if obj_achievementtracker.ispeppino
        return;
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (5 << 0)) && (global.rank == "d") && (global.leveltosave == "entrance"))
        palette_unlock(name, "reverse", 6, -4, false)
}
, false, "Palettes", "reverse")
pats = [["critic", 7, 510], ["outlaw", 8, 511], ["antidoise", 9, 512], ["flesheater", 10, 779], ["super", 11, 783]]
for (i = 0; i < array_length(pats); i++)
{
    pat = pats[i]
    p = add_achievement_notify(concat("pal_", pat[0]), function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_21939_gml_Object_obj_achievementtracker_Create_0
    {
        achievement_add_variable("count", 0, false, true)
    }
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_22016_gml_Object_obj_achievementtracker_Create_0
    {
        if obj_achievementtracker.ispeppino
            return;
        var type = argument0[0]
        var arr = argument0[1]
        var count = achievement_get_variable("count")
        if ((type == (66 << 0)))
            count.value++
        else if ((type == (50 << 0)) && (arr[0] == pattern[2]) && (count.value <= 0))
            palette_unlock(name, pattern[0], pattern[1], -4, false)
    }
, false, "Palettes", pat[0])
    if ((!is_undefined(p)) && (!p.unlocked))
        p.pattern = pat
}
add_achievement_notify("pal_porcupine", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_22621_gml_Object_obj_achievementtracker_Create_0
{
    if obj_achievementtracker.ispeppino
        return;
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (67 << 0)) && (arr[0] == "quick"))
        palette_unlock(name, "porcupine", 15, -4, false)
}
, false, "Palettes", "porcupine")
add_achievement_notify("pal_feminine", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_23016_gml_Object_obj_achievementtracker_Create_0
{
    if (obj_achievementtracker.ispeppino && (!global.swapmode))
        return;
    var type = argument0[0]
    if ((type == (58 << 0)))
        palette_unlock(name, "feminine", 16, -4, false)
}
, false, "Palettes", "feminine")
add_achievement_update("pal_realdoise", 2, -4, function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_23429_gml_Object_obj_achievementtracker_Create_0
{
    if obj_achievementtracker.ispeppino
        return;
    if ((obj_player1.state == (0 << 0)) && (obj_player1.sprite_index == obj_player1.spr_breakdance) && (room == boss_pizzaface) && instance_exists(obj_noiseboss))
        palette_unlock(name, "realdoise", 17, -4, false)
}
, false, "Palettes", "realdoise")
add_achievement_notify("pal_forest", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_23882_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("forest_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_23960_gml_Object_obj_achievementtracker_Create_0
{
    if obj_achievementtracker.ispeppino
        return;
    var type = argument0[0]
    var arr = argument0[1]
    var count = achievement_get_variable("forest_count")
    if ((type == (2 << 0)) && (arr[2] == obj_noisegoblin))
        count.value++
    else if ((type == (5 << 0)) && (arr[0] == "forest") && (count.value <= 0))
        palette_unlock(name, "forest", 18, -4, false)
}
, false, "Palettes", "forest")
add_achievement_notify("pal_racer", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_24551_gml_Object_obj_achievementtracker_Create_0
{
    if obj_achievementtracker.ispeppino
        return;
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (54 << 0)))
    {
        var game = global.game[(global.currentsavefile - 1)]
        var noise_secs = ((global.file_minutes * 60) + global.file_seconds)
        var pep_secs = ((game.minutes * 60) + game.seconds)
        if ((game.judgement != "none") && (noise_secs < pep_secs))
            palette_unlock(name, "racer", 28, spr_noisepattern1, false)
    }
}
, false, "Palettes", "racer")
add_achievement_update("pal_comedian", 1, function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_25180_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("comedian_count", 0, false, false)
}
, function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_25261_gml_Object_obj_achievementtracker_Create_0
{
    if obj_achievementtracker.ispeppino
        return;
    var count = achievement_get_variable("comedian_count")
    var arr = [88, 526, 532, 11, 1142, 150, 51]
    var found = false
    var i = 0
    while ((i < array_length(arr)))
    {
        if instance_exists(arr[i])
        {
            found = true
            break
        }
        else
            i++
    }
    if (!found)
    {
        count.value = 0
        return;
    }
    if ((obj_player1.sprite_index == obj_player1.spr_breakdance))
    {
        count.value++
        if ((count.value >= 600))
            palette_unlock(name, "comedian", 27, spr_noisepattern2, false)
    }
    else
        count.value = 0
}
, false, "Palettes", "comedian")
add_achievement_notify("pal_banana", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_26102_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("banana_count", 0, true, false)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_26180_gml_Object_obj_achievementtracker_Create_0
{
    if obj_achievementtracker.ispeppino
        return;
    var type = argument0[0]
    var count = achievement_get_variable("banana_count")
    if ((type == (69 << 0)))
    {
        count.value++
        if ((count.value >= 10))
            palette_unlock(name, "banana", 26, spr_noisepattern3, false)
    }
}
, false, "Palettes", "banana")
add_achievement_update("pal_noiseTV", 1, -4, function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_26642_gml_Object_obj_achievementtracker_Create_0
{
    if ((!instance_exists(obj_tv)) || obj_achievementtracker.ispeppino)
        return;
    if ((obj_tv.idlespr == spr_tv_exprheatN))
        palette_unlock(name, "noiseTV", 25, spr_noisepattern4, false)
}
, false, "Palettes", "noiseTV")
add_achievement_notify("pal_madman", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_26936_gml_Object_obj_achievementtracker_Create_0
{
    if obj_achievementtracker.ispeppino
        return;
    var type = argument0[0]
    if ((type == (70 << 0)))
        palette_unlock(name, "madman", 24, spr_noisepattern5, false)
}
, false, "Palettes", "madman")
add_achievement_notify("pal_bubbly", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_27272_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("bubbly_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_27350_gml_Object_obj_achievementtracker_Create_0
{
    if obj_achievementtracker.ispeppino
        return;
    var type = argument0[0]
    var arr = argument0[1]
    var count = achievement_get_variable("bubbly_count")
    if ((type == (71 << 0)) && (arr[0] == "space"))
    {
        count.value++
        if ((count.value >= 21))
            palette_unlock(name, "bubbly", 23, spr_noisepattern6, false)
    }
}
, false, "Palettes", "bubbly")
add_achievement_notify("pal_welldone", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_27839_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("welldone_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_27919_gml_Object_obj_achievementtracker_Create_0
{
    if obj_achievementtracker.ispeppino
        return;
    var type = argument0[0]
    var arr = argument0[1]
    var count = achievement_get_variable("welldone_count")
    if ((type == (39 << 0)) && (arr[0] == "badland"))
    {
        count.value++
        if ((count.value >= 45))
            palette_unlock(name, "welldone", 22, spr_noisepattern7, false)
    }
}
, false, "Palettes", "welldone")
add_achievement_notify("pal_grannykisses", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_28427_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("granny_hubtips1", false, true, false)
    achievement_add_variable("granny_hubtips2", false, true, false)
    achievement_add_variable("granny_hubtips3", false, true, false)
    achievement_add_variable("granny_hubtips4", false, true, false)
    achievement_add_variable("granny_hubtips5", false, true, false)
    achievement_add_variable("granny_hubtips6", false, true, false)
    achievement_add_variable("granny_hubtips7N", false, true, false)
    achievement_add_variable("granny_hubtips8", false, true, false)
    achievement_add_variable("granny_hubtips9", false, true, false)
    achievement_add_variable("granny_garbage1N", false, true, false)
    achievement_add_variable("granny_garbage2N", false, true, false)
    achievement_add_variable("granny_garbage3", false, true, false)
    achievement_add_variable("granny_garbage4", false, true, false)
    achievement_add_variable("granny_garbage5N", false, true, false)
    achievement_add_variable("granny_garbage6", false, true, false)
    achievement_add_variable("granny_garbage7N", false, true, false)
    achievement_add_variable("granny_garbage8", false, true, false)
    achievement_add_variable("granny_garbage9", false, true, false)
    achievement_add_variable("granny_garbage10", false, true, false)
    achievement_add_variable("granny_garbage11", false, true, false)
    achievement_add_variable("granny_garbage12", false, true, false)
    achievement_add_variable("granny_garbage13", false, true, false)
    achievement_add_variable("granny_garbage14", false, true, false)
    achievement_add_variable("granny_garbage15", false, true, false)
    achievement_add_variable("granny_forest1N", false, true, false)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_30131_gml_Object_obj_achievementtracker_Create_0
{
    if obj_achievementtracker.ispeppino
        return;
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (73 << 0)))
    {
        var b = achievement_get_variable(concat("granny_", arr[0]))
        if (!is_undefined(b))
        {
            b.value = true
            var vals = achievement_get_all_variables()
            var found = false
            var i = 0
            while ((i < array_length(vals)))
            {
                if (!vals[i].value)
                {
                    found = true
                    break
                }
                else
                    i++
            }
            if (!found)
                palette_unlock(name, "grannykisses", 21, spr_noisepattern8, false)
        }
    }
}
, false, "Palettes", "grannykisses")
add_achievement_notify("pal_towerguy", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_30851_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("towerguy_entrance", false, true, false)
    achievement_add_variable("towerguy_medieval", false, true, false)
    achievement_add_variable("towerguy_ruin", false, true, false)
    achievement_add_variable("towerguy_dungeon", false, true, false)
    achievement_add_variable("towerguy_badland", false, true, false)
    achievement_add_variable("towerguy_graveyard", false, true, false)
    achievement_add_variable("towerguy_farm", false, true, false)
    achievement_add_variable("towerguy_saloon", false, true, false)
    achievement_add_variable("towerguy_plage", false, true, false)
    achievement_add_variable("towerguy_forest", false, true, false)
    achievement_add_variable("towerguy_minigolf", false, true, false)
    achievement_add_variable("towerguy_space", false, true, false)
    achievement_add_variable("towerguy_street", false, true, false)
    achievement_add_variable("towerguy_sewer", false, true, false)
    achievement_add_variable("towerguy_freezer", false, true, false)
    achievement_add_variable("towerguy_industrial", false, true, false)
    achievement_add_variable("towerguy_war", false, true, false)
    achievement_add_variable("towerguy_kidsparty", false, true, false)
    achievement_add_variable("towerguy_chateau", false, true, false)
    achievement_add_variable("towerguy_exit", false, true, false)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_32217_gml_Object_obj_achievementtracker_Create_0
{
    if obj_achievementtracker.ispeppino
        return;
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (72 << 0)))
    {
        var b = achievement_get_variable(concat("towerguy_", arr[0]))
        if (!is_undefined(b))
        {
            b.value = true
            var vals = achievement_get_all_variables()
            var found = false
            var i = 0
            while ((i < array_length(vals)))
            {
                if (!vals[i].value)
                {
                    found = true
                    break
                }
                else
                    i++
            }
            if (!found)
                palette_unlock(name, "towerguy", 20, spr_noisepattern9, false)
        }
    }
}
, false, "Palettes", "towerguy")
add_achievement_notify("halloween1", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_32902_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (60 << 0)) && (arr[0] >= 30))
        achievement_unlock(name, "Pumpkin Munchkin", spr_achievement_halloween, 0)
}
)
add_achievement_notify("halloween2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_33144_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("hw2count", 0, false, true)
    achievement_add_variable("hw2start", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_33278_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    switch type
    {
        case (61 << 0):
            if ((arr[0] == 832))
            {
                if ((achievement_get_variable("hw2count").value >= 10))
                {
                    achievement_unlock(name, "Tricksy", spr_achievement_halloween, 1)
                    with (obj_achievementviewer)
                        event_perform(ev_other, ev_room_start)
                }
                else
                    trace("Couldn't get the achievement!, max count: ", achievement_get_variable("hw2count").value)
                achievement_get_variable("hw2count").value = 0
            }
            break
        case (62 << 0):
            achievement_get_variable("hw2count").value = 0
            break
        case (60 << 0):
            var r = string_letters(room_get_name(room))
            if ((r == "trickytreat") || (r == "trickytreatb"))
            {
                trace("Found pumpkin at: ", room_get_name(room))
                achievement_get_variable("hw2count").value = (achievement_get_variable("hw2count").value + 1)
            }
            break
    }

}
)
add_achievement_notify("entrance1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_34329_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("entr1count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_34405_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (14 << 0)) && (global.leveltosave == "entrance") && (arr[0] == 68))
    {
        achievement_get_variable("entr1count").value = (achievement_get_variable("entr1count").value + 1)
        if ((achievement_get_variable("entr1count").value >= 16))
            achievement_unlock(name, "John Gutted", spr_achievement_entrance, 0)
    }
}
)
add_achievement_notify("entrance2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_34881_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_34902_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (5 << 0)) && (arr[0] == "entrance") && ((arr[2] < 2) || ((arr[2] == 2) && (arr[3] <= 0))))
        achievement_unlock(name, "Let's Make This Quick", spr_achievement_entrance, 1)
}
)
add_achievement_notify("entrance3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_35273_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("entr3count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_35349_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if (((type == (51 << 0)) && (arr[0] >= 99) && (global.leveltosave == "entrance")) || ((type == (2 << 0)) && (global.combo >= 99) && (global.leveltosave == "entrance")))
        achievement_unlock(name, "Primate Rage", spr_achievement_entrance, 2)
}
)
add_achievement_notify("medieval1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_35850_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("med1count", 0, false, true)
    achievement_add_variable("med1hurt", false, false, true)
    achievement_add_variable("med1start", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_36046_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((global.leveltosave == "medieval"))
    {
        if ((type == (57 << 0)))
            achievement_get_variable("med1start").value = true
        else if ((type == (32 << 0)))
            achievement_get_variable("med1hurt").value = true
        else if ((type == (25 << 0)))
        {
            if ((achievement_get_variable("med1start").value == true) && (achievement_get_variable("med1hurt").value == false))
                achievement_get_variable("med1count").value = (achievement_get_variable("med1count").value + 1)
            if ((achievement_get_variable("med1count").value >= 5))
                achievement_unlock(name, "Shining Armor", spr_achievement_medieval, 0)
            achievement_get_variable("med1hurt").value = false
        }
    }
}
)
add_achievement_notify("medieval2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_36874_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("med2count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_36949_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (4 << 0)) && (global.leveltosave == "medieval") && (arr[1] == 743))
    {
        achievement_get_variable("med2count").value = (achievement_get_variable("med2count").value + 1)
        if ((achievement_get_variable("med2count").value >= 10))
            achievement_unlock(name, "Spoonknight", spr_achievement_medieval, 1)
    }
}
)
add_achievement_notify("medieval3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_37414_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_37435_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    if ((type == (2 << 0)) && (global.leveltosave == "medieval") && ((obj_player1.state == (5 << 0)) || ((obj_player1.tauntstoredstate == (5 << 0)) && (obj_player1.state == (61 << 0)))) && ((obj_player1.sprite_index == obj_player1.spr_tumblestart) || (obj_player1.sprite_index == obj_player1.spr_tumbleend) || (obj_player1.sprite_index == obj_player1.spr_tumble)))
        achievement_unlock(name, "Spherical", spr_achievement_medieval, 2)
}
)
add_achievement_notify("ruin1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_38064_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("ruin1hurt", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_38143_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    var val = achievement_get_variable("ruin1hurt")
    if ((type == (7 << 0)) && (global.leveltosave == "ruin") && (arr[2] == 645))
    {
        val.value = true
        trace("Locked out of Thrill Seeker!")
    }
    else if ((type == (5 << 0)) && (arr[0] == "ruin") && (!val.value))
        achievement_unlock(name, "Thrill Seeker", spr_achievement_ruin, 0)
}
)
add_achievement_notify("ruin2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_38712_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_38733_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    if ((type == (34 << 0)) && (global.leveltosave == "ruin"))
        achievement_unlock(name, "Volleybomb", spr_achievement_ruin, 1)
}
)
add_achievement_notify("ruin3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_39069_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("ruin3count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_39145_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (33 << 0)) && (global.leveltosave == "ruin"))
    {
        achievement_get_variable("ruin3count").value = (achievement_get_variable("ruin3count").value + 1)
        if ((achievement_get_variable("ruin3count").value >= 350))
            achievement_unlock(name, "Delicacy", spr_achievement_ruin, 2)
    }
}
)
add_achievement_notify("dungeon1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_39624_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("dun1hurt", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_39702_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (37 << 0)) && (global.leveltosave == "dungeon"))
        achievement_get_variable("dun1hurt").value = true
    else if ((type == (5 << 0)) && (arr[0] == "dungeon") && (achievement_get_variable("dun1hurt").value == false))
        achievement_unlock(name, "Very Very Hot Sauce", spr_achievement_dungeon, 0)
}
)
add_achievement_notify("dungeon2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_40256_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_40277_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if (global.panic && (type == (43 << 0)) && (global.leveltosave == "dungeon") && (arr[0] >= 120))
        achievement_unlock(name, "Eruption Man", spr_achievement_dungeon, 1)
}
)
add_achievement_notify("dungeon3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_40653_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("dun3hurt", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_40731_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (7 << 0)) && (global.leveltosave == "dungeon") && (arr[2] == 875))
        achievement_get_variable("dun3hurt").value = true
    else if ((type == (5 << 0)) && (arr[0] == "dungeon") && (achievement_get_variable("dun3hurt").value == false))
        achievement_unlock(name, "Unsliced Pizzaman", spr_achievement_dungeon, 2)
}
)
add_achievement_notify("badland1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_41293_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_41314_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    if ((type == (49 << 0)) && (global.leveltosave == "badland"))
        achievement_unlock(name, "Peppino's Rain Dance", spr_achievement_badland, 0)
}
)
add_achievement_notify("badland2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_41644_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("bad2count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_41719_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (2 << 0)) && (global.leveltosave == "badland") && (arr[2] == 446))
    {
        achievement_get_variable("bad2count").value = (achievement_get_variable("bad2count").value + 1)
        if ((achievement_get_variable("bad2count").value >= 5))
            achievement_unlock(name, "Unnecessary Violence", spr_achievement_badland, 1)
    }
}
)
add_achievement_notify("badland3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_42195_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("bad3hurt", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_42273_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (38 << 0)) && (global.leveltosave == "badland"))
        achievement_get_variable("bad3hurt").value = true
    else if ((type == (5 << 0)) && (arr[0] == "badland") && (achievement_get_variable("bad3hurt").value == false))
        achievement_unlock(name, "Alien Cow", spr_achievement_badland, 2)
}
)
add_achievement_notify("graveyard1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_42800_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("grav1hurt", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_42879_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (41 << 0)) && (global.leveltosave == "graveyard"))
        achievement_get_variable("grav1hurt").value = true
    else if ((type == (5 << 0)) && (arr[0] == "graveyard") && (achievement_get_variable("grav1hurt").value == false))
        achievement_unlock(name, "Ghosted", spr_achievement_graveyard, 0)
}
)
add_achievement_notify("graveyard2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_43456_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("grav2count", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_43599_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((global.leveltosave == "graveyard"))
    {
        if ((type == (2 << 0)) && ((obj_player1.state == (16 << 0)) || ((obj_player1.state == (61 << 0)) && (obj_player1.tauntstoredstate == (16 << 0)))))
        {
            achievement_get_variable("grav2count").value = (achievement_get_variable("grav2count").value + 1)
            if ((achievement_get_variable("grav2count").value >= 20))
                achievement_unlock(name, "Pretend Ghost", spr_achievement_graveyard, 1)
        }
    }
}
)
add_achievement_notify("graveyard3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_44541_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("grav3count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_44617_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (40 << 0)) && (global.leveltosave == "graveyard"))
    {
        achievement_get_variable("grav3count").value = (achievement_get_variable("grav3count").value + 1)
        if ((achievement_get_variable("grav3count").value >= 10))
            achievement_unlock(name, "Alive and Well", spr_achievement_graveyard, 2)
    }
}
)
add_achievement_notify("farm1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_45078_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("f1_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_45152_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (3 << 0)))
    {
        var n = achievement_get_variable("f1_count")
        var r = room_get_name(arr[1])
        if ((obj_player.state == (84 << 0)) && ((string_letters(r) == "farm") || (string_letters(r) == "farmb")))
        {
            n.value++
            if ((n.value >= 3))
                achievement_unlock(name, "No one is safe", spr_achievement_farm, 2)
        }
    }
}
)
add_achievement_notify("farm2", -4, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_45698_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    if ((type == (6 << 0)))
        achievement_unlock(name, "Cube Menace", spr_achievement_farm, 1)
}
)
add_achievement_notify("farm3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_45953_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("f3_hurted", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_46032_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if (((type == (7 << 0)) || (type == (8 << 0))) && ((arr[1] == (11 << 0)) || (arr[1] == (14 << 0)) || (arr[1] == (13 << 0)) || (arr[1] == (12 << 0))))
        achievement_get_variable("f3_hurted").value = true
    if ((type == (5 << 0)) && (arr[0] == "farm") && (!achievement_get_variable("f3_hurted").value))
        achievement_unlock(name, "Good Egg", spr_achievement_farm, 0)
}
)
add_achievement_notify("saloon1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_46664_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("s1_beer", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_46737_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    if ((type == (9 << 0)) && (global.leveltosave == "saloon"))
    {
        achievement_get_variable("s1_beer").value = (achievement_get_variable("s1_beer").value + 1)
        if ((achievement_get_variable("s1_beer").value >= 58))
            achievement_unlock(name, "Non-Alcoholic", spr_achievement_saloon, 0)
    }
}
)
add_achievement_notify("saloon2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_47183_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("s2_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_47257_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    if ((type == (10 << 0)) && (global.leveltosave == "saloon"))
        achievement_get_variable("s2_count").value = (achievement_get_variable("s2_count").value + 1)
    else if ((type == (5 << 0)))
    {
        var arr = argument0[1]
        if ((arr[0] == "saloon") && (achievement_get_variable("s2_count").value == 9))
            achievement_unlock(name, "Already Pressed", spr_achievement_saloon, 1)
    }
}
)
add_achievement_notify("saloon3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_47762_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("s3_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_47836_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    if ((type == (11 << 0)) && (global.leveltosave == "saloon"))
    {
        achievement_get_variable("s3_count").value = (achievement_get_variable("s3_count").value + 1)
        if ((achievement_get_variable("s3_count").value >= 8))
            achievement_unlock(name, "Royal Flush", spr_achievement_saloon, 2)
    }
}
)
add_achievement_notify("plage1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_48243_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_48264_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (12 << 0)) && (global.leveltosave == "plage") && (arr[1] == 722) && (arr[3] == 584))
        achievement_unlock(name, "Blowback", spr_achievement_beach, 0)
}
)
add_achievement_notify("plage2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_48619_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("b2_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_48693_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (13 << 0)) && (global.leveltosave == "plage") && (arr[1] == 710))
    {
        achievement_get_variable("b2_count").value = (achievement_get_variable("b2_count").value + 1)
        if ((achievement_get_variable("b2_count").value >= 7))
            achievement_unlock(name, "X Marks The Spot", spr_achievement_beach, 1)
    }
}
)
add_achievement_notify("plage3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_49174_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("b3_hurt", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_49251_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (7 << 0)) && (global.leveltosave == "plage") && (arr[2] == 645))
        achievement_get_variable("b3_hurt").value = true
    else if ((type == (5 << 0)) && (arr[0] == "plage") && (achievement_get_variable("b3_hurt").value == false))
        achievement_unlock(name, "Demolition Expert", spr_achievement_beach, 2)
}
)
add_achievement_update("forest1", 5, -4, function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_49790_gml_Object_obj_achievementtracker_Create_0
{
    if ((global.leveltosave == "forest"))
    {
        var b = false
        with (obj_player)
        {
            if ((!b) && (state == (84 << 0)) && (distance_to_object(obj_beedeco) < 300))
                b = true
        }
        if b
            achievement_unlock(name, "Bee Nice", spr_achievement_forest, 0)
    }
}
)
add_achievement_notify("forest2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_50185_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("fo2_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_50260_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (14 << 0)) && (global.leveltosave == "forest") && ((arr[0] == 510) || (arr[0] == 534)))
    {
        achievement_get_variable("fo2_count").value = (achievement_get_variable("fo2_count").value + 1)
        if ((achievement_get_variable("fo2_count").value >= 183))
            achievement_unlock(name, "Lumberjack", spr_achievement_forest, 1)
    }
}
)
add_achievement_notify("forest3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_50930_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_50951_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (12 << 0)) && (global.leveltosave == "forest") && (arr[1] == 721) && (arr[3] == 700))
        achievement_unlock(name, "Bullseye", spr_achievement_forest, 2)
}
)
add_achievement_update("space1", 1, function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_51376_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("sp1_hit", false, false, true)
}
, function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_51453_gml_Object_obj_achievementtracker_Create_0
{
    if ((room == space_10))
    {
        if instance_exists(obj_fadeout)
        {
            if ((obj_player1.targetDoor == "B"))
                achievement_get_variable("sp1_hit").value = false
        }
        var b = false
        with (obj_antigravbubble)
        {
            if ((sprite_index == spr_antigrav_bubblesquish))
                b = true
        }
        if b
            achievement_get_variable("sp1_hit").value = true
        var _q = false
        with (obj_player1)
        {
            if ((y < 608))
                _q = true
        }
        if (_q && (achievement_get_variable("sp1_hit").value == false))
            achievement_unlock(name, "Turbo Tunnel", spr_achievement_space, 0)
    }
}
)
add_achievement_notify("space2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_52149_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("sp2_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_52224_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (14 << 0)) && (global.leveltosave == "space") && (arr[0] == 560))
    {
        achievement_get_variable("sp2_count").value = (achievement_get_variable("sp2_count").value + 1)
        if ((achievement_get_variable("sp2_count").value >= 18))
            achievement_unlock(name, "Blast Em Asteroids", spr_achievement_space, 2)
    }
}
)
add_achievement_notify("space3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_52773_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("space3count", 0, false, true)
    achievement_add_variable("space3start", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_52913_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((global.leveltosave == "space"))
    {
        if ((type == (0 << 0)))
            achievement_get_variable("space3start").value = true
        else if ((achievement_get_variable("space3start").value == true) && (type == (2 << 0)) && (arr[2] == 748))
        {
            achievement_get_variable("space3count").value = (achievement_get_variable("space3count").value + 1)
            trace("Meteor Man Count: ", achievement_get_variable("space3count").value)
            if ((achievement_get_variable("space3count").value >= 5))
                achievement_unlock(name, "Man Meteor", spr_achievement_space, 1)
        }
        else if ((type == (1 << 0)))
        {
            achievement_get_variable("space3start").value = false
            achievement_get_variable("space3count").value = 0
        }
    }
}
)
add_achievement_notify("minigolf1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_53830_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("g1_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_53904_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (18 << 0)) && (arr[0] == 4094))
    {
        achievement_get_variable("g1_count").value = (achievement_get_variable("g1_count").value + 1)
        if ((achievement_get_variable("g1_count").value >= 9))
            achievement_unlock(name, "Primo Golfer", spr_achievement_golf, 0)
    }
}
)
add_achievement_notify("minigolf2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_54332_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("g2_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_54406_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (16 << 0)) && ((arr[0] == 587) || (arr[0] == 587)))
        achievement_get_variable("g2_count").value = 0
    else if ((type == (17 << 0)))
    {
        achievement_get_variable("g2_count").value = (achievement_get_variable("g2_count").value + 1)
        if ((achievement_get_variable("g2_count").value >= 3))
            achievement_unlock(name, "Nice Shot", spr_achievement_golf, 1)
    }
}
)
add_achievement_notify("minigolf3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_54961_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("g3_hit", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_55037_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (16 << 0)))
    {
        if ((arr[0] == 1129))
            achievement_get_variable("g3_hit").value = true
        else
            achievement_get_variable("g3_hit").value = false
    }
    else if ((type == (18 << 0)) && (achievement_get_variable("g3_hit").value == true))
        achievement_unlock(name, "Helpful Burger", spr_achievement_golf, 2)
}
)
add_achievement_update("street1", 60, -4, function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_55563_gml_Object_obj_achievementtracker_Create_0
{
    if ((room == street_bacon))
        achievement_unlock(name, "Pan Fried", spr_achievement_street, 0)
}
)
add_achievement_notify("street2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_55777_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("st2_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_55852_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    if ((global.leveltosave == "street"))
    {
        if ((type == (19 << 0)))
            achievement_get_variable("st2_count").value = 0
        else if ((type == (21 << 0)))
        {
            achievement_get_variable("st2_count").value = (achievement_get_variable("st2_count").value + 1)
            if ((achievement_get_variable("st2_count").value >= 3))
                achievement_unlock(name, "Strike!", spr_achievement_street, 1)
        }
    }
}
)
add_achievement_notify("street3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_56370_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("st3_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_56445_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    if ((type == (22 << 0)))
    {
        achievement_get_variable("st3_count").value = (achievement_get_variable("st3_count").value + 1)
        if ((achievement_get_variable("st3_count").value >= 14))
            achievement_unlock(name, "Say Oink!", spr_achievement_street, 2)
    }
}
)
add_achievement_notify("sewer1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_56838_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("sw1_killed", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_56918_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (23 << 0)))
        achievement_get_variable("sw1_killed").value = true
    else if ((type == (5 << 0)) && (arr[0] == "sewer") && (achievement_get_variable("sw1_killed").value == false))
        achievement_unlock(name, "Can't Fool Me", spr_achievement_sewer, 0)
}
)
add_achievement_notify("sewer2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_57370_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("sw2_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_57445_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((global.leveltosave == "sewer") && (type == (4 << 0)) && (arr[1] == 742))
    {
        achievement_get_variable("sw2_count").value = (achievement_get_variable("sw2_count").value + 1)
        if ((achievement_get_variable("sw2_count").value >= 10))
            achievement_unlock(name, "Food Clan", spr_achievement_sewer, 1)
    }
}
)
add_achievement_notify("sewer3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_57920_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("sw3_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_57995_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((global.leveltosave == "sewer") && global.panic && (type == (24 << 0)))
        achievement_get_variable("sw3_count").value = (achievement_get_variable("sw3_count").value + 1)
    else if ((type == (5 << 0)) && (arr[0] == "sewer") && (achievement_get_variable("sw3_count").value <= 0))
        achievement_unlock(name, "Penny Pincher", spr_achievement_sewer, 2)
}
)
add_achievement_notify("industrial1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_58573_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("i1_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_58647_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((global.leveltosave == "industrial") && (type == (25 << 0)) && ((arr[2] == (33 << 0)) || (arr[2] == (35 << 0)) || (arr[2] == (34 << 0))))
    {
        achievement_get_variable("i1_count").value = (achievement_get_variable("i1_count").value + 1)
        if ((achievement_get_variable("i1_count").value >= 4))
            achievement_unlock(name, "Unflattenning", spr_achievement_industrial, 0)
    }
}
)
add_achievement_notify("industrial2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_59208_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("i2_count", 0, false, true)
    achievement_add_variable("i2_hurt", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_59341_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((room == industrial_secret1))
    {
        if ((type == (2 << 0)) && (arr[2] == 238))
            achievement_get_variable("i2_count").value = (achievement_get_variable("i2_count").value + 1)
        else if ((type == (7 << 0)))
            achievement_get_variable("i2_hurt").value = true
    }
    if ((type == (27 << 0)) && (arr[0] == 675) && (achievement_get_variable("i2_hurt").value == false) && (achievement_get_variable("i2_count").value >= 11))
        achievement_unlock(name, "Whoop This", spr_achievement_industrial, 1)
}
)
add_achievement_notify("industrial3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_60053_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("i3_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_60127_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((global.leveltosave == "industrial") && (type == (2 << 0)) && (arr[2] == 718))
    {
        achievement_get_variable("i3_count").value = (achievement_get_variable("i3_count").value + 1)
        if ((achievement_get_variable("i3_count").value >= 31))
            achievement_unlock(name, "There Can Be Only One", spr_achievement_industrial, 2)
    }
}
)
add_achievement_notify("freezer1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_60612_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("fr1_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_60687_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    if ((global.leveltosave == "freezer") && (type == (28 << 0)))
    {
        achievement_get_variable("fr1_count").value = (achievement_get_variable("fr1_count").value + 1)
        if ((achievement_get_variable("fr1_count").value >= 13))
            achievement_unlock(name, "Frozen Nuggets", spr_achievement_freezer, 0)
    }
}
)
add_achievement_notify("freezer2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_61115_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("fr2_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_61190_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((global.leveltosave == "freezer") && (type == (2 << 0)) && (arr[2] == 973))
    {
        achievement_get_variable("fr2_count").value = (achievement_get_variable("fr2_count").value + 1)
        if ((achievement_get_variable("fr2_count").value >= 5))
            achievement_unlock(name, "Frozen Nuggets", spr_achievement_freezer, 1)
    }
}
)
add_achievement_notify("freezer3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_61670_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("fr3_fall", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_61748_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (8 << 0)) && (global.leveltosave == "freezer"))
        achievement_get_variable("fr3_fall").value = true
    else if ((type == (5 << 0)) && (arr[0] == "freezer") && (achievement_get_variable("fr3_fall").value == false))
        achievement_unlock(name, "Ice Climber", spr_achievement_freezer, 2)
}
)
add_achievement_notify("chateau1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_62254_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("ch1_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_62329_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((global.leveltosave == "chateau") && (type == (2 << 0)) && (arr[2] == 290))
    {
        achievement_get_variable("ch1_count").value = (achievement_get_variable("ch1_count").value + 1)
        if ((achievement_get_variable("ch1_count").value >= 30))
            achievement_unlock(name, "Cross To Bare", spr_achievement_chateau, 0)
    }
}
)
add_achievement_notify("chateau2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_62808_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("ch2_hurt", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_62886_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (7 << 0)) && ((arr[2] == 614) || (arr[2] == 338)))
        achievement_get_variable("ch2_hurt").value = true
    if ((type == (5 << 0)) && (arr[0] == "chateau") && (!achievement_get_variable("ch2_hurt").value))
        achievement_unlock(name, "Haunted Playground", spr_achievement_chateau, 1)
}
)
add_achievement_notify("chateau3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_63406_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("ch3_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_63481_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    if ((type == (15 << 0)) && (global.leveltosave == "chateau"))
    {
        achievement_get_variable("ch3_count").value = (achievement_get_variable("ch3_count").value + 1)
        if ((achievement_get_variable("ch3_count").value >= 10))
            achievement_unlock(name, "Skullsplitter", spr_achievement_chateau, 2)
    }
}
)
add_achievement_notify("kidsparty1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_63955_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("kp1_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_64030_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    if ((type == (29 << 0)) && (global.leveltosave == "kidsparty") && global.panic && (room != kidsparty_secret1))
    {
        achievement_get_variable("kp1_count").value = (achievement_get_variable("kp1_count").value + 1)
        if ((achievement_get_variable("kp1_count").value >= 9))
            achievement_unlock(name, "And This... Is My Gun-On-A-Stick!", spr_achievement_kidsparty, 0)
    }
}
)
add_achievement_notify("kidsparty2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_64545_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("kp2_count", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_64620_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (30 << 0)) && (global.leveltosave == "kidsparty") && (!global.panic))
        achievement_get_variable("kp2_count").value = (achievement_get_variable("kp2_count").value + 1)
    else if ((type == (20 << 0)) && (arr[0] == 606))
    {
        if ((achievement_get_variable("kp2_count").value <= 6))
            achievement_unlock(name, "Let Them Sleep", spr_achievement_kidsparty, 1)
    }
}
)
add_achievement_notify("kidsparty3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_65169_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("kp3_hurted", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_65249_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (31 << 0)) && (global.leveltosave == "kidsparty"))
        achievement_get_variable("kp3_hurted").value = true
    else if ((type == (5 << 0)) && (arr[0] == "kidsparty"))
    {
        if ((achievement_get_variable("kp3_hurted").value == false))
            achievement_unlock(name, "Jumpspared", spr_achievement_kidsparty, 2)
    }
}
)
add_achievement_notify("war1", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_65760_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("war1hurt", 0, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_65834_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (7 << 0)) && (global.leveltosave == "war"))
        achievement_get_variable("war1hurt").value = (achievement_get_variable("war1hurt").value + 1)
    else if ((type == (5 << 0)) && (arr[0] == "war") && (achievement_get_variable("war1hurt").value <= 3))
        achievement_unlock(name, "Decorated Veteran", spr_achievement_war, 0)
}
)
add_achievement_notify("war2", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_66376_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("war2_missed", 0, false, true)
    achievement_add_variable("war2_hit", false, false, true)
    achievement_add_variable("war2_start", false, false, true)
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_66575_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((global.leveltosave == "war"))
    {
        if ((type == (44 << 0)))
        {
            achievement_get_variable("war2_hit").value = false
            achievement_get_variable("war2_start").value = true
        }
        else if (((type == (2 << 0)) || (type == (3 << 0)) || (type == (46 << 0)) || (type == (47 << 0))) && (achievement_get_variable("war2_start").value == true))
            achievement_get_variable("war2_hit").value = true
        else if ((type == (45 << 0)))
        {
            var val = achievement_get_variable("war2_hit").value
            achievement_get_variable("war2_start").value = false
            if (!val)
            {
                achievement_get_variable("war2_missed").value = (achievement_get_variable("war2_missed").value + 1)
                trace("Sharpshooter: Shot missed!")
            }
        }
    }
    if ((type == (5 << 0)) && (arr[0] == "war") && (achievement_get_variable("war2_missed").value <= 3))
        achievement_unlock(name, "Sharpshooter", spr_achievement_war, 1)
}
)
add_achievement_notify("war3", function() //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_67891_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon_gml_Object_obj_achievementtracker_Create_0_67912_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if ((type == (48 << 0)) && (arr[0] >= 1))
        achievement_unlock(name, "Trip to the Warzone", spr_achievement_war, 2)
}
)
